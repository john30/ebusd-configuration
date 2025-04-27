import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0020066007_inc {
  // ,BAI00,zeoTHERM (BMU),0020066007 187
  // ##### dia level 1 #####

  /** d.05 T3_Setpoint: Sollwert PWT-Ausgang */
  @ext(0x39, 0)
  model T3TempDesired is ReadonlyRegister<temp>;

  /** d.08 Thermostatkontakt_an_Kl_3_4: External controls heat demand (Clamp 3-4) */
  @ext(0x2a, 0)
  model ThermostatkontaktAnKl34 is ReadonlyRegister<onoff>;

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

  /** d.40 T3: PWT-Ausgangstemperatur */
  @ext(0x18, 0)
  model T3 is ReadonlyRegister<tempsensor>;

  /** d.41 T4: PWT-Eingangstemperatur */
  @ext(0x98, 0)
  model T4 is ReadonlyRegister<tempmirrorsensor>;

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

  /** d.60 Number STL cut off: Number of safety temperature limiter cut offs */
  @ext(0x20, 0)
  model DeactivationsTemplimiter is ReadonlyRegister<UCH>;

  /** d.61 Number ignition device cut off: number of lock outs (unsuccessfull ignitons in the last attempt, flame failure) */
  @ext(0x1f, 0)
  model DeactivationsIFC is ReadonlyRegister<UCH>;

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

  /** d.93 Device specific number: DSN aplliance variant setting */
  @ext(0xb5, 0)
  model DSNOffset is ServiceRegister<UCH>;
  // ##### expert level #####

  /** Flame */
  @ext(0x5, 0)
  model Flame is ReadonlyRegister<onoff2>;

  /** Changes_DSN_DK: Numbers adjusting (storing) the DSN */
  @ext(0xc, 0)
  model ChangesDSN is ReadonlyRegister<UCH>;

  /** SD_Gasvalve_uC_DK: Activation signal of the gasvalve (activated via micrcontroller) */
  @ext(0xd, 0)
  model GasvalveUC is ReadonlyRegister<onoff2>;

  /** SD_VolatileLockout_DK: TRUE: STB failures is volatileFALSE: STB failure is not volataile */
  @ext(0x10, 0)
  model VolatileLockout is ReadonlyRegister<yesno2>;

  /** SD_Flame_Sensing_ASIC_DK: ioni/adc value from the flame control circuit */
  @ext(0x2f, 0)
  model FlameSensingASIC is ReadonlyRegister<UIN>;

  /** BoilerType_DK: Boiler typ of the bmu */
  @ext(0x5e, 0)
  model BoilerType is ReadonlyRegister<UCH>;

  /** ReturnTemperature_DK: external return sensor */
  @ext(0x6b, 0)
  model ReturnTemp is ReadonlyRegister<tempsensor>;

  /** Floor heating contact */
  @ext(0x70, 0)
  model FloorHeatingContact is ReadonlyRegister<onoff>;

  /** EbusVoltage_DK: feedback signal of the eBus source */
  @ext(0x7f, 0)
  model EbusVoltage is ReadonlyRegister<onoff>;

  /** FluegasvalveOpen_DK: feedback of the flue gas valve */
  @ext(0x89, 0)
  model FluegasvalveOpen is ReadonlyRegister<onoff>;

  /** Testbyte_DK: Testbyte (relevant for the Tester) */
  @ext(0x99, 0)
  model Testbyte is ReadonlyRegister<UCH>;

  /** DSN_DK: DSN: Device Specific number */
  @ext(0x9a, 0)
  model DSN is ReadonlyRegister<UIN>;

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

  /** Statenumber_DK: status number */
  @ext(0xab, 0)
  model Statenumber is ReadonlyRegister<UCH>;

  /** DSN Start adress */
  @ext(0xbc, 0)
  model DSNStart is ReadonlyRegister<UIN>;

  /** Partnumber_Box */
  @inherit(r)
  @ext(0xc0, 0)
  model PartnumberBox {
    /** part number of the eBox */
    @maxLength(5)
    value: HEX;
  }

  /** SD_STL_with_NTC: Safety temperature limit concept:1 = safety temp. Limit check with NTC0 = safety temp. Limit check with contact */
  @ext(0xd2, 0)
  model TemplimiterWithNTC is ReadonlyRegister<yesno2>;

  /** SD_VolatileLockout_IFC_GV_DK: all IFC faults are volataile */
  @ext(0xd3, 0)
  model VolatileLockoutIFCGV is ReadonlyRegister<yesno2>;

  /** SD_Gasvalve3_uC_DK: Gasvalve activation signal (from Microcontroller) */
  @ext(0xdb, 0)
  model Gasvalve3UC is ReadonlyRegister<onoff2>;

  /** InitialisationEEPROM: Initialisation off all EEPROM values (done in the production) */
  @ext(0xdc, 0)
  model InitialisationEEPROM is ReadonlyRegister<yesno>;

  /** TimerInputCH_DK: timer input (block heatdemand) */
  @ext(0xde, 0)
  model TimerInputHc is ReadonlyRegister<onoff>;

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
  model FaultlistDK {
    /** fault list (of the last 10 failures) */
    @maxLength(10)
    value: HEX;
  }
  // ##### maintenance data #####

  /** TempDiffBlock_DK: Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures */
  @ext(0x12, 0)
  model TempDiffBlock is ReadonlyRegister<temp0>;

  /** TempDiffFailure_DK: Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures */
  @ext(0x13, 0)
  model TempDiffFailure is ReadonlyRegister<temp0>;

  /** TWV_Communt_DK: commutations of the three way valve */
  @ext(0x1a, 0)
  model ValveStarts is ReadonlyRegister<cntstarts2>;

  /** Fan operation hours */
  @ext(0x1b, 0)
  model FanHours is ReadonlyRegister<hoursum2>;

  /** FanCommunt_DK: commutations of the fan */
  @ext(0x1c, 0)
  model FanStarts is ReadonlyRegister<cntstarts2>;

  /** min_Ignitiontime_DK */
  @inherit(r)
  @ext(0x2b, 0)
  model MinIgnitiontime {
    /** minimum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** T3_max: Maximaltemperatur am PWT-Ausgang */
  @ext(0x37, 0)
  model T3Max is ReadonlyRegister<temp>;

  /** CounterStartAttempts3_DK: unsuccessfull ignitions in the third attempt */
  @ext(0x81, 0)
  model CounterStartAttempts3 is ReadonlyRegister<temp0>;

  /** CounterStartAttempts4_DK: unsuccessfull ignitions in the fourth attempt */
  @ext(0x82, 0)
  model CounterStartAttempts4 is ReadonlyRegister<temp0>;

  /** T4_max: Maximaltemperatur am PWT-Eingang */
  @ext(0xbe, 0)
  model T4Max is ReadonlyRegister<temp>;

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
