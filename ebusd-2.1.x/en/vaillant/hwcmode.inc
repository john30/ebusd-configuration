# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
# HWC/CC: Operation mode,,,,,,,,,,,,,
*r,,,,,,"B504",,,,,,,
*w,,,,,,"B505",,,,,,,
r,,DateTime,Date time,,,,00,,,dcfstate;btime;bdate;temp2,,,
r,,Mode,Operation mode,,,,01,,,temp0;hwcmode;IGN:2;hwcmode;mctype7;HEX;daynight,,,
w,,SetTempDesired,Set desired temperature,,,,01,,,temp0,,,
w,,SetMode,Set operation mode,,,,02,,,hwcmode,,,
w,,SetFlowTempMin,Set min flow temperature,,,,0e,,,temp0,,,
w,,SetFlowTempMax,Set max flow temperature,,,,0f,,,temp0,,,
r,,Params,Parameters,,,,09,,,temp0;IGN:3;mctype7;temps;IGN;temps;temps;IGN,,,
r,,Status0a,Status flow temperature/mixer/pump/desired flow temperature,,,,0A,,,temp:flowtemp;mixer;onoff:pump;onoff;temp0:flowtempdesired
r,,Status,Desired flow/status/flow/desired temperature,,,,0D,,,temp0;onoff;temp;temp0,,,
r,,Status16,Outside temperature,,,,16,,,temp,,,
