import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace bai._0010002315_inc {
  // ,BAI00,atmoCOMPACT,0010002315 174

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x9, 0xe)
  model wi {}

  /** WP_SecondStage_DK */
  @inherit(r)
  @ext(0xed, 0)
  model WPSecondStage {
    /** Second stage of the pump activated */
    @values(values_WPSecondStage)
    value: UCH;
  }
  // ##### dia level 1 #####

  /** d.00 heating partload */
  @inherit(r, wi)
  @ext(0x7, 0x4)
  model PartloadHcKW {
    /** Heating part load */
    value: power;
  }

  /** d.01 central heating overruntime */
  @inherit(r, wi)
  @ext(0xf7, 0x3)
  model WPPostrunTime {
    /** water pump overrun time for heating mode */
    value: minutes0;
  }

  /** d.02 Max blocking time CH */
  @inherit(r, wi)
  @ext(0x9, 0x4)
  model BlockTimeHcMax {
    /** max. burner anti cycling period at 20°C Flow temperature setpoint */
    value: minutes0;
  }

  /** d.03 Temp DHW */
  @inherit(r)
  @ext(0x16, 0)
  model HwcTemp {
    /** hot water flow temperature (combination boiler only) */
    value: tempsensor;
  }

  /** d.04 Temp storage / she */
  @inherit(r)
  @ext(0x17, 0)
  model StorageTemp {
    /** current temperature for warm start sensor (combinations boiler only) Current storage tank sensor (system boiler only) */
    value: tempsensor;
  }

  /** d.05 flow/return setpoint */
  @inherit(r)
  @ext(0x39, 0)
  model FlowTempDesired {
    /** Flow temperature target value or return target value when return regulation is set */
    value: temp;
  }

  /** d.06 DHW setpoint */
  @inherit(r)
  @ext(0xea, 0x3)
  model HwcTempDesired {
    /** Hot water temperature target value */
    value: temp;
  }

  /** d.07 Storage setpoint */
  @inherit(r)
  @ext(0x4, 0)
  model StorageTempDesired {
    /** Warm start temperature value (combination boiler plus only), Storage temperature target value (system boiler only) */
    value: temp;
  }

  /** d.08 Room thermostat 230 V */
  @inherit(r)
  @ext(0x2a, 0)
  model ACRoomthermostat {
    /** External controls heat demand (Clamp 3-4) */
    value: onoff;
  }

  /** d.09 ext flowsetpoint */
  @inherit(r)
  @ext(0x6e, 0x4)
  model ExtFlowTempDesiredMin {
    /** minimum out of Kl.7 and eBus flow setpoint */
    value: temp;
  }

  /** d.10 Central heating pump */
  @inherit(r)
  @ext(0x44, 0)
  model WP {
    /** internal heating pump */
    value: onoff;
  }

  /** d.11 external pump */
  @inherit(r)
  @ext(0x3f, 0)
  model extWP {
    /** External heating pump */
    value: onoff;
  }

  /** d.12 storage load pump */
  @inherit(r)
  @ext(0x9e, 0)
  model Storageloadpump {
    /** tank load pump demand */
    value: percent0;
  }

  /** d.13 Circulation pump */
  @inherit(r)
  @ext(0x7b, 0)
  model CirPump {
    /** Hot water circulation pump (via external module) */
    value: onoff;
  }

  /** d.23 operation mode */
  @inherit(r)
  @ext(0xf2, 0x3)
  model HeatingSwitch {
    /** Wintermode active */
    value: onoff;
  }

  /** d.25 DHW demand enabled */
  @inherit(r)
  @ext(0x47, 0x4)
  model StoragereleaseClock {
    /** hot water release (tank storage) via eBus Control */
    value: yesno;
  }

  /** d.30 Gasvalve */
  @inherit(r)
  @ext(0xbb, 0)
  model Gasvalve {
    /** Gasvalve activation signal */
    @values(values_Gasvalve)
    value: UCH;
  }

  /** d.35 Position TWV */
  @inherit(r)
  @ext(0x54, 0)
  model PositionValveSet {
    /** Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position */
    value: UCH;
  }

  /** d.40 TFT_DK */
  @inherit(r)
  @ext(0x18, 0)
  model FlowTemp {
    /** Flow temperature */
    value: tempsensor;
  }

  /** d.41 Temp heating return */
  @inherit(r)
  @ext(0x98, 0)
  model ReturnTemp {
    /** return temperature */
    value: tempmirrorsensor;
  }

  /** d.47 Temp outside */
  @inherit(r)
  @ext(0x76, 0)
  model OutdoorstempSensor {
    /** Outside temperature (uncorrected value) */
    value: tempsensor;
  }

  /** d.67 Remaining burner block time */
  @inherit(r)
  @ext(0x38, 0)
  model RemainingBoilerblocktime {
    /** Remaining burner anti cycling time */
    value: minutes0;
  }

  /** d.90 Digital control recognized */
  @inherit(r)
  @ext(0, 0x4)
  model EBusHeatcontrol {
    /** Digital regulator status */
    value: yesno;
  }

  /** d.91 Status DCF 77 */
  @inherit(r)
  @ext(0x69, 0)
  model dcfState {
    /** dcfStatus */
    value: dcfstate;
  }
  // ##### expert level #####

  /** external flowsetpoint */
  @inherit(r)
  @ext(0x25, 0)
  model externalFlowTempDesired {
    /** Flow target temperature from external regulator to terminal 7-8-9 */
    value: temp;
  }

  /** d.48 SD_TAI_DK */
  @inherit(r)
  @ext(0x33, 0)
  model AITemp {
    /** Exhaust sensor (inside the flue pipe) */
    value: tempmirrorsensor;
  }

  /** d.49 SD_TAA_DK */
  @inherit(r)
  @ext(0x32, 0)
  model AATemp {
    /** Exhaust sensor (outside the flue pipe) */
    value: tempmirrorsensor;
  }

  /** water pressure */
  @inherit(r)
  @ext(0x2, 0)
  model WaterPressure {
    /** water pressure */
    value: presssensor;
  }

  /** flame */
  @inherit(r)
  @ext(0x5, 0)
  model Flame {
    /** flame */
    @values(values_Flame)
    value: UCH;
  }

  /** SM_GV_Current_DK */
  @inherit(r)
  @ext(0x6, 0)
  model SMGVCurrent {
    /** current for the gasvalve */
    @unit("ADC")
    value: UIN;
  }

  /** Changes_DSN_DK */
  @inherit(r)
  @ext(0xc, 0)
  model ChangesDSN {
    /** Numbers adjusting (storing) the DSN */
    value: UCH;
  }

  /** SD_Gasvalve_uC_DK */
  @inherit(r)
  @ext(0xd, 0)
  model GasvalveUC {
    /** Activation signal of the gasvalve (activated via micrcontroller) */
    @values(values_GasvalveUC)
    value: UCH;
  }

  /** SD_VolatileLockout_DK */
  @inherit(r)
  @ext(0x10, 0)
  model VolatileLockout {
    /** TRUE: STB failures is volatileFALSE: STB failure is not volataile */
    @values(values_VolatileLockout)
    value: UCH;
  }

  /** Modulationsetpoint_DK */
  @inherit(r)
  @ext(0x2e, 0)
  model ModulationTempDesired {
    /** Modulation set point */
    @unit("%")
    @divisor(10)
    value: SIN;
  }

  /** SD_Flame_Sensing_ASIC_DK */
  @inherit(r)
  @ext(0x2f, 0)
  model FlameSensingASIC {
    /** ioni/adc value from the flame control circuit */
    value: UIN;
  }

  /** HZ_UnderHundred_SwiActi_DK */
  @inherit(r)
  @ext(0x30, 0)
  model HcUnderHundredStarts {
    /** Heat switch cycles under hundred */
    value: UCH;
  }

  /** BW_UnderHundred_SwiActi_DK */
  @inherit(r)
  @ext(0x31, 0)
  model HwcUnderHundredStarts {
    /** DHW switch cycles under hundred */
    value: UCH;
  }

  /** EbusSourceOn_DK */
  @inherit(r)
  @ext(0x34, 0)
  model EbusSourceOn {
    /** Activation signal of the eBus source */
    value: onoff;
  }

  /** Fluegasvalve_DK */
  @inherit(r)
  @ext(0x3c, 0)
  model Fluegasvalve {
    /** flue gasvalve activation signal */
    value: onoff;
  }

  /** External_Faultmessage_DK */
  @inherit(r)
  @ext(0x3e, 0)
  model ExternalFaultmessage {
    /** external fault message */
    value: onoff;
  }

  /** SD_Gasvalve_ASICFeedback_DK */
  @inherit(r)
  @ext(0x47, 0)
  model GasvalveASICFeedback {
    /** feedback gasvalve (from ASIC) */
    @values(values_GasvalveASICFeedback)
    value: UCH;
  }

  /** SD_Gasvalve_uCFeedback_DK */
  @inherit(r)
  @ext(0x48, 0)
  model GasvalveUCFeedback {
    /** feedback gasvalve (from Microcontroller) */
    @values(values_GasvalveUCFeedback)
    value: UCH;
  }

  /** SD_Ignitor_DK */
  @inherit(r)
  @ext(0x49, 0)
  model Ignitor {
    /** igniton activated */
    @values(values_Ignitor)
    value: UCH;
  }

  /** DHW_Types_DK */
  @inherit(r)
  @ext(0x4b, 0)
  model HwcTypes {
    /** DHW type of the appliance */
    value: UCH;
  }

  /** DHW impellor switch */
  @inherit(r)
  @ext(0x57, 0)
  model HwcImpellorSwitch {
    /** domestic hot water (tapping) demand */
    value: yesno;
  }

  /** WarmstartDemand */
  @inherit(r)
  @ext(0x3a, 0x4)
  model WarmstartDemand {
    /** aktivation of warmstart */
    value: yesno;
  }

  /** BoilerType_DK */
  @inherit(r)
  @ext(0x5e, 0)
  model BoilerType {
    /** Boiler typ of the bmu */
    value: UCH;
  }

  /** ParamToken_DK */
  @inherit(r)
  @ext(0x60, 0)
  model ParamToken {
    /** token for parameter managment */
    value: UCH;
  }

  /** ReturnTemperature_DK */
  @inherit(r)
  @ext(0x6b, 0)
  model expertlevel_ReturnTemp {
    /** external return sensor */
    value: tempsensor;
  }

  /** Floor heating contact */
  @inherit(r)
  @ext(0x70, 0)
  model FloorHeatingContact {
    /** Floor heating contact */
    value: onoff;
  }

  /** SD_Temperaturelimiter_DK */
  @inherit(r)
  @ext(0x77, 0)
  model Templimiter {
    /** feedback signal of the temperature limiter */
    @values(values_Templimiter)
    value: UCH;
  }

  /** EbusVoltage_DK */
  @inherit(r)
  @ext(0x7f, 0)
  model EbusVoltage {
    /** feedback signal of the eBus source */
    value: onoff;
  }

  /** FluegasvalveOpen_DK */
  @inherit(r)
  @ext(0x89, 0)
  model FluegasvalveOpen {
    /** feedback of the flue gas valve */
    value: onoff;
  }

  /** Testbyte_DK */
  @inherit(r)
  @ext(0x99, 0)
  model Testbyte {
    /** Testbyte (relevant for the Tester) */
    value: UCH;
  }

  /** DSN_DK */
  @inherit(r)
  @ext(0x9a, 0)
  model DSN {
    /** DSN: Device Specific number */
    value: UIN;
  }

  /** PowerValue */
  @inherit(r)
  @ext(0xaa, 0)
  model PowerValue {
    /** Power Values of the Boiler (min Power, max Power) */
    @maxLength(6)
    value: HEX;
  }

  /** Statenumber_DK */
  @inherit(r)
  @ext(0xab, 0)
  model Statenumber {
    /** status number */
    value: UCH;
  }

  /** WaterpressureBranchControlOff_DK */
  @inherit(r)
  @ext(0xaf, 0)
  model WaterpressureBranchControlOff {
    /** water pressure branch controll off */
    value: onoff;
  }

  /** DSN start */
  @inherit(r)
  @ext(0x31, 0x4)
  model DSNStart {
    /** DSN Start adress */
    value: UIN;
  }

  /** Partnumber_Box */
  @inherit(r)
  @ext(0xc0, 0)
  model PartnumberBox {
    /** part number of the eBox */
    @maxLength(5)
    value: HEX;
  }

  /** SD_STL_with_NTC */
  @inherit(r)
  @ext(0xd2, 0)
  model TemplimiterWithNTC {
    /** Safety temperature limit concept:1 = safety temp. Limit check with NTC0 = safety temp. Limit check with contact */
    @values(values_TemplimiterWithNTC)
    value: UCH;
  }

  /** SD_VolatileLockout_IFC_GV_DK */
  @inherit(r)
  @ext(0xd3, 0)
  model VolatileLockoutIFCGV {
    /** all IFC faults are volataile */
    @values(values_VolatileLockoutIFCGV)
    value: UCH;
  }

  /** VortexFlowSensor_DK */
  @inherit(r)
  @ext(0xd5, 0)
  model VortexFlowSensor {
    /** Predictive Maintenance data, CH water flow */
    value: UIN;
  }

  /** DisplayMode_DK */
  @inherit(r)
  @ext(0xda, 0)
  model DisplayMode {
    /** Display mode of the aplliance */
    value: UCH;
  }

  /** SD_Gasvalve3_uC_DK */
  @inherit(r)
  @ext(0xdb, 0)
  model Gasvalve3UC {
    /** Gasvalve activation signal (from Microcontroller) */
    @values(values_Gasvalve3UC)
    value: UCH;
  }

  /** InitialisationEEPROM */
  @inherit(r)
  @ext(0xdc, 0)
  model InitialisationEEPROM {
    /** Initialisation off all EEPROM values (done in the production) */
    value: yesno;
  }

  /** TimerInputCH_DK */
  @inherit(r)
  @ext(0xde, 0)
  model TimerInputHc {
    /** timer input (block heatdemand) */
    value: onoff;
  }

  /** ExternGasvalve_DK */
  @inherit(r)
  @ext(0xe4, 0)
  model ExternGasvalve {
    /** external gasvalve activated */
    value: onoff;
  }

  /** DCF_TimeDate_DK */
  @inherit(r)
  @ext(0xe5, 0)
  model DCFTimeDate {
    /** DCF Time / date stamp struct { uchar sec; uchar min; uchar std; uchar tag; uchar mon; uchar wtg; uchar jah; } Tdcf77_time; */
    @maxLength(8)
    value: HEX;
  }
  // ##### dia level 2 #####

  /** d.17 Return regulation */
  @inherit(r, wi)
  @ext(0xc, 0x4)
  model ReturnRegulation {
    /** heating flow/return regulation activation */
    value: onoff;
  }

  /** d.18 CH pump mode */
  @inherit(r, wi)
  @ext(0x49, 0x4)
  model HcPumpMode {
    /** Pump mode */
    @values(values_HcPumpMode)
    value: UCH;
  }

  /** d.19 Mode of 2 speed pump */
  @inherit(r, wi)
  @ext(0xb, 0x4)
  model SecondPumpMode {
    /** Operating mode of the two-stage heating pump0: burner mode = 2, pre/post-run = 1; 1: CH + post-run = 1, DHW = 2, 2: as 1 but rotation speed in CH is dependent of heating part load, (defaultsetting)3: always stage 2 */
    value: UCH;
  }

  /** d.20 Max value tanksetpoint */
  @inherit(r, wi)
  @ext(0x43, 0x4)
  model HwcTempMax {
    /** Adjustment of maximum tank setpoint range (maximum endposition of potmeter) */
    value: temp;
  }

  /** d.27 Option relais 1 */
  @inherit(r, wi)
  @ext(0x4b, 0x4)
  model AccessoriesOne {
    /** Accesory relay 1 function */
    @values(values_AccessoriesOne)
    value: UCH;
  }

  /** d.28 Option relais 2 */
  @inherit(r, wi)
  @ext(0x4c, 0x4)
  model AccessoriesTwo {
    /** Accesory relay 2 function */
    @values(values_AccessoriesTwo)
    value: UCH;
  }

  /** d.52 MinGVStepOffset */
  @inherit(r, wi)
  @ext(0x74, 0x4)
  model GVStepOffsetMin {
    /** Offset for minimum gas valve steps */
    value: UCH;
  }

  /** d.53 MaxGVStepOffset */
  @inherit(r, wi)
  @ext(0x75, 0x4)
  model GVStepOffsetMax {
    /** Offset for maximum gas valve steps */
    value: SCH;
  }

  /** d.56 ExhaustCurve */
  @inherit(r, wi)
  @ext(0x72, 0x4)
  model ExhaustCurve {
    value: UCH;
  }

  /** d.60 Number STL cut off */
  @inherit(r)
  @ext(0x20, 0)
  model DeactivationsTemplimiter {
    /** Number of safety temperature limiter cut offs */
    value: UCH;
  }

  /** d.61 Number ignition device cut off */
  @inherit(r)
  @ext(0x1f, 0)
  model DeactivationsIFC {
    /** number of lock outs (unsuccessfull ignitons in the last attempt, flame failure) */
    value: UCH;
  }

  /** d.64 average ignition time */
  @inherit(r)
  @ext(0x2d, 0)
  model averageIgnitiontime {
    /** average ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** d.65 Max ignition time */
  @inherit(r)
  @ext(0x2c, 0)
  model maxIgnitiontime {
    /** maximum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** d.68 ignition attempts 1 */
  @inherit(r)
  @ext(0x6e, 0)
  model CounterStartattempts1 {
    /** unsuccessfull ignitions in the first attempt */
    value: temp0;
  }

  /** d.69 ignition attempts 2 */
  @inherit(r)
  @ext(0x6f, 0)
  model CounterStartattempts2 {
    /** unsuccessfull ignitions in the second attempt */
    value: temp0;
  }

  /** d.70 diverter valve position */
  @inherit(r, wi)
  @ext(0x2a, 0x4)
  model ValveMode {
    /** Set diverter valve position 0=normal mode, 1=middle position (GB), 2=permanent CH position */
    value: UCH;
  }

  /** d.71 Max value flow temp */
  @inherit(r, wi)
  @ext(0xe, 0x4)
  model FlowsetHcMax {
    /** Adjustment of maximum central heating setpoint range (maximum endposition of potmeter) */
    value: temp;
  }

  /** d.78 Max value flow temp storage */
  @inherit(r, wi)
  @ext(0xf, 0x4)
  model FlowsetHwcMax {
    /** storage charging temperature limit (target flow temperature in storage mode) */
    value: temp;
  }

  /** d.80 operating hours CH */
  @inherit(r)
  @ext(0x28, 0)
  model HcHours {
    /** central heating operation hours */
    value: hoursum2;
  }

  /** d.81 Operating hours DHW */
  @inherit(r)
  @ext(0x22, 0)
  model HwcHours {
    /** water heating operation hours */
    value: hoursum2;
  }

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

  /** d.84 Hours till next service */
  @inherit(r, wi)
  @ext(0x20, 0x4)
  model HoursTillService {
    /** Maintenance indicator:Number of hours until the next maintenance */
    value: hoursum2;
  }

  /** d.85 AntiCondensValue */
  @inherit(r, wi)
  @ext(0x77, 0x4)
  model AntiCondensValue {
    /** increase of minimum power */
    value: power;
  }

  /** d.93 Device specific number */
  @inherit(r, wi)
  @ext(0x30, 0x4)
  model DSNOffset {
    /** DSN appliance variant setting */
    value: UCH;
  }

  /** d.96 Set factory settings */
  @inherit(r, wi)
  @ext(0x68, 0x4)
  model SetFactoryValues {
    /** set diagnostic values back to factory settings */
    value: yesno;
  }
  // ##### maintenance data #####

  /** TempGradientFailure_DK */
  @inherit(r)
  @ext(0x11, 0)
  model TempGradientFailure {
    /** Number of cut offs of the boilers cause of to high gradient (S.54) */
    value: temp0;
  }

  /** TempDiffBlock_DK */
  @inherit(r)
  @ext(0x12, 0)
  model TempDiffBlock {
    /** Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures */
    value: temp0;
  }

  /** TempDiffFailure_DK */
  @inherit(r)
  @ext(0x13, 0)
  model TempDiffFailure {
    /** Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures */
    value: temp0;
  }

  /** pump operation hours */
  @inherit(r)
  @ext(0x14, 0)
  model PumpHours {
    /** pump operation hours */
    value: hoursum2;
  }

  /** CH_PumpCommunt_DK */
  @inherit(r)
  @ext(0x15, 0)
  model HcPumpStarts {
    /** pump switchings */
    value: cntstarts2;
  }

  /** TWV_Communt_DK */
  @inherit(r)
  @ext(0x1a, 0)
  model ValveStarts {
    /** commutations of the three way valve */
    value: cntstarts2;
  }

  /** OverflowCounter_DK */
  @inherit(r)
  @ext(0x1e, 0)
  model OverflowCounter {
    /** Predictive Maintenance counter have got an overflow */
    value: yesno;
  }

  /** MaxTempDiffExtTFT_DK */
  @inherit(r)
  @ext(0x27, 0)
  model TempMaxDiffExtTFT {
    /** Predictive maintenance data */
    value: temp;
  }

  /** min_Ignitiontime_DK */
  @inherit(r)
  @ext(0x2b, 0)
  model minIgnitiontime {
    /** minimum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** Temp DHW max */
  @inherit(r)
  @ext(0x35, 0)
  model maintenancedata_HwcTempMax {
    /** maximum temperature measured by the domestic hot water outlet sensor */
    value: temp;
  }

  /** Temp storage max */
  @inherit(r)
  @ext(0x36, 0)
  model StorageTempMax {
    /** maximum temperature measured by the external tank sensor */
    value: temp;
  }

  /** TFT_max_DK */
  @inherit(r)
  @ext(0x37, 0)
  model FlowTempMax {
    /** maximum temperature measured by the flow sensor */
    value: temp;
  }

  /** MaxDeltaFlowReturn_DK */
  @inherit(r)
  @ext(0x3d, 0)
  model DeltaFlowReturnMax {
    /** Predictive maintenance data */
    value: temp;
  }

  /** TankLoadPumpOperationHours_DK */
  @inherit(r)
  @ext(0x4c, 0)
  model StorageLoadPumpHours {
    /** Preditive maintenance data */
    value: hoursum2;
  }

  /** TankloadPumpCommunt_DK */
  @inherit(r)
  @ext(0x4f, 0)
  model StorageloadPumpStarts {
    /** Preditive maintenance data */
    value: cntstarts2;
  }

  /** CounterStartAttempts3_DK */
  @inherit(r)
  @ext(0x81, 0)
  model CounterStartAttempts3 {
    /** unsuccessfull ignitions in the third attempt */
    value: temp0;
  }

  /** CounterStartAttempts4_DK */
  @inherit(r)
  @ext(0x82, 0)
  model CounterStartAttempts4 {
    /** unsuccessfull ignitions in the fourth attempt */
    value: temp0;
  }

  /** TRT_max_DK */
  @inherit(r)
  @ext(0xbe, 0)
  model ReturnTempMax {
    /** Max_Return_Temperature */
    value: temp;
  }

  /** PumpDHWFlowSum_DK */
  @inherit(r)
  @ext(0xc1, 0)
  model PumpHwcFlowSum {
    /** summed up DHW flow rate */
    value: UIN;
  }

  /** PumpDHWFlowNumber_DK */
  @inherit(r)
  @ext(0xc2, 0)
  model PumpHwcFlowNumber {
    /** number of times DHW flow rate was detected */
    value: UCH;
  }

  /** SHE_MaxFlowTemp_DK */
  @inherit(r)
  @ext(0xc3, 0)
  model SHEMaxFlowTemp {
    /** maximum flow temperature DHW */
    value: temp;
  }

  /** SHE_MaxDeltaFlowDHW_DK */
  @inherit(r)
  @ext(0xc4, 0)
  model SHEMaxDeltaHwcFlow {
    /** maximum difference between flow and DHW outlet temperature */
    value: temp;
  }

  /** PrEnergyCountDHW2_DK */
  @inherit(r)
  @ext(0xc8, 0)
  model PrEnergyCountHwc2 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergySumDHW3_DK */
  @inherit(r)
  @ext(0xc9, 0)
  model PrEnergySumHwc3 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergyCountDHW3_DK */
  @inherit(r)
  @ext(0xca, 0)
  model PrEnergyCountHwc3 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** MaxWaterFlowCH_DK */
  @inherit(r)
  @ext(0xd0, 0)
  model WaterHcFlowMax {
    /** Predictive maintenance data */
    value: UIN;
  }

  /** WaterpressureVariantSum_DK */
  @inherit(r)
  @ext(0xf0, 0)
  model WaterpressureVariantSum {
    /** Predictive maintenance data */
    value: pressm2;
  }

  /** WaterpressureMeasureCounter_DK */
  @inherit(r)
  @ext(0xf1, 0)
  model WaterpressureMeasureCounter {
    /** Predictive maintenance data */
    value: UCH;
  }

  /** PrAPSCounter_DK */
  @inherit(r)
  @ext(0xf2, 0)
  model PrAPSCounter {
    /** Predictive maintenance data */
    value: UCH;
  }

  /** PrAPSSum_DK */
  @inherit(r)
  @ext(0xf3, 0)
  model PrAPSSum {
    /** Predictive maintenance data */
    value: seconds2;
  }

  /** PrVortexFlowSensorValue_DK */
  @inherit(r)
  @ext(0xf4, 0)
  model PrVortexFlowSensorValue {
    /** Predictive maintenance data */
    @unit("ADC")
    value: SIN;
  }

  /** PrEnergySumCH1_DK */
  @inherit(r)
  @ext(0xf5, 0)
  model PrEnergySumHc1 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH1_DK */
  @inherit(r)
  @ext(0xf6, 0)
  model PrEnergyCountHc1 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergySumCH2_DK */
  @inherit(r)
  @ext(0xf7, 0)
  model PrEnergySumHc2 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH2_DK */
  @inherit(r)
  @ext(0xf8, 0)
  model PrEnergyCountHc2 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergySumCH3_DK */
  @inherit(r)
  @ext(0xf9, 0)
  model PrEnergySumHc3 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH3_DK */
  @inherit(r)
  @ext(0xfa, 0)
  model PrEnergyCountHc3 {
    /** Predictive maintenance data */
    value: ULG;
  }

  enum values_WPSecondStage {
    off: 240,
    on: 15,
  }

  enum values_Gasvalve {
    off: 240,
    on: 15,
  }

  enum values_Flame {
    off: 240,
    on: 15,
  }

  enum values_GasvalveUC {
    off: 240,
    on: 15,
  }

  enum values_VolatileLockout {
    no: 240,
    yes: 15,
  }

  enum values_GasvalveASICFeedback {
    off: 240,
    on: 15,
  }

  enum values_GasvalveUCFeedback {
    off: 240,
    on: 15,
  }

  enum values_Ignitor {
    off: 240,
    on: 15,
  }

  enum values_Templimiter {
    off: 240,
    on: 15,
  }

  enum values_TemplimiterWithNTC {
    no: 240,
    yes: 15,
  }

  enum values_VolatileLockoutIFCGV {
    no: 240,
    yes: 15,
  }

  enum values_Gasvalve3UC {
    off: 240,
    on: 15,
  }

  enum values_HcPumpMode {
    post_run: 0,
    permanent: 1,
    winter: 2,
  }

  enum values_AccessoriesOne {
    circulationpump: 1,
    extheatingpump: 2,
    storagechargingpump: 3,
    fluegasflapextractorhood: 4,
    externalgasvalve: 5,
    externalerrormessage: 6,
    solarpump: 7,
    remotecontrol: 8,
  }

  enum values_AccessoriesTwo {
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
    errors_inc,
  }
}
