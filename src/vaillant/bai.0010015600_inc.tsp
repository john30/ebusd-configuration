import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010015600_inc {
  // ,BAI00,ecoCompact (euro),0010015600 296

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w for user level "NOT_YET_CONFIRMED" */
  @write
  @auth("NOT_YET_CONFIRMED")
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *wi for user level "install_NOT_YET_CONFIRMED" */
  @write
  @auth("install_NOT_YET_CONFIRMED")
  @base(MF, 0x9, 0xe)
  model wi {}

  /** default *ws for user level "service_NOT_YET_CONFIRMED" */
  @write
  @auth("service_NOT_YET_CONFIRMED")
  @base(MF, 0x9, 0xe)
  model ws {}
  // ##### Diagnose Ebene 1 #####

  /** d.00 heating partload */
  @inherit(r, wi)
  @ext(0x6c, 0)
  model PartloadHcKW {
    /** Heating part load */
    value: power;
  }

  /** d.01 central heating overruntime */
  @inherit(r, wi)
  @ext(0x64, 0)
  model WPPostrunTime {
    /** water pump overrun time for heating mode */
    value: minutes0;
  }

  /** d.02 Max blocking time CH */
  @inherit(r, wi)
  @ext(0x21, 0)
  model BlockTimeHcMax {
    /** Maximum burner anti cycling period at 20°C flow temperature set point */
    value: minutes0;
  }

  /** d.03 Temp DHW */
  @inherit(r)
  @ext(0x16, 0)
  model HwcTemp {
    /** Hot water flow temperature */
    value: tempsensor;
  }

  /** d.04 Storage temperature */
  @inherit(r)
  @ext(0x17, 0)
  model StorageTemp {
    /** Current temperature for warm start sensor (combi boiler) / Current storage tank sensor (system boiler only) */
    value: tempsensor;
  }

  /** d.05 flow/return setpoint */
  @inherit(r)
  @ext(0x39, 0)
  model FlowTempDesired {
    /** Flow temperature target value or return target value when return regulation is set */
    value: temp;
  }

  /** d.07 Storage temperature set point */
  @inherit(r)
  @ext(0x4, 0)
  model StorageTempDesired {
    /** Warm start temperature value (combi boiler only); Storage temperature target value (system boiler only) */
    value: temp;
  }

  /** d.09 ext flowsetpoint */
  @inherit(r)
  @ext(0xf3, 0x4)
  model ExtFlowTempDesiredMin {
    /** minimum out of Kl.7 and eBus flow setpoint */
    value: temp;
  }

  /** d.10 Central heating pump */
  @inherit(r)
  @ext(0x44, 0)
  model WP {
    /** Internal central heating pump */
    value: onoff;
  }

  /** d.11 External heating pump */
  @inherit(r)
  @ext(0x3f, 0)
  model ExtWP {
    /** External central heating pump */
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

  /** d.14 Desired heating pump power */
  @inherit(r, wi)
  @ext(0xa1, 0)
  model PumpPowerDesired {
    /** PWM-Desired central heating pump power */
    @unit("%")
    @values(Values_PumpPowerDesired)
    value: UCH;
  }

  /** d.15 Current heating pump power */
  @inherit(r)
  @ext(0x73, 0)
  model PumpPower {
    /** Current central heating pump power */
    value: UCH;
  }

  /** d.16 room thermostat 24 V */
  @inherit(r)
  @ext(0xe, 0)
  model DCRoomthermostat {
    /** xternal controls heat demand (Clamp 3-4) */
    value: onoff;
  }

  /** d.22 DHW demand */
  @inherit(r)
  @ext(0x58, 0)
  model HwcDemand {
    /** Domestic hot water demand */
    value: yesno;
  }

  /** d.23 Heating on/off switch */
  @inherit(r, wi)
  @ext(0xf2, 0x3)
  model HeatingSwitch {
    /** Central heating on/off switch */
    value: onoff;
  }
  // r,StoragereleaseClock,d.25 DHW demand enabled,4704,yesno,hot water release (tank storage) via eBus Control

  /** d.29 Primary circuit flow rate */
  @inherit(r)
  @ext(0xfb, 0)
  model PrimaryCircuitFlowrate {
    /** primary circuit water flow rate */
    @unit("l/min")
    value: uin100;
  }

  /** d.33 Target fan speed */
  @inherit(r)
  @ext(0x24, 0)
  model TargetFanSpeed {
    /** Fan speed setpoint */
    @unit("1/min")
    value: UIN;
  }

  /** d.34 Current fan speed */
  @inherit(r)
  @ext(0x83, 0)
  model FanSpeed {
    /** Current fan speed */
    @unit("1/min")
    value: UIN;
  }

  /** d.35 Position TWV */
  @inherit(r)
  @ext(0x54, 0)
  model PositionValveSet {
    /** Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position */
    value: UCH;
  }

  /** d.40 Supply temperature */
  @inherit(r)
  @ext(0x18, 0)
  model FlowTemp {
    /** CH supply temperature sensor (VF2) */
    value: tempsensor;
  }

  /** d.41 Return temperature */
  @inherit(r)
  @ext(0x98, 0)
  model ReturnTemp {
    /** CH return temperature sensor */
    value: tempmirrorsensor;
  }

  /** d.44 Ionisation voltage */
  @inherit(r)
  @ext(0xa4, 0)
  model IonisationVoltageLevel {
    /** digital ionisation voltage> 80 no flame< 40 good flame */
    @divisor(10)
    value: SIN;
  }

  /** d.47 Outdoor temperature */
  @inherit(r)
  @ext(0x76, 0)
  model OutdoorstempSensor {
    /** Outdoor temperature sensor (uncorrected value) value and status */
    value: tempsensor;
  }

  /** d.67 Remaining burner block time */
  @inherit(r)
  @ext(0x38, 0)
  model RemainingBoilerblocktime {
    /** Remaining burner anti cycling time */
    value: minutes0;
  }
  // r,EBusHeatcontrol,d.90 Digitaler Regler,0004,yesno,Gibt an ob ein digitaler Regler erkannt wurde

  /** d.91 DCF Status */
  @inherit(r)
  @ext(0x69, 0)
  model DcfState {
    /** dcfStatus */
    value: dcfstate;
  }
  // ##### Expertenebene #####

  /** External HWC tank */
  @inherit(r)
  @ext(0, 0)
  model ExternalHwcSwitch {
    /** Demand external HWC tank (via contact) */
    value: onoff;
  }

  /** water pressure */
  @inherit(r)
  @ext(0x2, 0)
  model WaterPressure {
    /** CH water pressure */
    value: presssensor;
  }

  /** flame */
  @inherit(r)
  @ext(0x5, 0)
  model Flame {
    /** flame */
    @values(Values_Flame)
    value: UCH;
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
    @values(Values_GasvalveUC)
    value: UCH;
  }

  /** SD_VolatileLockout_DK */
  @inherit(r)
  @ext(0x10, 0)
  model VolatileLockout {
    /** TRUE: STB errors are locking */
    @values(Values_VolatileLockout)
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

  /** SD_Flame_Sensing_ASIC */
  @inherit(r)
  @ext(0x2f, 0)
  model FlameSensingASIC {
    /** ioni/adc value from the flame control circuit */
    value: UIN;
  }

  /** HZ_UnderHundred_SwiActi */
  @inherit(r)
  @ext(0x30, 0)
  model HcUnderHundredStarts {
    /** Heat switch cycles under hundred */
    value: UCH;
  }

  /** BW_UnderHundred_SwiActi */
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

  /** FluegasvalveOpen_DK */
  @inherit(r)
  @ext(0x3c, 0)
  model Fluegasvalve {
    /** Feedback from the flue gas valve */
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
    /** Gas valve feedback (from ASIC) */
    @values(Values_GasvalveASICFeedback)
    value: UCH;
  }

  /** SD_Gasvalve_uCFeedback_DK */
  @inherit(r)
  @ext(0x48, 0)
  model GasvalveUCFeedback {
    /** Gas valve feedback (from micro controller) */
    @values(Values_GasvalveUCFeedback)
    value: UCH;
  }

  /** SD_Ignitor_DK */
  @inherit(r)
  @ext(0x49, 0)
  model Ignitor {
    /** Ignition status */
    @values(Values_Ignitor)
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
    /** DHW demand from impeller switch */
    value: yesno;
  }

  /** WarmstartDemand */
  @inherit(r)
  @ext(0x3a, 0x4)
  model WarmstartDemand {
    /** Status of warmstarr mode */
    value: yesno;
  }

  /** BoilerType */
  @inherit(r)
  @ext(0x5e, 0)
  model BoilerType {
    /** Boiler typ of the bmu */
    value: UCH;
  }

  /** ParamToken */
  @inherit(r)
  @ext(0x60, 0)
  model ParamToken {
    /** token for parameter managment */
    value: UCH;
  }

  /** Ext. return temperature */
  @inherit(r)
  @ext(0x6b, 0)
  model ReturnTempExternal {
    /** External return temperature sensor */
    value: tempsensor;
  }

  /** Floor heating contact */
  @inherit(r)
  @ext(0x70, 0)
  model FloorHeatingContact {
    /** Floor heating contact */
    value: onoff;
  }

  /** Temperature limiter sensor */
  @inherit(r)
  @ext(0x77, 0)
  model Templimiter {
    /** Feedback of the temperature limiter sensor */
    @values(Values_Templimiter)
    value: UCH;
  }

  /** eBUS voltage */
  @inherit(r)
  @ext(0x7f, 0)
  model EbusVoltage {
    /** eBUS voltage feedback */
    value: onoff;
  }

  /** Flue flap open */
  @inherit(r)
  @ext(0x89, 0)
  model FluegasvalveOpen {
    /** Exhaust (flue) flap open */
    value: onoff;
  }

  /** Testbyte */
  @inherit(r)
  @ext(0x99, 0)
  model Testbyte {
    /** Testbyte (relevant for testers) */
    value: UCH;
  }

  /** DSN */
  @inherit(r)
  @ext(0x9a, 0)
  model DSN {
    /** DSN: Device Specific number */
    value: UIN;
  }

  /** Target fan speed */
  @inherit(r)
  @ext(0x9f, 0)
  model TargetFanSpeedOutput {
    /** Target fan speed */
    @unit("1/min")
    value: UIN;
  }

  /** Power number */
  @inherit(r)
  @ext(0xaa, 0)
  model PowerValue {
    /** Power value of the boiler (minimum and maximum) */
    @maxLength(6)
    value: HEX;
  }

  /** Statenumber */
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
    /** Water pressure branch control switch */
    value: onoff;
  }

  /** DSN starting address */
  @inherit(r)
  @ext(0x31, 0x4)
  model DSNStart {
    /** DSN starting address */
    value: UIN;
  }

  /** VR65 memory module */
  @inherit(r)
  @ext(0xbf, 0)
  model ExtStorageModulCon {
    /** External memory module (VR65) connected */
    value: yesno;
  }

  /** Partnumber_Box */
  @inherit(r)
  @ext(0xc0, 0)
  model PartnumberBox {
    /** part number of the eBox */
    @maxLength(5)
    value: HEX;
  }

  /** WP_SecondStage */
  @inherit(r)
  @ext(0xed, 0)
  model WPSecondStage {
    /** Second stage of the pump activated */
    value: onoff;
  }

  /** SD_STL_with_NTC */
  @inherit(r)
  @ext(0xd2, 0)
  model TemplimiterWithNTC {
    /** Temperature limiter (1 = NTC; 0 = switching contact) */
    @values(Values_TemplimiterWithNTC)
    value: UCH;
  }

  /** SD_VolatileLockout_IFC_GV */
  @inherit(r)
  @ext(0xd3, 0)
  model VolatileLockoutIFCGV {
    /** All IFC errors are non-volatile */
    @values(Values_VolatileLockoutIFCGV)
    value: UCH;
  }

  /** DisplayMode */
  @inherit(r)
  @ext(0xda, 0)
  model DisplayMode {
    /** Display mode of the appliance */
    value: UCH;
  }

  /** Gasventil 3 */
  @inherit(r)
  @ext(0xdb, 0)
  model Gasvalve3UC {
    /** Gas valve switching signal (from the processor) */
    @values(Values_Gasvalve3UC)
    value: UCH;
  }

  /** InitialisationEEPROM */
  @inherit(r)
  @ext(0xdc, 0)
  model InitialisationEEPROM {
    /** EEPROM initialization (for production) */
    value: yesno;
  }

  /** Eingang Schaltuhr */
  @inherit(r)
  @ext(0xde, 0)
  model TimerInputHc {
    /** timer input (block heatdemand) */
    value: onoff;
  }

  /** Minimum fan speed */
  @inherit(r)
  @ext(0xdf, 0)
  model FanMinSpeedOperation {
    /** Fan minimum speed */
    @unit("1/min")
    value: UIN;
  }

  /** Maximum fan speed */
  @inherit(r)
  @ext(0xe0, 0)
  model FanMaxSpeedOperation {
    /** Fan maximum speed */
    @unit("1/min")
    value: UIN;
  }

  /** External gas valve */
  @inherit(r)
  @ext(0xe4, 0)
  model ExternGasvalve {
    /** External solenoid valve */
    value: onoff;
  }

  /** DCF date/time */
  @inherit(r)
  @ext(0xe5, 0)
  model DCFTimeDate {
    /** DCF Time / date stamp struct { uchar sec; uchar min; uchar std; uchar tag; uchar mon; uchar wtg; uchar jah; } Tdcf77_time; */
    vti: VTI;

    hda: HDA;
  }

  /** DHW_Switch */
  @inherit(r, wi)
  @ext(0xf3, 0x3)
  model HwcSwitch {
    /** Domestic hot water switch */
    value: onoff;
  }

  /** ProductionByte */
  @inherit(r)
  @ext(0x3e, 0x4)
  model ProductionByte {
    value: UCH;
  }

  /** SerialNumber */
  @inherit(r)
  @ext(0x3f, 0x4)
  model SerialNumber {
    /** Serial number AI */
    @maxLength(8)
    value: HEX;
  }
  // ##### Diagnose Ebene 2 #####

  /** d.17 Return control */
  @inherit(r, wi)
  @ext(0xb3, 0)
  model ReturnRegulation {
    /** Activation of the return control */
    value: onoff;
  }

  /** d.18 CH pump mode */
  @inherit(r, wi)
  @ext(0xb7, 0)
  model HcPumpMode {
    /** Pump mode for central heating */
    @values(Values_HcPumpMode)
    value: UCH;
  }

  /** d.20 Maximum DHW temperature */
  @inherit(r, wi)
  @ext(0xd9, 0)
  model HwcTempMax {
    /** Max. Speichersollwert. Limits the maximum adjustment range of the potentiometer (right stop). */
    value: temp;
  }

  /** d.26 Optional relay */
  @inherit(r, wi)
  @ext(0xb8, 0)
  model OptionalRelais {
    /** Function of optional relay */
    @values(Values_OptionalRelais)
    value: UCH;
  }

  /** d.27 Accessory relay 1 */
  @inherit(r, wi)
  @ext(0xb9, 0)
  model AccessoriesOne {
    /** Function of accessory relay 1 */
    @values(Values_AccessoriesOne)
    value: UCH;
  }

  /** d.28 Accessory relay 2 */
  @inherit(r, wi)
  @ext(0xba, 0)
  model AccessoriesTwo {
    /** Function of accessory relay 2 */
    @values(Values_AccessoriesTwo)
    value: UCH;
  }

  /** d.50 Minimum fan speed offset */
  @inherit(r, wi)
  @ext(0xa7, 0)
  model FanSpeedOffsetMin {
    /** Fan minimum speed offset */
    @unit("1/min")
    value: SIN;
  }

  /** d.51 Maximum fan speed offset */
  @inherit(r, wi)
  @ext(0xa8, 0)
  model FanSpeedOffsetMax {
    /** Fan maximum speed offset */
    @unit("1/min")
    value: SIN;
  }

  /** d.60 Shutdowns by the temp limiter */
  @inherit(r)
  @ext(0x20, 0)
  model DeactivationsTemplimiter {
    /** Number of shutdowns by the safety temperature limiter */
    value: UCH;
  }

  /** d.61 Ignition failures */
  @inherit(r)
  @ext(0x1f, 0)
  model DeactivationsIFC {
    /** Number of ignition failures (unsuccessful last-run or faulty flame signal) */
    value: UCH;
  }

  /** d.64 average ignition time */
  @inherit(r)
  @ext(0x2d, 0)
  model AverageIgnitiontime {
    /** average ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** d.65 Maximum ignition time */
  @inherit(r)
  @ext(0x2c, 0)
  model MaxIgnitiontime {
    /** maximum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** d.68 Failed ignition (1nd attempt) */
  @inherit(r)
  @ext(0x6e, 0)
  model CounterStartattempts1 {
    /** Number of unsuccessful ignition attempts (in the first attempt) */
    value: temp0;
  }

  /** d.69 Failed ignition (2nd attempt) */
  @inherit(r)
  @ext(0x6f, 0)
  model CounterStartattempts2 {
    /** Number of unsuccessful ignition attempts (in the second attempt) */
    value: temp0;
  }

  /** d.71 CH max flow temperature */
  @inherit(r, wi)
  @ext(0xe, 0x4)
  model FlowsetHcMax {
    /** Setting the maximum flow setpoint in heating mode (with left-hand stop of the potentiometer) */
    value: temp;
  }

  /** d.75 Maximum storage time */
  @inherit(r, wi)
  @ext(0x66, 0)
  model StorageLoadTimeMax {
    /** Maximum water storing time for storage without own controls */
    value: minutes0;
  }

  /** d.78 Max value flow temp storage */
  @inherit(r, wi)
  @ext(0xa6, 0)
  model FlowsetHwcMax {
    /** storage charging temperature limit (target flow temperature in storage mode) */
    value: temp;
  }

  /** d.80 Hz. Hours in CH mode */
  @inherit(r)
  @ext(0x28, 0)
  model HcHours {
    /** Hours of operation in heating mode */
    value: hoursum2;
  }

  /** d.81 Hours in DHW mode */
  @inherit(r)
  @ext(0x22, 0)
  model HwcHours {
    /** Hours of DHW operation */
    value: hoursum2;
  }

  /** d.82 CH mode starts */
  @inherit(r)
  @ext(0x29, 0)
  model HcStarts {
    /** Number of CH mode starts */
    @factor(100)
    value: UIN;
  }

  /** d.83 DHW mode starts */
  @inherit(r)
  @ext(0x23, 0)
  model HwcStarts {
    /** Number of DHW mode starts */
    @factor(100)
    value: UIN;
  }

  /** d.84 Hours till service */
  @inherit(r, wi)
  @ext(0xac, 0)
  model HoursTillService {
    /** Hours left before service is needed */
    value: hoursum2;
  }

  /** d.85 Minimal power to avoid condensation */
  @inherit(r, wi)
  @ext(0xec, 0)
  model AntiCondensValue {
    /** Minimal power to avoid condensation */
    value: power;
  }

  /** d.93 Hardware ID */
  @inherit(r, ws)
  @ext(0x30, 0x4)
  model DSNOffset {
    /** Hardware ID (DSN) */
    value: UCH;
  }
  // r;wi,ClearErrorHistory,d.94 Delete error history,0000,yesno,Delete error history
  // r,SoftwareVersion,d.95 Software Version,0000,HEX:8,Software Version

  /** d.96 Reset to defaults */
  @inherit(r, wi)
  @ext(0x68, 0x4)
  model SetFactoryValues {
    /** Reset to factory defaults */
    value: yesno;
  }

  /** d.98 SD_CodingResistor */
  @inherit(r)
  @ext(0x92, 0)
  model CodingResistor {
    /** Therme identification resistance */
    @maxLength(3)
    value: HEX;
  }
  // r;wi,ELGA,d.121 ELGA Teillastanfettung,0000,UCH,0=normal;1=angefettet;2=abgemagert,ELGA Teillastanfettung
  // r;wi,PressureLevel,d.122 Druckniveau,0000,mbar,Druckniveau
  // r,LastStorageDuration,d.123 Dauer der letzen Speicherladung,0000,minutes0,Dauer der letzen Speicherladung
  // r;w,Eco-Modus,d.124 Eco-Modus Speicherladung,0000,onoff,Eco-Modus Speicherladung

  /** d.125 Storage output temperature */
  @inherit(r)
  @ext(0x50, 0)
  model StorageExitTemp {
    /** Current storage output temperature */
    value: tempsensor;
  }

  /** d.126 Storage charge delay */
  @inherit(r)
  @ext(0x9, 0)
  model StorageDelay {
    /** Delay of the storage charge */
    value: minutes0;
  }
  // r;wi,StateAnodeConnection,d.127 Status Fremdstromanode,0000,UCH,0=offen;1=angeschlossen,Status Fremdstromanodeanschluß
  // ##### Wartungsdaten #####

  /** Temperature gradient failures */
  @inherit(r)
  @ext(0x11, 0)
  model TempGradientFailure {
    /** Number of boiler shutdown due to high gradient (S.54) */
    value: temp0;
  }

  /** TempDiffBlock */
  @inherit(r)
  @ext(0x12, 0)
  model TempDiffBlock {
    /** Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures */
    value: temp0;
  }

  /** TempDiffFailure */
  @inherit(r)
  @ext(0x13, 0)
  model TempDiffFailure {
    /** Number of shutdowns due to incorrect difference between supply and return temperatures */
    value: temp0;
  }

  /** Betriebsstunden Pumpe */
  @inherit(r)
  @ext(0x14, 0)
  model PumpHours {
    /** Pump operating hours */
    value: hoursum2;
  }

  /** CH_PumpCommunt */
  @inherit(r)
  @ext(0x15, 0)
  model HcPumpStarts {
    /** Pump times switched on */
    value: cntstarts2;
  }

  /** 3WV Schaltspiele */
  @inherit(r)
  @ext(0x1a, 0)
  model ValveStarts {
    /** Number of times 3WV value operated */
    value: cntstarts2;
  }

  /** Fan operating hours */
  @inherit(r)
  @ext(0x1b, 0)
  model FanHours {
    /** Operating hours of the fan */
    value: hoursum2;
  }

  /** Fan number of starts */
  @inherit(r)
  @ext(0x1c, 0)
  model FanStarts {
    /** Number of times fan switched on */
    value: cntstarts2;
  }

  /** Overflow PM counter */
  @inherit(r)
  @ext(0x1e, 0)
  model OverflowCounter {
    /** Predictive Maintenance counter have got an overflow */
    value: yesno;
  }

  /** MaxTempDiffExtTFT */
  @inherit(r)
  @ext(0x27, 0)
  model TempMaxDiffExtTFT {
    /** Predictive maintenance data */
    value: temp;
  }

  /** minimum ignition time */
  @inherit(r)
  @ext(0x2b, 0)
  model MinIgnitiontime {
    /** minimum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** Maximum DHW temperature */
  @inherit(r)
  @ext(0x35, 0)
  model Maintenancedata_HwcTempMax {
    /** Maximum temperature measured at the tap water outlet sensor */
    value: temp;
  }

  /** Maximum storage temperature */
  @inherit(r)
  @ext(0x36, 0)
  model StorageTempMax {
    /** Maximum storage tank temperature */
    value: temp;
  }

  /** Maximum CH temperature */
  @inherit(r)
  @ext(0x37, 0)
  model FlowTempMax {
    /** Maximum CH flow temperature */
    value: temp;
  }

  /** Fan_PWM_Sum */
  @inherit(r)
  @ext(0x3a, 0)
  model FanPWMSum {
    /** Predictive Maintenance data for the fan damage recognition */
    value: UIN;
  }

  /** Fan_PWM_Test */
  @inherit(r)
  @ext(0x3b, 0)
  model FanPWMTest {
    /** Predictive Maintenance data for the fan damage recognition */
    value: UCH;
  }

  /** MaxDeltaFlowReturn */
  @inherit(r)
  @ext(0x3d, 0)
  model DeltaFlowReturnMax {
    /** Maintenance data */
    value: temp;
  }

  /** TankLoadPumpOperationHours */
  @inherit(r)
  @ext(0x4c, 0)
  model StorageLoadPumpHours {
    /** Preditive maintenance data */
    value: hoursum2;
  }

  /** TankloadPumpCommunt */
  @inherit(r)
  @ext(0x4f, 0)
  model StorageloadPumpStarts {
    /** Preditive maintenance data */
    value: cntstarts2;
  }

  /** Max. WW Vorlauftemp. */
  @inherit(r)
  @ext(0x56, 0)
  model HwcWaterflowMax {
    /** Maximalwert des Warmwassersensors */
    value: uin100;
  }

  /** Failed ignition (3rd attempt) */
  @inherit(r)
  @ext(0x81, 0)
  model CounterStartAttempts3 {
    /** Number of unsuccessful ignition attempts (in the 3rd attempt) */
    value: temp0;
  }

  /** Failed ignition (4th attempt) */
  @inherit(r)
  @ext(0x82, 0)
  model CounterStartAttempts4 {
    /** Number of unsuccessful ignition attempts (in the 4th attempt) */
    value: temp0;
  }

  /** Max flow return temperature */
  @inherit(r)
  @ext(0xbe, 0)
  model ReturnTempMax {
    /** Max flow return temperature */
    value: temp;
  }

  /** PumpDHWFlowSum */
  @inherit(r)
  @ext(0xc1, 0)
  model PumpHwcFlowSum {
    /** summed up DHW flow rate */
    value: UIN;
  }

  /** PumpDHWFlowNumber */
  @inherit(r)
  @ext(0xc2, 0)
  model PumpHwcFlowNumber {
    /** number of times DHW flow rate was detected */
    value: UCH;
  }

  /** Max. WW Vorlauftemp. */
  @inherit(r)
  @ext(0xc3, 0)
  model SHEMaxFlowTemp {
    /** Maximum flow temperature for WW */
    value: temp;
  }

  /** SHE_MaxDeltaFlowDHW */
  @inherit(r)
  @ext(0xc4, 0)
  model SHEMaxDeltaHwcFlow {
    /** maximum difference between flow and DHW outlet temperature */
    value: temp;
  }

  /** PrEnergySumDHW1 */
  @inherit(r)
  @ext(0xc5, 0)
  model PrEnergySumHwc1 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountDHW1 */
  @inherit(r)
  @ext(0xc6, 0)
  model PrEnergyCountHwc1 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergySumDHW2 */
  @inherit(r)
  @ext(0xc7, 0)
  model PrEnergySumHwc2 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountDHW2 */
  @inherit(r)
  @ext(0xc8, 0)
  model PrEnergyCountHwc2 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergySumDHW3 */
  @inherit(r)
  @ext(0xc9, 0)
  model PrEnergySumHwc3 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountDHW3 */
  @inherit(r)
  @ext(0xca, 0)
  model PrEnergyCountHwc3 {
    /** Maintenance data */
    value: ULG;
  }

  /** MaxWaterFlowCH */
  @inherit(r)
  @ext(0xd0, 0)
  model WaterHcFlowMax {
    /** v */
    value: UIN;
  }

  /** WaterpressureVariantSum */
  @inherit(r)
  @ext(0xf0, 0)
  model WaterpressureVariantSum {
    /** Maintenance data */
    value: pressm2;
  }

  /** WaterpressureMeasureCounter */
  @inherit(r)
  @ext(0xf1, 0)
  model WaterpressureMeasureCounter {
    /** Maintenance data */
    value: UCH;
  }

  /** PrAPSCounter */
  @inherit(r)
  @ext(0xf2, 0)
  model PrAPSCounter {
    /** Maintenance data */
    value: UCH;
  }

  /** PrAPSSum */
  @inherit(r)
  @ext(0xf3, 0)
  model PrAPSSum {
    /** Maintenance data */
    value: seconds2;
  }

  /** PrVortexFlowSensorValue */
  @inherit(r)
  @ext(0xf4, 0)
  model PrVortexFlowSensorValue {
    /** Maintenance data */
    @unit("ADC")
    value: SIN;
  }

  /** PrEnergySumCH1 */
  @inherit(r)
  @ext(0xf5, 0)
  model PrEnergySumHc1 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH1 */
  @inherit(r)
  @ext(0xf6, 0)
  model PrEnergyCountHc1 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergySumCH2 */
  @inherit(r)
  @ext(0xf7, 0)
  model PrEnergySumHc2 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH2 */
  @inherit(r)
  @ext(0xf8, 0)
  model PrEnergyCountHc2 {
    /** Wartungsdaten */
    value: ULG;
  }

  /** PrEnergySumCH3 */
  @inherit(r)
  @ext(0xf9, 0)
  model PrEnergySumHc3 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH3 */
  @inherit(r)
  @ext(0xfa, 0)
  model PrEnergyCountHc3 {
    /** Maintenance data */
    value: ULG;
  }

  enum Values_PumpPowerDesired {
    auto: 0,
    _53: 1,
    _60: 2,
    _70: 3,
    _85: 4,
    _100: 5,
  }

  enum Values_Flame {
    off: 240,
    on: 15,
  }

  enum Values_GasvalveUC {
    off: 240,
    on: 15,
  }

  enum Values_VolatileLockout {
    no: 240,
    yes: 15,
  }

  enum Values_GasvalveASICFeedback {
    off: 240,
    on: 15,
  }

  enum Values_GasvalveUCFeedback {
    off: 240,
    on: 15,
  }

  enum Values_Ignitor {
    off: 240,
    on: 15,
  }

  enum Values_Templimiter {
    off: 240,
    on: 15,
  }

  enum Values_TemplimiterWithNTC {
    no: 240,
    yes: 15,
  }

  enum Values_VolatileLockoutIFCGV {
    no: 240,
    yes: 15,
  }

  enum Values_Gasvalve3UC {
    off: 240,
    on: 15,
  }

  enum Values_HcPumpMode {
    post_run: 0,
    permanent: 1,
    winter: 2,
  }

  enum Values_OptionalRelais {
    circulationpump: 1,
    extheatingpump: 2,
    storagechargingpump: 3,
    fluegasflapextractorhood: 4,
    externalgasvalve: 5,
    externalerrormessage: 6,
    solarpump: 7,
    remotecontrol: 8,
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
  @condition(Id.Id.sw, ">=413")
  namespace SW {
    /** d.74 APC_LegioProtection */
    @inherit(r, wi)
    @ext(0x97, 0x4)
    model APCLegioProtection {
      /** Legionella protection for internal storage */
      value: UCH;
    }
  }

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
