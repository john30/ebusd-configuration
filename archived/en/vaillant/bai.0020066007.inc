# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,zeoTHERM (BMU),0020066007 187,,,,,,,,,,
*r,,,,,,"B509","0D",,,,,,
*w,,,,,,"B509","0E",,,,,,
*wi,#install,,,,,"B509","0E",,,,,,
*ws,#service,,,,,"B509","0E",,,,,,
# ##### dia level 1 #####,,,,,,,,,,,,,
r,,T3TempDesired,d.05 T3_Setpoint,,,,"3900",,,temp,,,Sollwert PWT-Ausgang
r,,ThermostatkontaktAnKl34,d.08 Thermostatkontakt_an_Kl_3_4,,,,"2A00",,,onoff,,,External controls heat demand (Clamp 3-4)
r,,Gasvalve,d.30 Gasvalve,,,,"BB00",,,UCH,240=off;15=on,,Gasvalve activation signal
r,,TargetFanSpeed,d.33 Target fan speed,,,,"2400",,,UIN,,1/min,Fan speed setpoint
r,,FanSpeed,d.34 Actual fan speed,,,,"8300",,,UIN,,1/min,fan speed actual value
r,,PositionValveSet,d.35 Position TWV,,,,"5400",,,UCH,,,"Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position"
r,,T3,d.40 T3,,,,"1800",,,tempsensor,,,PWT-Ausgangstemperatur
r,,T4,d.41 T4,,,,"9800",,,tempmirrorsensor,,,PWT-Eingangstemperatur
r,,IonisationVoltageLevel,d.44 Dig. ionisation voltage,,,,"A400",,,SIN,10,,digital ionisation voltage> 80 no flame< 40 good flame
r;wi,,FanSpeedOffsetMin,d.50 MinFanSpeedOffset,,,,"A700",,,SIN,,1/min,Offset for minimum fan speed
r;wi,,FanSpeedOffsetMax,d.51 MaxFanSpeedOffset,,,,"A800",,,SIN,,1/min,Offset for maximum fan speed
r,,DeactivationsTemplimiter,d.60 Number STL cut off,,,,"2000",,,UCH,,,Number of safety temperature limiter cut offs
r,,DeactivationsIFC,d.61 Number ignition device cut off,,,,"1F00",,,UCH,,,"number of lock outs (unsuccessfull ignitons in the last attempt, flame failure)"
r,,averageIgnitiontime,d.64 average ignition time,,,,"2D00",,,UCH,10,s,average ignition time
r,,maxIgnitiontime,d.65 Max ignition time,,,,"2C00",,,UCH,10,s,maximum ignition time
r,,CounterStartattempts1,d.68 ignition attempts 1,,,,"6E00",,,temp0,,,unsuccessfull ignitions in the first attempt
r,,CounterStartattempts2,d.69 ignition attempts 2,,,,"6F00",,,temp0,,,unsuccessfull ignitions in the second attempt
r;ws,,DSNOffset,d.93 Device specific number,,,,"B500",,,UCH,,,DSN aplliance variant setting
# ##### expert level #####,,,,,,,,,,,,,
r,,Flame,Flame,,,,"0500",,,UCH,240=off;15=on,,flame
r,,ChangesDSN,Changes_DSN_DK,,,,"0C00",,,UCH,,,Numbers adjusting (storing) the DSN
r,,GasvalveUC,SD_Gasvalve_uC_DK,,,,"0D00",,,UCH,240=off;15=on,,Activation signal of the gasvalve (activated via micrcontroller)
r,,VolatileLockout,SD_VolatileLockout_DK,,,,"1000",,,UCH,240=no;15=yes,,TRUE: STB failures is volatileFALSE: STB failure is not volataile
r,,FlameSensingASIC,SD_Flame_Sensing_ASIC_DK,,,,"2F00",,,UIN,,,ioni/adc value from the flame control circuit
r,,BoilerType,BoilerType_DK,,,,"5E00",,,UCH,,,Boiler typ of the bmu
r,,ReturnTemp,ReturnTemperature_DK,,,,"6B00",,,tempsensor,,,external return sensor
r,,FloorHeatingContact,Floor heating contact,,,,"7000",,,onoff,,,Floor heating contact
r,,EbusVoltage,EbusVoltage_DK,,,,"7F00",,,onoff,,,feedback signal of the eBus source
r,,FluegasvalveOpen,FluegasvalveOpen_DK,,,,"8900",,,onoff,,,feedback of the flue gas valve
r,,Testbyte,Testbyte_DK,,,,"9900",,,UCH,,,Testbyte (relevant for the Tester)
r,,DSN,DSN_DK,,,,"9A00",,,UIN,,,DSN: Device Specific number
r,,TargetFanSpeedOutput,TargetFan_Speed_Output_DK,,,,"9F00",,,UIN,,1/min,output fan speed
r,,PowerValue,PowerValue,,,,"AA00",,,HEX:6,,,"Power Values of the Boiler (min Power, max Power)"
r,,Statenumber,Statenumber_DK,,,,"AB00",,,UCH,,,status number
r,,DSNStart,DSN start,,,,"BC00",,,UIN,,,DSN Start adress
r,,PartnumberBox,Partnumber_Box,,,,"C000",,,HEX:5,,,part number of the eBox
r,,TemplimiterWithNTC,SD_STL_with_NTC,,,,"D200",,,UCH,240=no;15=yes,,Safety temperature limit concept:1 = safety temp. Limit check with NTC0 = safety temp. Limit check with contact
r,,VolatileLockoutIFCGV,SD_VolatileLockout_IFC_GV_DK,,,,"D300",,,UCH,240=no;15=yes,,all IFC faults are volataile
r,,Gasvalve3UC,SD_Gasvalve3_uC_DK,,,,"DB00",,,UCH,240=off;15=on,,Gasvalve activation signal (from Microcontroller)
r,,InitialisationEEPROM,InitialisationEEPROM,,,,"DC00",,,yesno,,,Initialisation off all EEPROM values (done in the production)
r,,TimerInputHc,TimerInputCH_DK,,,,"DE00",,,onoff,,,timer input (block heatdemand)
r,,FanMinSpeedOperation,FanMinSpeedOperation,,,,"DF00",,,UIN,,1/min,Minimum Fan speed of the appliance
r,,FanMaxSpeedOperation,FanMaxSpeedOperation,,,,"E000",,,UIN,,1/min,Maximum Fan speed of the appliance
r,,FaultlistDK,Faultlist_DK[0],,,,"2600",,,HEX:10,,,fault list (of the last 10 failures)
# ##### maintenance data #####,,,,,,,,,,,,,
r,,TempDiffBlock,TempDiffBlock_DK,,,,"1200",,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r,,TempDiffFailure,TempDiffFailure_DK,,,,"1300",,,temp0,,,Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures
r,,ValveStarts,TWV_Communt_DK,,,,"1A00",,,cntstarts2,,,commutations of the three way valve
r,,FanHours,Fan operation hours,,,,"1B00",,,hoursum2,,,fan operation hours
r,,FanStarts,FanCommunt_DK,,,,"1C00",,,cntstarts2,,,commutations of the fan
r,,minIgnitiontime,min_Ignitiontime_DK,,,,"2B00",,,UCH,10,s,minimum ignition time
r,,T3Max,T3_max,,,,"3700",,,temp,,,Maximaltemperatur am PWT-Ausgang
r,,CounterStartAttempts3,CounterStartAttempts3_DK,,,,"8100",,,temp0,,,unsuccessfull ignitions in the third attempt
r,,CounterStartAttempts4,CounterStartAttempts4_DK,,,,"8200",,,temp0,,,unsuccessfull ignitions in the fourth attempt
r,,T4Max,T4_max,,,,"BE00",,,temp,,,Maximaltemperatur am PWT-Eingang
!include,errors.inc,,,,,,,,,,,,
