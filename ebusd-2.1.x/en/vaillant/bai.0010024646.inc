# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,Vaillant ecoTEC,0010024646,,,,,,,,,,
*r,,,,,,"B509","0D",,,,,,
*w,,,,,,"B509","0E",,,,,,
*wi,#install,,,,,"B509","0E",,,,,,
*ws,#service,,,,,"B509","0E",,,,,,
*[SW],scan,,,SW,,,,,,,,,
# ##### dia level 1 #####,,,,,,,,,,,,,
r,,Statenumber,Statenumber_DK,,,,"AB00",,,UCH,,,status number
r;wi,,PartloadHcKW,d.00 heating partload,,,,"0704",,,power,,,Heating part load
r;wi,,WPPostrunTime,d.01 central heating overruntime,,,,"F703",,,minutes0,,,water pump overrun time for heating mode
r;wi,,BlockTimeHcMax,d.02 Max blocking time CH,,,,"0904",,,minutes0,,,max. burner anti cycling period at 20°C Flow temperature setpoint
r,,HwcTemp,d.03 Temp DHW,,,,"1600",,,tempsensor,,,hot water flow temperature (combination boiler only)
r,,StorageTemp,d.04 Temp storage / she,,,,"1700",,,tempsensor,,,current temperature for warm start sensor (combination boiler only) Current storage tank sensor (system boiler only)
r,,FlowTempDesired,d.05 flow/return setpoint,,,,"3900",,,temp,,,Flow temperature target value or return target value when return regulation is set
r,,StorageTempDesired,d.07 Storage setpoint,,,,"0400",,,temp,,,"Warm start temperature value (combination boiler plus only), Storage temperature target value (system boiler only)"
r,,ACRoomthermostat,d.08 Room thermostat 230 V,,,,"2A00",,,onoff,,,External controls heat demand (Clamp 3-4)
r,,ExtFlowTempDesiredMin,d.09 ext flowsetpoint,,,,"6E04",,,temp,,,minimum out of Kl.7 and eBus flow setpoint
r,,WP,d.10 Central heating pump,,,,"4400",,,onoff,,,internal heating pump
r,,ExtWP,d.11 external pump,,,,"3F00",,,onoff,,,External heating pump
r,,Storageloadpump,d.12 storage load pump,,,,"9E00",,,percent0,,,tank load pump demand
r,,CirPump,d.13 Circulation pump,,,,"7B00",,,onoff,,,Hot water circulation pump (via external module)
r,,HwcDemand,d.22 DHW demand,,,,"5800",,,yesno,,,domestic hot water (tapping or tank contact) demand
r,,HeatingSwitch,d.23 operation mode,,,,"F203",,,onoff,,,Wintermode active
r,,StoragereleaseClock,d.25 DHW demand enabled,,,,"4704",,,yesno,,,hot water release (tank storage) via eBus Control
r,,Gasvalve,d.30 Gasvalve,,,,"BB00",,,onoff2,,,Gasvalve activation signal
r,,TargetFanSpeed,d.33 Target fan speed,,,,"2400",,,UIN,,rpm,Fan speed setpoint
r,,FanSpeed,d.34 Actual fan speed,,,,"8300",,,UIN,,rpm,fan speed actual value
r,,PositionValveSet,d.35 Position TWV,,,,"5400",,,UCH,,,Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position
r,,FlowTemp,d.40 TFT_DK,,,,"1800",,,tempsensor,,,flow temperature
r,,ReturnTemp,d.41 Temp heating return,,,,"9800",,,tempmirrorsensor,,,return temperature
r,,IonisationVoltageLevel,d.44 Dig. ionisation voltage,,,,"A400",,,SIN,10,,digital ionisation voltage> 80 no flame< 40 good flame
r,,OutdoorstempSensor,d.47 Temp outside,,,,"7600",,,tempsensor,,,Outside temperature (uncorrected value)
r,,RemainingBoilerblocktime,d.67 Remaining burner block time,,,,"3800",,,minutes0,,,Remaining burner anti cycling time
r,,DeactivationsTemplimiter,d.60 Number STL cut off,,,,"2000",,,UCH,,,Number of safety temperature limiter cut offs
r,,DeactivationsIFC,d.61 Number ignition device cut off,,,,"1F00",,,UCH,,,number of lock outs (unsuccessfull ignitons in the last attempt, flame failure)
r,,AverageIgnitiontime,d.64 average ignition time,,,,"2D00",,,UCH,10,s,average ignition time
r,,MaxIgnitiontime,d.65 Max ignition time,,,,"2C00",,,UCH,10,s,maximum ignition time
r,,CounterStartattempts1,d.68 ignition attempts 1,,,,"6E00",,,temp0,,,unsuccessfull ignitions in the first attempt
r,,CounterStartattempts2,d.69 ignition attempts 2,,,,"6F00",,,temp0,,,unsuccessfull ignitions in the second attempt
r,,EBusHeatcontrol,d.90 Digital control recognized,,,,"0004",,,yesno,,,Digital regulator status
r,,Flame,Flame,,,,"0500",,,onoff2,,,Flame status
r,,FanHours,Fan operation hours,,,,"1B00",,,hoursum2,,h,Operating hours of the fan
r,,FanStarts,FanCommunt_DK,,,,"1C00",,,cntstarts2,,,commutations of the fan
r,,CounterStartAttempts3,CounterStartAttempts3_DK,,,,"8100",,,temp0,,,unsuccessfull ignitions in the third attempt
r,,CounterStartAttempts4,CounterStartAttempts4_DK,,,,"8200",,,temp0,,,unsuccessfull ignitions in the fourth attempt
r,,TempDiffBlock,TempDiffBlock_DK,,,,"1200",,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r,,TempDiffFailure,TempDiffFailure_DK,,,,"1300",,,temp0,,,Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures
r,,ValveStarts,TWV_Communt_DK,,,,"1A00",,,cntstarts2,,,commutations of the three way valve
r,,TemplimiterWithNTC,TemplimiterWithNTC,,,,"D200",,,yesno2,,,Safety temperature limit concept
r,,HcHours,HcHours,,,,"3801",,,hoursum,,h,Central heating operation hours
r,,HcPumpStarts,HcPumpStarts,,,,"5603",,,cntstarts3,,,Central heating pump starts
r,,HcStarts,HcStarts,,,,"3803",,,cntstarts2,,,Central heating burner starts
r,,HwcHours,HwcHours,,,,"7701",,,hoursum,,h,Hot water operation hours
r,,HwcStarts,HwcStarts,,,,"7703",,,cntstarts2,,,Hot water burner starts
r,,PumpHours,PumpHours,,,,"5601",,,hoursum,,h,Pump operation hours
r,,StorageLoadPumpHours,StorageLoadPumpHours,,,,"7301",,,hoursum,,h,Storage load pump operation hours
r,,StorageloadPumpStarts,StorageloadPumpStarts,,,,"7303",,,cntstarts2,,,Storage load pump starts
r,,ValveMode,ValveMode,,,,"F403",,,UCH,,,Valve mode
r,,HcPumpMode,HcPumpMode,,,,"4E04",,,pumpmode,,,Heating pump mode 