import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Encon;

// @zz(0x3c)
namespace Excellent {
  // # This ebus config may work for Ubbink,VisionAIR,WOLF CWL series,Viessmann and some other systems that are just re-branded Brink devices
  // # sources:
  // # - Original idea and some dividers: https://github.com/dstrigl/ebusd-config-brink-renovent-excellent-300
  // # - Brink Service Tool (decompiled via Jetbrains DotPeak): https://www.brinkclimatesystems.nl/tools/software-brink-service-tool-en
  // # - Renovent 150 Datasheet: https://manuals.plus/brink/renovent-sky-150-plus-mechanical-ventilation-with-heat-recovery-manual
  // # - Modbus Module Datasheet: https://www.brinkclimatesystems.nl/documenten/modbus-uwa2-b-uwa2-e-installation-regulations-614882.pdf
  // # Message names are based on official Brink Service Tool translations with removed spaces and special characters.
  // # Message comment is the name of the parameter as used internally in code (as to help if the translation itself is confusing)
  // #
  // # For ebusd configuration files for the complete Brink portfolio go to https://github.com/pvyleta/ebusd-brink-hru

  /** default *r */
  model r {}

  /** default *w */
  @write
  model w {}
  // # COMMON HRU COMMANDS ## (WTWCommands.cs - Some of them might not be applicable for this device,use with caution)

  /** Factory reset */
  @write
  @id(
    MF,
    0xff,
    0x46,
    0x61,
    0x63,
    0x74,
    0x6f,
    0x72,
    0x79,
    0x52,
    0x65,
    0x73,
    0x65,
    0x74
  )
  model FactoryReset {}

  /** Reset Notifications */
  @write
  @id(MF, 0x91)
  model ResetNotifications {
    /** NoResetRequested is a dummy message doing nothing. It might be useful for integration in MQTT and HA automation. ErrorsAndFilter seems not working for me - but is specified. */
    @values(Values_ResetNotifications)
    value: UIR;
  }

  /** Error_History */
  @id(MF, 0x90)
  model RequestErrorList {
    @maxLength(18)
    value: HEX;
  }

  /** Fan mode */
  @write
  @id(MF, 0xa1)
  model SetFanMode {
    /** Temporary settings which resets after few minutes */
    @values(Values_SetFanMode)
    value: ULR;
  }

  /** Fan modeAlternative */
  @write
  @id(MF, 0xcb, 1, 1)
  model SetFanModeAlt {
    /** Does not reset after one minute with Sky300 with latest SW; this message is sent by Brink AirControl wall panel */
    @values(Values_SetFanModeAlt)
    value: UIR;
  }

  /** default *r */
  @base(MF, 0x50)
  model r_1 {}

  /** Filter Maximum Flow */
  @inherit(r_1)
  @ext(0x1c)
  model FilterNotificationFlow {
    volume: volume;
    min: volume;
    max: volume;
    step: volume;
    default: volume;
  }

  /** Filter usage (days) */
  @inherit(r_1)
  @ext(0x22)
  model TotalFilterDays {
    days: days;
    min: days;
    max: days;
    step: days;
    default: days;
  }

  /** Filter usage */
  @inherit(r_1)
  @ext(0x23)
  model TotalFilterFlow {
    volume: volume;
    min: volume;
    max: volume;
    step: volume;
    default: volume;
  }

  /** Operating time */
  @inherit(r_1)
  @ext(0x24)
  model TotalOperatingHours {
    hours5: hours5;
    min: hours5;
    max: hours5;
    step: hours5;
    default: hours5;
  }

  /** Total Flow */
  @inherit(r_1)
  @ext(0x25)
  model TotalFlow {
    volume: volume;
    min: volume;
    max: volume;
    step: volume;
    default: volume;
  }
  // # Curent state and sensors ##

  /** default *r */
  @base(MF, 0x22)
  model r_2 {}

  /** Fan mode */
  @inherit(r_2)
  @ext(1)
  model FanMode {
    @values(Values_FanMode)
    value: UIR;
  }

  /** Inlet flow setting */
  @inherit(r_2)
  @ext(0x9)
  model SettingInletFlow {
    value: speed;
  }

  /** Exhaust flow setting */
  @inherit(r_2)
  @ext(0xa)
  model SettingExhaustFlow {
    value: speed;
  }

  /** Actual inlet flow */
  @inherit(r_2)
  @ext(0xb)
  model InletFlow {
    value: speed;
  }

  /** Actual exhaust flow */
  @inherit(r_2)
  @ext(0xc)
  model ExhaustFlow {
    value: speed;
  }

  /** Actual inletfan speed */
  @inherit(r_2)
  @ext(0x2)
  model InletFanSpeed {
    @unit("rpm")
    value: UIR;
  }

  /** Actual exhaustfan speed */
  @inherit(r_2)
  @ext(0x3)
  model ExhaustFanSpeed {
    @unit("rpm")
    value: UIR;
  }

  /** Perilex position */
  @inherit(r_2)
  @ext(0x5)
  model PerilexPosition {
    value: position;
  }

  /** Switch position */
  @inherit(r_2)
  @ext(0x6)
  model SwitchPosition {
    value: position;
  }

  /** Contact 1 position */
  @inherit(r_2)
  @ext(0x1b)
  model Contact1Position {
    value: onoff;
  }

  /** Contact 2 position */
  @inherit(r_2)
  @ext(0x1c)
  model Contact2Position {
    value: onoff;
  }

  /** Dipswitch value */
  @inherit(r_2)
  @ext(0x4)
  model DipswitchValue {
    @values(Values_DipswitchValue)
    value: UIR;
  }

  /** software version */
  @inherit(r_2)
  @ext(0)
  model SoftwareVersion {
    @maxLength(13)
    value: STR;
  }

  /** Bypass status */
  @inherit(r_2)
  @ext(0xe)
  model BypassStatus {
    @values(Values_BypassStatus)
    value: UIR;
  }

  /** Bypass current */
  @inherit(r_2)
  @ext(0xd)
  model BypassCurrent {
    value: UIR;
  }

  /** Preheater status */
  @inherit(r_2)
  @ext(0xf)
  model PreheaterStatus {
    value: heaterstatus;
  }

  /** Preheater power */
  @inherit(r_2)
  @ext(0x10)
  model PreheaterPower {
    value: percentr;
  }

  /** Postheater status */
  @inherit(r_2)
  @ext(0x1d)
  model PostheaterStatus {
    value: heaterstatus;
  }

  /** Postheater power */
  @inherit(r_2)
  @ext(0x1e)
  model PostheaterPower {
    value: percentr;
  }

  /** EWT status */
  @inherit(r_2)
  @ext(0x1f)
  model EWTStatus {
    @values(Values_EWTStatus)
    value: UIR;
  }

  /** Frost status */
  @inherit(r_2)
  @ext(0x16)
  model FrostStatus {
    @values(Values_FrostStatus)
    value: UIR;
  }

  /** Fan status */
  @inherit(r_2)
  @ext(0x11)
  model FanStatus {
    @values(Values_FanStatus)
    value: UIR;
  }

  /** Inside temperature */
  @inherit(r_2)
  @ext(0x7)
  model InsideTemperature {
    value: temp10;
  }

  /** outside temperature */
  @inherit(r_2)
  @ext(0x8)
  model OutsideTemperature {
    value: temp10;
  }

  /** Option temperature */
  @inherit(r_2)
  @ext(0x1a)
  model OptionTemperature {
    value: temp10;
  }

  /** Filter dirty */
  @inherit(r_2)
  @ext(0x18)
  model FilterStatus {
    value: yesno;
  }

  /** Relative Humidity */
  @inherit(r_2)
  @ext(0x20)
  model RelativeHumidity {
    @unit("%")
    @divisor(10)
    value: SIR;
  }

  /** Humidity Boost State */
  @inherit(r_2)
  @ext(0x21)
  model HumidityBoostState {
    @unit("Pa")
    @values(Values_HumidityBoostState)
    value: UIR;
  }

  /** Actual inlet pressure */
  @inherit(r_2)
  @ext(0x14)
  model PressureInlet {
    @unit("Pa")
    @divisor(10)
    value: UIR;
  }

  /** Actual exhaust pressure */
  @inherit(r_2)
  @ext(0x15)
  model PressureExhaust {
    @unit("Pa")
    @divisor(10)
    value: UIR;
  }

  /** EBus SyncGen Errors */
  @inherit(r_2)
  @ext(0x64)
  model EBusSyncGenErrorCount {
    value: UIR;
  }

  /** CO2 Sensor 1 status */
  @inherit(r_2)
  @ext(0x28)
  model CO2Sensor1Status {
    value: sensorstate;
  }

  /** CO2 Sensor 1 level */
  @inherit(r_2)
  @ext(0x29)
  model CO2Sensor1Value {
    @unit("ppm")
    value: UIR;
  }

  /** CO2 Sensor 2 status */
  @inherit(r_2)
  @ext(0x2a)
  model CO2Sensor2Status {
    value: sensorstate;
  }

  /** CO2 Sensor 2 level */
  @inherit(r_2)
  @ext(0x2b)
  model CO2Sensor2Value {
    @unit("ppm")
    value: UIR;
  }

  /** CO2 Sensor 3 status */
  @inherit(r_2)
  @ext(0x2c)
  model CO2Sensor3Status {
    value: sensorstate;
  }

  /** CO2 Sensor 3 level */
  @inherit(r_2)
  @ext(0x2d)
  model CO2Sensor3Value {
    @unit("ppm")
    value: UIR;
  }

  /** CO2 Sensor 4 status */
  @inherit(r_2)
  @ext(0x2e)
  model CO2Sensor4Status {
    value: sensorstate;
  }

  /** CO2 Sensor 4 level */
  @inherit(r_2)
  @ext(0x2f)
  model CO2Sensor4Value {
    @unit("ppm")
    value: UIR;
  }
  // # Configuration parameters ## (values in brackets next to field are definitions of those fields values from Brink Service Tool.)

  /** default *r */
  @base(MF, 0x50)
  model r_3 {}

  /** default *w */
  @write
  @base(MF, 0x80)
  model w_1 {}

  /** Air flow rate mode 0 */
  @inherit(r_3, w_1)
  @ext(0x21)
  model FlowMode0 {
    @minValue(0) @maxValue(50) @step(50)
    speed: speed;

    /** [min:0] */
    min?: speed;

    /** [max:50] */
    max?: speed;

    /** [step:50] */
    step?: speed;

    /** [default:50] */
    default?: speed;
  }

  /** Air flow rate mode 1 */
  @inherit(r_3, w_1)
  @ext(1)
  model FlowMode1 {
    @minValue(50) @maxValue(400) @step(5)
    speed: speed;

    /** [min:50] */
    min?: speed;

    /** [max:300 or 400] */
    max?: speed;

    /** [step:5] */
    step?: speed;

    /** [default:100] */
    default?: speed;
  }

  /** Air flow rate mode 2 */
  @inherit(r_3, w_1)
  @ext(0x2)
  model FlowMode2 {
    @minValue(50) @maxValue(400) @step(5)
    speed: speed;

    /** [min:50] */
    min?: speed;

    /** [max:300 or 400] */
    max?: speed;

    /** [step:5] */
    step?: speed;

    /** [default:150 or 200] */
    default?: speed;
  }

  /** Air flow rate mode 3 */
  @inherit(r_3, w_1)
  @ext(0x3)
  model FlowMode3 {
    @minValue(50) @maxValue(400) @step(5)
    speed: speed;

    /** [min:50] */
    min?: speed;

    /** [max:300 or 400] */
    max?: speed;

    /** [step:5] */
    step?: speed;

    /** [default:225 or 300] */
    default?: speed;
  }

  /** Bypass temperature */
  @inherit(r_3, w_1)
  @ext(0x4)
  model BypassTemp {
    @minValue(150) @maxValue(350) @step(5)
    temp10: temp10;

    /** [min:150] */
    min?: temp10;

    /** [max:350] */
    max?: temp10;

    /** [step:5] */
    step?: temp10;

    /** [default:240] */
    default?: temp10;
  }

  /** Bypass hysteresis */
  @inherit(r_3, w_1)
  @ext(0x30)
  model BypassTempHyst {
    @minValue(0) @maxValue(50) @step(5)
    temp10: temp10;

    /** [min:0] */
    min?: temp10;

    /** [max:50] */
    max?: temp10;

    /** [step:5] */
    step?: temp10;

    /** [default:20] */
    default?: temp10;
  }

  /** Operation bypass valve */
  @inherit(r_3, w_1)
  @ext(0x1b)
  model BypassMode {
    autocloseopen: autocloseopen;

    @maxLength(6)
    ign?: IGN;

    /** [default:0] - min/max/step fields of enum message omitted */
    default?: autocloseopen;
  }

  /** Central heating + heat recovery */
  @inherit(r_3, w_1)
  @ext(0x7)
  model CVWTWMode {
    onoff: onoff;

    @maxLength(6)
    ign?: IGN;

    /** [default:0] - min/max/step fields of enum message omitted */
    default?: onoff;
  }

  /** Imbalance permissible */
  @inherit(r_3, w_1)
  @ext(0x8)
  model UnbalanceMode {
    yesno: yesno;

    @maxLength(6)
    ign?: IGN;

    /** [default:1] - min/max/step fields of enum message omitted */
    default?: yesno;
  }

  /** Fixed imbalance */
  @inherit(r_3, w_1)
  @ext(0x9)
  model UnbalanceFlow {
    @minValue(-100) @maxValue(100)
    speed: sspeed;

    /** [min:-100] */
    min?: sspeed;

    /** [max:100] */
    max?: sspeed;

    /** [step:1] */
    step?: sspeed;

    /** [default:0] */
    default?: sspeed;
  }

  /** Extra heater type */
  @inherit(r_3, w_1)
  @ext(0xa)
  model ExtraHeaterType {
    @minValue(0) @maxValue(2)
    uir: UIR;

    /** [min:0] */
    min?: UIR;

    /** [max:2] */
    max?: UIR;

    /** [step:1] */
    step?: UIR;

    /** [default:0] */
    default?: UIR;
  }

  /** Temperature postheater */
  @inherit(r_3, w_1)
  @ext(0xb)
  model PostheaterTemp {
    @minValue(150) @maxValue(300) @step(5)
    temp10: temp10;

    /** [min:150] */
    min?: temp10;

    /** [max:300] */
    max?: temp10;

    /** [step:5] */
    step?: temp10;

    /** [default:210] */
    default?: temp10;
  }

  /** Selection input 1 */
  @inherit(r_3, w_1)
  @ext(0xc)
  model Input1Mode {
    inputmode: inputmode;

    @maxLength(6)
    ign?: IGN;

    /** [default:0] - min/max/step fields of enum message omitted */
    default?: inputmode;
  }

  /** Minimum voltage input 1 */
  @inherit(r_3, w_1)
  @ext(0xd)
  model Input1VMin {
    @minValue(0) @maxValue(100) @step(5)
    voltage: voltage;

    /** [min:0] */
    min?: voltage;

    /** [max:100] */
    max?: voltage;

    /** [step:5] */
    step?: voltage;

    /** [default:0] */
    default?: voltage;
  }

  /** Maximum voltage input 1 */
  @inherit(r_3, w_1)
  @ext(0xe)
  model Input1VMax {
    @minValue(0) @maxValue(100) @step(5)
    voltage: voltage;

    /** [min:0] */
    min?: voltage;

    /** [max:100] */
    max?: voltage;

    /** [step:5] */
    step?: voltage;

    /** [default:100] */
    default?: voltage;
  }

  /** Conditions sw. input 1 */
  @inherit(r_3, w_1)
  @ext(0xf)
  model CN1Coupling {
    onoffbypass: onoffbypass;

    @maxLength(6)
    ign?: IGN;

    /** [default:0] - min/max/step fields of enum message omitted */
    default?: onoffbypass;
  }

  /** Supply fan mode sw. input 1 */
  @inherit(r_3, w_1)
  @ext(0x10)
  model CN1Inlet {
    fanmode: fanmode;

    @maxLength(6)
    ign?: IGN;

    /** [default:5] - min/max/step fields of enum message omitted */
    default?: fanmode;
  }

  /** Extract fan mode sw. input 1 */
  @inherit(r_3, w_1)
  @ext(0x11)
  model CN1Exhaust {
    fanmode: fanmode;

    @maxLength(6)
    ign?: IGN;

    /** [default:5] - min/max/step fields of enum message omitted */
    default?: fanmode;
  }

  /** Selection input 2 */
  @inherit(r_3, w_1)
  @ext(0x12)
  model Input2Mode {
    inputmode: inputmode;

    @maxLength(6)
    ign?: IGN;

    /** [default:1] - min/max/step fields of enum message omitted */
    default?: inputmode;
  }

  /** Minimum voltage input 2 */
  @inherit(r_3, w_1)
  @ext(0x13)
  model Input2VMin {
    @minValue(0) @maxValue(100) @step(5)
    voltage: voltage;

    /** [min:0] */
    min?: voltage;

    /** [max:100] */
    max?: voltage;

    /** [step:5] */
    step?: voltage;

    /** [default:0] */
    default?: voltage;
  }

  /** Maximum voltage input 2 */
  @inherit(r_3, w_1)
  @ext(0x14)
  model Input2VMax {
    @minValue(0) @maxValue(100) @step(5)
    voltage: voltage;

    /** [min:0] */
    min?: voltage;

    /** [max:100] */
    max?: voltage;

    /** [step:5] */
    step?: voltage;

    /** [default:100] */
    default?: voltage;
  }

  /** Conditions sw. input 2 */
  @inherit(r_3, w_1)
  @ext(0x15)
  model CN2Coupling {
    onoffbypass: onoffbypass;

    @maxLength(6)
    ign?: IGN;

    /** [default:0] - min/max/step fields of enum message omitted */
    default?: onoffbypass;
  }

  /** Supply fan mode sw. input 2 */
  @inherit(r_3, w_1)
  @ext(0x16)
  model CN2Inlet {
    fanmode: fanmode;

    @maxLength(6)
    ign?: IGN;

    /** [default:5] - min/max/step fields of enum message omitted */
    default?: fanmode;
  }

  /** Extract fan mode sw. input 2 */
  @inherit(r_3, w_1)
  @ext(0x17)
  model CN2Exhaust {
    fanmode: fanmode;

    @maxLength(6)
    ign?: IGN;

    /** [default:5] - min/max/step fields of enum message omitted */
    default?: fanmode;
  }

  /** Geo heat exchanger */
  @inherit(r_3, w_1)
  @ext(0x18)
  model EWTMode {
    onoff: onoff;

    @maxLength(6)
    ign?: IGN;

    /** [default:0] - min/max/step fields of enum message omitted */
    default?: onoff;
  }

  /** Min. temp. geo heat exchanger */
  @inherit(r_3, w_1)
  @ext(0x19)
  model EWTTempMin {
    @minValue(0) @maxValue(100) @step(5)
    temp10: temp10;

    /** [min:0] */
    min?: temp10;

    /** [max:100] */
    max?: temp10;

    /** [step:5] */
    step?: temp10;

    /** [default:50] */
    default?: temp10;
  }

  /** Max. temp. geo heat exchanger */
  @inherit(r_3, w_1)
  @ext(0x1a)
  model EWTTempMax {
    @minValue(150) @maxValue(400) @step(5)
    temp10: temp10;

    /** [min:150] */
    min?: temp10;

    /** [max:400] */
    max?: temp10;

    /** [step:5] */
    step?: temp10;

    /** [default:250] */
    default?: temp10;
  }

  /** RH Sensor Present */
  @inherit(r_3, w_1)
  @ext(0x32)
  model RHTSensorPresent {
    @minValue(0) @maxValue(1)
    uir: UIR;

    /** [min:0] */
    min?: UIR;

    /** [max:1] */
    max?: UIR;

    /** [step:1] */
    step?: UIR;

    /** [default:0] */
    default?: UIR;
  }

  /** RH Sensor Sensitivity */
  @inherit(r_3, w_1)
  @ext(0x33)
  model RHTSensorSensitivity {
    @minValue(-2) @maxValue(2)
    sir: SIR;

    /** [min:-2] */
    min?: SIR;

    /** [max:2] */
    max?: SIR;

    /** [step:1] */
    step?: SIR;

    /** [default:0] */
    default?: SIR;
  }

  /** Backlight level */
  @inherit(r_3, w_1)
  @ext(0x1d)
  model BacklightLevel {
    @minValue(0) @maxValue(100) @step(5)
    percentr: percentr;

    /** [min:0] */
    min?: percentr;

    /** [max:100] */
    max?: percentr;

    /** [step:5] */
    step?: percentr;

    /** [default:10] */
    default?: percentr;
  }

  /** CO2 Sensor 1 lower limit */
  @inherit(r_3, w_1)
  @ext(0x34)
  model CO2Sensor1LowerLimit {
    @unit("ppm")
    @minValue(400) @maxValue(2000) @step(25)
    uir: UIR;

    /** [min:400] */
    @unit("ppm")
    min?: UIR;

    /** [max:2000] */
    @unit("ppm")
    max?: UIR;

    /** [step:25] */
    @unit("ppm")
    step?: UIR;

    /** [default:400] */
    @unit("ppm")
    default?: UIR;
  }

  /** CO2 Sensor 1 upper limit */
  @inherit(r_3, w_1)
  @ext(0x35)
  model CO2Sensor1UpperLimit {
    @unit("ppm")
    @minValue(400) @maxValue(2000) @step(25)
    uir: UIR;

    /** [min:400] */
    @unit("ppm")
    min?: UIR;

    /** [max:2000] */
    @unit("ppm")
    max?: UIR;

    /** [step:25] */
    @unit("ppm")
    step?: UIR;

    /** [default:1200] */
    @unit("ppm")
    default?: UIR;
  }

  /** CO2 Sensor 2 lower limit */
  @inherit(r_3, w_1)
  @ext(0x36)
  model CO2Sensor2LowerLimit {
    @unit("ppm")
    @minValue(400) @maxValue(2000) @step(25)
    uir: UIR;

    /** [min:400] */
    @unit("ppm")
    min?: UIR;

    /** [max:2000] */
    @unit("ppm")
    max?: UIR;

    /** [step:25] */
    @unit("ppm")
    step?: UIR;

    /** [default:400] */
    @unit("ppm")
    default?: UIR;
  }

  /** CO2 Sensor 2 upper limit */
  @inherit(r_3, w_1)
  @ext(0x37)
  model CO2Sensor2UpperLimit {
    @unit("ppm")
    @minValue(400) @maxValue(2000) @step(25)
    uir: UIR;

    /** [min:400] */
    @unit("ppm")
    min?: UIR;

    /** [max:2000] */
    @unit("ppm")
    max?: UIR;

    /** [step:25] */
    @unit("ppm")
    step?: UIR;

    /** [default:1200] */
    @unit("ppm")
    default?: UIR;
  }

  /** CO2 Sensor 3 lower limit */
  @inherit(r_3, w_1)
  @ext(0x38)
  model CO2Sensor3LowerLimit {
    @unit("ppm")
    @minValue(400) @maxValue(2000) @step(25)
    uir: UIR;

    /** [min:400] */
    @unit("ppm")
    min?: UIR;

    /** [max:2000] */
    @unit("ppm")
    max?: UIR;

    /** [step:25] */
    @unit("ppm")
    step?: UIR;

    /** [default:400] */
    @unit("ppm")
    default?: UIR;
  }

  /** CO2 Sensor 3 upper limit */
  @inherit(r_3, w_1)
  @ext(0x39)
  model CO2Sensor3UpperLimit {
    @unit("ppm")
    @minValue(400) @maxValue(2000) @step(25)
    uir: UIR;

    /** [min:400] */
    @unit("ppm")
    min?: UIR;

    /** [max:2000] */
    @unit("ppm")
    max?: UIR;

    /** [step:25] */
    @unit("ppm")
    step?: UIR;

    /** [default:1200] */
    @unit("ppm")
    default?: UIR;
  }

  /** CO2 Sensor 4 lower limit */
  @inherit(r_3, w_1)
  @ext(0x3a)
  model CO2Sensor4LowerLimit {
    @unit("ppm")
    @minValue(400) @maxValue(2000) @step(25)
    uir: UIR;

    /** [min:400] */
    @unit("ppm")
    min?: UIR;

    /** [max:2000] */
    @unit("ppm")
    max?: UIR;

    /** [step:25] */
    @unit("ppm")
    step?: UIR;

    /** [default:400] */
    @unit("ppm")
    default?: UIR;
  }

  /** CO2 Sensor 4 upper limit */
  @inherit(r_3, w_1)
  @ext(0x3b)
  model CO2Sensor4UpperLimit {
    @unit("ppm")
    @minValue(400) @maxValue(2000) @step(25)
    uir: UIR;

    /** [min:400] */
    @unit("ppm")
    min?: UIR;

    /** [max:2000] */
    @unit("ppm")
    max?: UIR;

    /** [step:25] */
    @unit("ppm")
    step?: UIR;

    /** [default:1200] */
    @unit("ppm")
    default?: UIR;
  }

  /** CO2 Sensors activated */
  @inherit(r_3, w_1)
  @ext(0x3c)
  model CO2SensorsActivated {
    yesno: yesno;

    @maxLength(6)
    ign?: IGN;

    /** [default:0] - min/max/step fields of enum message omitted */
    default?: yesno;
  }

  /** Flow Correction */
  @inherit(r_3, w_1)
  @ext(0x3f)
  model FlowCorrection {
    @minValue(90) @maxValue(110)
    percentr: percentr;

    /** [min:90] */
    min?: percentr;

    /** [max:110] */
    max?: percentr;

    /** [step:1] */
    step?: percentr;

    /** [default:100] */
    default?: percentr;
  }

  /** Default position switch */
  @inherit(r_3, w_1)
  @ext(0x40)
  model SwitchDefaultPos {
    onoff: onoff;

    @maxLength(6)
    ign?: IGN;

    /** [default:1] - min/max/step fields of enum message omitted */
    default?: onoff;
  }

  /** Filter days before warning */
  @inherit(r_3, w_1)
  @ext(0x45)
  model FilterDaysBeforeWarning {
    @minValue(1) @maxValue(365)
    uir: UIR;

    /** [min:1] */
    min?: UIR;

    /** [max:365] */
    max?: UIR;

    /** [step:1] */
    step?: UIR;

    /** [default:90] */
    default?: UIR;
  }

  /** Modbus Interface */
  @inherit(r_3, w_1)
  @ext(0x41)
  model ModbusInterface {
    @minValue(0) @maxValue(3) @step(2)
    uir: UIR;

    /** [min:0] */
    min?: UIR;

    /** [max:3] */
    max?: UIR;

    /** [step:2] */
    step?: UIR;

    /** [default:1] */
    default?: UIR;
  }

  /** Modbus Slave Address */
  @inherit(r_3, w_1)
  @ext(0x42)
  model ModbusSlaveAddress {
    @minValue(1) @maxValue(247)
    uir: UIR;

    /** [min:1] */
    min?: UIR;

    /** [max:247] */
    max?: UIR;

    /** [step:1] */
    step?: UIR;

    /** [default:11] */
    default?: UIR;
  }

  /** Modbus Speed */
  @inherit(r_3, w_1)
  @ext(0x43)
  model ModbusSpeed {
    baud: baud;

    @maxLength(6)
    ign?: IGN;

    /** [default:3] - min/max/step fields of enum message omitted */
    default?: baud;
  }

  /** Modbus Parity */
  @inherit(r_3, w_1)
  @ext(0x44)
  model ModbusParity {
    parity: parity;

    @maxLength(6)
    ign?: IGN;

    /** [default:1] - min/max/step fields of enum message omitted */
    default?: parity;
  }

  enum Values_ResetNotifications {
    Errors: 0x0100,
    Filter: 0x0001,
    ErrorsAndFilter: 0x0101,
    NoResetRequested: 0x0000,
  }

  enum Values_SetFanMode {
    Holiday: 0x0,
    Reduced: 0x00010001,
    Normal: 0x00020002,
    High: 0x00030003,
  }

  enum Values_SetFanModeAlt {
    Holiday: 0,
    Reduced: 1,
    Normal: 2,
    High: 3,
  }

  enum Values_FanMode {
    Holiday: 0,
    Reduced: 1,
    Normal: 2,
    High: 3,
    Auto: 4,
  }

  enum Values_DipswitchValue {
    Excellent180Basic: 31,
    Excellent180Plus: 30,
    Excellent300Basic: 7,
    Excellent300Plus: 6,
    Excellent400Basic: 5,
    Excellent400Plus: 4,
    Excellent450Basic: 27,
    Excellent450Plus: 26,
    RenoventElan300Basic: 3,
    RenoventElan300Plus: 2,
    Sky150Basic: 19,
    Sky150Plus: 18,
    Sky200Basic: 9,
    Sky200Plus: 8,
    Sky300Basic: 21,
    Sky300Plus: 20,
  }

  enum Values_BypassStatus {
    Initializing: 0,
    Opening: 1,
    Closing: 2,
    Open: 3,
    Closed: 4,
    Error: 5,
    Calibrating: 6,
    Error_1: 255,
  }

  enum Values_EWTStatus {
    OpenLow: 0,
    Closed: 1,
    OpenHigh: 2,
  }

  enum Values_FrostStatus {
    Initializing: 0,
    NoFrost: 1,
    NoFrost_1: 17,
    DefrostWait: 2,
    Preheater: 3,
    Preheater_1: 18,
    Error: 255,
    VeluHeater: 5,
    VeluFanCtrl: 6,
    TableFanCtrl: 7,
    TableFanCtrl_1: 19,
    Sky150Heater: 8,
    FanCtrlFanOff: 9,
    FanCtrlFanRestart: 10,
    FanCtrlCurve1: 11,
    FanCtrlCurve2: 12,
    FanCtrlCurve3: 13,
    FanCtrlCurve4: 14,
    HeaterCoolDown: 15,
    Blocked: 16,
  }

  enum Values_FanStatus {
    Initializing: 0,
    ConstantFlow: 1,
    ConstantPWM: 2,
    Off: 3,
    Error: 4,
    MassBalance: 5,
    Standby: 6,
    ConstantRPM: 7,
  }

  enum Values_HumidityBoostState {
    Error: 0,
    NotInitialized: 1,
    SensorNotActive: 2,
    PowerUpDelay: 3,
    NormalRH: 4,
    BoostRising: 5,
    BoostStable: 6,
    BoostDecending: 7,
    BoostRHLowLevelStable: 8,
  }
}
