# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
# Status codes,,,,,,,,,,,,,
*r,,,,,,B503,00,,,,,,,,,,,,,,,,,,,,,,,,
*w,,,,,,B503,00,,,,,,,,,,,,,,,,,,,,,,,,
r,,Statuscode,,,,,03,,,UIN,34=Frost protection;100=Standby;101=Heating: Compressor shutdown;102=Heating: Compressor blocked;103=Heating: Prerun;104=Heating: Compressor active;107=Heating: Overrun;111=Cooling: Compressor shutdown;112=Cooling: Compressor blocked;113=Cooling: Prerun;114=Cooling: Compressor active;117=Cooling: Overrun;125=Heating: Immersion heater active;132=Warm Water: Compressor blocked;133=Warm Water: Prerun;134=Warm Water: Compressor active;135=Warm Water: Immersion Heater active;137=Warm Water: Overrun;141=Heating: Immersion Heater shutdown;142=Heating: Immersion Heater blocked;151=Warm Water: Immersion Heater shutdown;152=Warm Water: Immersion Heater blocked;202=Air purging program activ;240=Compressor oil heating activated;252=Fan 1 blocked;255=Fan 1 air inlet too high;256=Fan 1 air inlet too low;275=Building circuit flow too low;277=Building circuit pump fault;280=Frequency converter fault: Compressor;281=Frequency converter fault: Mains voltage;282=Frequency converter fault: Overheating;283=Deicing time too long;284=Deicing flow temperature too low;285=Compressor outlet temperature too high;286=Hot gas temperature switch open;287=Fan 1: Wind;289=Current limt active;302=High pressure switch open;303=Compressor outlet temperature too high;304=Evaporation temperature too low;305=Condensation temperature too low;306=Evaporation temperature too high;308=Condensation temperature too high;312=Building circuit return temperature too low;314=Building circuit return temperature too high;351=Immersion heater: Flow temperature too high;516=Deicing active;575=Frequency converter fault;581=Connection fault: frequency converter;590=4-port-valve position fault
w,,ReadLiveMonitorMain,Payload needed sent: 03FFFF,,,,,,m,HEX:1,,,,,,,,,,,,,,,,,,,,,,,,,,
r,,LiveMonitorMain,,71,,,,id,,UCH,0x39=Controller starting;0xf4=Standby;0xf5=Supply on;0xf6=Heating: Flow ok;0xf7=Heating: temperature self test;0xf8=Heating: Start;0xfa=Heating: Fan on;0xfc=EEV switch;0xfd=Compressor starting;0xfe=Heating: compressor on;0x00=Compressor off;0x02=Compressor coast down;0x03=Deicing start;0x04=Deicing;0x05=Deicing end;0x12=Cooling: Flow on;0x14=Cooling: temperature self test;0x15=Cooling: starting;0x17=Cooling: Fan on;0x13=Cooling: Flow ok;0x19=Cooling: EEV?;0x1a=Cooling: compressor starting;0x1b=Cooling: compressor on;0x1d=Cooling: ending;0x29=Start condition not met;0x57=Device error;0x44=Flow error in distribution system,,,function,,UCH,0x01=Heating;0x02=Cooling,,,,,,,,,,,,,,,,,,,

# HC operation mode,,,,,,,,,,,,,
*r,,,,,,B504,,,,,,,,,,,,,,,,,,,,,,,,
r,,DateTime,Date Time,,,,00,,,dcfstate;btime;bdate;temp2,,,
r,,Status16,Outside temperature,,,,16,,,temp,,,

# HC operation mode2,,,,,,,,,,,,,
*r,,,,,,B511,,,,,,,,,,,,,,,,,,,,,,,,,
*uw,,,,,,B510,,,,,,,,,,,,,,,,,,,,,,,,
uw,,SetMode,Operation Mode,,,,00,,,hcmode,,,,flowtempdesired,,temp1,,,,hwctempdesired,,temp1,,,,hwcflowtempdesired,,temp0,,,,,,IGN:1,,,,disablehc,,BI0,,,,disablehwctapping,,BI1,,,,disablehwcload,,BI2,,,,,,IGN:1,,,,remoteControlHcPump,,BI0,,,,releaseBackup,,BI1,,,,releaseCooling,,BI2,,,,
r,,State00,,,,,00,field1,,UCH,,,,field2,,UIN,,,,field3,,UCH,,,,field4,,UCH,,,,field5,,UIN,,,,field6,,UCH
r,,State01,Supply Temperature/Return Temperature/Outside Temperature/HwC Temperature/Buffer Temperature/Pump status,,,,01,,,temp1;temp1;temp2;temp1;temp1;pumpstate,,,
r,,State02,Betriebsart/Maximaltemperatur/ReglerCurrentTEMP/Maximaltemperatur/ReglerCurrentTemp,,,,02,,,hwcmode;temp0;temp1;temp0;temp1,,,
r,,State03,Status,,,,03,,,temp;press;press;hcmode2;HEX,,,
#r,,State07,,,,,07,energy,,UCH,,,,,,energy,,kWh,,onoff,,UCH,0=off;1=on,,,state,,UCH,0x01=ready;0x0b=error;0x09=heating;0x11=cooling;0x81=heating_water,,
#r,,State07,,,,,07,field1,,UCH,,,,field2,,UIN,,,,field3,,UCH,,,,field4,,UCH,,,,field5,,UIN,,,,field6,,UCH,,,
r,,State07,,,,,07,power,,UCH,,%,Compressor power,energy,,energy,10,kWh,daily environmental energy yield,state,,UCH,192=Eco mode HP off;193=Eco mode HP on;128=Normal mode HP off;129=Normal mode HP on;0=HP off;1=HP on,,,state,,UCH,0x00=ready;0x01=ready;0x0a=error;0x0b=error;0x08=heating;0x09=heating;0x10=cooling;0x11=cooling;0x80=heating_water;0x81=heating_water,,
*uw,,,,,,"B512",,,,,,,
uw,,StatusCirPump,Status circulation pump,,,,00,,,UCH,0=off;100=on,,
