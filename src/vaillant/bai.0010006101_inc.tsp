import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010006101_inc {
  // ,BAI00,TEC/4,0010006101 188
  // ##### dia level 1 #####

  /** d.00 heating partload: Heating part load */
  @ext(0x7, 0x4)
  model PartloadHcKW is Register<power>;

  /** d.01 central heating overruntime: water pump overrun time for heating mode */
  @ext(0xf7, 0x3)
  model WPPostrunTime is Register<minutes0>;

  /** d.02 Max blocking time CH: max. burner anti cycling period at 20°C Flow temperature setpoint */
  @ext(0x9, 0x4)
  model BlockTimeHcMax is Register<minutes0>;

  /** d.03 Temp DHW: hot water flow temperature (combination boiler only) */
  @ext(0x16, 0)
  model HwcTemp is ReadonlyRegister<tempsensor>;

  /** d.04 Temp storage / she: current temperature for warm start sensor (combination boiler only) Current storage tank sensor (system boiler only) */
  @ext(0x17, 0)
  model StorageTemp is ReadonlyRegister<tempsensor>;

  /** d.05 flow/return setpoint: Flow temperature target value or return target value when return regulation is set */
  @ext(0x39, 0)
  model FlowTempDesired is ReadonlyRegister<temp>;

  /** d.06 DHW setpoint: Hot water temperature target value */
  @ext(0xea, 0x3)
  model HwcTempDesired is ReadonlyRegister<temp>;

  /** d.07 Storage setpoint: Warm start temperature value (combination boiler plus only), Storage temperature target value (system boiler only) */
  @ext(0x4, 0)
  model StorageTempDesired is ReadonlyRegister<temp>;

  /** d.08 Room thermostat 230 V: External controls heat demand (Clamp 3-4) */
  @ext(0x2a, 0)
  model ACRoomthermostat is ReadonlyRegister<onoff>;

  /** d.09 ext flowsetpoint: minimum out of Kl.7 and eBus flow setpoint */
  @ext(0x6e, 0x4)
  model ExtFlowTempDesiredMin is ReadonlyRegister<temp>;

  /** d.10 Central heating pump: internal heating pump */
  @ext(0x44, 0)
  model WP is ReadonlyRegister<onoff>;

  /** d.11 external pump: External heating pump */
  @ext(0x3f, 0)
  model ExtWP is ReadonlyRegister<onoff>;

  /** d.12 storage load pump: tank load pump demand */
  @ext(0x9e, 0)
  model Storageloadpump is ReadonlyRegister<percent0>;

  /** d.13 Circulation pump: Hot water circulation pump (via external module) */
  @ext(0x7b, 0)
  model CirPump is ReadonlyRegister<onoff>;

  /** d.15 WP_PWMPower_DK: actual PWM-Powerrate of electronic-pump */
  @ext(0x73, 0)
  model WPPWMPower is ReadonlyRegister<percent0>;

  /** d.22 DHW demand: domestic hot water (tapping or tank contact) demand */
  @ext(0x58, 0)
  model HwcDemand is ReadonlyRegister<yesno>;

  /** d.23 operation mode: Wintermode active */
  @ext(0xf2, 0x3)
  model HeatingSwitch is ReadonlyRegister<onoff>;

  /** d.24 SD_AircontrolOk_DK: Air pressure switch */
  @ext(0x3, 0)
  model AircontrolOk is ReadonlyRegister<onoff2>;

  /** d.25 DHW demand enabled: hot water release (tank storage) via eBus Control */
  @ext(0x47, 0x4)
  model StoragereleaseClock is ReadonlyRegister<yesno>;

  /** d.30 Gasvalve: Gasvalve activation signal */
  @ext(0xbb, 0)
  model Gasvalve is ReadonlyRegister<onoff2>;

  /** d.33 Target fan speed */
  @inherit(r)
  @ext(0x24, 0)
  model TargetFanSpeed {
    /** Fan speed setpoint */
    @unit("1/min")
    value: UIN;
  }

  /** d.34 Actual fan speed */
  @inherit(r)
  @ext(0x83, 0)
  model FanSpeed {
    /** fan speed actual value */
    @unit("1/min")
    value: UIN;
  }

  /** d.35 Position TWV: Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position */
  @ext(0x54, 0)
  model PositionValveSet is ReadonlyRegister<UCH>;

  /** d.36 DHW waterflow: domestic hot water flow sensor */
  @ext(0x55, 0)
  model HwcWaterflow is ReadonlyRegister<uin100>;

  /** d.40 TFT_DK: flow temperature */
  @ext(0x18, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** d.41 Temp heating return: return temperature */
  @ext(0x98, 0)
  model ReturnTemp is ReadonlyRegister<tempmirrorsensor>;

  /** d.44 Dig. ionisation voltage */
  @inherit(r)
  @ext(0xa4, 0)
  model IonisationVoltageLevel {
    /** digital ionisation voltage */
    @divisor(10)
    value: SIN;
  }

  /** d.47 Temp outside: Outside temperature (uncorrected value) */
  @ext(0x76, 0)
  model OutdoorstempSensor is ReadonlyRegister<tempsensor>;

  /** d.48 SD_TAI_DK: Exhaust sensor (inside the flue pipe) */
  @ext(0x33, 0)
  model AITemp is ReadonlyRegister<tempmirrorsensor>;

  /** d.49 SD_TAA_DK: Exhaust sensor (outside the flue pipe) */
  @ext(0x32, 0)
  model AATemp is ReadonlyRegister<tempmirrorsensor>;

  /** d.67 Remaining burner block time: Remaining burner anti cycling time */
  @ext(0x38, 0)
  model RemainingBoilerblocktime is ReadonlyRegister<minutes0>;

  /** d.90 Digital control recognized: Digital regulator status */
  @ext(0, 0x4)
  model EBusHeatcontrol is ReadonlyRegister<yesno>;

  /** d.91 Status DCF 77: DCF status */
  @ext(0x69, 0)
  model DcfState is ReadonlyRegister<dcfstate>;
  // ##### expert level #####

  /** d.16 room thermostat 24 V: External controls heat demand (Clamp 3'-4') */
  @ext(0xe, 0)
  model DCRoomthermostat is ReadonlyRegister<onoff>;

  /** DHWSwitch: DHW on/off */
  @ext(0xf3, 0x3)
  model HwcSwitch is ReadonlyRegister<onoff>;

  /** value of waterpressure-sensor */
  @ext(0x2, 0)
  model WaterPressure is ReadonlyRegister<presssensor>;

  /** ExternGasvalve_DK: external gasvalve activated */
  @ext(0xe4, 0)
  model ExternGasvalve is ReadonlyRegister<onoff>;

  /** ReturnTemperature_DK: external return sensor */
  @ext(0x6b, 0)
  model Expertlevel_ReturnTemp is ReadonlyRegister<tempsensor>;

  /** SD_Ignitor_DK: igniton activated */
  @ext(0x49, 0)
  model Ignitor is ReadonlyRegister<onoff2>;

  /** Flame */
  @ext(0x5, 0)
  model Flame is ReadonlyRegister<onoff2>;

  /** DHWSwitch_DK: Demand external tank (via contact) */
  @ext(0, 0)
  model ExternalHwcSwitch is ReadonlyRegister<onoff>;

  /** HZ_UnderHundred_SwiActi_DK: Heat switch cycles under hundred */
  @ext(0x30, 0)
  model HcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** BW_UnderHundred_SwiActi_DK: DHW switch cycles under hundred */
  @ext(0x31, 0)
  model HwcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** DSN_DK: DSN: Device Specific number */
  @ext(0x9a, 0)
  model DSN is ReadonlyRegister<UIN>;

  /** DSN Start adress */
  @ext(0x31, 0x4)
  model DSNStart is ReadonlyRegister<UIN>;

  /** Changes_DSN_DK: Numbers adjusting (storing) the DSN */
  @ext(0xc, 0)
  model ChangesDSN is ReadonlyRegister<UCH>;

  /** ParamToken_DK: token for parameter managment */
  @ext(0x60, 0)
  model ParamToken is ReadonlyRegister<UCH>;

  /** FanMinSpeedOperation */
  @inherit(r)
  @ext(0xdf, 0)
  model FanMinSpeedOperation {
    /** Minimum Fan speed of the appliance */
    @unit("1/min")
    value: UIN;
  }

  /** FanMaxSpeedOperation */
  @inherit(r)
  @ext(0xe0, 0)
  model FanMaxSpeedOperation {
    /** Maximum Fan speed of the appliance */
    @unit("1/min")
    value: UIN;
  }

  /** WaterpressureBranchControlOff_DK: water pressure branch control off */
  @ext(0xaf, 0)
  model WaterpressureBranchControlOff is ReadonlyRegister<onoff>;

  /** SerialNumber */
  @inherit(r)
  @ext(0x3f, 0x4)
  model SerialNumber {
    /** serial number of AI */
    @maxLength(8)
    value: HEX;
  }

  /** Partnumber_Box */
  @inherit(r)
  @ext(0xc0, 0)
  model PartnumberBox {
    /** part number of the eBox */
    @maxLength(5)
    value: HEX;
  }

  /** BoilerType_DK: Boiler typ of the bmu */
  @ext(0x5e, 0)
  model BoilerType is ReadonlyRegister<UCH>;

  /** BoilerType_2_DK */
  @ext(0xc, 1)
  model BoilerType2 is ReadonlyRegister<ULG>;

  /** DisplayMode_DK: Display mode of the appliance */
  @ext(0xda, 0)
  model DisplayMode is ReadonlyRegister<UCH>;

  /** PowerValue */
  @inherit(r)
  @ext(0xaa, 0)
  model PowerValue {
    /** Power Values of the Boiler (min Power, max Power) */
    @maxLength(6)
    value: HEX;
  }

  /** DCF_TimeDate_DK */
  @inherit(r)
  @ext(0xe5, 0)
  model DCFTimeDate {
    btime: btime;
    bdate: bdate;
  }

  /** EbusVoltage_DK: feedback signal of the eBus source */
  @ext(0x7f, 0)
  model EbusVoltage is ReadonlyRegister<onoff>;

  /** EbusSourceOn_DK: Activation signal of the eBus source */
  @ext(0x34, 0)
  model EbusSourceOn is ReadonlyRegister<onoff>;

  /** SD_STL_with_NTC: Safety temperature limit concept:1 = safety temp. Limit check with NTC0 = safety temp. Limit check with contact */
  @ext(0xd2, 0)
  model TemplimiterWithNTC is ReadonlyRegister<yesno2>;

  /** SD_Temperaturelimiter_DK: feedback signal of the temperature limiter */
  @ext(0x77, 0)
  model Templimiter is ReadonlyRegister<onoff2>;

  /** TimerInputCH_DK: timer input (block heatdemand) */
  @ext(0xde, 0)
  model TimerInputHc is ReadonlyRegister<onoff>;

  /** Statenumber_DK: status number */
  @ext(0xab, 0)
  model Statenumber is ReadonlyRegister<UCH>;

  /** External_Faultmessage_DK: external fault message */
  @ext(0x3e, 0)
  model ExternalFaultmessage is ReadonlyRegister<onoff>;

  /** FlowSetPotmeter: flow setpoint potentiometer */
  @ext(0xf0, 0x3)
  model FlowSetPotmeter is ReadonlyRegister<temp>;

  /** DHWSetPotmeter: DHW setpoint potentiometer */
  @ext(0xf1, 0x3)
  model HwcSetPotmeter is ReadonlyRegister<temp>;

  /** Floor heating contact */
  @ext(0x70, 0)
  model FloorHeatingContact is ReadonlyRegister<onoff>;

  /** external flowsetpoint: Flow target temperature from external regulator to terminal 7-8-9 */
  @ext(0x25, 0)
  model ExternalFlowTempDesired is ReadonlyRegister<temp>;

  /** Modulationsetpoint_DK */
  @inherit(r)
  @ext(0x2e, 0)
  model ModulationTempDesired {
    /** Modulation set point */
    @unit("%")
    @divisor(10)
    value: SIN;
  }
  // ##### dia level 2 #####

  /** d.14 WP_PWMPowerDia_DK: Set-PWM-Powerrate of electronic-pump */
  @ext(0xa, 0x4)
  model WPPWMPowerDia is InstallRegister<UCH>;

  /** d.17 Return regulation: heating flow/return regulation activation */
  @ext(0xc, 0x4)
  model ReturnRegulation is InstallRegister<onoff>;

  /** d.18 CH pump mode */
  @inherit(r, wi)
  @ext(0x49, 0x4)
  model HcPumpMode {
    /** Pump mode */
    @values(Values_HcPumpMode)
    value: UCH;
  }

  /** d.19 Mode of 2 speed pump: Operating mode of the two-stage heating pump0: burner mode = 2, pre/post-run = 1; 1: CH + post-run = 1, DHW = 2, 2: as 1 but rotation speed in CH is dependent of heating part load, (defaultsetting)3: always stage 2 */
  @ext(0xb, 0x4)
  model SecondPumpMode is InstallRegister<UCH>;

  /** d.20 Max value tanksetpoint: Adjustment of maximum tank setpoint range (maximum endposition of potmeter) */
  @ext(0x43, 0x4)
  model HwcTempMax is InstallRegister<temp>;

  /** d.27 Option relais 1 */
  @inherit(r, wi)
  @ext(0x4b, 0x4)
  model AccessoriesOne {
    /** Accesory relay 1 function */
    @values(Values_AccessoriesOne)
    value: UCH;
  }

  /** d.28 Option relais 2 */
  @inherit(r, wi)
  @ext(0x4c, 0x4)
  model AccessoriesTwo {
    /** Accesory relay 2 function */
    @values(Values_AccessoriesTwo)
    value: UCH;
  }

  /** d.52 MinGVStepOffset: Offset for minimum gas valve steps */
  @ext(0x74, 0x4)
  model GVStepOffsetMin is InstallRegister<UCH>;

  /** d.53 MaxGVStepOffset: Offset for maximum gas valve steps */
  @ext(0x75, 0x4)
  model GVStepOffsetMax is InstallRegister<SCH>;

  /** d.56 ExhaustCurve */
  @ext(0x72, 0x4)
  model ExhaustCurve is ServiceRegister<UCH>;

  /** d.58 solar function: special DHW functions0: solar function deactivated (default)1: solar function activated and DHW setpoint minimum 60°C2: solar function activated and DHW setpoint like combi standard (min 35°)3: DHW setpoint minimum 60°C (poti) */
  @ext(0x73, 0x4)
  model SolPostHeat is ReadonlyRegister<UCH>;

  /** d.60 Number STL cut off: Number of safety temperature limiter cut offs */
  @ext(0x20, 0)
  model DeactivationsTemplimiter is ReadonlyRegister<UCH>;

  /** d.61 Number ignition device cut off: number of lock outs (unsuccessfull ignitons in the last attempt, flame failure) */
  @ext(0x1f, 0)
  model DeactivationsIFC is ReadonlyRegister<UCH>;

  /** d.63 exhaust way block counter: numbers the exhaust way was blocked */
  @ext(0x9c, 0)
  model ExhaustWayBlockCounter is ReadonlyRegister<UCH>;

  /** d.64 average ignition time */
  @inherit(r)
  @ext(0x2d, 0)
  model AverageIgnitiontime {
    /** average ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** d.65 Max ignition time */
  @inherit(r)
  @ext(0x2c, 0)
  model MaxIgnitiontime {
    /** maximum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** d.68 ignition attempts 1: unsuccessfull ignitions in the first attempt */
  @ext(0x6e, 0)
  model CounterStartattempts1 is ReadonlyRegister<temp0>;

  /** d.69 ignition attempts 2: unsuccessfull ignitions in the second attempt */
  @ext(0x6f, 0)
  model CounterStartattempts2 is ReadonlyRegister<temp0>;

  /** d.70 diverter valve position: Set diverter valve position 0=normal mode, 1=middle position (GB), 2=permanent CH position */
  @ext(0x2a, 0x4)
  model ValveMode is InstallRegister<UCH>;

  /** d.71 Max value flow temp: Adjustment of maximum central heating setpoint range (maximum endposition of potmeter) */
  @ext(0xe, 0x4)
  model FlowsetHcMax is InstallRegister<temp>;

  /** d.72 postrun time storage */
  @inherit(r, wi)
  @ext(0x11, 0x4)
  model HwcPostrunTime {
    /** Pump overrun time after charging a storage (charging through C1-C2, external/internal tank with tank sensor) */
    @unit("s")
    @factor(10)
    value: UCH;
  }

  /** d.73 Warmstart offset: Offset for warm start target value (combination boilers only) */
  @ext(0x10, 0x4)
  model WarmstartOffset is ReadonlyRegister<temp>;

  /** d.75 Max load time storage: Maximum charging time for a storage without own control */
  @ext(0x12, 0x4)
  model StorageLoadTimeMax is InstallRegister<minutes0>;

  /** d.77 hot water partload: storage part load (storage charging capacity limit) */
  @ext(0x8, 0x4)
  model PartloadHwcKW is InstallRegister<power>;

  /** d.78 Max value flow temp storage: storage charging temperature limit (target flow temperature in storage mode) */
  @ext(0xf, 0x4)
  model FlowsetHwcMax is InstallRegister<temp>;

  /** d.80 operating hours CH: central heating operation hours */
  @ext(0x28, 0)
  model HcHours is ReadonlyRegister<hoursum2>;

  /** d.81 Operating hours DHW: water heating operation hours */
  @ext(0x22, 0)
  model HwcHours is ReadonlyRegister<hoursum2>;

  /** d.82 Burner starts heating */
  @inherit(r)
  @ext(0x29, 0)
  model HcStarts {
    /** cycles in heating mode */
    @factor(100)
    value: UIN;
  }

  /** d.83 Burner starts DHW */
  @inherit(r)
  @ext(0x23, 0)
  model HwcStarts {
    /** Cycles in hot water operation */
    @factor(100)
    value: UIN;
  }

  /** d.84 Hours till next service: Maintenance indicator:Number of hours until the next maintenance */
  @ext(0x20, 0x4)
  model HoursTillService is InstallRegister<hoursum2>;

  /** d.85 AntiCondensValue */
  @inherit(r, wi)
  @ext(0x77, 0x4)
  model AntiCondensValue {
    /** increase of minimum power */
    @unit("kW / %")
    value: UCH;
  }

  /** d.88 SpecialAdj: switching on threshold for recognition of water tapping0 = 1,5 l/min and no delay, 1 = 3,7 l/min and 2s delay */
  @ext(0x76, 0x4)
  model SpecialAdj is InstallRegister<UCH>;

  /** d.93 Device specific number: DSN aplliance variant setting */
  @ext(0x30, 0x4)
  model DSNOffset is ServiceRegister<UCH>;

  /** d.96 Set factory settings */
  @ext(0x68, 0x4)
  model SetFactoryValues is InstallRegister<yesno>;
  // ##### maintenance data #####

  /** min_Ignitiontime_DK */
  @inherit(r)
  @ext(0x2b, 0)
  model MinIgnitiontime {
    /** minimum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** SD_Gasvalve_uC_DK: Activation signal of the gasvalve (activated via micrcontroller) */
  @ext(0xd, 0)
  model GasvalveUC is ReadonlyRegister<onoff2>;

  /** SD_VolatileLockout_DK: TRUE: STB failures is volatileFALSE: STB failure is not volataile */
  @ext(0x10, 0)
  model VolatileLockout is ReadonlyRegister<yesno2>;

  /** SD_Flame_Sensing_ASIC_DK: ioni/adc value from the flame control circuit */
  @ext(0x2f, 0)
  model FlameSensingASIC is ReadonlyRegister<UIN>;

  /** Fluegasvalve_DK: flue gasvalve activation signal */
  @ext(0x3c, 0)
  model Fluegasvalve is ReadonlyRegister<onoff>;

  /** SD_Gasvalve_ASICFeedback_DK: feedback gasvalve (from ASIC) */
  @ext(0x47, 0)
  model GasvalveASICFeedback is ReadonlyRegister<onoff2>;

  /** SD_Gasvalve_uCFeedback_DK: feedback gasvalve (from Microcontroller) */
  @ext(0x48, 0)
  model GasvalveUCFeedback is ReadonlyRegister<onoff2>;

  /** DHW_Types_DK: DHW type of the appliance */
  @ext(0x4b, 0)
  model HwcTypes is ReadonlyRegister<UCH>;

  /** DHW Waterflow_max_DK: domestic hot water flow sensor maximum value */
  @ext(0x56, 0)
  model HwcWaterflowMax is ReadonlyRegister<uin100>;

  /** DHW impellor switch: domestic hot water (tapping) demand */
  @ext(0x57, 0)
  model HwcImpellorSwitch is ReadonlyRegister<yesno>;

  /** WarmstartDemand: activation of warmstart */
  @ext(0x3a, 0x4)
  model WarmstartDemand is ReadonlyRegister<yesno>;

  /** TargetFan_Speed_Output_DK */
  @inherit(r)
  @ext(0x9f, 0)
  model TargetFanSpeedOutput {
    /** output fan speed */
    @unit("1/min")
    value: UIN;
  }

  /** ReduceModulationBlocktime_DK: Reduced modulation blocking time to fulfil 3-star requirement */
  @ext(0x5c, 0)
  model ReduceModulationBlocktime is ServiceRegister<UCH>;

  /** CounterStartAttempts3_DK: unsuccessfull ignitions in the third attempt */
  @ext(0x81, 0)
  model CounterStartAttempts3 is ReadonlyRegister<temp0>;

  /** SHE_MaxFlowTemp_DK: maximum flow temperature DHW */
  @ext(0xc3, 0)
  model SHEMaxFlowTemp is ReadonlyRegister<temp>;

  /** SHE_MaxDeltaFlowDHW_DK: maximum difference between flow and DHW outlet temperature */
  @ext(0xc4, 0)
  model SHEMaxDeltaHwcFlow is ReadonlyRegister<temp>;

  /** Pump operation hours */
  @ext(0x14, 0)
  model PumpHours is ReadonlyRegister<hoursum2>;

  /** WP_SecondStage_DK: Second stage of the pump activated */
  @ext(0xed, 0)
  model WPSecondStage is ReadonlyRegister<onoff2>;

  /** CH_PumpCommunt_DK: pump switchings */
  @ext(0x15, 0)
  model HcPumpStarts is ReadonlyRegister<cntstarts2>;

  /** TWV_Communt_DK: commutations of the three way valve */
  @ext(0x1a, 0)
  model ValveStarts is ReadonlyRegister<cntstarts2>;

  /** Fan operation hours */
  @ext(0x1b, 0)
  model FanHours is ReadonlyRegister<hoursum2>;

  /** FanCommunt_DK: commutations of the fan */
  @ext(0x1c, 0)
  model FanStarts is ReadonlyRegister<cntstarts2>;

  /** Fan_PWM_Test_DK: Predictive Maintenance data for the fan damage recognition */
  @ext(0x3b, 0)
  model FanPWMTest is ReadonlyRegister<UCH>;

  /** Fan_PWM_Sum_DK: Predictive Maintenance data for the fan damage recognition */
  @ext(0x3a, 0)
  model FanPWMSum is ReadonlyRegister<UIN>;

  /** SD_Gasvalve3_uC_DK: Gasvalve activation signal (from Microcontroller) */
  @ext(0xdb, 0)
  model Gasvalve3UC is ReadonlyRegister<onoff2>;

  /** WaterpressureMeasureCounter_DK: Predictive Maintenance data */
  @ext(0xf1, 0)
  model WaterpressureMeasureCounter is ReadonlyRegister<UCH>;

  /** WaterpressureVariantSum_DK: Predictive Maintenance data */
  @ext(0xf0, 0)
  model WaterpressureVariantSum is ReadonlyRegister<pressm2>;

  /** TankLoadPumpOperationHours_DK: Preditive maintenance data */
  @ext(0x4c, 0)
  model StorageLoadPumpHours is ReadonlyRegister<hoursum2>;

  /** TankloadPumpCommunt_DK: Preditive maintenance data */
  @ext(0x4f, 0)
  model StorageloadPumpStarts is ReadonlyRegister<cntstarts2>;

  /** TempGradientFailure_DK: Number of cut offs of the boilers cause of to high gradient (S.54) */
  @ext(0x11, 0)
  model TempGradientFailure is ReadonlyRegister<temp0>;

  /** TempDiffBlock_DK: Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures */
  @ext(0x12, 0)
  model TempDiffBlock is ReadonlyRegister<temp0>;

  /** TempDiffFailure_DK: Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures */
  @ext(0x13, 0)
  model TempDiffFailure is ReadonlyRegister<temp0>;

  /** TRT_max_DK: max. return temperature */
  @ext(0xbe, 0)
  model ReturnTempMax is ReadonlyRegister<temp>;

  /** Temp DHW max: maximum temperature measured by the domestic hot water outlet sensor */
  @ext(0x35, 0)
  model Maintenancedata_HwcTempMax is ReadonlyRegister<temp>;

  /** Temp storage max: maximum temperature measured by the external tank sensor */
  @ext(0x36, 0)
  model StorageTempMax is ReadonlyRegister<temp>;

  /** MaxTempDiffExtTFT_DK: Predictive maintenance data */
  @ext(0x27, 0)
  model TempMaxDiffExtTFT is ReadonlyRegister<temp>;

  /** MaxDeltaFlowReturn_DK: Predictive Maintenance data */
  @ext(0x3d, 0)
  model DeltaFlowReturnMax is ReadonlyRegister<temp>;

  /** MaxWaterFlowCH_DK: Predictive Maintenance data */
  @ext(0xd0, 0)
  model WaterHcFlowMax is ReadonlyRegister<UIN>;

  /** PumpDHWFlowSum_DK: summed up DHW flow rate */
  @ext(0xc1, 0)
  model PumpHwcFlowSum is ReadonlyRegister<UIN>;

  /** PrAPSCounter_DK: Predictive Maintenance data */
  @ext(0xf2, 0)
  model PrAPSCounter is ReadonlyRegister<UCH>;

  /** PrAPSSum_DK: Predictive Maintenance data */
  @ext(0xf3, 0)
  model PrAPSSum is ReadonlyRegister<seconds2>;

  /** PumpDHWFlowNumber_DK: number of times DHW flow rate was detected */
  @ext(0xc2, 0)
  model PumpHwcFlowNumber is ReadonlyRegister<UCH>;

  /** PrEnergySumDHW1_DK: Predictive Maintenance data */
  @ext(0xc5, 0)
  model PrEnergySumHwc1 is InstallRegister<ULG>;

  /** PrEnergyCountDHW1_DK: Predictive Maintenance data */
  @ext(0xc6, 0)
  model PrEnergyCountHwc1 is InstallRegister<ULG>;

  /** PrEnergySumDHW2_DK: Predictive Maintenance data */
  @ext(0xc7, 0)
  model PrEnergySumHwc2 is InstallRegister<ULG>;

  /** PrEnergyCountDHW2_DK: Predictive Maintenance data */
  @ext(0xc8, 0)
  model PrEnergyCountHwc2 is InstallRegister<ULG>;

  /** PrEnergySumDHW3_DK: Predictive Maintenance data */
  @ext(0xc9, 0)
  model PrEnergySumHwc3 is InstallRegister<ULG>;

  /** PrEnergyCountDHW3_DK: Predictive Maintenance data */
  @ext(0xca, 0)
  model PrEnergyCountHwc3 is InstallRegister<ULG>;

  /** PrEnergySumCH1_DK: Predictive Maintenance data */
  @ext(0xf5, 0)
  model PrEnergySumHc1 is InstallRegister<ULG>;

  /** PrEnergyCountCH1_DK: Predictive Maintenance data */
  @ext(0xf6, 0)
  model PrEnergyCountHc1 is InstallRegister<ULG>;

  /** PrEnergySumCH2_DK: Predictive Maintenance data */
  @ext(0xf7, 0)
  model PrEnergySumHc2 is InstallRegister<ULG>;

  /** PrEnergyCountCH2_DK: Predictive Maintenance data */
  @ext(0xf8, 0)
  model PrEnergyCountHc2 is InstallRegister<ULG>;

  /** PrEnergySumCH3_DK: Predictive Maintenance data */
  @ext(0xf9, 0)
  model PrEnergySumHc3 is InstallRegister<ULG>;

  /** PrEnergyCountCH3_DK: Predictive Maintenance data */
  @ext(0xfa, 0)
  model PrEnergyCountHc3 is InstallRegister<ULG>;

  /** OverflowCounter_DK: Predictive Maintenance counter have got an overflow */
  @ext(0x1e, 0)
  model OverflowCounter is ReadonlyRegister<yesno>;

  /** Pred_FanPWM_DevThreshold_DK */
  @ext(0x35, 1)
  model PredFanPWMDevThreshold is ReadonlyRegister<UCH>;

  /** Pred_FanPWM_SwitchingPoint_DK */
  @ext(0x36, 1)
  model PredFanPWMSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_FanPWM_RefPWMcounter_DK */
  @ext(0x37, 1)
  model PredFanPWMRefPWMcounter is ReadonlyRegister<UCH>;

  /** Pred_FanPWM_RefPWMsum_DK */
  @ext(0x38, 1)
  model PredFanPWMRefPWMsum is ReadonlyRegister<UIN>;

  /** Pred_FanPWM_PredCounter_DK */
  @inherit(r)
  @ext(0x39, 1)
  model PredFanPWMPredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_Ignition_SwitchingPoint_DK */
  @ext(0x3c, 1)
  model PredIgnitionSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_Ignition_PredCounter_DK */
  @inherit(r)
  @ext(0x3d, 1)
  model PredIgnitionPredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_Combustion_DecrementTime_DK */
  @ext(0x3e, 1)
  model PredCombustionDecrementTime is ReadonlyRegister<UCH>;

  /** Pred_Combustion_SwitchingPoint_DK */
  @ext(0x3f, 1)
  model PredCombustionSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_Combustion_PredCounter_DK */
  @inherit(r)
  @ext(0x40, 1)
  model PredCombustionPredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_AirPressure_DevThreshold_DK */
  @ext(0x41, 1)
  model PredSourcePressureDevThreshold is ReadonlyRegister<UCH>;

  /** Pred_AirPressure_SwitchingPoint_DK */
  @ext(0x42, 1)
  model PredSourcePressureSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_AirPressure_PredCounter_DK */
  @inherit(r)
  @ext(0x43, 1)
  model PredSourcePressurePredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_Waterflow_DevThreshold_DK */
  @ext(0x44, 1)
  model PredWaterflowDevThreshold is ReadonlyRegister<UCH>;

  /** Pred_Waterflow_SwitchingPoint_DK */
  @ext(0x45, 1)
  model PredWaterflowSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_Waterpressure_MinPressure_DK */
  @ext(0x46, 1)
  model PredWaterpressureMinPressure is ReadonlyRegister<UIN>;

  /** Pred_Waterpressure_MaxPressure_DK */
  @ext(0x47, 1)
  model PredWaterpressureMaxPressure is ReadonlyRegister<UIN>;

  /** Pred_Waterpressure_SwitchingPoint_DK */
  @ext(0x48, 1)
  model PredWaterpressureSwitchingPoint is ReadonlyRegister<UIN>;

  enum Values_HcPumpMode {
    post_run: 0,
    permanent: 1,
    winter: 2,
    eco: 3,
  }

  enum Values_AccessoriesOne {
    circulationpump: 1,
    extheatingpump: 2,
    storagechargingpump: 3,
    fluegasflapextractorhood: 4,
    externalgasvalve: 5,
    externalerrormessage: 6,
    solarpump: 7,
    remotecontrol: 8,
  }

  enum Values_AccessoriesTwo {
    circulationpump: 1,
    extheatingpump: 2,
    storagechargingpump: 3,
    fluegasflapextractorhood: 4,
    externalgasvalve: 5,
    externalerrormessage: 6,
    solarpump: 7,
    remotecontrol: 8,
  }

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
