# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
# DHW/CC: Betriebsart,,,,,,,,,,,,,
*r,,,,,,"B504",,,,,,,
*w,,,,,,"B505",,,,,,,
r,,DateTime,Datum Uhrzeit,,,,00,,,dcfstate;btime;bdate;temp2,,,
r,,Mode,Betriebsart/Temperatur,,,,01,,,temp0:tempdesired;hwcmode:operationmode;IGN:3;mctype7:mixertype;IGN;daynight:dayornight,,,
w,,SetTempDesired,Solltemperatur setzen,,,,01,,,temp0,,,
w,,SetMode,Betriebsart setzen,,,,02,,,hwcmode,,,
w,,SetFlowTempMin,Minimalen Vorlaufsollwert setzen,,,,0e,,,temp0,,,
w,,SetFlowTempMax,Maximalen Vorlaufsollwert setzen,,,,0f,,,temp0,,,
r,,Params,Parameters,,,,09,,,temp0:tempdesired;IGN:3;mctype7:mixertype;IGN:2;temps:flowtempmin;temps:flowtempmax;IGN,,,
r,,Status0a,Status Vorlauf Ist/Mixer/Pumpe/Vorlauf Soll,,,,0A,,,temp:flowtemp;mixer;onoff:pump;onoff;temp0:flowtempdesired
r,,Status,Soll Vorlauf/Status/Ist/Solltemperatur,,,,0D,,,temp0:flowtempdesired;onoff:status;temp:flowtemp;IGN,,,
r,,Status16,Aussentemperatur,,,,16,,,temp,,,

