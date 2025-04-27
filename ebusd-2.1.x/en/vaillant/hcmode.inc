# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
# HC operation mode,,,,,,,,,,,,,
*r,,,,,,"B504",,,,,,,
r,,DateTime,Date Time,,,,00,,,dcfstate;btime;bdate;temp2,,,
r,,Status16,Outside temperature,,,,16,,,temp,,,

# HC operation mode2,,,,,,,,,,,,,
*r,,,,,,"B511",,,,,,,
*uw,,,,,,"B510",,,,,,,
*wi,#install,,,,,"B510",,,,,,,
uw;wi,,SetMode,Operation Mode,,,,00,,,hcmode,,,,flowtempdesired,,temp1,,,,hwctempdesired,,temp1,,,,hwcflowtempdesired,,temp0,,,,,,IGN:1,,,,disablehc,,BI0,,,,disablehwctapping,,BI1,,,,disablehwcload,,BI2,,,,,,IGN:1,,,,remoteControlHcPump,,BI0,,,,releaseBackup,,BI1,,,,releaseCooling,,BI2,,,,
#potential last byte: currentmode,s,UCH,0=off;1=standby;2=heat;3=water,,
r,,Status01,Vorlauftemperatur/Rücklauftemperatur/Aussentemperatur/WW Temperatur/Speichertemperatur/Pumpenstatus,,,,01,,,temp1;temp1;temp2;temp1;temp1;pumpstate,,,
r,,Status02,Betriebsart/Maximaltemperatur/ReglerCurrentTEMP/Maximaltemperatur/ReglerCurrentTemp,,,,02,,,hwcmode;temp0;temp1;temp0;temp1,,,
r,,Status,Status,,,,03,,,temp;press;press;hcmode2;HEX,,,

*uw,,,,,,"B512",,,,,,,
uw,,StatusCirPump,Status circulation pump,,,,00,,,UCH,0=off;100=on,,
