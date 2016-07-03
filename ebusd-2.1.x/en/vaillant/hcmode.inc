# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
# HC operation mode,,,,,,,,,,,,,
*r,,,,,,"B504",,,,,,,
r,,Mode,Operation mode,,,B510,00,mode,,UCH,0=off;1=standby;2=heat;3=water,,
r,,DateTime,Date Time,,,,00,,,dcfstate;btime;bdate;temp2,,,
r,,Status,Status,,,B511,03,,,temp;press;press;HEX:4,,,
r,,Status01,Temp heating flow/Temp heating return/Outsidetemperature/Temp warm water/Tanktemperture/Pump Status,,,B511,01,,,temp1;temp1;temp2;temp1;temp1;pumpstate,,,
r,,Status02,Operation mode/MaximalTemperature/ReglerCurrentTEMP/MaximalTemperature/ReglerCurrentTemp,,,B511,02,,,hwcmode;temp0;temp1;temp0;temp1,,,
r,,Status16,Outsidetemperature,,,,16,,,temp,,,
