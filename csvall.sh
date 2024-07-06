#!/bin/bash
sed -i \
  -e 's/^id,/#id,/' \
  latest/en/_templates.csv latest/de/_templates.csv \
&& sed -i \
  -e 's#\(HcName.*\),STR:11,#\1,hcname,#i' \
  -e 's#\(phone.*\),STR:9,#\1,phone,#i' \
  -e 's#,UCH,hour,#,hours,,#i' \
  -e 's#,ULG,hour,#,hoursum,,#i' \
  latest/en/vaillant/*.*.csv latest/de/vaillant/*.*.csv latest/en/vaillant/*.inc latest/de/vaillant/*.inc \
&& npm run csv2tsp \
&& npm run csv2tsp-combine \
&& mv outtsp.de/i18n.yaml outtsp/i18n.yaml \
&& cp normalized/*.tsp outtsp/ \
&& npm run maintsp \
&& npm run format \
&& npm run lint
