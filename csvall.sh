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
  -e 's#,UCH,,hours\?,\?#,hours,,,#i' \
  -e 's#,ULG,hour,#,hoursum,,#i' \
  -e 's#,ULG,,hour,#,hoursum,,,#i' \
  -e 's#,UIN,,Steps,#,UIN,,,#i' \
  -e 's#,UIN,,Schritte,#,UIN,,,#ig' \
  -e 's#,UIN,,sec,#,seconds2,,,#ig' \
  -e 's#,UIN,,h,hours#,hoursum2,,,#ig' \
  -e 's#,UIN,,,hours#,hoursum2,,,#ig' \
  -e 's#,UIN,,hours,#,hoursum2,,,#ig' \
  -e 's#,UCH,,sec,#,seconds0,,,#ig' \
  -e 's#,UCH,,min / 5,#,minutes5,,,#ig' \
  -e 's#,mcmode,,,"0=OFF, 1=ON, 2=AUTO, 3=MANUAL"#,hwcmode2,,,#' \
  -e 's#,hwcmode2,,,"0=OFF, 1=ON, 2=AUTO, 3=MANUAL"#,hwcmode2,,,#' \
  -e 's#,ULG,,,Maintance Alarm Date#,DTM,,,Maintance Alarm Date#' \
  -e 's#,HEX:8,,,DCF Time / date[^,]*#,btime;bdate,,,#' \
  -e 's#,btime;bdate,,,DCF Time / date stamp struct[^,]*#,btime;bdate,,,#' \
  -e 's#,VTI;HDA,,,DCF Time / date stamp struct[^,]*#,VTI;HDA,,,#' \
  -e 's#^r,,FaultlistDK\[0\],#r,,FaultlistDK,#' \
  -e 's#,,night-\?time#,,NightTime#i' \
  -e 's#,,Time&Date#,,TimeDate#i' \
  -e 's#,UCH,240=off;15=on,#,onoff2,,#' \
  -e 's#,UCH,,,"Off=0, On=1"#,onoff,,,#' \
  -e 's#,UCH,240=no;15=yes,#,yesno2,,#' \
  -e 's#,RückmeldungB#,RueckmeldungB#' \
  -e 's#ReglerCurrentTEMP#ReglerCurrentTemp#' \
  -e 's#\(,CounterStartattempts[.*],\)temp0,#\1UCH,#' \
  -e 's#ForWay#FourWay#g' \
  \{\} \; \
&& npm run csv2tsp-extra \
&& npm run csv2tsp \
&& npm run csv2tsp-combine \
&& mv outtsp.de/i18n.yaml outtsp/i18n.yaml \
&& ( (cd outtsp.de && find . -type f) | xargs -i bash -c 'test -f  outtsp/{} || cp outtsp.de/{} outtsp/{}') \
&& cp normalized/*.tsp outtsp/ \
&& sed -i -e 's#using Ebus.Str;#using Ebus.Str;\nusing Ebus.Contrib;#' outtsp/tem/_templates.tsp \
&& npm run maintsp \
&& npm run format \
&& npm run lint
