# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,IsotwinCondens 30-B,0010021901 233,,,,,,,,,,
*r,,,,,,B509,0D,,,,,,
*w,,,,,,B509,0E,,,,,,
*wi,#install,,,,,B509,0E,,,,,,
*ws,#service,,,,,B509,0E,,,,,,
*[SW],scan,,,SW,,,,,,,,,
# ##### dia level 1 #####,,,,,,,,,,,,,
r;wi,,PartloadHcKW,d.00 heating partload,,,,6C00,,,power,,,Heating part load
r;wi,,WPPostrunTime,d.01 central heating overruntime,,,,6400,,,minutes0,,,water pump overrun time for heating mode
r;wi,,BlockTimeHcMax,d.02 Max blocking time CH,,,,2100,,,minutes0,,,max. burner anti cycling period at 20°C Flow temperature setpoint
r,,HwcTemp,d.03 Temp DHW,,,,0100,,,temp,,,Hot water flow temperature
r,,StorageTemp,d.04 Storage temperature,,,,1700,,,tempsensor,,,Current temperature for warm start sensor (combi boiler) / Current storage tank sensor (system boiler only)
r,,FlowTempDesired,d.05 flow/return setpoint,,,,"3900",,,temp,,,Flow temperature target value or return target value when return regulation is set
r,,HwcTempDesired,d.06 DHW setpoint,,,,"EA03",,,temp,,,Hot water temperature target value
r,,ExtFlowTempDesiredMin,d.09 ext flowsetpoint,,,,"6E04",,,temp,,,minimum out of Kl.7 and eBus flow setpoint
r;wi,,PumpPowerDesired,d.14 Desired heating pump power,,,,A100,,,UCH,0=auto;1=53;2=60;3=70;4=85;5=100,%,PWM-Desired central heating pump power,,,
r,,PumpPower,d.15 Current heating pump power,,,,7300,,,UCH,,,Current central heating pump power,,,
r;wi,,HcPumpMode,d.18 CH pump mode,,,,B700,,,UCH,0=post run;1=permanent;2=winter,,Pump mode
r;wi,,HwcTempMax,d.20 Max value tanksetpoint,,,,D900,,,temp,,,Adjustment of maximum tank setpoint range (maximum endposition of potmeter)
r;wi,,AccessoriesOne,d.27 Option relais 1,,,,B900,,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Accesory relay 1 function
r;wi,,AccessoriesTwo,d.28 Option relais 2,,,,BA00,,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Accesory relay 2 function
r,,FanSpeed,d.34 Actual fan speed,,,,"8300",,,UIN,,1/min,fan speed actual value
r,,PositionValveSet,d.35 Position TWV,,,,"5400",,,UCH,,,"Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position"
r,,SolBackTemp,d.39 TSolarBack_DK,,,,"6800",,,tempsensor,,,Solar yield sensor
r,,FlowTemp,d.40 TFT_DK,,,,"1800",,,tempsensor,,,flow temperature
r,,ReturnTemp,d.41 Temp heating return,,,,"9800",,,tempmirrorsensor,,,return temperature
r,,DeactivationsTemplimiter,d.60 Number STL cut off,,,,"2000",,,UCH,,,Number of safety temperature limiter cut offs
r;wi,,Night-timeOffset,d.62 Night-time offset,,,,3F04,,,IGN:7;UCH,,,"Night-time offset (Specific function for Belgium and NL: RT does not stop the burner but change the set-point. Do not use in other countries)"
r,,RemainingBoilerblocktime,d.67 Remaining burner block time,,,,"3800",,,minutes0,,,Remaining burner anti cycling time
r;wi,,FlowsetHcMax,d.71 Max value flow temp,,,,A500,,,temp,,,Adjustment of maximum central heating setpoint range (maximum endposition of potmeter)
r;wi,,AntiCondensValue,d.85 Minimal power to avoid condensation,,,,EC00,,,power,,,Minimal power to avoid condensation
r,,EBusHeatcontrol,d.90 Digital control recognized,,,,"0004",,,yesno,,,Digital regulator status
#r;wi,,ClearErrorHistory,d.94 Delete error history,,,,"0000",,,yesno,,,Delete error history
# ##### maintenance data #####,,,,,,,,,,,,,
r,,TempGradientFailure,TempGradientFailure_DK,,,,1100,,,temp0,,,Number of cut offs of the boilers cause of to high gradient (S.54)
r,,TempDiffBlock,TempDiffBlock_DK,,,,1200,,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r,,TempDiffFailure,TempDiffFailure_DK,,,,1300,,,temp0,,,Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures
r,,PumpHours,Pump operation hours,,,,1400,,,hoursum2,,,pump operation hours
r,,HcPumpStarts,CH_PumpCommunt_DK,,,,1500,,,cntstarts2,,,pump switchings
r,,ValveStarts,TWV_Communt_DK,,,,1A00,,,cntstarts2,,,commutations of the three way valve
r,,FanHours,Fan operation hours,,,,1B00,,,hoursum2,,,fan operation hours
r,,FanStarts,FanCommunt_DK,,,,1C00,,,cntstarts2,,,commutations of the fan
r,,OverflowCounter,OverflowCounter_DK,,,,1E00,,,yesno,,,Predictive Maintenance counter have got an overflow
r,,TempMaxDiffExtTFT,MaxTempDiffExtTFT_DK,,,,2700,,,temp,,,Predictive maintenance data
r,,minIgnitiontime,min_Ignitiontime_DK,,,,2B00,,,UCH,10,s,minimum ignition time
r,,maintenancedata_HwcTempMax,Temp DHW max,,,,3500,,,temp,,,maximum temperature measured by the domestic hot water outlet sensor
r,,StorageTempMax,Temp storage max,,,,3600,,,temp,,,maximum temperature measured by the external tank sensor
r,,FlowTempMax,TFT_max_DK,,,,3700,,,temp,,,maximum temperature measured by the flow sensor
r,,FanPWMSum,Fan_PWM_Sum_DK,,,,3A00,,,UIN,,,Predictive Maintenance data for the fan damage recognition
r,,FanPWMTest,Fan_PWM_Test_DK,,,,3B00,,,UCH,,,Predictive Maintenance data for the fan damage recognition
r,,DeltaFlowReturnMax,MaxDeltaFlowReturn_DK,,,,3D00,,,temp,,,Predictive Maintenance data
r,,StorageLoadPumpHours,TankLoadPumpOperationHours_DK,,,,4C00,,,hoursum2,,,Preditive maintenance data
r,,StorageloadPumpStarts,TankloadPumpCommunt_DK,,,,4F00,,,cntstarts2,,,Preditive maintenance data
r,,HwcWaterflowMax,DHW Waterflow_max_DK,,,,5600,,,uin100,,,domestic hot water flow sensor maximum value
r,,CounterStartAttempts3,CounterStartAttempts3_DK,,,,8100,,,temp0,,,unsuccessfull ignitions in the third attempt
r,,CounterStartAttempts4,CounterStartAttempts4_DK,,,,8200,,,temp0,,,unsuccessfull ignitions in the fourth attempt
r,,ReturnTempMax,TRT_max_DK,,,,BE00,,,temp,,,max. return temperature
r,,PumpHwcFlowSum,PumpDHWFlowSum_DK,,,,C100,,,UIN,,,summed up DHW flow rate
r,,PumpHwcFlowNumber,PumpDHWFlowNumber_DK,,,,C200,,,UCH,,,number of times DHW flow rate was detected
r,,SHEMaxFlowTemp,SHE_MaxFlowTemp_DK,,,,C300,,,temp,,,maximum flow temperature DHW
r,,SHEMaxDeltaHwcFlow,SHE_MaxDeltaFlowDHW_DK,,,,C400,,,temp,,,maximum difference between flow and DHW outlet temperature
r;wi,,PrEnergySumHwc1,PrEnergySumDHW1_DK,,,,C500,,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergyCountHwc1,PrEnergyCountDHW1_DK,,,,C600,,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergySumHwc2,PrEnergySumDHW2_DK,,,,C700,,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergyCountHwc2,PrEnergyCountDHW2_DK,,,,C800,,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergySumHwc3,PrEnergySumDHW3_DK,,,,C900,,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergyCountHwc3,PrEnergyCountDHW3_DK,,,,CA00,,,ULG,,,Predictive Maintenance data
r,,WaterHcFlowMax,MaxWaterFlowCH_DK,,,,D000,,,UIN,,,Predictive Maintenance data
r,,WaterpressureVariantSum,WaterpressureVariantSum_DK,,,,F000,,,pressm2,,,Predictive Maintenance data
r,,WaterpressureMeasureCounter,WaterpressureMeasureCounter_DK,,,,F100,,,UCH,,,Predictive Maintenance data
r,,PrAPSCounter,PrAPSCounter_DK,,,,F200,,,UCH,,,Predictive Maintenance data
r,,PrAPSSum,PrAPSSum_DK,,,,F300,,,seconds2,,,Predictive Maintenance data
r,,PrVortexFlowSensorValue,PrVortexFlowSensorValue_DK,,,,F400,,,SIN,,ADC,Predictive Maintenance data
r;wi,,PrEnergySumHc1,PrEnergySumCH1_DK,,,,F500,,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergyCountHc1,PrEnergyCountCH1_DK,,,,F600,,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergySumHc2,PrEnergySumCH2_DK,,,,F700,,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergyCountHc2,PrEnergyCountCH2_DK,,,,F800,,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergySumHc3,PrEnergySumCH3_DK,,,,F900,,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergyCountHc3,PrEnergyCountCH3_DK,,,,FA00,,,ULG,,,Predictive Maintenance data
# ##### expert level #####,,,,,,,,,,,,,
r,,externalFlowTempDesired,external flowsetpoint,,,,2500,,,temp,,,Flow target temperature from external regulator to terminal 7-8-9
r,,externalHwcSwitch,DHWSwitch_DK,,,,0000,,,onoff,,,Demand external tank (via contact)
r,,WaterPressure,Waterpressure,,,,0200,,,presssensor,,,water pressure
r,,Flame,Flame,,,,0500,,,UCH,240=off;15=on,,flame
r,,ChangesDSN,Changes_DSN_DK,,,,0C00,,,UCH,,,Numbers adjusting (storing) the DSN
r,,GasvalveUC,SD_Gasvalve_uC_DK,,,,0D00,,,UCH,240=off;15=on,,Activation signal of the gasvalve (activated via micrcontroller)
r,,VolatileLockout,SD_VolatileLockout_DK,,,,1000,,,UCH,240=no;15=yes,,TRUE: STB failures is volatileFALSE: STB failure is not volataile
r,,ModulationTempDesired,Modulationsetpoint_DK,,,,2E00,,,SIN,10,%,Modulation set point
r,,FlameSensingASIC,SD_Flame_Sensing_ASIC_DK,,,,2F00,,,UIN,,,ioni/adc value from the flame control circuit
r,,HcUnderHundredStarts,HZ_UnderHundred_SwiActi_DK,,,,3000,,,UCH,,,Heat switch cycles under hundred
r,,HwcUnderHundredStarts,BW_UnderHundred_SwiActi_DK,,,,3100,,,UCH,,,DHW switch cycles under hundred
r,,EbusSourceOn,EbusSourceOn_DK,,,,3400,,,onoff,,,Activation signal of the eBus source
r,,Fluegasvalve,Fluegasvalve_DK,,,,3C00,,,onoff,,,flue gasvalve activation signal
r,,ExternalFaultmessage,External_Faultmessage_DK,,,,3E00,,,onoff,,,external fault message
r,,GasvalveASICFeedback,SD_Gasvalve_ASICFeedback_DK,,,,4700,,,UCH,240=off;15=on,,feedback gasvalve (from ASIC)
r,,GasvalveUCFeedback,SD_Gasvalve_uCFeedback_DK,,,,4800,,,UCH,240=off;15=on,,feedback gasvalve (from Microcontroller)
r,,Ignitor,SD_Ignitor_DK,,,,4900,,,UCH,240=off;15=on,,igniton activated
r,,HwcTypes,DHW_Types_DK,,,,4B00,,,UCH,,,DHW type of the appliance
r,,HwcImpellorSwitch,DHW impellor switch,,,,5700,,,yesno,,,domestic hot water (tapping) demand
r,,WarmstartDemand,WarmstartDemand,,,,3A04,,,yesno,,,aktivation of warmstart
r,,BoilerType,BoilerType_DK,,,,5E00,,,UCH,,,Boiler typ of the bmu
r,,ParamToken,ParamToken_DK,,,,6000,,,UCH,,,token for parameter managment
r,,expertlevel_ReturnTemp,ReturnTemperature_DK,,,,6B00,,,tempsensor,,,external return sensor
r,,FloorHeatingContact,Floor heating contact,,,,7000,,,onoff,,,Floor heating contact
r,,TemplimiterFault,SD_TL_Fault_DK,,,,"4D00",,,UCH,240=off;15=on,,temperature limiter error
r,,Templimiter,SD_Temperaturelimiter_DK,,,,7700,,,UCH,240=off;15=on,,feedback signal of the temperature limiter
r,,EbusVoltage,EbusVoltage_DK,,,,7F00,,,onoff,,,feedback signal of the eBus source
r,,FluegasvalveOpen,FluegasvalveOpen_DK,,,,8900,,,onoff,,,feedback of the flue gas valve
r,,Testbyte,Testbyte_DK,,,,9900,,,UCH,,,Testbyte (relevant for the Tester)
r,,DSN,DSN_DK,,,,9A00,,,UIN,,,DSN: Device Specific number
r,,TargetFanSpeedOutput,TargetFan_Speed_Output_DK,,,,9F00,,,UIN,,1/min,output fan speed
r,,PowerValue,PowerValue,,,,AA00,,,HEX:6,,,"Power Values of the Boiler (min Power, max Power)"
r,,Statenumber,Statenumber_DK,,,,AB00,,,UCH,,,status number
r,,WaterpressureBranchControlOff,WaterpressureBranchControlOff_DK,,,,AF00,,,onoff,,,water pressure branch controll off
r,,DSNStart,DSN start,,,,3104,,,UIN,,,DSN Start adress
r,,ExtStorageModulCon,ExtTankModulCon_DK,,,,BF00,,,yesno,,,external tank modul connected (VR65)
r,,PartnumberBox,Partnumber_Box,,,,C000,,,HEX:5,,,part number of the eBox
r,,WPSecondStage,WP_SecondStage_DK,,,,ED00,,,onoff,,,Second stage of the pump activated
r,,TemplimiterWithNTC,SD_STL_with_NTC,,,,D200,,,UCH,240=no;15=yes,,Safety temperature limit concept:1 = safety temp. Limit check with NTC0 = safety temp. Limit check with contact
r,,VolatileLockoutIFCGV,SD_VolatileLockout_IFC_GV_DK,,,,D300,,,UCH,240=no;15=yes,,all IFC faults are volataile
r,,VortexFlowSensor,VortexFlowSensor_DK,,,,D500,,,UIN,,,"Predictive Maintenance data, CH water flow"
r,,DisplayMode,DisplayMode_DK,,,,DA00,,,UCH,,,Display mode of the aplliance
r,,Gasvalve3UC,SD_Gasvalve3_uC_DK,,,,DB00,,,UCH,240=off;15=on,,Gasvalve activation signal (from Microcontroller)
r,,InitialisationEEPROM,InitialisationEEPROM,,,,DC00,,,yesno,,,Initialisation off all EEPROM values (done in the production)
r,,TimerInputHc,TimerInputCH_DK,,,,DE00,,,onoff,,,timer input (block heatdemand)
r,,FanMinSpeedOperation,FanMinSpeedOperation,,,,DF00,,,UIN,,1/min,Minimum Fan speed of the appliance
r,,FanMaxSpeedOperation,FanMaxSpeedOperation,,,,E000,,,UIN,,1/min,Maximum Fan speed of the appliance
r,,ExternGasvalve,ExternGasvalve_DK,,,,E400,,,onoff,,,external gasvalve activated
r,,DCFTimeDate,DCF_TimeDate_DK,,,,E500,,,HEX:8,,,DCF Time / date stamp struct { uchar sec; uchar min; uchar std; uchar tag; uchar mon; uchar wtg; uchar jah; } Tdcf77_time;
r;w,,FlowSetPotmeter,FlowSetPotmeter,,,,F003,,,temp,,,flow setpoint potentiometer
r;w,,HwcSetPotmeter,DHWSetPotmeter,,,,F103,,,temp,,,DHW setpoint potentiometer
r;w,,HeatingSwitch,Heating Switch,,,,F203,,,onoff,,,Wintermode active
r;w,,HwcSwitch,DHWSwitch,,,,F303,,,onoff,,,DHW on/off
r,,ProductionByte,ProductionByte,,,,3E04,,,UCH,,,
!include,errors.inc,,,,,,,,,,,,
