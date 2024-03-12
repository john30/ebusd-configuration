# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
# MK1: Betriebsart,,,,,,,,,,,,,
*r,,,,,,"B504",,,,,,,
*w,,,,,,"B505",,,,,,,
r,,DateTime,Datum Uhrzeit,,,,00,,,dcfstate;btime;bdate;temp2,,,
r,,Mode,Betriebsart/Temperatur,,,,01,,,temp0:tempdesired;mcmode:operationmode;days:floorpavingdryingday;temp0:floorpavingdryingtemp;mcmode:teleswitchmode;mctype7:mixertype;IGN;daynight,,,
w,,SetTempDesired,Solltemperatur setzen,,,,01,,,temp0,,,
w,,SetMode,Betriebsart setzen,,,,02,,,mcmode,,,
w,,SetFloorPavingDryingDay,Estrichtrocknungstag setzen,,,,03,,,days,,,
w,,SetFloorPavingDryingTemp,Estrichtrocknungstemperatur setzen,,,,04,,,temp0,,,
w,,SetType,Kreis Typ setzen,,,,08,,,mctype,,,
#r 2-7: timer
#w 9: timer
w,,SetTempDesiredLow,Absenksollwert setzen,,,,0a,,,temp0,,,
w,,SetHeatingCurve,Heizkurve setzen,,,,0b,,,curve,,,
w,,SetShutdownTemp,Aussentemp. Abschaltgrenze setzen,,,,0c,,,temp0,,,
w,,SetPumpIdlePeriod,Pumpensperrzeit setzen,,,,0d,,,minutes0,,,
w,,SetFlowTempMin,Minimalen Vorlaufsollwert setzen,,,,0e,,,temp0,,,
w,,SetFlowTempMax,Maximalen Vorlaufsollwert setzen,,,,0f,,,temp0,,,
w,,SetMaxPreHeating,Max. Voraufheizung setzen,,,,10,,,hours,,,
r,,Params,TempDesired/SetTempDesiredLow/HeatingCurve/Type/SetShutdownTemp/SetPumpIdlePeriod/FlowTempMin/FlowTempMax/MaxPreHeating,,,,09,,,temp0:tempdesired;temps:tempdesiredlow;curve;mctype7:mixertype;temps:shutdowntemp;minutes0:pumpidleperiod;temps:flowtempmin;temps:flowtempmax;hours:maxpreheating,,,
r,,Status0a,Status Vorlauf Ist/Mixer/Pumpe/Vorlauf Soll,,,,0A,,,temp:flowtemp;mctype7:mixertype;onoff:pump;onoff:status;temp0:flowtempdesired
r,,Status,Soll Vorlauf/Status/Ist/?,,,,0D,,,temp0:flowtempdesired;onoff:status;temp:flowtemp;IGN,,,

r,,Status16,Aussentemperatur,,,,16,,,temp,,,
