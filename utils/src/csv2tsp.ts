import csvParser from "csv-parser";
import * as fs from "fs";
import {readFile, writeFile} from "fs/promises";
import {dump, load} from "js-yaml";
import * as path from 'path';
import {Transform, type TransformCallback} from "stream";
import {pipeline} from "stream/promises";

type ReqStrs = (string | undefined | false)[];

type OptStrs = ReqStrs | undefined;

type CsvLine = Record<number, string|undefined>;

type Additions = {imports: ReqStrs, models: ReqStrs, includes: [string, string[]][], defaultsByName: Map<string, number>, conditions: Map<string, string[]>};

type Trans<T extends CsvLine> = (location: string, line: T|undefined, header: string|false|undefined, additions: Additions) => OptStrs;

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
const normId = (id: string): string => id.replaceAll(/[^a-zA-Z0-9_]/g, '_');
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
  if (parts[1]==='*') {
    // '* is the only way to allow dynamic length on a field as last one in request or response
    return `@minLength(0) @maxLength(16) `;
  }
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
const addI18n = (location: string, str?: string): string|undefined => {
  if (!i18n || !str) return str;
  str = str.trim().replaceAll(/  /g, ' '); // normalize space
  if (str.match(/^[^0-9a-zA-Z]*$/)) return ''; // only whitespace
  let first = str;
  let key = str!.toLowerCase().replaceAll(/[^a-z0-9]/g, '');
  let add: Partial<I18n>|undefined;
  if (i18nMap) {
    const mapped = i18nMap.get(location);
    if (mapped) {
      key = mapped[0];
      add = mapped[1];
      first = add!.first!;
    } else if (!i18n.has(key)) { // warn only once
      if (warnI18n) {
        console.warn(`missing map key ${location} for ${str}`);
      }
    }
  }
  const old = i18n.get(key);
  if (old) {
    if (add) {
      Object.assign(old, add);
    }
    old.locations.add(location);
    const oldStr = old[i18nLang];
    if (oldStr && oldStr!==str) {
      let warn = '';
      if (str.toLowerCase()===oldStr.toLowerCase()) {
        warn = 'different case';
        // prefer the one with more upper case in german / more lower case in other languages
        if ((oldStr.replaceAll(/[^A-Z]/g, '').length > str.replaceAll(/[^A-Z]/g, '').length) === (i18nLang==='de')) {
          str = oldStr;
        }
      } else if (oldStr.length > str.length) {
        warn = 'different length';
        // prefer the longer one
        str = oldStr;
      } else if (oldStr.replaceAll(' ', '').length < str.replaceAll(' ', '').length) {
        warn = 'different spaces';
        // prefer the one with more spaces
        str = oldStr;
      } else {
        warn = 'different length';
        // prefer the longer one
      }
      if (warnI18n) {
        console.warn(`${warn} for key ${location}: ${str} / ${oldStr}`);
      }
    }
    old[i18nLang] = str;
    return old.first;
  }
  const locations = new Set<string>();
  locations.add(location);
  i18n.set(key, {...add, first, [i18nLang]: str, locations});
  return first;
};
const normComment = (location: string, str?: string) => str && addI18n(location, str.replace(/@/g, 'at').replaceAll('**', '^'));
const templateTrans: Trans<TemplateLine> = (location, line?, header?, additions?): OptStrs => {
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
      '',
      comm&&comm!==line[1]&&`/** ${normComment(`${location}:${id}`, comm)} */`,
      `model ${id} {`,
      ...types.map(t => {
          const {id, typ, typLen} = divisorValues('', t, '', '');
          const name = removeTrailNum(normFieldName(id));
          return `  ${typLen??''}${name}${suffix(name, seen)}: ${typ},`;
        }),
       '}',
    ];
  }
  const name = normalize && id===typ ? 'value' : normFieldName(id);
  return [
    '',
    comm&&comm!==line[1]&&`/** ${normComment(`${location}:${name}`, comm)} */`,
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
const templateTransSub = (subdir: string): Trans<TemplateLine> => (...args): OptStrs => {
  const [,,header] = args;
  if (header) return [
    ...templateHeaderSubdir,
    '',
    `namespace ${subdir};`,
    setSubdirManuf(subdir)&&`alias MF = ${hex(subdirManufId||0)}; // Ebus.id.manufacturers.${subdirManuf}`,
  ];
  return templateTrans(...args);
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
const splitTypeName = (t?: string): string[] => {
  if(!t) return [''];
  const p = t.split(':');
  if (p.length!==2) return [t];
  if (p[1].match(/^[0-9]+/)) return [t];
  return p;
}
const divisorValues = (name: string|undefined, typIn: string, divVal: string|undefined,
  comm: string|undefined, singleField?: string
): {id: string, typ?: string, typLen?: string, comm: string, divisor?: string, values?: string} => {
  let [typ, typName] = splitTypeName(typIn);
  name = name || typName;
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
    values += ((id&&!isBaseType(id)&&id)||singleField||comm||'').replaceAll(/[^a-zA-Z0-9]/g, '_');
    values += suffix(values, valueLists.seen);
    valueLists.list.set(values, divParts);
    values = `@values(${values})`;
  } else if (divVal) {
    const value = parseInt(divVal!, 10);
    divisor = `@${value<0?'factor':'divisor'}(${Math.abs(value)})`;
  }
  return {id, typ, typLen, comm, divisor, values};
};
const fieldTrans = (location: string, line: FieldOfLine|undefined, seen: Map<string, number>, singleField?: string): OptStrs => {
  if (!line) return;
  const {id, typ, typLen, comm, divisor, values}
  = divisorValues(line[0], line[2], line[3], line[5], singleField);
  const types = line[2].split(';');
  if (types.length>1) {
    const ret: ReqStrs = [];
    let firstComm: string|undefined = comm;
    types.filter(t=>t).forEach(t => {
      const {id, typ, typLen} = divisorValues('', t, '', '');
      const name = removeTrailNum(normFieldName(id));
      const suffName = `${name}${suffix(name, seen)}`;
      ret.push(...[
        (firstComm&&firstComm!==id&&firstComm!==line[2])?`/** ${normComment(`${location}:${suffName}`, firstComm)} */`:undefined,
        `${typLen??''}${suffName}: ${typ},`,
      ]);
      firstComm = undefined;
    });
    return ret;
  }
  const name = normalize && singleField && id===typ ? 'value' : normFieldName(id);
  const suffName = `${name}${suffix(name, seen)}`;
  return [
    comm&&comm!=id&&`/** ${normComment(`${location}:${suffName}`, comm)} */`,
    line[1]&&(line[1]==='m'?'@out':'@in'),
    line[4]&&`@unit("${line[4]}")`,
    divisor||values,
    typLen,
    `${suffName}: ${typ},`,
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
const namespaceWithZz = (header: string) => {
  const parts = header.split('.');
  let zz: string|undefined;
  let circuit = header;
  if (parts.length>=2 && parts[0].length==2) {
    // zz.circuit
    zz = `0x${parts[0]}`;
    parts.splice(0, 1);
  }
  circuit = parts.map(p=>normId(p)).map(p=>(p[0]>='0'&&p[0]<='9'?'_':'')+p).join('.');
  return [
    zz&&`@zz(${zz})`,
    `namespace ${circuit} {`,
  ];
};
const reservedWords = ['unknown'];
const addValueLists = (): ReqStrs => {
  const ret: ReqStrs = [];
  for (const [name, values] of valueLists.list.entries()) {
    ret.push('');
    ret.push(`enum ${name} {`);
    const keys = new Map<string, number>();
    values.forEach(v => {
      const [k, n] = v.split('=');
      let id = normId(n.replaceAll(/[^a-zA-Z0-9]/g, '_'));
      if (id[0]>='0' && id[0]<='9') {
        id = '_'+id;
      }
      if (reservedWords.includes(id)) {
        id = '_'+id;
      }
      ret.push(`  ${id+suffix(id, keys)}: ${k},`);
    });
    ret.push('}');
  }
  return ret;
};
const messageTrans: Trans<MessageLine> = (location, wholeLine, header, additions): OptStrs => {
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
  let dirsStr = line[0];
  let isDefault: string|undefined = dirsStr[0]==='*'?`default ${dirsStr}`:undefined;
  if (isDefault) {
    dirsStr = dirsStr.substring(1);
  }
  const isCondition = dirsStr[0]==='[';
  const conds: string[] = [];
  let condNamespace: string|undefined;
  if (isCondition) {
    const parts = dirsStr.split(']');
    dirsStr = parts.pop()!; // remainder
    const conditions = parts.map(p => p.startsWith('[') ? p.substring(1, p.endsWith(']')?p.length-1:p.length) : p);
    // support conditions
    if (isDefault) {
      // declared condition
      const name = conditions[0];
      let circuit = line[1];
      const model = line[2];
      let field = line[4];
      let value = line[6]||'';
      if (circuit==='scan') {
        if (!model) {
          // refers to Ebus.id.id
          circuit = 'id.id';
          field = field?.toLowerCase();
        } else {
          additions!.imports.push(`import "./${circuit}.tsp";`);
        }
      }
      const fname = field||(value&&normalize?'value':'');
      additions.conditions.set(name, [[circuit,model,fname].filter(p=>p).join('.'), value]);
      return;
    }
    // conditional
    conditions.forEach(cond => {
      // SW<1,SW>1,SW=1,SW<=1,SW>=1
      let [,name, values] = cond.match(/^([^=<>]*)(.*)$/)||[,cond];
      const [field, value] = additions.conditions.get(name)||additions.conditions.get(cond)||[];
      if (value && !values) {
        values = value;
      }
      conds.push(`@condition(${field}${values?`, ${values.split(';').map(v=>'"'+v+'"').join(',')}`:''})`);
      let nsAdd;
      if (value) {
        nsAdd = name;
      } else {
        nsAdd = ((field.startsWith('id.id.')?field.substring('id.id.'.length):field)+values).replaceAll(/[^a-zA-Z0-9]/g, '_');
      }
      condNamespace = condNamespace?condNamespace+'_'+nsAdd:nsAdd;
    });
  }
  if (dirsStr[0]==='!') {
    // include/load instruction
    const isLoad = dirsStr==='!load';
    if (dirsStr==='!include' || isLoad) {
      const fileNoExt = path.basename(line[1]!, path.extname(line[1]!));
      additions!.imports.push(`import "./${fileNoExt}_inc.tsp";`);
      const fileComp = fileNoExt.split('.').reverse()[0];
      let name = condNamespace || fileComp;
      name = normId(name.replace(/(__[^_]+_?)+/, '_'+fileComp)); // reduce multiple product ids with filename instead
      additions!.includes.push([fileNoExt, [...conds, isLoad ? !conds.length ? 'default: // final load alternative\n' : name+': ' : '']]);
    }
    return;
  }
  let circuit: string|undefined = line[1];
  let auth: string|undefined;
  if (isDefault) {
    // default line: convert to base models
    dirsStr += suffix(dirsStr, additions!.defaultsByName);
    if (circuit?.startsWith('#')) {
      auth = circuit.substring(1);
      isDefault += ` for user level "${auth}"`;
      circuit = '';
    }
  }
  const dirs = dirsStr.split(';').map(d=>d.replace(/[0-9]$/,'')); // strip off poll prio, todo do otherwise
  const chain = (line[7]||'').split(';').map(i=>fromHex(line[6], i.split(':')[0])); // weird construct of limitling length omitted for now => todo rewrite the definition
  const idComb = chain[0];
  const single = dirs.length===1 && (isDefault || !dirs.some(d=>additions!.defaultsByName.has(d)));
  const zz = line[5]&&fromHex(line[5]).join();
  // adjust location before extracting fields
  location += `:${condNamespace}:${dirs[0]}:${zz||''}:${idComb.join(',')}`;
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
  const modelName = normId(isDefault?dirsStr:line[2]);
  fieldLines.forEach(fieldLine => fields.push(...fieldTrans(location, fieldLine, seenFields, fieldLines.length===1?modelName:'')||[]));
  return [
    '',
    ...conds,
    condNamespace&&`namespace ${condNamespace} {`,
    (line[3]||isDefault)&&`/** ${normComment(location, line[3])||isDefault} */`,
    single
      ? direction(dirs[0]) // single model
      : `@inherit(${dirs.map(d=>d+getSuffix(d, additions!.defaultsByName)).join(', ')})`, // multi model
    auth&&`@auth("${auth}")`,
    line[4]&&`@qq(${fromHex(line[4]).join})`,
    zz&&`@zz(${zz==='0xfe'?'BROADCAST':zz})`,
    single&&idComb.length>=2
      ? `@${isDefault?'base':'id'}(${idComb.join(', ')})`
      : idComb.length ? chain.map(i=>`@ext(${i.join(', ')})`).join(' ')
      : undefined,
    `model ${modelName} {`,
    ...fields,
    '}',
    condNamespace&&`}`,
  ];
}
const messageTransSub = (subdir: string): Trans<MessageLine> => (...args): OptStrs => {
  const [,,header] = args;
  header && setSubdirManuf(subdir);
  if (header) return [
    ...messageHeader,
    `namespace ${subdir};`,
    '',
    ...namespaceWithZz(header),
  ];
  return messageTrans(...args);
}
const joinNl = (inp?: OptStrs): string|undefined =>
  inp?.length ? (inp.filter(i=>i!==undefined&&i!==false).join('\n')+'\n\n') : undefined; // one extra for block separation

const helpTxt = [
  'usage: csv2tsp [-k] [-o outdir] [-b basedir] [csvfile*]',
  'converts ebusd csv files to tsp for use with ebus typespec library.',
  'with:',
  '  -N           do not normalize names',
  '  -b basedir   the base directory for determining namespace of each csvfile (default "latest/en")',
  '  -o outdir    the output directory (default "outtsp")',
  '  -l langfile  the file name in which to store the multi-language mapping (default "i18n.yaml" in outdir)',
  '  -L lang      the language code for -l option (default "en")',
  '  -w           warn on different text for same key',
  '  -m mapfile   the file name of a multi-language mapping to read for normalizing i18n',
  '  -M lang      the language code for -m option (default "en")',
  '  -s i18ndir   the directory in which to store i18n file(s) per language ("<lang>.yaml")',
  '  csvfile      the csv file(s) to transform (unless to traverse the whole basedir)'
];
let normalize = true;
type I18n = {first: string, en?: string, de?: string, locations: Set<string>}
const i18n = new Map<string, I18n>(); // map from i18n key to src language text and locations as message/field/template key
let i18nLang: keyof Omit<I18n, 'locations'> = 'en';
let warnI18n = false;
let i18nMap: Map<string, [string, Partial<I18n>]>; // map from message/field/template key to i18n key and language+text
export const csv2tsp = async (args: string[] = []) => {
  let indir = 'latest/en';
  let outdir = 'outtsp';
  let files: string[] = [];
  let langFile: string|undefined;
  let normFile: string|undefined;
  let normFileLang: keyof Omit<I18n, 'locations'> = 'en';
  let storeI18nDir: string|undefined;
  for (let i=0; i<args.length; i++) {
    const arg = args[i];
    switch (arg) {
      case '-h':
      case '--help':
      case '-?':
        console.log(joinNl(helpTxt));
        return;
      case '-N':
        normalize = false;
        break;
      case '-b':
        indir = args[++i];
        break;
      case '-o':
        outdir = args[++i];
        break;
      case '-l':
        langFile = args[++i];
        break;
      case '-L':
        i18nLang = args[++i] as keyof Omit<I18n, 'locations'>;
        break;
      case '-w':
        warnI18n = true;
        break;
      case '-m':
        normFile = args[++i];
        break;
      case '-M':
        normFileLang = args[++i] as keyof Omit<I18n, 'locations'>;
        break;
      case '-s':
        storeI18nDir = args[++i];
        break;
      default:
        files = args.slice(i);
        i = args.length;
        break;
    }
  }
  if (!langFile) {
    langFile = path.join(outdir, 'i18n.yaml');
  }
  if (normFile) {
    let read: string|undefined;
    try {
      read = await readFile(normFile, 'utf-8');
    } catch (e) {
      console.error(`unable to read mapping file ${normFile}, ignoring it`);
    }
    if (read) {
      i18nMap = new Map();
      const normData = await load(read) as Record<string, I18n & {locations: string[]}>;
      for (const [k, v] of Object.entries(normData)) {
        v.locations.forEach(l => i18nMap.set(l, [k, {first: v.first, [normFileLang]: v[normFileLang] as string}]))
      }
    }
  }
  if (!files?.length) {
    // whole tree in indir if no files
    files = (await fs.promises.readdir(indir, {withFileTypes: true, recursive: true}))
    .filter(e => e.isFile() && !e.isSymbolicLink() && (e.name.endsWith('.csv')||e.name.endsWith('.inc')))
    .sort()
    .map(e => path.join(e.parentPath, e.name));
  }
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
    const isTemplates = name==='_templates.csv';
    const isInclude = path.extname(name)==='.inc';
    const nameNoExt = path.basename(name, path.extname(name));
    const namespace = isInclude ? nameNoExt+'_inc' : nameNoExt;
    const newFile = path.join(todir, namespace+'.tsp');
    console.log(`generating ${newFile}`);
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
    const empty = (line: CsvLine) => !line || !Object.keys(line).length;
    const content: ReqStrs = [];
    const additions: Additions = {
      imports: [],
      includes: [],
      models: [],
      defaultsByName: new Map<string, number>(),
      conditions: new Map<string, string[]>(),
    };
    const location = path.join(subdir, name);
    const push = (inp: OptStrs, cb: TransformCallback, flush=false) => {
      if (!transform) return cb();
      if (inp?.length) {
        if (first) {
          first = false;
          content.push(...trans(location, undefined, namespace, additions)||[]); // prepend header on first push
        }
        content.push(...inp);
      }
      if (!flush) return cb();
      if (additions.imports.length) {
        const pos = content.map(l => l&&l.startsWith('import ')).lastIndexOf(true);
        content.splice(pos+1, 0, ...additions.imports);
      }
      const addToNamespace = (lines: ReqStrs) => {
        if (!lines?.length) return;
        const line = content[content.length-1];
        if (line && line.startsWith('}')) {
          // assumed end of namespace
          content.splice(content.length-1, 0, ...lines);
        } else {
          content.push(...lines);
        }
      };
      addToNamespace(additions.models);
      if (additions.includes.length) {
        addToNamespace([
          '',
          '/** included parts */',
          'union _includes {',
          ...additions.includes.map(([i,c]) => `${c.join('\n')}${i.split('.').map(i=>(i.match(/^[0-9]/)?'_':'')+i).join('.')}_inc,`),
          '}',
        ]);
      }
      const contentStr = joinNl(content) as string;
      // formatTypeSpec(contentStr)
      // .then((d:string) => cb(null, d), cb);
      cb(null, contentStr);
    }
    let firstLine = true;
    await pipeline(
      fs.createReadStream(file, 'utf-8'),
      csvParser({headers: false}),
      transform = new Transform({
        objectMode: true,
        transform: (line: CsvLine, _, cb) => {
          if (line[0]?.startsWith('#')) {
            if (firstLine) {
              firstLine = false;
              return push(undefined, cb);
            }
            const parts = [];
            for (let i=0; i<Object.keys(line).length; i++) {
              const str = line[i];
              if (str===undefined) {
                break;
              }
              parts.push(str);
            }
            const str = parts.join().substring(1).trim().replaceAll(/,+/g, ',').replace(/,$/, '');
            return push(empty(str)?undefined:[`// ${str}`], cb)
          }
          push(empty(line)?undefined:trans(location, line as any, undefined, additions), cb)
        },
        flush: (cb) => push(trans('', undefined, false, additions), cb, true),
      }),
      fs.createWriteStream(newFile),
    );
  }
  if (langFile) {
    const replacer = (key: string, value: any) => {
      if (value instanceof Map) {
        const ret: Record<string, any> = {};
        value.forEach((v, k) => ret[k] = replacer(k, v));
        return ret;
      }
      if (value instanceof Set) {
        const ret: any[] = [];
        value.forEach(v => ret.push(replacer(v, v)));
        return ret;
      }
      return value;
    };
    console.log(`writing multi-language mapping to ${langFile}`);
    await writeFile(langFile, dump(i18n, {replacer}), 'utf-8');
    if (storeI18nDir) {
      // const langs = new Set<string>();
      // i18n.forEach(i => Object.keys(i).forEach(l => l!=='locations' && l!=='first' && langs.add(l)));
      for (const lang of ['en', 'de']) { // langs) {
        // if (!lang.match(/^[a-z][a-z]$/)) continue;
        const data: Record<string, string> = {};
        i18n.forEach(i => {
          const src = i.first;
          const str = i[lang as keyof I18n];
          if (src && typeof str === 'string') {
            data[src] = str;
          }
        });
        if (!Object.keys(data).length) continue;
        const file = path.join(storeI18nDir, lang+'.yaml');
        console.log(`writing i18n file to ${file}`);
        await writeFile(file, dump(data), 'utf-8');
      }
    }
  }
};
