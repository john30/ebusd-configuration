#!/bin/bash
sed -i \
  -e 's/^id,/#id,/' \
  latest/en/_templates.csv latest/de/_templates.csv \
&& sed -i \
  -e 's#^errorok,#onoff2,UCH,240=off;15=on,,\nyesno2,UCH,240=no;15=yes,,\nerrorok,#' \
  -e 's#^errorok,#yesno2,UCH,240=no;15=yes,,\nerrorok,#' \
  latest/en/vaillant/_templates.csv latest/de/vaillant/_templates.csv \
&& find latest/ -mindepth 3 -type f -not -name "_templates.csv" -exec sed -i \
  -e 's#\(HcName.*\),STR:11,#\1,hcname,#i' \
  -e 's#\(phone.*\),STR:9,#\1,phone,#i' \
  -e 's#,UCH,hour,#,hours,,#i' \
  -e 's#,ULG,hour,#,hoursum,,#i' \
  -e 's#,UIN,,Steps,#,UIN,,,#i' \
  -e 's#,UIN,,Schritte,#,UIN,,,#i' \
  -e 's#^r,,FaultlistDK\[0\],#r,,FaultlistDK,#' \
  -e 's#,,night-time#,,NightTime#i' \
  -e 's#,,Time&Date#,,TimeDate#i' \
  -e 's#,UCH,240=off;15=on,#,onoff2,,#' \
  -e 's#,UCH,240=no;15=yes,#,yesno2,,#' \
  \{\} \; \
&& npm run csv2tsp \
&& npm run csv2tsp-combine \
&& mv outtsp.de/i18n.yaml outtsp/i18n.yaml \
&& cp normalized/*.tsp outtsp/ \
&& npm run maintsp \
&& npm run format \
&& npm run lint
