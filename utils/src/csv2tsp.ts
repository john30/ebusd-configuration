import csvParser from "csv-parser";
import * as fs from "fs";
import * as path from 'path';
import {Transform} from "stream";
import {pipeline} from "stream/promises";


type OptStrs = (string | undefined)[] | undefined;

type CsvLine = OptStrs;

type Trans<T extends CsvLine> = (line?: T, header?: boolean) => OptStrs;

type TemplateLine = CsvLine & {
  0: string, // name
  1: string, // type / templates
  2?: string, // divider / values
  3?: string, // unit
  4?: string, // comment
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
const addLength = (t: string): string|undefined => {
  const parts = t.split(':');
  if (parts.length<2 || !dynLengthTypes.has(parts[0])) return '';
  return `@maxLength(${parts[1]}) `;
}
const templateTrans: Trans<TemplateLine> = (line?, header?): OptStrs => {
  if (header===true) return templateHeader;
  if (header===false) return templateFooter;
  if (!line) return;
  const types = line[1].split(';');
  if (types.length>1) {
    const seen = new Map<string, number>();
    const suffix = (t: string) => {
      let idx = seen.get(t);
      if (idx===undefined) {
        seen.set(t, 0);
        return '';
      }
      seen.set(t, ++idx);
      return `_${idx}`;
    }
    return [
      line[4]&&`/** ${line[4]} */`,
      `model ${normId(line[0])} {`,
      ...types.map(t => `${addLength(t)}${normId(t)}${suffix(t)}: ${normType(t)},`),
       '}',
      ];
  }
  return [
    line[4]&&`/** ${line[4]} */`,
    line[3]&&`@unit("${line[3]}")`,
    addLength(types[0]),
    `scalar ${normId(line[0])} extends ${normType(types[0])}`,
  ]
}
const templateTransSubdir = (subdir: string): Trans<TemplateLine> => (line?, header?): OptStrs => {
  if (header===true) return [...templateHeaderSubdir, '', `namespace ${subdir};`];
  return templateTrans(line, header);
}

type MessageLine = CsvLine & {
  0: string, // type (r[1-9];w;u)
  1?: string, // class
  2: string, // name (not required for default)
  3?: string, // comment
  4?: string, // QQ
  5?: string, // ZZ
  6?: string, // PBSB
  7?: string, // ID
  // ...fields
}
type FieldOfLine = {
  0?: string, // name
  1?: string, // part (m/s)
  2: string, // type / templates
  3?: string, // divider / values
  4?: string, // unit
  5?: string, // comment
}
const messageHeader = [
  ...ebusImport,
  'import "_templates.tsp";',
  ...ebusUsing,
];
const messageFooter: string[] = [];
const messageTrans: Trans<MessageLine> = (line?: MessageLine, header?: boolean): OptStrs => {
  if (header===true) return messageHeader;
  if (header===false) return messageFooter;
  if (!line) return;
  return [
    line[3]&&`/** ${line[3]} */`,
  ]
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
      await fs.promises.mkdir(todir, {recursive: true});
    }
    const name = path.basename(file);
    const newFile = path.join(todir, path.basename(name, path.extname(name))+'.tsp');
    const isTemplates = name==='_templates.csv';
    const trans = isTemplates
      ? subdir
        ? templateTransSubdir(subdir)
        : templateTrans
      : messageTrans;
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
