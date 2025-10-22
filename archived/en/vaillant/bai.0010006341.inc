# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,icoVIT/7,0010006341 207,,,,,,,,,,
*r,,,,,,"B509","0D",,,,,,
*w,,,,,,"B509","0E",,,,,,
*wi,#install,,,,,"B509","0E",,,,,,
*ws,#service,,,,,"B509","0E",,,,,,
# ##### dia level 1 #####,,,,,,,,,,,,,
r;wi,,WPPostrunTime,d.01 central heating overruntime,,,,"6400",,,minutes0,,,water pump overrun time for heating mode
r;wi,,BlockTimeHcMax,d.02 Max blocking time CH,,,,"2100",,,minutes0,,,max. burner anti cycling period at 20°C Flow temperature setpoint
r,,HwcTemp,d.03 Temp DHW,,,,"1600",,,tempsensor,,,actoSTOR inletsensor temperature
r,,StorageTemp,d.04 Temp storage / she,,,,"1700",,,tempsensor,,,current storage tank sensor temperature
r,,FlowTempDesired,d.05 flow/return setpoint,,,,"3900",,,temp,,,Flow temperature target value or return target value when return regulation is set
r,,StorageTempDesired,d.07 Storage setpoint,,,,"0400",,,temp,,,Storage temperature target value
r,,ACRoomthermostat,d.08 Room thermostat 230 V,,,,"2A00",,,onoff,,,External controls heat demand (Clamp 3-4)
r,,ExtFlowTempDesiredMin,d.09 ext flowsetpoint,,,,"6E04",,,temp,,,minimum out of Kl.7 and eBus flow setpoint
r,,WP,d.10 Central heating pump,,,,"4400",,,onoff,,,internal heating pump
r,,extWP,d.11 external pump,,,,"3F00",,,onoff,,,External heating pump
r,,Storageloadpump,d.12 storage load pump,,,,"9E00",,,percent0,,,tank load pump demand
r,,CirPump,d.13 Circulation pump,,,,"7B00",,,onoff,,,Hot water circulation pump (via external module)
r,,WPPWMPower,d.15 WP_PWMPower_DK,,,,"7300",,,percent0,,,Output of pwm pump
r,,DCRoomthermostat,d.16 room thermostat 24 V,,,,"0E00",,,onoff,,,External controls heat demand (Clamp 3'-4')
r,,HwcDemand,d.22 DHW demand,,,,"5800",,,yesno,,,domestic hot water (tapping or tank contact) demand
r,,HeatingSwitch,d.23 operation mode,,,,"F203",,,onoff,,,Wintermode active
r,,StoragereleaseClock,d.25 DHW demand enabled,,,,"4704",,,yesno,,,hot water release (tank storage) via eBus Control
r,,Gasvalve,d.30 Gasvalve,,,,"BB00",,,UCH,240=off;15=on,,Gasvalve activation signal
r,,FlowTemp,d.40 TFT_DK,,,,"1800",,,tempsensor,,,flow temperature
r,,ReturnTemp,d.41 Temp heating return,,,,"9800",,,tempmirrorsensor,,,return temperature
r,,OutdoorstempSensor,d.47 Temp outside,,,,"7600",,,tempsensor,,,Outside temperature (uncorrected value)
r;wi,,FlowHysteresisON,d.53 FlowHysteresis_ON_DK,,,,"1601",,,temp,,,Adjustment of the switch on hysteresis
r;wi,,FlowHysteresisOff,d.54 FlowHysteresis_OFF_DK,,,,"1701",,,temp,,,Adjustment of the switch off hysteresis
r,,RemainingBoilerblocktime,d.67 Remaining burner block time,,,,"3800",,,minutes0,,,Remaining burner anti cycling time
r,,EBusHeatcontrol,d.90 Digital control recognized,,,,"0004",,,yesno,,,Digital regulator status
r,,dcfState,d.91 Status DCF 77,,,,"6900",,,dcfstate,,,DCF status
r;ws,,Password,d.97 Password_DK,,,,"4904",,,UCH,,,Password
r;ws,,PhoneNumber,d.98 PhoneNumber_DK,,,,"8104",,,HEX:8,,,Phone number
r;ws,,Language,d.99 Language_DK,,,,"8204",,,UCH,,,language selection
# ##### dia level 2 #####,,,,,,,,,,,,,
r,,PumpspeedDesired,d.14 PumpspeedSetpoint,,,,"A100",,,percent0,,,PWM pump speed
r;wi,,ReturnRegulation,d.17 Return regulation,,,,"B300",,,onoff,,,heating flow/return regulation activation
r;wi,,HcPumpMode,d.18 CH pump mode,,,,"B700",,,UCH,0=post run;1=permanent;2=winter,,Pump mode
r;wi,,HwcTempMax,d.20 Max value tanksetpoint,,,,"D900",,,temp,,,Adjustment of maximum tank setpoint range (maximum endposition of potmeter)
r;wi,,OptionalRelais,d.26 OptionalRelais_DK,,,,"B800",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Option relais function
r;wi,,AccessoriesOne,d.27 Option relais 1,,,,"B900",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Accesory relay 1 function
r;wi,,AccessoriesTwo,d.28 Option relais 2,,,,"BA00",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Accesory relay 2 function
r,,DeactivationsTemplimiter,d.60 Number STL cut off,,,,"2000",,,UCH,,,Number of safety temperature limiter cut offs
r,,DeactivationsIFC,d.61 Number ignition device cut off,,,,"1F00",,,UCH,,,"number of lock outs (unsuccessfull ignitons in the last attempt, flame failure)"
r,,averageIgnitiontime,d.64 average ignition time,,,,"2D00",,,UCH,10,s,average ignition time
r,,maxIgnitiontime,d.65 Max ignition time,,,,"2C00",,,UCH,10,s,maximum ignition time
r,,CounterStartattempts1,d.68 ignition attempts 1,,,,"6E00",,,temp0,,,unsuccessfull ignitions in the first attempt
r,,CounterStartattempts2,d.69 ignition attempts 2,,,,"6F00",,,temp0,,,unsuccessfull ignitions in the second attempt
r;wi,,FlowsetHcMax,d.71 Max value flow temp,,,,"A500",,,temp,,,Adjustment of maximum central heating setpoint range (maximum endposition of potmeter)
r;wi,,StorageLoadTimeMax,d.75 Max load time storage,,,,"6600",,,minutes0,,,Maximum charging time for a storage without own control
r,,CodingResistor,d.76 SD_CodingResistor_DK,,,,"9200",,,HEX:3,,,boiler identification resistor
r;wi,,FlowsetHwcMax,d.78 Max value flow temp storage,,,,"A600",,,temp,,,storage charging temperature limit (target flow temperature in storage mode)
r,,HcHours,d.80 operating hours CH,,,,"2800",,,hoursum2,,,central heating operation hours
r,,HwcHours,d.81 Operating hours DHW,,,,"2200",,,hoursum2,,,water heating operation hours
r,,HcStarts,d.82 Burner starts heating,,,,"2900",,,UIN,-100,,cycles in heating mode
r,,HwcStarts,d.83 Burner starts DHW,,,,"2300",,,UIN,-100,,Cycles in hot water operation
r;wi,,HoursTillService,d.84 Hours till next service,,,,"2004",,,hoursum2,,,Maintenance indicator:Number of hours until the next maintenance
r;ws,,DSNOffset,d.93 Device specific number,,,,"B500",,,UCH,,,DSN aplliance variant setting
r;wi,,SetFactoryValues,d.96 Set factory settings,,,,"7201",,,yesno,,,Factory settings
r,,WaterPressure,Waterpressure,,,,"0200",,,presssensor,,,water pressure
# ##### maintenance data #####,,,,,,,,,,,,,
r,,TempGradientFailure,TempGradientFailure_DK,,,,"1100",,,temp0,,,Number of cut offs of the boilers cause of to high gradient (S.54)
r,,TempDiffBlock,TempDiffBlock_DK,,,,"1200",,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r,,TempDiffFailure,TempDiffFailure_DK,,,,"1300",,,temp0,,,Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures
r,,PumpHours,Pump operation hours,,,,"1400",,,hoursum2,,,pump operation hours
r,,HcPumpStarts,CH_PumpCommunt_DK,,,,"1500",,,cntstarts2,,,pump switchings
r,,FanHours,Fan operation hours,,,,"1B00",,,hoursum2,,,fan operation hours
r,,FanStarts,FanCommunt_DK,,,,"1C00",,,cntstarts2,,,commutations of the fan
r,,OverflowCounter,OverflowCounter_DK,,,,"1E00",,,yesno,,,Predictive Maintenance counter have got an overflow
r,,TempMaxDiffExtTFT,MaxTempDiffExtTFT_DK,,,,"2700",,,temp,,,Predictive maintenance data
r,,minIgnitiontime,min_Ignitiontime_DK,,,,"2B00",,,UCH,10,s,minimum ignition time
r,,StorageTempMax,Temp storage max,,,,"3600",,,temp,,,maximum temperature measured by the external tank sensor
r,,FlowTempMax,TFT_max_DK,,,,"3700",,,temp,,,maximum temperature measured by the flow sensor
r,,DeltaFlowReturnMax,MaxDeltaFlowReturn_DK,,,,"3D00",,,temp,,,Predictive Maintenance data
r,,StorageLoadPumpHours,TankLoadPumpOperationHours_DK,,,,"4C00",,,hoursum2,,,Preditive maintenance data
r,,StorageloadPumpStarts,TankloadPumpCommunt_DK,,,,"4F00",,,cntstarts2,,,Preditive maintenance data
r,,CounterStartAttempts3,CounterStartAttempts3_DK,,,,"8100",,,temp0,,,unsuccessfull ignitions in the third attempt
r,,CounterStartAttempts4,CounterStartAttempts4_DK,,,,"8200",,,temp0,,,unsuccessfull ignitions in the fourth attempt
r,,ReturnTempMax,TRT_max_DK,,,,"BE00",,,temp,,,max. return temperature
r,,PumpHwcFlowSum,PumpDHWFlowSum_DK,,,,"C100",,,UIN,,,summed up DHW flow rate
r,,PumpHwcFlowNumber,PumpDHWFlowNumber_DK,,,,"C200",,,UCH,,,number of times DHW flow rate was detected
r,,SHEMaxFlowTemp,SHE_MaxFlowTemp_DK,,,,"C300",,,temp,,,maximum flow temperature DHW
r,,SHEMaxDeltaHwcFlow,SHE_MaxDeltaFlowDHW_DK,,,,"C400",,,temp,,,maximum difference between flow and DHW outlet temperature
r;wi,,PrEnergySumHwc1,PrEnergySumDHW1_DK,,,,"C500",,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergyCountHwc1,PrEnergyCountDHW1_DK,,,,"C600",,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergySumHwc2,PrEnergySumDHW2_DK,,,,"C700",,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergyCountHwc2,PrEnergyCountDHW2_DK,,,,"C800",,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergySumHwc3,PrEnergySumDHW3_DK,,,,"C900",,,ULG,,,Predictive Maintenance data
r;wi,,PrEnergyCountHwc3,PrEnergyCountDHW3_DK,,,,"CA00",,,ULG,,,Predictive Maintenance data
r,,WaterpressureVariantSum,WaterpressureVariantSum_DK,,,,"F000",,,pressm2,,,Predictive Maintenance data
r,,WaterpressureMeasureCounter,WaterpressureMeasureCounter_DK,,,,"F100",,,UCH,,,Predictive Maintenance data
# ##### expert level\Main #####,,,,,,,,,,,,,
r,,externalFlowTempDesired,external flowsetpoint,,,,"2500",,,temp,,,Flow target temperature from external regulator to terminal 7-8-9
r,,externalHwcSwitch,DHWSwitch_DK,,,,"0000",,,onoff,,,Demand external tank (via contact)
r,,Flame,Flame,,,,"0500",,,UCH,240=off;15=on,,flame
r,,IFCFault,SD_IFC_Fault_DK,,,,"0700",,,UCH,240=off;15=on,,IFC error
r,,ChangesDSN,Changes_DSN_DK,,,,"0C00",,,UCH,,,Numbers adjusting (storing) the DSN
r,,Brennstoffventil,Brennstoffventil,,,,"0D00",,,UCH,240=off;15=on,,Activation signal of the gasvalve (activated via micrcontroller)
r,,VolatileLockout,SD_VolatileLockout_DK,,,,"1000",,,UCH,240=no;15=yes,,TRUE: STB failures is volatileFALSE: STB failure is not volataile
r,,Faultlist,Faultlist_DK,,,,"2600",,,HEX:10,,,last 10 fault codes
r,,ModulationTempDesired,Modulationsetpoint_DK,,,,"2E00",,,SIN,10,%,Modulation set point
r,,FlameSensingASIC,SD_Flame_Sensing_ASIC_DK,,,,"2F00",,,UIN,,,ioni/adc value from the flame control circuit
r,,HcUnderHundredStarts,HZ_UnderHundred_SwiActi_DK,,,,"3000",,,UCH,,,Heat switch cycles under hundred
r,,HwcUnderHundredStarts,BW_UnderHundred_SwiActi_DK,,,,"3100",,,UCH,,,DHW switch cycles under hundred
r,,EbusSourceOn,EbusSourceOn_DK,,,,"3400",,,onoff,,,Activation signal of the eBus source
r,,Fluegasvalve,Fluegasvalve_DK,,,,"3C00",,,onoff,,,flue gasvalve activation signal
r,,ExternalFaultmessage,External_Faultmessage_DK,,,,"3E00",,,onoff,,,external fault message
r,,RueckmeldungBrennstoffventil1,Rückmeldung Brennstoffventil 1,,,,"4700",,,UCH,240=off;15=on,,feedback gasvalve (from ASIC)
r,,RueckmeldungBrennstoffventil2,Rückmeldung Brennstoffventil 2,,,,"4800",,,UCH,240=off;15=on,,feedback gasvalve (from Microcontroller)
r,,Ignitor,SD_Ignitor_DK,,,,"4900",,,UCH,240=off;15=on,,igniton activated
r,,Fan,Fan_DK,,,,"4A00",,,yesno,,,Fan activation signal
r,,HwcTypes,DHW_Types_DK,,,,"4B00",,,UCH,,,DHW type of the appliance
r,,TemplimiterFault,SD_TL_Fault_DK,,,,"4D00",,,UCH,240=off;15=on,,temperature limiter error
r,,ADCOk,SD_ADC_ok_DK,,,,"4E00",,,UCH,240=off;15=on,,internal electronic error
r,,FanFault,SD_Fan_Fault_DK,,,,"5300",,,UCH,240=off;15=on,,Fan error
r,,BoilerType,BoilerType_DK,,,,"5E00",,,UCH,,,Boiler typ of the bmu
r,,FunctionFlags,FunctionFlags_DK,,,,"5F00",,,UCH,,,differrent function flags
r,,ParamToken,ParamToken_DK,,,,"6000",,,UCH,,,token for parameter managment
r,,expertlevelMain_ReturnTemp,ReturnTemperature_DK,,,,"6B00",,,tempsensor,,,external return sensor
r,,FloorHeatingContact,Floor heating contact,,,,"7000",,,onoff,,,Floor heating contact
r,,Templimiter,SD_Temperaturelimiter_DK,,,,"7700",,,UCH,240=off;15=on,,feedback signal of the temperature limiter
r,,SRIFCEEFaultCause,SR_IFC_EE_FaultCause_DK,,,,"7A00",,,UCH,,,current IFC fault cause
r,,ParamReplication,ParamReplication_DK,,,,"7C00",,,yesno,,,activated the parameter managment again
r,,AnodeINFeedback,Anode_IN_Feedback_DK,,,,"7E00",,,yesno,,,feedback signal of the anode
r,,EbusVoltage,EbusVoltage_DK,,,,"7F00",,,onoff,,,feedback signal of the eBus source
r,,SRTFINSDFeedback,SR_TF_IN_SD_Feedback_DK,,,,"8400",,,UCH,240=off;15=on,,Thermal fuse error
r,,DemandCirPump,Demand_CirculationPump_DK,,,,"8800",,,yesno,,,remote control activated accessory circulation pump
r,,FluegasvalveOpen,FluegasvalveOpen_DK,,,,"8900",,,onoff,,,feedback of the flue gas valve
r,,FunctionFault,Function_Fault_DK,,,,"9500",,,yesno,,,boiler stopped by a internal function fault
r,,Testbyte,Testbyte_DK,,,,"9900",,,UCH,,,Testbyte (relevant for the Tester)
r,,DSN,DSN_DK,,,,"9A00",,,UIN,,,DSN: Device Specific number
r,,TargetFanSpeedOutput,TargetFan_Speed_Output_DK,,,,"9F00",,,UIN,,1/min,output fan speed
r,,Statenumber,Statenumber_DK,,,,"AB00",,,UCH,,,status number
r,,AdvancedPowerValues,AdvancedPowerValues_DK,,,,"AE00",,,HEX:9,,,min. / max powervalues
r,,DSNStart,DSN start,,,,"BC00",,,UIN,,,DSN Start adress
r,,Shiftloadtankpump,Shiftloadtankpump_DK,,,,"B400",,,yesno,,,current status of the shift load pump
r,,ExtStorageModulCon,ExtTankModulCon_DK,,,,"BF00",,,yesno,,,external tank modul connected (VR65)
r,,PartnumberBox,Partnumber_Box,,,,"C000",,,HEX:5,,,part number of the eBox
r,,SRSyphonINSDSwitch,SR_Syphon_IN_SD_Switch_DK,,,,"CF00",,,UCH,240=no;15=yes,,feedback of the syphon switch contact
r,,TemplimiterWithNTC,SD_STL_with_NTC,,,,"D200",,,UCH,240=no;15=yes,,Safety temperature limit concept:1 = safety temp. Limit check with NTC0 = safety temp. Limit check with contact
r,,VolatileLockoutIFCGV,SD_VolatileLockout_IFC_GV_DK,,,,"D300",,,UCH,240=no;15=yes,,all IFC faults are volataile
r,,DisplayMode,DisplayMode_DK,,,,"DA00",,,UCH,,,Display mode of the aplliance
r,,RueckmeldungBrennstoffventil3,Rückmeldung Brennstoffventil 3,,,,"DB00",,,UCH,240=off;15=on,,Gasvalve activation signal (from Microcontroller)
r,,InitialisationEEPROM,InitialisationEEPROM,,,,"DC00",,,yesno,,,Initialisation off all EEPROM values (done in the production)
r,,DefaultSettingEEPROM,DefaultSettingEEPROM_DK,,,,"DD00",,,yesno,,,default value setting off all EEPROM values (done in the production)
r,,TimerInputHc,TimerInputCH_DK,,,,"DE00",,,onoff,,,timer input (block heatdemand)
r,,RManagEE.VirtualHcPartloadEnableDTemp,TR_Manag_EE.Virtual_CH_Partload_Enable_DK,,,,"E300",,,onoff,,,enable the adaptive CH-partload calulation
r,,ExternGasvalve,ExternGasvalve_DK,,,,"E400",,,onoff,,,external gasvalve activated
r,,DCFTimeDate,DCF_TimeDate_DK,,,,"E500",,,HEX:8,,,DCF Time / date stamp struct { uchar sec; uchar min; uchar std; uchar tag; uchar mon; uchar wtg; uchar jah; } Tdcf77_time;
r,,actoSTOREEPreventiveCounter,actoSTOR_EE_PreventiveCounter_DK,,,,"EC00",,,UIN;UIN;UIN,,,Predictive maintenance date of the actoSTOR
r,,InitialisationSequence,InitialisationSequence_DK,,,,"9A01",,,UCH,,,value:0 -> off1-> full initialisation incl. all defaultvalues (done in the production)
r,,FlowSetPotmeter,FlowSetPotmeter,,,,"F003",,,temp,,,flow setpoint potentiometer
r,,HwcSetPotmeter,DHWSetPotmeter,,,,"F103",,,temp,,,DHW setpoint potentiometer
r,,HwcSwitch,DHWSwitch,,,,"F303",,,onoff,,,DHW on/off
r,,ProductionByte,ProductionByte,,,,"3E04",,,UCH,,,
r,,SerialNumber,SerialNumber,,,,"3F04",,,HEX:8,,,serial number of AI
r,,BoilerType2,BoilerType_2_DK,,,,"0C01",,,ULG,,,second Boiler typ of the bmu
r,,StatusList,StatusList_DK,,,,"1101",,,HEX:10,,,List of the last 10 status numbers
r,,LimpHomeModeEEHistoryList,LimpHomeMode_EE_History_List_DK,,,,"8B01",,,UIN;UIN;UIN;UIN;UIN,,,history of the last 5 limp home modes
# ##### expert level\icoVIT #####,,,,,,,,,,,,,
r;wi,,AWPCEEMinThreshold,AWPC_EE_MinThreshold_DK,,,,"1201",,,SIN,10,bar/10,minimum waterpressure threshold
r;wi,,AWPCEEMaxThreshold,AWPC_EE_MaxThreshold_DK,,,,"1301",,,SIN,10,bar/10,maximum waterpressure threshold
r,,OILOUTPreHeater,OIL_OUT_PreHeater_DK,,,,"3101",,,onoff,,,activated the preheater
r,,OILINPreHeaterFeedback,OIL_IN_PreHeaterFeedback_DK,,,,"3201",,,yesno,,,feedback of the preheater
!include,errors.inc,,,,,,,,,,,,
!include,service.inc,,,,,,,,,,,,
