import {csv2tsp} from "./csv2tsp";

csv2tsp(process.argv.slice(2)).then(() => console.log('done'), console.error);
