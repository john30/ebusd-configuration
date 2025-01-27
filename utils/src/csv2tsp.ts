import csvParser from "csv-parser";
import {createReadStream, createWriteStream, type Stats} from "fs";
import {mkdir, readFile, readdir, readlink, stat, symlink, unlink, writeFile} from "fs/promises";
import {dump, load} from "js-yaml";
import * as path from 'path';
import {Transform, type TransformCallback} from "stream";
import {pipeline} from "stream/promises";
import {isDeepStrictEqual} from "util";

type ReqStr = string | undefined | false;
type ReqStrs = ReqStr[];

type OptStrs = ReqStrs | undefined;

type CsvLine = Record<number, string|undefined>;

type Additions = {
  subdir: string, file: string, nameNoExt: string,
  imports: Map<string, ReqStr>, includes: [string, string[]][],
  defaultsByName: Map<string, number>, renamedDefaults: Record<string, string>,
  baseModels: Map<string, KnownModel>, complexModels: Map<string, string>,
  conditions: Map<string, string[]>, conditionBlocks: Map<string, {header: string[], lines: ReqStrs}>,
  renamedTemplates: Map<string, string>,
};

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
  'import "@ebusd/ebus-typespec";'
]
const ebusUsing = [
  'using Ebus;',
  'using Ebus.Num;',
  'using Ebus.Dtm;',
  'using Ebus.Str;',
]
type KnownModel = {
  dd: number[],
  dir?: string,
  auth?: string,
}
const knownBaseModels: Record<string, Record<string, KnownModel>> = {vaillant: {
  r: {dd: [0xb5, 0x09, 0x0d]},
  w: {dd: [0xb5, 0x09, 0x0e], dir: 'w'},
  u: {dd: [0xb5, 0x09, 0x29], dir: 'u'},
  wi: {dd: [0xb5, 0x09, 0x0e], dir: 'w', auth: 'install'},
  ws: {dd: [0xb5, 0x09, 0x0e], dir: 'w', auth: 'service'},
  rm: {dd: [0xb5, 0x04]},
  wm: {dd: [0xb5, 0x05], dir: 'w'},
  rt: {dd: [0xb5, 0x15]},
  wt: {dd: [0xb5, 0x15], dir: 'w'},
}};
const knownComplexModels: Record<string, Record<string, string>> = {vaillant: {
  'r': 'ReadonlyRegister',
  'r,w': 'Register',
  'r,wi': 'InstallRegister',
  'r,ws': 'ServiceRegister',
  'r,u': 'ReadonlyUpdateRegister',
  'r,u,w': 'UpdateRegister',
  'r,u,wi': 'InstallUpdateRegister',
  'r,u,ws': 'ServiceUpdateRegister',
  'rm,wm': 'Mode',
  'rt,wt': 'Timer',
}};
const knownbaseModelTemplates: Record<string, string> = {vaillant: `
/** default *r for register */
@base(MF, 0x9, 0xd)
model r {}

/** default *w for register */
@write
@base(MF, 0x9, 0xe)
model w {}

/** default *u for register */
@passive 
@base(MF, 0x9, 0x29)
model u {
  @maxLength(2) 
  value: IGN,
}

/** default *wi for register with user level "install" */
@write
@auth("install")
@base(MF, 0x9, 0xe)
model wi {}

/** default *ws for register with user level "service" */
@write
@auth("service")
@base(MF, 0x9, 0xe)
model ws {}

/** read/write register */
@inherit(r, w)
model Register<T> {
  value: T;
}

/** read only register */
@inherit(r)
model ReadonlyRegister<T> {
  value: T;
}

/** installer level register */
@inherit(r, wi)
model InstallRegister<T> {
  value: T;
}

/** service level register */
@inherit(r, ws)
model ServiceRegister<T> {
  value: T;
}

/** read/write updated register */
@inherit(r, w, u)
model UpdateRegister<T> {
  value: T;
}

/** read only updated register */
@inherit(r, u)
model ReadonlyUpdateRegister<T> {
  value: T;
}

/** installer level updated register */
@inherit(r, wi, u)
model InstallUpdateRegister<T> {
  value: T;
}

/** service level updated register */
@inherit(r, ws, u)
model ServiceUpdateRegister<T> {
  value: T;
}

/** default *r for mode */
@base(MF, 0x04)
model rm {
}

/** default *w for mode */
@write
@base(MF, 0x05)
model wm {
}

/** default *r for timer */
@base(MF, 0x15)
model rt {
  @maxLength(1)
  value: IGN;
}

/** default *w for timer */
@write
@base(MF, 0x15)
model wt {}

/** timer */
@inherit(rt, wt)
model Timer<T> {
  /** timer value */
  value: T;
}
`};
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
const pascalCase = (s?: string) => s ? s.substring(0,1).toUpperCase()+s.substring(1) : s;
const normId = (id: string): string => (id || '')
  .replaceAll('ä','ae').replaceAll('ö','oe').replaceAll('ü','ue')
  .replaceAll('Ä','AE').replaceAll('Ö','OE').replaceAll('Ü','UE')
  .replaceAll('²', '2').replaceAll('³', '3')
  .replaceAll(/[^a-zA-Z0-9_]/g, '_').replace(/^([0-9])/, '_$1')
  .replaceAll(/__+/g, '_').replace(/^(.+)_$/, '$1');
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
  let old = i18n.get(key);
  if (!old && !add && i18nMapRev) {
    const other = i18nMapRev.get(str)!;
    if (other) {
      key = other!.toLowerCase().replaceAll(/[^a-z0-9]/g, '');
      first = other;
      old = i18n.get(key);
      add = {first, [i18nLang]: str, en: other};
    }
  }
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
const normComment = (location: string, str?: string) => {
  if (!str || commentI18nIgnore && commentI18nIgnore.test(str)) {
    return str;
  }
  return addI18n(location, str.replace(/@/g, 'at').replaceAll('**', '^'));
};
const templateTrans: Trans<TemplateLine> = (location, line, header, additions): OptStrs => {
  if (header) return templateHeader;
  if (header===false) {
    const base = knownbaseModelTemplates[additions.subdir || ''] || '';
    return [
      ...addValueLists(),
      ...(base ? [base] : []),
      ...templateFooter,
    ];
  }
  line = objSlice(line);
  if (!line) return;
  const {id, renameTo, typ, typLen, comm, divisor, values}
  = divisorValues(line[0], line[1], line[2], line[4], undefined, true, additions.renamedTemplates);
  if (renameTo) {
    additions.renamedTemplates.set(id, renameTo);
  }
  const types = line[1].split(';');
  if (types.length>1) {
    const seen = new Map<string, number>();
    return [
      '',
      comm&&comm!==line[1]&&`/** ${normComment(`${location}:${id}`, comm)} */`,
      `model ${id} {`, // expected to be lowercase in templates
      ...types.map(t => {
          const {id, typ, typLen} = divisorValues('', t, '', '', undefined, undefined, additions.renamedTemplates);
          const name = removeTrailNum(normFieldName(additions.renamedTemplates.get(id) || id));
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
  ['tem', [0x10, 'TEM']],
  ['wolf', [0x19, 'Wolf']], // actually under kromschroeder below
  ['encon', [0x40, 'ENCON']],
  ['kromschroeder', [0x50, 'Kromschröder']],
  ['vaillant', [0xb5, 'Vaillant']],
  ['weishaupt', [0xc5, 'Weishaupt']],
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
    `namespace ${pascalCase(subdir)};`, // expected to be PascalCase
    setSubdirManuf(subdir)&&`alias MF = ${hex(subdirManufId||0)}; // Ebus.Id.Values_manufacturers.${subdirManuf}`,
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
  comm: string|undefined, singleField?: string, renamable?: true, renamedTemplates?: Map<string, string>,
): {id: string, renameTo?: string, typ?: string, typLen?: string, comm: string, divisor?: string, values?: string, constValue?: string} => {
  let [typ, typName] = splitTypeName(typIn);
  name = name || typName;
  let renameTo: string|undefined = undefined;
  if (renamable) {
    const parts = name.split(':');
    if (parts.length>1) {
      name = parts[0];
      renameTo = parts[1];
    }
  }
  const id = normId(name||(typ.split(':')[0]));
  comm = comm || '';
  const typLen = addLength(typ);
  // const origTyp = typ;
  typ = normType(typ);
  if (renamedTemplates?.has(typ)) {
    name = renamedTemplates.get(typ);
  }
  // if (!comm && origTyp && !isBaseType(origTyp)) {
  //   comm = origTyp;
  // }
  const divParts = divVal?.split(';');
  const hasValues = divParts && (divParts.length>1 || divParts[0].indexOf('=')>0); // may be just one
  const isConst = !hasValues && divParts?.length===1 && divParts[0].startsWith('=');
  let divisor: string|undefined;
  let values: string|undefined;
  let constValue: string|undefined;
  if (isConst) {
    constValue = divParts[0].substring(1).trim();
  } else if (hasValues) {
    values = `Values_`;
    values += ((id&&!isBaseType(id)&&id)||singleField||comm||'').replaceAll(/[^a-zA-Z0-9]/g, '_');
    values += suffix(values, valueLists.seen);
    valueLists.list.set(values, divParts);
    values = `@values(${values})`;
  } else if (divVal) {
    const value = parseInt(divVal!, 10);
    divisor = `@${value<0?'factor':'divisor'}(${Math.abs(value)})`;
  }
  return {id, renameTo, typ, typLen, comm, divisor, values, constValue};
};
const isSimpleField = (line: FieldOfLine, singleField?: string): {comm?: string, typ: string}|undefined => {
  if (!line || !singleField) return;
  const types = line[2].split(';');
  if (types.length>1 || line[1] || line[4] || line[3]) return;
  // similar to divisorValues() but without incrementing any suffix
  let [typ] = splitTypeName(line[2]);
  const typLen = addLength(typ);
  typ = normType(typ);
  if (typLen || !typ) {
    return;
  }
  return {comm: line[5], typ};
}
const fieldTrans = (location: string, line: FieldOfLine|undefined, seen: Map<string, number>, additions: Additions, singleField?: string, optional?: true): OptStrs => {
  if (!line) return;
  const {id, typ, typLen, comm, divisor, values, constValue}
  = divisorValues(line[0], line[2], line[3], line[5], singleField);
  const types = line[2].split(';');
  if (types.length>1) {
    const ret: ReqStrs = [];
    let firstComm: string|undefined = comm;
    types.filter(t=>t).forEach(t => {
      const {id, typ, typLen} = divisorValues('', t, '', '', undefined, undefined, additions.renamedTemplates);
      const name = removeTrailNum(normFieldName(additions.renamedTemplates.get(id) || id));
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
    constValue!==undefined ? `@constValue(${constValue})` : '',
    `${suffName}${optional?'?':''}: ${typ},`,
  ]
};
const messageHeader = [
  ...ebusImport,
  'import "./_templates.tsp";',
  ...ebusUsing,
];
const messageFooter: string[] = ['}'];
const directionNorm = (dir: string): string|undefined => dir[0]==='r' ? undefined : dir[0]==='w' ? 'w' : ((dir[1]==='w'?'uw':'')+'u');
const direction = (dir: string): string|undefined => dir[0]==='r' ? undefined : dir[0]==='w' ? '@write ' : ((dir[1]==='w'?'@write ':'')+'@passive ');
let subdirManufId: number|undefined;
let subdirManuf: string|undefined;
const hex = (n?: number) => n===undefined?undefined:`0x${(n|0x100).toString(16).substring(1)}`;
const fromHex = (...strs: ReqStrs): (number|string)[] => fromHexOpt(false, ...strs);
const fromHexOpt = (allowMf: boolean, ...strs: ReqStrs): (number|string)[] => Buffer.from(strs.filter(s=>s!==undefined).join(''))
.reduce((p, c, i, all) => {
  if (i%2) {
    const n = Number.parseInt(String.fromCharCode(p.n, c), 16);
    p.r.push(allowMf && i===1 && all.length>=2*2 && n===subdirManufId ? 'MF' : n<2 ? n : `0x${n.toString(16)}`);
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
const namespaceWithZz = (header: string, additions: Additions) => {
  const parts = header.split('.');
  let zz: string|undefined;
  let circuit = header;
  if (parts.length>=2 && parts[0].length==2) {
    // zz.circuit
    zz = `@zz(0x${parts[0]})`
    if (additions.nameNoExt.startsWith(parts[0]+'.')) {
      // comment unnecessary @zz
      zz = '// '+zz;
    }
    parts.splice(0, 1);
  }
  // note: these need to be kept for uniqueness as e.g. 52.mc2.mc.4 and 53.mc2.mc.5 would otherwise overlap
  // if (parts.length>1 && parts[parts.length-1].match(/^[0-9]*$/)) {
  //   // drop component index suffix
  //   parts.splice(parts.length-1, 1);
  // }
  circuit = parts.filter(p=>!!p).map(p=>normId(p)).map(p=>(p[0]>='0'&&p[0]<='9'?'_'+p:pascalCase(p))).join('.');
  return [
    zz,
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
      let id = normId(n);
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
      ...namespaceWithZz(header, additions),
    ];
  }
  if (header===false) {
    return [...addValueLists(), ...messageFooter];
  };
  const line = objSlice(wholeLine);
  if (!line) return;
  let dirsStr = line[0].trim();
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
      const zz = hex(fromHex(line[5])[0] as number) || '';
      let value = line[6]||'';
      let noNs = '';
      if (circuit==='scan') {
        if (!model) {
          // refers to Ebus.Id.Id
          circuit = 'Id.Id';
          field = field?.toLowerCase();
        } else {
          additions.imports.set(circuit.toLowerCase(), `import "./${circuit}.tsp";`);
        }
      }
      const fname = field||(value&&normalize?'value':'');
      additions.conditions.set(name, [[pascalCase(circuit),pascalCase(model),fname].filter(p=>p).join('.'), value, zz, noNs]);
      return;
    }
    // conditional
    const loadInclude = dirsStr[0]==='!' && line[1] && path.basename(line[1], path.extname(line[1]));
    conditions.forEach(cond => {
      // SW<1,SW>1,SW=1,SW<=1,SW>=1
      let [,name, values] = cond.match(/^([^=<>]*)(.*)$/)||[,cond];
      const [field, value, zz, noNs] = additions.conditions.get(name)||additions.conditions.get(cond)||[];
      if (value && !values) {
        values = value;
      }
      if (zz) {
        conds.push(`@conditionExt(${field}, ${zz}${values?`, ${values.split(';').map(v=>'"'+v+'"').join(',')}`:''})`);
      } else {
        conds.push(`@condition(${field}${values?`, ${values.split(';').map(v=>'"'+v+'"').join(',')}`:''})`);
      }
      let nsAdd;
      if (value) {
        nsAdd = name;
      } else if (noNs) {
        nsAdd = '';
      } else {
        nsAdd = (zz?'_'+zz.substring(2)+(values?'_':''):'')+(values||'');
        if (loadInclude && nsAdd.startsWith("='") && field.includes('.Id.')) {
          nsAdd = '_'+loadInclude.split('.').reverse()[0]; // reduce multiple product ids with filename instead
        }
        nsAdd = ((field.startsWith('Id.Id.')?field.substring('Id.Id.'.length):field)+nsAdd)
          .replace('>=', '_ge').replace('<=', '_le').replace('>', '_gt').replace('<', '_lt').replace('==', '_eq')
          .replaceAll(/[^a-zA-Z0-9]/g, '_');
      }
      condNamespace = (condNamespace?condNamespace+'_'+nsAdd:nsAdd).replaceAll('__', '_');
    });
  }
  if (dirsStr[0]==='!') {
    // include/load instruction
    const isLoad = dirsStr==='!load';
    if (dirsStr==='!include' || isLoad) {
      const fileNoExt = path.basename(line[1]!, path.extname(line[1]!));
      additions.imports.set(fileNoExt.toLowerCase(), `import "./${fileNoExt}_inc.tsp";`);
      const fileComp = fileNoExt.split('.').reverse()[0];
      let name = condNamespace || fileComp;
      name = normId(name.replace(/(__[^_]+_?)+/, '_'+fileComp)); // reduce multiple product ids with filename instead
      additions.includes.push([fileNoExt, [...conds, isLoad ? !conds.length ? 'default: // final load alternative\n' : name+': ' : '']]);
    }
    return;
  }
  let circuit: string|undefined = line[1];
  let auth: string|undefined;
  if (isDefault) {
    const baseModels = knownBaseModels[additions.subdir || ''] || '';
    if (baseModels && !additions.baseModels.size) {
      for (const [name, baseModel] of Object.entries(baseModels)) {
        additions.defaultsByName.set(name, 0);
        additions.baseModels.set(name, baseModel);
      }
    }
    const complexModels = knownComplexModels[additions.subdir || ''] || '';
    if (complexModels && !additions.complexModels.size) {
      for (const [key, complexModel] of Object.entries(complexModels)) {
        additions.complexModels.set(key, complexModel);
      }
    }
    // default line: convert to base models
    const circuitLevel = circuit?.split('#');
    if (circuitLevel?.length===2) {
      auth = circuitLevel[1];
      circuit = circuitLevel[0];
      isDefault += ` for user level "${auth}"`;
    }
  }
  if (circuit) {
    const name = path.basename(location, path.extname(location));
    const parts = name.split('.');
    if (parts.length===1 ? circuit===name : parts[0].match(/^[0-9a-f]{2,2}$/) ? circuit===parts[1] : circuit===name) {
      circuit = undefined;
    }
  }
  if (circuit && !namespacePerCircuit) {
    console.warn(`found circuit ${circuit} that differs from the file name circuit part in ${location}${isDefault?' for default':''}. consider using the '-n' switch!`);
  }
  const dirs = dirsStr.split(';').map(d=>d.replace(/[0-9]$/,'')); // strip off poll prio
  const poll = dirsStr.split(';').filter(d=>d.match(/r[0-9]$/)).map(d=>d.replace(/.*([0-9])$/,'$1')).filter(p=>p).sort(); // extract poll prio
  let defaultNs: string|undefined;
  if (namespacePerCircuit && !isDefault && !circuit) {
    const add = additions.renamedDefaults[':'+dirsStr];
    if (add) {
      defaultNs = add;
      // dirs.forEach((v, i) => dirs[i] = add+':'+v);
      condNamespace = add+(condNamespace?'.'+condNamespace:'');
    }
  }
  // single: outside of any defaults inherit scope
  const single = dirs.length===1 && (
    isDefault
    || line[6] // no inherit from default when pbsb is set
    || !additions.defaultsByName.has((defaultNs?defaultNs+':':'')+dirs[0])
  );
  const chain = (line[7]||'').split(';').map((i,_,a)=>fromHexOpt(a.length<=1&&!!single&&!!line[6], line[6], i.split(':')[0]));
  const idComb = chain[0];
  if (isDefault) {
    if (additions.baseModels.size && !line[5]) {
      let renamedDefault;
      const numId = idComb.map(i => (i==='MF' ? subdirManufId : typeof i === 'string' ? parseInt(i, 16) : i) as number);
      const dir = directionNorm(dirs[0]);
      for (const [name, b] of additions.baseModels.entries()) {
        if ((auth ? auth===b.auth : !b.auth)
          && (dir ? b.dir===dir : !b.dir)
          && isDeepStrictEqual(numId, b.dd)) {
          renamedDefault = name;
          break;
        }
      }
      if (renamedDefault) {
        additions.renamedDefaults[dirs[0]] = renamedDefault;
        return; // do not emit as part of base models
      }
      delete additions.renamedDefaults[dirs[0]];
    }
    const suff = suffix(
      (namespacePerCircuit && !condNamespace && circuit ? circuit+':' : '')+
      dirsStr, additions.defaultsByName);
    dirs[0] += suff;
    if (namespacePerCircuit && !condNamespace && circuit) {
      additions.renamedDefaults[':'+dirsStr] = circuit;
      condNamespace = circuit;
    }
  }
  const chainLengths = chain.length>1 && (line[7]||'').split(';').map(i=>i.split(':')[1])
    .filter(i=>i?.length)
    .reduce((p,c)=>p.add(c)&&p, new Set<string>());
  if (chainLengths && chainLengths.size>1) {
    console.error(`different chain lengths in "${line[6]}", ignored`);
  }
  const zz = line[5]&&fromHex(line[5]).join();
  // adjust location before extracting fields
  location += `:${condNamespace||''}:`;
  location += single ? dirs[0]
  : dirs.map(d=>additions.renamedDefaults[d] || (d+getSuffix((defaultNs?defaultNs+':':'')+d, additions.defaultsByName))).join(',');
  location += `:${zz||''}:${idComb.join(',')}`;//inherited is missing
  const fieldLines: FieldOfLine[] = [];
  const seenFields = new Map<string, number>();
  for (let idx=messageLinePrefixLen; idx<messageLinePrefixLen+maxFields*messageLineFieldLen; idx+=messageLineFieldLen) {
    const fieldLine = objSlice(wholeLine, idx, messageLineFieldLen) as FieldOfLine;
    if (!fieldLine) {
      break;
    }
    fieldLines.push(fieldLine);
  }
  const modelName = normId(isDefault?dirs[0]:line[2]);
  let model: OptStrs;
  if (!single && additions.complexModels.size && fieldLines.length===1) {
    // check for complex known model
    const key = dirs.map(d=>additions.renamedDefaults[d] || (d+getSuffix(d, additions.defaultsByName))).sort().join();
    const name = additions.complexModels.get(key);
    let {comm, typ} = isSimpleField(fieldLines[0], modelName) || {};
    if (name && typ) {
      const msgComm = line[3];
      if (!comm || msgComm?.toLowerCase().includes(comm.toLowerCase())) {
        comm = msgComm;
      } else if (msgComm && !comm.toLowerCase().includes(msgComm.toLowerCase())) {
        comm = msgComm+': '+comm;
      }
      model = [
        comm&&`/** ${normComment(location, comm)} */`,
        auth&&`@auth("${auth}")` || (poll.length?`@poll(${poll[0]})`:undefined),
        `@ext(${idComb.join(', ')})`,
        `model ${pascalCase(modelName)} is ${name}<${typ}>;`,
      ]
    };
  }
  if (!model) {
    const fields: OptStrs = [];
    let optional: undefined|true = undefined;
    fieldLines.forEach(fieldLine => {
      if (fieldLine[0]?.startsWith('?')) {
        fieldLine[0] = fieldLine[0].substring(1);
        optional = true;
      }
      fields.push(...fieldTrans(location, fieldLine, seenFields, additions, fieldLines.length===1?modelName:'', optional)||[]);
    });
    model = [
      (line[3]||isDefault)&&`/** ${normComment(location, line[3])||isDefault} */`,
      single
        ? direction(dirs[0]) // single model
        : `@inherit(${dirs.map(d=>additions.renamedDefaults[d] || (d+getSuffix((defaultNs?defaultNs+':':'')+d, additions.defaultsByName))).join(', ')})`, // multi model
      auth&&`@auth("${auth}")` || (poll.length?`@poll(${poll[0]})`:undefined),
      line[4]&&`@qq(${fromHex(line[4]).join('')})`,
      zz&&`@zz(${zz==='0xfe'?'BROADCAST':zz})`,
      single&&idComb.length>=2
        ? `@${isDefault?'base':'id'}(${idComb.join(', ')})`
        : idComb.length ? `@ext(${idComb.join(', ')})`
          +(chain.length>1?`\n@chain(${chainLengths&&chainLengths.size?chainLengths.values().next().value:'0'}, ${chain.slice(1).map(i=>`#[${i.join(', ')}]`).join(', ')})`:'')
        : !single ? '@ext' // needed when default already defines whole id (e.g. roomtempoffset.inc)
        : undefined,
      `model ${isDefault ? modelName : pascalCase(modelName)} {`, // expected to be PascalCase
      ...fields,
      '}',
    ];
  }
  const ret = [
    '',
    ...(condNamespace ? [] : conds),
    ...model,
  ];
  if (condNamespace) {
    let condBlock = additions.conditionBlocks.get(condNamespace);
    if (!condBlock) {
      condBlock = {header: [...conds, `namespace ${pascalCase(condNamespace)} {`,], lines: []};
      additions.conditionBlocks.set(condNamespace, condBlock);
    }
    condBlock.lines.push(...ret);
    return [];
  }
  return ret;
}
const messageTransSub = (subdir: string): Trans<MessageLine> => (...args): OptStrs => {
  const [,,header,additions] = args;
  header && setSubdirManuf(subdir);
  if (header) return [
    ...messageHeader,
    `namespace ${pascalCase(subdir)};`, // expected to be PascalCase
    '',
    ...namespaceWithZz(header, additions),
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
  '  -p mapfile   the file name of a previously generated multi-language mapping to read for seeding the i18n normalization',
  '  -s i18ndir   the directory in which to store i18n file(s) per language ("<lang>.yaml")',
  '  -i regex     pattern for file names (including relative dir) to ignore',
  '  -I regex     pattern for comment strings to ignore for i18n',
  '  -n           add extra namespace for explicitly named circuit',
  '  csvfile      the csv file(s) to transform (unless to traverse the whole basedir)'
];
let normalize = true;
let namespacePerCircuit = false;
type I18n = {first: string, en?: string, de?: string, locations: Set<string>}
const i18n = new Map<string, I18n>(); // map from i18n key to src language text and locations as message/field/template key
let i18nLang: keyof Omit<I18n, 'locations'> = 'en';
let warnI18n = false;
let i18nMap: Map<string, [string, Partial<I18n>]>; // map from message/field/template key to i18n key and language+text
let i18nMapRev: Map<string, string>; // map from non-en language to en from previous mapping
let commentI18nIgnore: RegExp|undefined;
export const csv2tsp = async (args: string[] = []) => {
  let indir = 'latest/en';
  let outdir = 'outtsp';
  let files: string[] = [];
  let langFile: string|undefined;
  let normFile: string|undefined;
  let normFilePrev: string|undefined;
  let normFileLang: keyof Omit<I18n, 'locations'> = 'en';
  let storeI18nDir: string|undefined;
  let ignorePattern: RegExp|undefined;
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
      case '-p':
        normFilePrev = args[++i];
        break;
      case '-s':
        storeI18nDir = args[++i];
        break;
      case '-i':
        ignorePattern = new RegExp(args[++i]);
        break;
      case '-I':
        commentI18nIgnore = new RegExp(args[++i]);
        break;
      case '-n':
        namespacePerCircuit = true;
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
      if (normFilePrev && i18nLang!=='en') {
        i18nMapRev = new Map();
      }
      for (const [k, v] of Object.entries(normData)) {
        if (i18nMapRev && v.locations.length && v[i18nLang] && v.en && v.en!==v[i18nLang]) {
          if (!i18nMapRev.has(v[i18nLang] as string)) {
            i18nMapRev.set(v[i18nLang] as string, v.en);
          }
        }
        v.locations.forEach(l => {
          i18nMap.set(l, [k, {first: v.first, [normFileLang]: v[normFileLang] as string}]);
        });
      }
      if (normFilePrev && i18nLang!=='en') {
        read = undefined;
        try {
          read = await readFile(normFilePrev, 'utf-8');
        } catch (e) {
          console.error(`unable to read previous mapping file ${normFilePrev}, ignoring it`);
        }
        if (read) {
          const normDataPrev = await load(read) as Record<string, I18n & {locations: string[]}>;
          for (const [k, v] of Object.entries(normDataPrev)) {
            if (v[i18nLang] && v.en && v.en!==v[i18nLang]) {
              if (!i18nMapRev.has(v[i18nLang] as string)) {
                i18nMapRev.set(v[i18nLang] as string, v.en);
              }
            }
          }
        }
      }
    }
  }
  const links: Record<string, string[]> = {}; // key=src location within indir, value=to[] within indir
  if (!files?.length) {
    // whole tree in indir if no files
    const all = await readdir(indir, {withFileTypes: true, recursive: true});
    files = all
      .filter(e => e.isFile() && !e.isSymbolicLink() && (e.name.endsWith('.csv')||e.name.endsWith('.inc')))
      .sort()
      .map(e => path.join(e.parentPath, e.name));
    for (const e of all.filter(e => e.isSymbolicLink())) {
      const file = path.join(e.parentPath, e.name);
      const link = await readlink(file);
      const src = path.relative(indir, path.resolve(e.parentPath, link));
      let list = links[src];
      if (!list) {
        list = [];
        links[src] = list;
      }
      list.push(path.relative(indir, file));
    }
  }
  const renamedTemplatesByDir = new Map<string, Map<string, string>>();
  for (const file of files) {
    const subdir = path.relative(indir, path.dirname(file));
    const name = path.basename(file);
    const location = path.join(subdir, name);
    if (ignorePattern?.test(location)) {
      continue;
    }
    const todir = path.join(outdir, subdir);
    try {
      await stat(todir); // throws if not exists
    } catch (_) {
      console.log(`creating directory ${todir}`);
      await mkdir(todir, {recursive: true});
    }
    // _templates is first per directory
    const isTemplates = name==='_templates.csv';
    let renamedTemplates = renamedTemplatesByDir.get(subdir);
    if (!renamedTemplates) {
      renamedTemplates = new Map(subdir ? renamedTemplatesByDir.get('') : undefined);
      renamedTemplatesByDir.set(subdir, renamedTemplates);
    }
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
      subdir, file, nameNoExt,
      imports: new Map(),
      includes: [],
      defaultsByName: new Map(),
      renamedDefaults: {},
      baseModels: new Map(),
      complexModels: new Map(),
      conditions: new Map(),
      conditionBlocks: new Map(),
      renamedTemplates,
    };
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
      if (additions.imports.size) {
        const pos = content.map(l => l&&l.startsWith('import ')).lastIndexOf(true);
        content.splice(pos+1, 0, ...additions.imports.values());
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
      if (additions.conditionBlocks.size) {
        for (const {header, lines} of additions.conditionBlocks.values()) {
          addToNamespace([...header, ...lines, '}']);
        }
      }
      if (additions.includes.length) {
        addToNamespace([
          '',
          '/** included parts */',
          'union _includes {',
          ...additions.includes.map(([i,c]) => `${c.join('\n')}${i.split('.').map(i=>(i.match(/^[0-9]/)?'_'+i:pascalCase(i))).join('.')}_inc,`),
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
      createReadStream(file, 'utf-8'),
      csvParser({headers: false, mapValues: ({value}) => typeof value === 'string' ? value.trim() : value}),
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
      createWriteStream(newFile),
    );
    if (!isInclude) {
      for (const link of links?.[location] || []) {
        const linkNameNoExt = path.basename(link, path.extname(link));
        const linkFile = path.join(todir, linkNameNoExt+'.tsp');
        const target = path.relative(todir, newFile);
        let st: Stats|undefined;
        let lnk: string|undefined;
        try {
          st = await stat(linkFile); // throws if not exists
          lnk = await readlink(linkFile);
        } catch (_) {
          // handled below
        }
        if (lnk===target) {
          // fine
        } else {
          if (st) {
            try {
              await unlink(linkFile);
            } catch (_) {
              // try creating the new link nevertheless
            }
          }
          await symlink(target, linkFile);
        }
      }
    }
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
    i18n.forEach((i, k) => {
      // ensure same order
      i18n.set(k, {
        first: i.first,
        en: i.en,
        de: i.de,
        locations: i.locations,
      });
    });

    const sortKeys = (a: string, b: string) => {
      const diff = a.toLowerCase().localeCompare(b.toLowerCase());
      if (diff !== 0) {
        return diff;
      }
      return a.localeCompare(b);
    };
    await writeFile(langFile, dump(i18n, {replacer, sortKeys}), 'utf-8');
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
        await writeFile(file, dump(data, {sortKeys}), 'utf-8');
      }
    }
  }
};
