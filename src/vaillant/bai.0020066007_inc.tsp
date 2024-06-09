import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace bai._0020066007_inc {
  // ,BAI00,zeoTHERM (BMU),0020066007 187

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

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x9, 0xe)
  model ws {}
  // ##### dia level 1 #####

  /** d.05 T3_Setpoint */
  @inherit(r)
  @ext(0x39, 0)
  model T3TempDesired {
    /** Sollwert PWT-Ausgang */
    value: temp;
  }

  /** d.08 Thermostatkontakt_an_Kl_3_4 */
  @inherit(r)
  @ext(0x2a, 0)
  model ThermostatkontaktAnKl34 {
    /** External controls heat demand (Clamp 3-4) */
    value: onoff;
  }

  /** d.30 Gasvalve */
  @inherit(r)
  @ext(0xbb, 0)
  model Gasvalve {
    /** Gasvalve activation signal */
    @values(values_Gasvalve)
    value: UCH;
  }

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

  /** d.35 Position TWV */
  @inherit(r)
  @ext(0x54, 0)
  model PositionValveSet {
    /** Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position */
    value: UCH;
  }

  /** d.40 T3 */
  @inherit(r)
  @ext(0x18, 0)
  model T3 {
    /** PWT-Ausgangstemperatur */
    value: tempsensor;
  }

  /** d.41 T4 */
  @inherit(r)
  @ext(0x98, 0)
  model T4 {
    /** PWT-Eingangstemperatur */
    value: tempmirrorsensor;
  }

  /** d.44 Dig. ionisation voltage */
  @inherit(r)
  @ext(0xa4, 0)
  model IonisationVoltageLevel {
    /** digital ionisation voltage> 80 no flame< 40 good flame */
    @divisor(10)
    value: SIN;
  }

  /** d.50 MinFanSpeedOffset */
  @inherit(r, wi)
  @ext(0xa7, 0)
  model FanSpeedOffsetMin {
    /** Offset for minimum fan speed */
    @unit("1/min")
    value: SIN;
  }

  /** d.51 MaxFanSpeedOffset */
  @inherit(r, wi)
  @ext(0xa8, 0)
  model FanSpeedOffsetMax {
    /** Offset for maximum fan speed */
    @unit("1/min")
    value: SIN;
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

  /** d.93 Device specific number */
  @inherit(r, ws)
  @ext(MF, 0)
  model DSNOffset {
    /** DSN aplliance variant setting */
    value: UCH;
  }
  // ##### expert level #####

  /** flame */
  @inherit(r)
  @ext(0x5, 0)
  model Flame {
    /** flame */
    @values(values_Flame)
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

  /** SD_Flame_Sensing_ASIC_DK */
  @inherit(r)
  @ext(0x2f, 0)
  model FlameSensingASIC {
    /** ioni/adc value from the flame control circuit */
    value: UIN;
  }

  /** BoilerType_DK */
  @inherit(r)
  @ext(0x5e, 0)
  model BoilerType {
    /** Boiler typ of the bmu */
    value: UCH;
  }

  /** ReturnTemperature_DK */
  @inherit(r)
  @ext(0x6b, 0)
  model ReturnTemp {
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

  /** TargetFan_Speed_Output_DK */
  @inherit(r)
  @ext(0x9f, 0)
  model TargetFanSpeedOutput {
    /** output fan speed */
    @unit("1/min")
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

  /** DSN start */
  @inherit(r)
  @ext(0xbc, 0)
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

  /** Faultlist_DK[0] */
  @inherit(r)
  @ext(0x26, 0)
  model FaultlistDK_0_ {
    /** fault list (of the last 10 failures) */
    @maxLength(10)
    value: HEX;
  }
  // ##### maintenance data #####

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

  /** TWV_Communt_DK */
  @inherit(r)
  @ext(0x1a, 0)
  model ValveStarts {
    /** commutations of the three way valve */
    value: cntstarts2;
  }

  /** fan operation hours */
  @inherit(r)
  @ext(0x1b, 0)
  model FanHours {
    /** fan operation hours */
    value: hoursum2;
  }

  /** FanCommunt_DK */
  @inherit(r)
  @ext(0x1c, 0)
  model FanStarts {
    /** commutations of the fan */
    value: cntstarts2;
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

  /** T3_max */
  @inherit(r)
  @ext(0x37, 0)
  model T3Max {
    /** Maximaltemperatur am PWT-Ausgang */
    value: temp;
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

  /** T4_max */
  @inherit(r)
  @ext(0xbe, 0)
  model T4Max {
    /** Maximaltemperatur am PWT-Eingang */
    value: temp;
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

  /** included parts */
  union _includes {
    errors_inc,
  }
}
