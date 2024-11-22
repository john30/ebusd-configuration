#!/bin/bash
sed -i \
  -e 's/^id,/#id,/' \
  latest/en/_templates.csv latest/de/_templates.csv \
&& find latest/ -mindepth 3 -type f -not -name "_templates.csv" -exec sed -i \
  -e 's#\(HcName.*\),STR:11,#\1,hcname,#i' \
  -e 's#\(phone.*\),STR:9,#\1,phone,#i' \
  -e 's#,UCH,hour,#,hours,,#i' \
  -e 's#,ULG,hour,#,hoursum,,#i' \
  -e 's#,UIN,,Steps,#,UIN,,,#i' \
  -e 's#,UIN,,Schritte,#,UIN,,,#i' \
  \{\} \; \
&& npm run csv2tsp \
&& npm run csv2tsp-combine \
&& mv outtsp.de/i18n.yaml outtsp/i18n.yaml \
&& cp normalized/*.tsp outtsp/ \
&& npm run maintsp \
&& npm run format \
&& npm run lint
