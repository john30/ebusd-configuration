import csvParser from "csv-parser";
import * as fs from "fs";
import * as path from 'path';
import {Transform} from "stream";
import {pipeline} from "stream/promises";

type ReqStrs = (string | undefined)[];

type OptStrs = ReqStrs | undefined;

type CsvLine = OptStrs;

type Trans<T extends CsvLine> = (line?: T, header?: boolean) => OptStrs;

type TemplateLine = CsvLine & {
  /** name */
  0: string,
  /** type / templates */
  1: string,
  /** divider / values */
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
    return '';
  }
  seen.set(t, ++idx);
  return `_${idx}`;
}
const getSuffix = (t: string, seen: Map<string, number>) => {
  let idx = seen.get(t);
  if (idx===undefined || idx===0) {
    return '';
  }
  return `_${idx}`;
}
const templateTrans: Trans<TemplateLine> = (line?, header?): OptStrs => {
  if (header) return templateHeader;
  if (header===false) return templateFooter;
  if (!line) return;
  const types = line[1].split(';');
  if (types.length>1) {
    const seen = new Map<string, number>();
    return [
      line[4]&&`/** ${line[4]} */`,
      `model ${normId(line[0])} {`,
      ...types.map(t => `${addLength(t)??''}${normId(t)}${suffix(t, seen)}: ${normType(t)},`),
       '}',
    ];
  }
  return [
    line[4]&&`/** ${line[4]} */`,
    line[3]&&`@unit("${line[3]}")`||undefined,//todo nicer
    addLength(types[0]),
    `scalar ${normId(line[0])} extends ${normType(types[0])}`,
  ]
}
const knownManufacturers = new Map<string, [number, string]>([
  ['vaillant', [0xb5, 'Vaillant']],
])
const setSubdirManuf = (subdir: string): string|undefined => {
  const [id, name] = knownManufacturers.get(subdir)||[];
  subdirManuf = name;
  subdirManufId = id!;
  return name;
}
const templateTransSubdir = (subdir: string): Trans<TemplateLine> => (line?, header?): OptStrs => {
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
  /** class */
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
  /** divider / values */
  3?: string,
  /** unit */
  4?: string,
  /** comment */
  5?: string,
}
const messageLineFieldLen = 6;
const fieldTrans = (line: FieldOfLine|undefined, seen: Map<string, number>, valueLists: Map<string, string[]>): OptStrs => {
  if (!line) return;
  const comm = line[5] || line[0] || line[2];
  const types = line[2].split(';');
  if (types.length>1) {
    const ret: ReqStrs = [];
    types.forEach(t => {
      const id = normId(t);
      ret.push(...[
        (comm&&comm!=id)?`/** ${comm} */`:undefined,
        `${addLength(t)??''}${id}${suffix(id, seen)}: ${normType(t)},`,
      ]);
    });
    return ret;
  }
  const id = normId(line[0]||(types[0].split(':')[0]));
  const divParts = line[3] && line[3].split(';');
  const hasValues = divParts && divParts.length>1;
  let divider: string|undefined;
  let values: string|undefined;
  if (hasValues) {
    values = `values_`;
    values += (comm||id||'').replaceAll(/[^a-zA-Z0-9]/g, '_');
    values += suffix(values, seen);
    valueLists.set(values, divParts);
  } else {
    divider = line[3];
  }
  return [
    (comm&&comm!=id)?`/** ${comm} */`:undefined,
    line[4]&&`@unit("${line[4]}")`||undefined,//todo nicer
    divider?`@divider("${line[3]}")`:values?`@values(${values})`:undefined,
    addLength(types[0]),
    `${id}${suffix(id, seen)}: ${normType(types[0])},`,
  ]
};
const messageHeader = [
  ...ebusImport,
  'import "./_templates.tsp";',
  ...ebusUsing,
];
const messageFooter: string[] = [];
const direction = (dir: string): string => dir[0]==='r' ? '' : dir[0]==='w' ? '@write ' : ((dir[1]==='w'?'@write ':'')+'@passive ');
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
const objSlice = (line: CsvLine, from: number, len: number): CsvLine => {
  if (!line) {
    return;
  }
  const ret = {} as ReqStrs;
  let used: CsvLine;
  for (let i=0; i<len; i++) {
    const str = line[from+i];
    if (str===undefined) {
      return used;
    }
    ret[i] = str;
    if (str) {
      used = ret;
    }
  }
  return used;
};
const defaultsByName = new Map<string, number>();
const valueLists = new Map<string, string[]>();
const messageTrans: Trans<MessageLine> = (line?, header?): OptStrs => {
  if (header) return messageHeader;
  if (header===false) {
    const ret: ReqStrs = [];
    for (const [name, values] of valueLists.entries()) {
      ret.push(`enum ${name} {`);
      const keys = new Map<string, number>();
      values.forEach(v => {
        const [k, n] = v.split('=');
        const id = normId(n);
        ret.push(`${id+suffix(id, keys)}: ${k},`);
      });
      ret.push('}');
    }
    return [...ret, ...messageFooter];
  };
  if (!line) return;
  const fields: OptStrs = [];
  const seenFields = new Map<string, number>();
  for (let idx=messageLinePrefixLen; idx<messageLinePrefixLen+16*messageLineFieldLen; idx+=messageLineFieldLen) {
    const field = fieldTrans(objSlice(line, idx, messageLineFieldLen) as FieldOfLine, seenFields, valueLists);
    if (!field) {
      break;
    }
    fields.push(...field);
  }
  let dirsStr = line[0];
  if (dirsStr[0]==='!') return; // todo support include/load instruction
  let isDefault: string|undefined = dirsStr[0]==='*'?`default ${dirsStr}`:undefined;
  if (isDefault) {
    // default line: convert to base models
    dirsStr = dirsStr.substring(1);
    dirsStr += suffix(dirsStr, defaultsByName);
    if (line[1]?.startsWith('#')) {
      // todo level
      isDefault += ` for user level "${line[1].substring(1)}"`;
    }
  }
  const isCondition = dirsStr[0]==='[';
  if (isCondition) return; // todo support conditions
  const dirs = dirsStr.split(';');
  // return dirs.map(dir=> (
  const idComb = fromHex(line[6], line[7]);
  const single = dirs.length===1 && (isDefault || !dirs.some(d=>defaultsByName.has(d)));
  const zz = fromHex(line[5]).join();
  return [
    // line[1]&&`namespace ${line[1]} {`, //todo block namespace as otherwise only once per file
    (line[3]||isDefault)&&`/** ${line[3]||isDefault} */`,
    single
      ? direction(dirs[0]) // single model
      : `@inherit(${dirs.map(d=>d+getSuffix(d, defaultsByName)).join(', ')})`, // multi model
    line[4]&&`@qq(${fromHex(line[4]).join})`,
    zz&&`@zz(${zz==='0xfe'?'BROADCAST':zz})`,
    single&&idComb.length>=2?`@${isDefault?'base':'id'}(${idComb.join(', ')})`:idComb.length?`@ext(${idComb.join(', ')})`:undefined,
    `model ${normId(isDefault?dirsStr:line[2])} {`,
    ...fields,
    '}',
    // line[1]&&`}`,
  ];
// )).reduce((p, c)=>{p.push(...c);return p;},[] as ReqStrs);
}
const messageTransSubdir = (subdir: string): Trans<MessageLine> => (line?, header?): OptStrs => {
  header && setSubdirManuf(subdir);
  if (header) return [
    ...messageHeader,
    '',
    `namespace ${subdir};`,
  ];
  return messageTrans(line, header);
}
const joinNl = (inp?: OptStrs): string|undefined =>
  inp?.length ? (inp.filter(i=>i!==undefined).join('\n')+'\n\n') : undefined; // one extra for block separation

const helpTxt = [
  'usage: csv2tsp [-o outdir] [-b basedir] csvfile*',
  'converts ebusd csv files to tsp for use with ebus typespec library.',
  'with:',
  '  outdir   the output directory (default "outdir")',
  '  basedir  the base directory for determining namespace of each csvfile',
  '  casfile  the csv file(s) to transform'
];
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
  //todo whole tree in indir if no files
  for (const file of files) {
    const subdir = path.relative(indir, path.dirname(file));
    const todir = path.join(outdir, subdir);
    try {
      await fs.promises.stat(todir); // throws if not exists
    } catch (_) {
      console.log(`creating directory ${todir}`);
      await fs.promises.mkdir(todir, {recursive: true});
    }
    const name = path.basename(file);
    const newFile = path.join(todir, path.basename(name, path.extname(name))+'.tsp');
    console.log(`generating ${newFile}`);
    const isTemplates = name==='_templates.csv';
    defaultsByName.clear();
    valueLists.clear();
    const trans = isTemplates
      ? subdir
        ? templateTransSubdir(subdir)
        : templateTrans
      : subdir
        ? messageTransSubdir(subdir)
        : messageTrans
    let first = true;
    let transform: Transform;
    const headerIfFirst = (inp: OptStrs): OptStrs => {
      if (!inp?.length || !first || !transform) return inp;
      first = false;
      transform.push(joinNl(trans(undefined, true)||[]));
      return inp;
    }
    await pipeline(
      fs.createReadStream(file, 'utf-8'),
      csvParser({headers: false, skipComments: true}),
      transform = new Transform({
        objectMode: true,
        // construct: 
        transform: (line, _, cb) => cb(null, joinNl(headerIfFirst(trans(line))||[])),
        flush: (cb) => cb(null, joinNl(headerIfFirst(trans(undefined, false))||[])),
      }),
      fs.createWriteStream(newFile),
    );
  }
};
