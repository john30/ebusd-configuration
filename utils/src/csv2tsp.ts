import csvParser from "csv-parser";
import * as fs from "fs";
import * as path from 'path';
import {Transform, type TransformCallback} from "stream";
import {pipeline} from "stream/promises";

type ReqStrs = (string | undefined | false)[];

type OptStrs = ReqStrs | undefined;

type CsvLine = Record<number, string|undefined>;

type Trans<T extends CsvLine> = (line?: T, header?: string|false) => OptStrs;

type TemplateLine = CsvLine & {
  /** name */
  0: string,
  /** type / templates */
  1: string,
  /** divisor / values */
  2?: string,
  /** unit */
  3?: string,
  /** comment */
  4?: string,
}
const ebusImport = [
  'import "ebus";'
]
const ebusUsing = [
  'using Ebus;',
  'using Ebus.num;',
  'using Ebus.dtm;',
  'using Ebus.str;',
]
const templateHeader = [
  ...ebusImport,
  ...ebusUsing,
];
const templateHeaderSubdir = [
  ...ebusImport,
  'import "../_templates.tsp";',
  ...ebusUsing,
];
const templateFooter: string[] = [];
const dynLengthTypes = new Set<string>(['STR', 'NTS', 'IGN', 'HEX'])
const normId = (id: string): string => id.replaceAll(/[-:]/g, '_');
const normType = (t: string): string => {
  const parts = t.split(':');
  parts[0] = normId(parts[0]);
  if (parts.length<2 || dynLengthTypes.has(parts[0])) return parts[0];
  return parts.join(parts[0].startsWith('BI')?'_':'')
}
const addLength = (t?: string): string|undefined => {
  if (!t) return;
  const parts = t.split(':');
  if (parts.length<2 || !dynLengthTypes.has(parts[0])) return;
  return `@maxLength(${parts[1]}) `;
}
const suffix = (t: string, seen: Map<string, number>) => {
  let idx = seen.get(t);
  if (idx===undefined) {
    seen.set(t, 0);
    return t==='_'?'_0':'';
  }
  seen.set(t, ++idx);
  return `_${idx}`;
}
const getSuffix = (t: string, seen: Map<string, number>) => {
  let idx = seen.get(t);
  if (idx===undefined || idx===0) {
    return t==='_'?'_0':'';
  }
  return `_${idx}`;
}
const isBaseType = (t: string|undefined) => t && t.toUpperCase()===t;
const removeTrailNum = (id: string) => id && id.replace(/[0-9]*$/, '');
const normFieldName = (id: string) => id && (isBaseType(id)?id.toLowerCase():id);
const templateTrans: Trans<TemplateLine> = (line?, header?): OptStrs => {
  if (header) return templateHeader;
  if (header===false) {
    return [...addValueLists(), ...templateFooter];
  }
  line = objSlice(line);
  if (!line) return;
  const {id, typ, typLen, comm, divisor, values}
  = divisorValues(line[0], line[1], line[2], line[4]);
  const types = line[1].split(';');
  if (types.length>1) {
    const seen = new Map<string, number>();
    return [
      comm&&comm!==id&&comm!==line[1]&&`/** ${comm} */`,
      `model ${id} {`,
      ...types.map(t => {
          const {id, typ, typLen} = divisorValues('', t, '', '');
          const name = removeTrailNum(normFieldName(id));
          return `${typLen??''}${name}${suffix(name, seen)}: ${typ},`;
        }),
       '}',
    ];
  }
  const name = normalize && id===typ ? 'value' : normFieldName(id);
  return [
    comm&&comm!=id&&`/** ${comm} */`,
    line[3]&&`@unit("${line[3]}")`,
    divisor||values,
    typLen,
    `scalar ${name} extends ${typ};`,
  ]
}
const knownManufacturers = new Map<string, [number, string]>([
  ['vaillant', [0xb5, 'Vaillant']],//todo use enum from lib
])
const setSubdirManuf = (subdir: string): string|undefined => {
  const [id, name] = knownManufacturers.get(subdir)||[];
  subdirManuf = name;
  subdirManufId = id!;
  return name;
}
const templateTransSub = (subdir: string): Trans<TemplateLine> => (line?, header?): OptStrs => {
  if (header) return [
    ...templateHeaderSubdir,
    '',
    `namespace ${subdir};`,
    setSubdirManuf(subdir)&&`alias MF = ${hex(subdirManufId||0)}; // Ebus.id.manufacturers.${subdirManuf}`,
  ];
  return templateTrans(line, header);
}

type MessageLine = CsvLine & {
  /** type (r[1-9];w;u) */
  0: string,
  /** circuit */
  1?: string,
  /** name (not required for default) */
  2: string,
  /** comment */
  3?: string,
  /** QQ */
  4?: string,
  /** ZZ */
  5?: string,
  /** PBSB */
  6?: string,
  /** ID */
  7?: string,
  // ...fields
}
const messageLinePrefixLen = 8;
type FieldOfLine = CsvLine & {
  /** name */
  0?: string,
  /** part (m/s) */
  1?: string,
  /** type / templates */
  2: string,
  /** divisor / values */
  3?: string,
  /** unit */
  4?: string,
  /** comment */
  5?: string,
}
const messageLineFieldLen = 6;
const maxFields = 16;
const valueLists = {list: new Map<string, string[]>(), seen: new Map<string, number>()};
const divisorValues = (name: string|undefined, typ: string, divVal: string|undefined,
  comm: string|undefined,
): {id: string, typ?: string, typLen?: string, comm: string, divisor?: string, values?: string} => {
  const id = normId(name||(typ.split(':')[0]));
  comm = comm || name || '';
  const typLen = addLength(typ);
  const origTyp = typ;
  typ = normType(typ);
  if (!comm && origTyp && !isBaseType(origTyp)) {
    comm = origTyp;
  }
  const divParts = divVal && divVal.split(';');
  const hasValues = divParts && divParts.length>1;
  let divisor: string|undefined;
  let values: string|undefined;
  if (hasValues) {
    values = `values_`;
    values += (comm||id||'').replaceAll(/[^a-zA-Z0-9]/g, '_');
    values += suffix(values, valueLists.seen);
    valueLists.list.set(values, divParts);
    values = `@values(${values})`;
  } else if (divVal) {
    const value = parseInt(divVal!, 10);
    divisor = `@${value<0?'factor':'divisor'}(${Math.abs(value)})`;
  }
  return {id, typ, typLen, comm, divisor, values};
};
const fieldTrans = (line: FieldOfLine|undefined, seen: Map<string, number>, singleField: boolean): OptStrs => {
  if (!line) return;
  const {id, typ, typLen, comm, divisor, values}
  = divisorValues(line[0], line[2], line[3], line[5]);
  const types = line[2].split(';');
  if (types.length>1) {
    const ret: ReqStrs = [];
    types.filter(t=>t).forEach(t => {
      const {id, typ, typLen} = divisorValues('', t, '', '');
      const name = removeTrailNum(normFieldName(id));
      ret.push(...[
        (comm&&comm!==id&&comm!==line[2])?`/** ${comm} */`:undefined,
        `${typLen??''}${name}${suffix(name, seen)}: ${typ},`,
      ]);
    });
    return ret;
  }
  //todo flatten inlined models only in emit
  const name = normalize && singleField && id===typ ? 'value' : normFieldName(id);
  return [
    comm&&comm!=id&&`/** ${comm} */`,
    line[1]&&(line[1]==='m'?'@out':'@in'),
    line[4]&&`@unit("${line[4]}")`,
    divisor||values,
    typLen,
    `${name}${suffix(name, seen)}: ${typ},`,
  ]
};
const messageHeader = [
  ...ebusImport,
  'import "./_templates.tsp";',
  ...ebusUsing,
];
const messageFooter: string[] = ['}'];
const direction = (dir: string): string|undefined => dir[0]==='r' ? undefined : dir[0]==='w' ? '@write ' : ((dir[1]==='w'?'@write ':'')+'@passive ');
let subdirManufId: number|undefined;
let subdirManuf: string|undefined;
const hex = (n?: number) => n===undefined?undefined:`0x${(n|0x100).toString(16).substring(1)}`;
const fromHex = (...strs: ReqStrs): (number|string)[] => Buffer.from(strs.filter(s=>s!==undefined).join(''))
.reduce((p, c, i, all) => {
  if (i%2) {
    const n = Number.parseInt(String.fromCharCode(p.n, c), 16);
    p.r.push(i===1 && all.length>=2*2 && n===subdirManufId ? 'MF' : n<2 ? n : `0x${n.toString(16)}`);
    p.n = 0;
  } else {
    p.n = c;
  }
  return p;
}, {n: 0, r: [] as (number|string)[]}).r;
const objSlice = <T extends CsvLine>(line: T|undefined, from: number = 0, len: number = messageLinePrefixLen+maxFields*messageLineFieldLen): T|undefined => {
  if (!line) {
    return line;
  }
  const ret = {} as T;
  let used = undefined as unknown as T;
  for (let i=0; i<len; i++) {
    const str = line[from+i];
    if (str===undefined) {
      return used;
    }
    if (str) {
      ret[i] = str;
      used = ret;
    }
  }
  return used;
};
const defaultsByName = new Map<string, number>();
const namespaceWithZz = (header: string) => {
  const parts = header.split('.');
  let zz: string|undefined;
  let circuit = header;
  if (parts.length==2 && parts[0].length==2) {
    // zz.circuit
    zz = `0x${parts[0]}`;
    circuit = parts[1]
  }
  return [
    zz&&`@zz(${zz})`,
    `namespace ${circuit} {`,
  ];
};
const addValueLists = (): ReqStrs => {
  const ret: ReqStrs = [];
  for (const [name, values] of valueLists.list.entries()) {
    ret.push(`enum ${name} {`);
    const keys = new Map<string, number>();
    values.forEach(v => {
      const [k, n] = v.split('=');
      let id = normId(n.replaceAll(/[^a-zA-Z0-9]/g, '_'));
      if (id[0]>='0' && id[0]<='9') {
        id = '_'+id;
      }
      ret.push(`${id+suffix(id, keys)}: ${k},`);
    });
    ret.push('}');
  }
  return ret;
};
const messageTrans: Trans<MessageLine> = (wholeLine?, header?): OptStrs => {
  if (header) {
    return [
      ...messageHeader,
      '',
      ...namespaceWithZz(header),
    ];
  }
  if (header===false) {
    return [...addValueLists(), ...messageFooter];
  };
  const line = objSlice(wholeLine);
  if (!line) return;
  const fieldLines: FieldOfLine[] = [];
  const seenFields = new Map<string, number>();
  for (let idx=messageLinePrefixLen; idx<messageLinePrefixLen+maxFields*messageLineFieldLen; idx+=messageLineFieldLen) {
    const fieldLine = objSlice(wholeLine, idx, messageLineFieldLen) as FieldOfLine;
    if (!fieldLine) {
      break;
    }
    fieldLines.push(fieldLine);
  }
  const fields: OptStrs = [];
  fieldLines.forEach(fieldLine => fields.push(...fieldTrans(fieldLine, seenFields, fieldLines.length===1)||[]));
  let dirsStr = line[0];
  if (dirsStr[0]==='!') return; // todo support include/load instruction
  let isDefault: string|undefined = dirsStr[0]==='*'?`default ${dirsStr}`:undefined;
  let circuit: string|undefined = line[1];
  let auth: string|undefined;
  if (isDefault) {
    // default line: convert to base models
    dirsStr = dirsStr.substring(1);
    dirsStr += suffix(dirsStr, defaultsByName);
    if (circuit?.startsWith('#')) {
      auth = circuit.substring(1);
      isDefault += ` for user level "${auth}"`;
      circuit = '';
    }
  }
  const isCondition = dirsStr[0]==='[';
  if (isCondition) return; // todo support conditions
  const dirs = dirsStr.split(';');
  // return dirs.map(dir=> (
  const idComb = fromHex(line[6], line[7]);
  const single = dirs.length===1 && (isDefault || !dirs.some(d=>defaultsByName.has(d)));
  const zz = line[5]&&fromHex(line[5]).join();
  return [
    // circuit&&`namespace ${circuit} {`, // block namespace as otherwise only once per file
    (line[3]||isDefault)&&`/** ${line[3]||isDefault} */`,
    single
      ? direction(dirs[0]) // single model
      : `@inherit(${dirs.map(d=>d+getSuffix(d, defaultsByName)).join(', ')})`, // multi model
    auth&&`@auth("${auth}")`,
    line[4]&&`@qq(${fromHex(line[4]).join})`,
    zz&&`@zz(${zz==='0xfe'?'BROADCAST':zz})`,
    single&&idComb.length>=2?`@${isDefault?'base':'id'}(${idComb.join(', ')})`:idComb.length?`@ext(${idComb.join(', ')})`:undefined,
    `model ${normId(isDefault?dirsStr:line[2])} {`,
    ...fields,
    '}',
    // circuit&&`}`,
  ];
  // )).reduce((p, c)=>{p.push(...c);return p;},[] as ReqStrs);
}
const messageTransSub = (subdir: string): Trans<MessageLine> => (line?, header?): OptStrs => {
  header && setSubdirManuf(subdir);
  if (header) return [
    ...messageHeader,
    `namespace ${subdir};`,
    '',
    ...namespaceWithZz(header),
  ];
  return messageTrans(line, header);
}
const joinNl = (inp?: OptStrs): string|undefined =>
  inp?.length ? (inp.filter(i=>i!==undefined&&i!==false).join('\n')+'\n\n') : undefined; // one extra for block separation

const helpTxt = [
  'usage: csv2tsp [-k] [-o outdir] [-b basedir] [csvfile*]',
  'converts ebusd csv files to tsp for use with ebus typespec library.',
  'with:',
  '  -n          normalize names',
  '  -o outdir   the output directory (default "outdir")',
  '  -b basedir  the base directory for determining namespace of each csvfile',
  '  csvfile     the csv file(s) to transform (unless to traverse the whole basedir)'
];
let normalize = false;
//todo write dictionary for translation or let emitter do that
export const csv2tsp = async (args: string[] = []) => {
  let indir = '.';
  let outdir = 'outdir';
  let files: string[] = [];
  for (let i=0; i<args.length; i++) {
    const arg = args[i];
    switch (arg) {
      case '-h':
        console.log(joinNl(helpTxt));
        return;
      case '-n':
        normalize = true;
        break;
      case '-b':
        indir = args[++i];
        break;
      case '-o':
        outdir = args[++i];
        break;
      default:
        files = args.slice(i);
        i = args.length;
        break;
    }
  }
  if (!files?.length) {
    // whole tree in indir if no files
    files = (await fs.promises.readdir(indir, {withFileTypes: true, recursive: true}))
    .filter(e => e.isFile() && !e.isSymbolicLink() && (e.name.endsWith('.csv')||e.name.endsWith('.inc')))
    .map(e => path.join(e.parentPath, e.name));
  }
  for (const file of files) {
    const subdir = path.relative(indir, path.dirname(file));
    const todir = path.join(outdir, subdir);
    //todo models imported from _templates
    try {
      await fs.promises.stat(todir); // throws if not exists
    } catch (_) {
      console.log(`creating directory ${todir}`);
      await fs.promises.mkdir(todir, {recursive: true});
    }
    const name = path.basename(file);
    const nameNoExt = path.basename(name, path.extname(name));
    const newFile = path.join(todir, nameNoExt+'.tsp');
    console.log(`generating ${newFile}`);
    const isTemplates = name==='_templates.csv';
    const namespace = isTemplates ? nameNoExt
    : path.extname(name)==='.inc' ? nameNoExt+'_inc'
    : nameNoExt;
    defaultsByName.clear();
    valueLists.list.clear();
    valueLists.seen.clear();
    const trans = isTemplates
      ? subdir
        ? templateTransSub(subdir)
        : templateTrans
      : subdir
        ? messageTransSub(subdir)
        : messageTrans
    let first = true;
    let transform: Transform;
    const empty = (line: OptStrs) => !line || !Object.keys(line).length;
    const content: ReqStrs = [];
    const push = (inp: OptStrs, cb: TransformCallback, flush=false) => {
      if (!transform) return cb();
      if (inp?.length) {
        if (first) {
          first = false;
          content.push(...trans(undefined, namespace)||[]); // prepend header on first push
        }
        content.push(...inp);
      }
      if (!flush) return cb();
      const contentStr = joinNl(content) as string;
      // formatTypeSpec(contentStr)
      // .then((d:string) => cb(null, d), cb);
      cb(null, contentStr);
    }
    await pipeline(
      fs.createReadStream(file, 'utf-8'),
      csvParser({headers: false, skipComments: true}),
      transform = new Transform({
        objectMode: true,
        transform: (line, _, cb) => push(empty(line)?undefined:trans(line), cb),
        flush: (cb) => push(trans(undefined, false), cb, true),
      }),
      fs.createWriteStream(newFile),
    );
  }
};
