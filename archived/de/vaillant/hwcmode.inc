# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
# DHW/CC: Betriebsart,,,,,,,,,,,,,
*r,,,,,,"B504",,,,,,,
*w,,,,,,"B505",,,,,,,
r,,DateTime,Datum Uhrzeit,,,,00,,,dcfstate;btime;bdate;temp2,,,
r,,Mode,Betriebsart/Temperatur,,,,01,,,temp0;hwcmode;IGN:2;hwcmode;mctype7;HEX;daynight,,,
w,,SetTempDesired,Solltemperatur setzen,,,,01,,,temp0,,,
w,,SetMode,Betriebsart setzen,,,,02,,,hwcmode,,,
w,,SetFlowTempMin,Minimalen Vorlaufsollwert setzen,,,,0e,,,temp0,,,
w,,SetFlowTempMax,Maximalen Vorlaufsollwert setzen,,,,0f,,,temp0,,,
r,,Params,Parameter,,,,09,,,temp0;IGN:3;mctype7;temps;IGN;temps;temps;IGN,,,
r,,Status0a,Status Vorlauf Ist/Mixer/Pumpe/Vorlauf Soll,,,,0A,,,temp:flowtemp;mixer;onoff:pump;onoff;temp0:flowtempdesired
r,,Status,Soll/Status/Ist/Soll,,,,0D,,,temp0;onoff;temp;temp0,,,
r,,Status16,Aussentemperatur,,,,16,,,temp,,,
