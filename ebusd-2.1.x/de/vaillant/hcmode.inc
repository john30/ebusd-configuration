# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
# HC Betriebsart,,,,,,,,,,,,,
*r,,,,,,"B504",,,,,,,
r,,Mode,Betriebsart,,,B510,00,mode,,UCH,0=off;1=standby;2=heat;3=water,,
r,,DateTime,Datum Uhrzeit,,,,00,,,dcfstate;btime;bdate;temp2,,,
r,,Status,Status,,,B511,03,,,temp;press;press;HEX:4,,,
r,,Status01,Vorlauftemperatur/Rücklauftemperatur/Aussentemperatur/WW Temperatur/Speichertemperatur/Pumpenstatus,,,B511,01,,,temp1;temp1;temp2;temp1;temp1;pumpstate,,,
r,,Status02,Betriebsart/Maximaltemperatur/ReglerCurrentTEMP/Maximaltemperatur/ReglerCurrentTemp,,,B511,02,,,hwcmode;temp0;temp1;temp0;temp1,,,
r,,Status16,Aussentemperatur,,,,16,,,temp,,,
