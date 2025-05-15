type,circuit,level,name,comment,qq,zz,pbsb,id,*name,part,type,divisor/values,unit,comment
*r,
*w,
r,,,Statenumber,Statenumber_DK: status number,,,b509,0dab00,value,,UCH,,,
r,,,PartloadHcKW,d.00 heating partload: Heating part load,,,b509,0d0704,value,,UCH,,kW,
w,,install,PartloadHcKW,d.00 heating partload: Heating part load,,,b509,0e0704,value,,UCH,,kW,
r,,,WPPostrunTime,d.01 central heating overruntime: water pump overrun time for heating mode,,,b509,0df703,value,,UCH,,min,minutes
w,,install,WPPostrunTime,d.01 central heating overruntime: water pump overrun time for heating mode,,,b509,0ef703,value,,UCH,,min,minutes
r,,,BlockTimeHcMax,d.02 Max blocking time CH: max. burner anti cycling period at 20°C Flow temperature setpoint,,,b509,0d0904,value,,UCH,,min,minutes
w,,install,BlockTimeHcMax,d.02 Max blocking time CH: max. burner anti cycling period at 20°C Flow temperature setpoint,,,b509,0e0904,value,,UCH,,min,minutes
r,,,HwcTemp,d.03 Temp DHW: hot water flow temperature (combination boiler only),,,b509,0d1600,temp,,D2C,,°C,temperature,sensor,,UCH,0=ok;85=circuit;170=cutoff,,sensor status
r,,,StorageTemp,d.04 Temp storage / she: current temperature for warm start sensor (combination boiler only) Current storage tank sensor (system boiler only),,,b509,0d1700,temp,,D2C,,°C,temperature,sensor,,UCH,0=ok;85=circuit;170=cutoff,,sensor status
r,,,FlowTempDesired,d.05 flow/return setpoint: Flow temperature target value or return target value when return regulation is set,,,b509,0d3900,value,,D2C,,°C,temperature
r,,,StorageTempDesired,"d.07 Storage setpoint: Warm start temperature value (combination boiler plus only), Storage temperature target value (system boiler only)",,,b509,0d0400,value,,D2C,,°C,temperature
r,,,ACRoomthermostat,d.08 Room thermostat 230 V: External controls heat demand (Clamp 3-4),,,b509,0d2a00,value,,UCH,0=off;1=on,,
r,,,ExtFlowTempDesiredMin,d.09 ext flowsetpoint: minimum out of Kl.7 and eBus flow setpoint,,,b509,0d6e04,value,,D2C,,°C,temperature
r,,,WP,d.10 Central heating pump: internal heating pump,,,b509,0d4400,value,,UCH,0=off;1=on,,
r,,,ExtWP,d.11 external pump: External heating pump,,,b509,0d3f00,value,,UCH,0=off;1=on,,
r,,,Storageloadpump,d.12 storage load pump: tank load pump demand,,,b509,0d9e00,value,,UCH,,%,
r,,,CirPump,d.13 Circulation pump: Hot water circulation pump (via external module),,,b509,0d7b00,value,,UCH,0=off;1=on,,
r,,,HwcDemand,d.22 DHW demand: domestic hot water (tapping or tank contact) demand,,,b509,0d5800,value,,UCH,0=no;1=yes,,
r,,,HeatingSwitch,d.23 operation mode: Wintermode active,,,b509,0df203,value,,UCH,0=off;1=on,,
r,,,StoragereleaseClock,d.25 DHW demand enabled: hot water release (tank storage) via eBus Control,,,b509,0d4704,value,,UCH,0=no;1=yes,,
r,,,Gasvalve,d.30 Gasvalve: Gasvalve activation signal,,,b509,0dbb00,value,,UCH,240=off;15=on,,
r,,,TargetFanSpeed,d.33 Target fan speed,,,b509,0d2400,value,,UIN,,1/min,Fan speed setpoint
r,,,FanSpeed,d.34 Actual fan speed,,,b509,0d8300,value,,UIN,,1/min,fan speed actual value
r,,,PositionValveSet,"d.35 Position TWV: Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position",,,b509,0d5400,value,,UCH,,,
r,,,FlowTemp,d.40 TFT_DK: flow temperature,,,b509,0d1800,temp,,D2C,,°C,temperature,sensor,,UCH,0=ok;85=circuit;170=cutoff,,sensor status
r,,,ReturnTemp,d.41 Temp heating return: return temperature,,,b509,0d9800,temp,,D2C,,°C,temperature,tempmirror,,UIN,,,,sensor,,UCH,0=ok;85=circuit;170=cutoff,,sensor status
r,,,IonisationVoltageLevel,d.44 Dig. ionisation voltage,,,b509,0da400,value,,SIN,10,,digital ionisation voltage> 80 no flame< 40 good flame
r,,,OutdoorstempSensor,d.47 Temp outside: Outside temperature (uncorrected value),,,b509,0d7600,temp,,D2C,,°C,temperature,sensor,,UCH,0=ok;85=circuit;170=cutoff,,sensor status
r,,,DeactivationsTemplimiter,d.60 Number STL cut off: Number of safety temperature limiter cut offs,,,b509,0d2000,value,,UCH,,,
r,,,DeactivationsIFC,"d.61 Number ignition device cut off: number of lock outs (unsuccessfull ignitons in the last attempt, flame failure)",,,b509,0d1f00,value,,UCH,,,
r,,,AverageIgnitiontime,d.64 average ignition time,,,b509,0d2d00,value,,UCH,10,s,average ignition time
r,,,MaxIgnitiontime,d.65 Max ignition time,,,b509,0d2c00,value,,UCH,10,s,maximum ignition time
r,,,RemainingBoilerblocktime,d.67 Remaining burner block time: Remaining burner anti cycling time,,,b509,0d3800,value,,UCH,,min,minutes
r,,,CounterStartattempts1,d.68 ignition attempts 1: unsuccessfull ignitions in the first attempt,,,b509,0d6e00,value,,UCH,,°C,temperature
r,,,CounterStartattempts2,d.69 ignition attempts 2: unsuccessfull ignitions in the second attempt,,,b509,0d6f00,value,,UCH,,°C,temperature
r,,,EBusHeatcontrol,d.90 Digital control recognized: Digital regulator status,,,b509,0d0004,value,,UCH,0=no;1=yes,,
r,,,Flame,Flame,,,b509,0d0500,value,,UCH,240=off;15=on,,
r,,,FanHours,Fan operation hours,,,b509,0d1b00,value,,UIN,,h,hours
r,,,FanStarts,FanCommunt_DK: commutations of the fan,,,b509,0d1c00,value,,UIN,,,start count
r,,,CounterStartAttempts3,CounterStartAttempts3_DK: unsuccessfull ignitions in the third attempt,,,b509,0d8100,value,,UCH,,°C,temperature
r,,,CounterStartAttempts4,CounterStartAttempts4_DK: unsuccessfull ignitions in the fourth attempt,,,b509,0d8200,value,,UCH,,°C,temperature
r,,,TempDiffBlock,TempDiffBlock_DK: Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures,,,b509,0d1200,value,,UCH,,°C,temperature
r,,,TempDiffFailure,TempDiffFailure_DK: Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures,,,b509,0d1300,value,,UCH,,°C,temperature
r,,,ValveStarts,TWV_Communt_DK: commutations of the three way valve,,,b509,0d1a00,value,,UIN,,,start count
r,,,TemplimiterWithNTC,TemplimiterWithNTC: Safety temperature limit concept,,,b509,0dd200,value,,UCH,240=no;15=yes,,
r,,,HcHours,HcHours: Central heating operation hours,,,b509,0d3801,value,,ULG,,h,hours
r,,,HcPumpStarts,HcPumpStarts: Central heating pump starts,,,b509,0d5603,value,,UCH,,,
r,,,HcStarts,HcStarts: Central heating burner starts,,,b509,0d3803,value,,UCH,,,
r,,,HwcHours,HwcHours: Hot water operation hours,,,b509,0d7701,value,,ULG,,h,hours
r,,,HwcStarts,HwcStarts: Hot water burner starts,,,b509,0d7703,value,,UIN,,,start count
r,,,PumpHours,PumpHours: Pump operation hours,,,b509,0d5601,value,,ULG,,h,hours
r,,,StorageLoadPumpHours,StorageLoadPumpHours: Storage load pump operation hours,,,b509,0d7301,value,,ULG,,h,hours
r,,,StorageloadPumpStarts,StorageloadPumpStarts: Storage load pump starts,,,b509,0d7303,value,,UIN,,,start count
r,,,ValveMode,Valve mode,,,b509,0df403,value,,UCH,,,
r,,,HcPumpMode,HcPumpMode: Heating pump mode,,,b509,0d4e04,value,,UCH,,,
r,,,DisplayMode,Dodane parametry na podstawie wyników komendy grabDisplayMode: Display operation mode,,,b509,0dda00,value,,UCH,,,
r,,,WaterpressureMeasureCounter,WaterpressureMeasureCounter: Water pressure measurement counter,,,b509,0df100,value,,UCH,,,
r,,,HwcUnderHundredStarts,HwcUnderHundredStarts: Hot water starts under hundred counter,,,b509,0d3100,value,,UCH,,,
r,,,HcUnderHundredStarts,HcUnderHundredStarts: Heating starts under hundred counter,,,b509,0d3000,value,,UCH,,,
r,,,SHEMaxFlowTemp,SHEMaxFlowTemp: Secondary heat exchanger maximum flow temperature,,,b509,0dc300,value,,D2C,,°C,temperature
r,,,HwcTempMax,HwcTempMax: Maximum hot water temperature,,,b509,0d4304,value,,D2C,,°C,temperature
r,,,Maintenancedata_HwcTempMax,Maintenancedata_HwcTempMax: Maximum hot water temperature from maintenance data,,,b509,0d3500,value,,D2C,,°C,temperature
r,,,StorageTempMax,StorageTempMax: Maximum storage temperature,,,b509,0d3600,value,,D2C,,°C,temperature
r,,,FlowTempMax,FlowTempMax: Maximum flow temperature,,,b509,0d3700,value,,D2C,,°C,temperature
r,,,ReturnTempMax,ReturnTempMax: Maximum return temperature,,,b509,0dbe00,value,,D2C,,°C,temperature
r,,,ModulationTempDesired,ModulationTempDesired: Desired modulation temperature,,,b509,0d2e00,value,,D2C,,°C,temperature
r,,,PumpPower,PumpPower: Pump power value,,,b509,0d7300,value,,UCH,,,
r,,,PumpPowerDesired,PumpPowerDesired: Desired pump power,,,b509,0da100,value,,UCH,,,
r,,,HwcWaterflow,HwcWaterflow: Hot water flow rate,,,b509,0d5500,value,,UIN,100,,
r,,,HwcWaterflowMax,HwcWaterflowMax: Maximum hot water flow rate,,,b509,0d5600,value,,UIN,100,,
r,,,HwcImpellorSwitch,HwcImpellorSwitch: Hot water impellor switch,,,b509,0d5700,value,,UCH,0=no;1=yes,,
r,,,VortexFlowSensor,VortexFlowSensor: Vortex flow sensor value,,,b509,0dd500,value,,UIN,,,
r,,,OverflowCounter,OverflowCounter: Overflow counter,,,b509,0d1e00,value,,UCH,0=no;1=yes,,
r,,,SecondPumpMode,SecondPumpMode: Second pump mode,,,b509,0d0b04,value,,UCH,,,
r,,,ExternalHwcSwitch,ExternalHwcSwitch: External hot water circuit switch,,,b509,0d0000,value,,UCH,0=off;1=on,,
r,,,HwcTempDesired,HwcTempDesired: Hot water temperature desired value,,,b509,0dea03,value,,D2C,,°C,temperature
r,,,WarmstartDemand,WarmstartDemand: Warm start demand,,,b509,0d3a04,value,,UCH,0=off;1=on,,
r,,,Templimiter,Templimiter: Temperature limiter status,,,b509,0d7700,value,,UCH,0=off;1=on,,
r,,,HoursTillService,HoursTillService: Hours till next service,,,b509,0d2004,value,,ULG,,,
r,,,TimerInputHc,TimerInputHc: Timer input for heating circuit,,,b509,0dde00,value,,UCH,0=off;1=on,,
r,,,PrEnergySumHwc1,PrEnergySumHwc1: Energy sum hot water circuit 1,,,b509,0dc500,value,,UIN,,,
r,,,PrEnergyCountHwc1,PrEnergyCountHwc1: Energy count hot water circuit 1,,,b509,0dc600,value,,UIN,,,
r,,,PrEnergySumHwc2,PrEnergySumHwc2: Energy sum hot water circuit 2,,,b509,0dc700,value,,UIN,,,
r,,,PrEnergyCountHwc2,PrEnergyCountHwc2: Energy count hot water circuit 2,,,b509,0dc800,value,,UIN,,,
r,,,PrEnergySumHwc3,PrEnergySumHwc3: Energy sum hot water circuit 3,,,b509,0dc900,value,,UIN,,,
r,,,PrEnergyCountHwc3,PrEnergyCountHwc3: Energy count hot water circuit 3,,,b509,0dca00,value,,UIN,,,
r,,,PrEnergySumHc1,PrEnergySumHc1: Energy sum heating circuit 1,,,b509,0df500,value,,UIN,,,
r,,,PrEnergyCountHc1,PrEnergyCountHc1: Energy count heating circuit 1,,,b509,0df600,value,,UIN,,,
r,,,PrEnergySumHc2,PrEnergySumHc2: Energy sum heating circuit 2,,,b509,0df700,value,,UIN,,,
r,,,PrEnergyCountHc2,PrEnergyCountHc2: Energy count heating circuit 2,,,b509,0df800,value,,UIN,,,
r,,,PrEnergySumHc3,PrEnergySumHc3: Energy sum heating circuit 3,,,b509,0df900,value,,UIN,,,
r,,,PrEnergyCountHc3,PrEnergyCountHc3: Energy count heating circuit 3,,,b509,0dfa00,value,,UIN,,,
r,,,PumpHwcFlowSum,PumpHwcFlowSum: Pump hot water flow sum,,,b509,0dc100,value,,UIN,,,
r,,,PumpHwcFlowNumber,PumpHwcFlowNumber: Pump hot water flow number,,,b509,0dc200,value,,UIN,,,
r,,,PrAPSCounter,PrAPSCounter: APS counter,,,b509,0df200,value,,UCH,,,
r,,,PrVortexFlowSensorValue,PrVortexFlowSensorValue: Vortex flow sensor value (legacy name),,,b509,0df400,value,,UIN,,,
r,,,HwcPostrunTime,HwcPostrunTime: Hot water pump overrun time,,,b509,0d1104,value,,UCH,,min,minutes
r,,,ChangesDSN,ChangesDSN: Numbers adjusting (storing) the DSN,,,b509,0d0c00,value,,UCH,,,
r,,,ExternalFlowTempDesired,ExternalFlowTempDesired: External flow temperature desired,,,b509,0d2500,value,,D2C,,°C,temperature
r,,,TempMaxDiffExtTFT,TempMaxDiffExtTFT: Maximum temperature difference,,,b509,0d2700,value,,D2C,,°C,temperature
r,,,Expertlevel_ReturnTemp,Expertlevel_ReturnTemp: Return temperature expert level,,,b509,0d6b00,temp,,D2C,,°C,temperature,tempmirror,,UIN,,,,sensor,,UCH,0=ok;85=circuit;170=cutoff,,sensor status
r,,,PowerValue,PowerValue: Power value of the boiler,,,b509,0daa00,value,,HEX:6,,,Power value of the boiler (minimum and maximum)
r,,,Status,Status: System status,,,b509,0d1103,value,,UCH,,,
r,,,Status01,Status01: Status information 1,,,b509,0d1101,value,,HEX,,,
r,,,Status02,Status02: Status information 2,,,b509,0d1102,value,,HEX,,,
r,,,Status16,Status16: Status information 16,,,b509,0d0416,value,,UCH,,,
r,,,TempGradientFailure,TempGradientFailure: Number of cut offs of the boilers cause of to high gradient (S.54),,,b509,0d1100,value,,UCH,,°C,temperature
r,,,Currenterror,Current errors,,,b503,0001,error,,UIN,,,error number,error_1,,UIN,,,error number,error_2,,UIN,,,error number,error_3,,UIN,,,error number,error_4,,UIN,,,error number
r,,,Errorhistory,Error_History,,,b503,0101,index,m,UCH,,,,status,,UCH,,,Status,time,,VTM,,,time,date,,HDA:3,,,date,error,,UIN,,,error number
w,,install,Clearerrorhistory,Clear error history,,,b503,0201,cleared,s,UCH,0=no;1=yes,,
r,,,Currentservice,Current service message,,,b503,0002,error,,UIN,,,error number,error_1,,UIN,,,error number,error_2,,UIN,,,error number,error_3,,UIN,,,error number,error_4,,UIN,,,error number
r,,,Servicehistory,Service message history,,,b503,0102,index,m,UCH,,,,status,,UCH,,,Status,time,,VTM,,,time,date,,HDA:3,,,date,error,,UIN,,,error number
w,,install,Clearservicehistory,Clear service message history,,,b503,0202,cleared,s,UCH,0=no;1=yes,,
