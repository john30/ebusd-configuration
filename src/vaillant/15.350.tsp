import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace _350 {
  // ,35000,VRT 350,173 173

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

  @inherit(r, wi)
  @ext(0, 0)
  model ResvdStorage1Sensor {
    value: tempsensor;
  }

  @inherit(r, wi)
  @ext(1, 0)
  model ResvdStorage2Sensor {
    value: tempsensor;
  }

  @inherit(r, wi)
  @ext(0x2, 0)
  model ResvdStorage3Sensor {
    value: tempsensor;
  }

  @inherit(r, wi)
  @ext(0x3, 0)
  model ResvdColl1Sensor {
    value: tempsensor;
  }

  @inherit(r, wi)
  @ext(0x4, 0)
  model ResvdColl2Sensor {
    value: tempsensor;
  }

  @inherit(r, wi)
  @ext(0x5, 0)
  model YieldSensor {
    value: tempsensor;
  }

  @inherit(r, wi)
  @ext(0x6, 0)
  model ResvdCollPump1 {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x7, 0)
  model ActualPumpPower {
    @maxLength(2)
    value: HEX;
  }

  @inherit(r, wi)
  @ext(0x8, 0)
  model ResvdCollPump2 {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x9, 0)
  model UV1State {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0xa, 0)
  model LegioPump {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0xb, 0)
  model CirPump {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0xc, 0)
  model ElectronicCartridge {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0xd, 0)
  model C1C2State {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0xe, 0)
  model BypassValve {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x10, 0)
  model RoomTempOffsetSelfWarming {
    value: temp;
  }

  @inherit(r, wi)
  @ext(0x11, 0)
  model RoomTempOffset {
    value: temp;
  }

  /** act. outside temperature [°C/sensor state] */
  @inherit(r, wi)
  @ext(0x12, 0)
  model OutsideTemp {
    value: tempsensor;
  }

  @inherit(r, wi)
  @ext(0x13, 0)
  model OutsideTempOffset {
    value: temp;
  }

  @inherit(r, wi)
  @ext(0x14, 0)
  model ActualTempDesired {
    value: temp0;
  }

  @inherit(r, wi)
  @ext(0x15, 0)
  model OperatingMode {
    value: mcmode;
  }

  @inherit(r, wi)
  @ext(0x16, 0)
  model ActualWeekday {
    value: bday;
  }

  @inherit(r, wi)
  @ext(0x17, 0)
  model Time {
    value: time;
  }

  @inherit(r, wi)
  @ext(0x18, 0)
  model ReducedNightTemp {
    value: temp;
  }

  @inherit(r, wi)
  @ext(0x19, 0)
  model PrevOperatingMode {
    value: mcmode;
  }

  @inherit(r, wi)
  @ext(0x1a, 0)
  model TeleSwOperatingMode {
    value: mcmode;
  }

  @inherit(r, wi)
  @ext(0x1b, 0)
  model HwcState {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x1c, 0)
  model YearCalendarActive {
    @values(Values_YearCalendarActive)
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x1d, 0)
  model ClockSwitchSummerWinterDone {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x1e, 0)
  model Yield {
    value: UIN;
  }

  @inherit(r, wi)
  @ext(0x1f, 0)
  model CollPumpHRuntime {
    uin: UIN;
    uin_1: UIN;
  }

  @inherit(r, wi)
  @ext(0x20, 0)
  model Date {
    value: date;
  }

  @inherit(r, wi)
  @ext(0x21, 0)
  model RoomTempSwitchOn {
    @values(Values_RoomTempSwitchOn)
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x22, 0)
  model ROCRoomSet {
    value: temp;
  }

  @inherit(r, wi)
  @ext(0x23, 0)
  model OffsetDesTemp {
    value: temp;
  }

  @inherit(r, wi)
  @ext(0x24, 0)
  model StateOfRoomCon {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x25, 0)
  model LegioProtectionState {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x26, 0)
  model StatusDcf {
    value: dcfstate;
  }

  @inherit(r, wi)
  @ext(0x27, 0)
  model DcfDaten {
    value: UIN;
  }

  @inherit(r, wi)
  @ext(0x28, 0)
  model IsInHoliday {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x29, 0)
  model IsInParty {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x2a, 0)
  model IsInSingleHwcLoadingMode {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x2b, 0)
  model RestoreOpModeAfterHoliday {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x2c, 0)
  model IsInSavingsFunction {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x2d, 0)
  model SavingsFunctionTime {
    time: time;
    onoff: onoff;
  }

  @inherit(r, wi)
  @ext(0x2e, 0)
  model SwitchOffParty {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x2f, 0)
  model IsInTeleSwitch {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x30, 0)
  model IsInFloorPavingDrying {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x31, 0)
  model IsInQuickVeto {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x32, 0)
  model QuickVetoTemp {
    value: temp;
  }

  @inherit(r, wi)
  @ext(0x33, 0)
  model StackeBUSTaskMax {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x34, 0)
  model StackMainTaskMax {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x35, 0)
  model StackLifeCheckTaskMax {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x36, 0)
  model Variant {
    @values(Values_Variant)
    value: ULG;
  }

  @inherit(r, wi)
  @ext(0x37, 0)
  model TimeWindows {
    value: UIN;
  }

  @inherit(r, wi)
  @ext(0x38, 0)
  model EBUSCRC {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x39, 0)
  model HwcTempDesired {
    value: temp;
  }

  @inherit(r, wi)
  @ext(0x3a, 0)
  model ComfTempEnabled {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x3b, 0)
  model ComfTempDesired {
    temp: temp;
    temp_1: temp;
    temp_2: temp;
    temp_3: temp;
  }

  @inherit(r, wi)
  @ext(0x3c, 0)
  model FrostProtectDelay {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x3d, 0)
  model HydraulicScheme {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x3e, 0)
  model SolHwcMaxLoadTemp {
    @maxLength(2)
    value: HEX;
  }

  @inherit(r, wi)
  @ext(0x3f, 0)
  model ONDiff {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x40, 0)
  model OffDiff {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x41, 0)
  model LegioProtectionEnabled {
    value: yesno;
  }

  @inherit(r, wi)
  @ext(0x42, 0)
  model FillmodeStartTime {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x43, 0)
  model OperatingmodeStartTime {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x44, 0)
  model NumCollPanels {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x45, 0)
  model SolPumpBlockingTime {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x46, 0)
  model LoadingDelayEnabled {
    value: onoff;
  }

  /** Solar flow rate [l/h] */
  @inherit(r, wi)
  @ext(0x47, 0)
  model SolFlowRate {
    value: UIN;
  }

  @inherit(r, wi)
  @ext(0x48, 0)
  model EDControlEnabled {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x49, 0)
  model ResetYield {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x4a, 0)
  model ResetOperatingTimes {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x4b, 0)
  model PumpPower {
    value: power;
  }

  @inherit(r, wi)
  @ext(0x4c, 0)
  model StartCircuitAeration {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x4d, 0)
  model HeatingCurve {
    value: curve;
  }

  @inherit(r, wi)
  @ext(0x4e, 0)
  model ControlMode {
    value: SCH;
  }

  @inherit(r, wi)
  @ext(0x4f, 0)
  model OtShutdownLimit {
    value: temp;
  }

  @inherit(r, wi)
  @ext(0x50, 0)
  model FlowTempMin {
    value: temp;
  }

  @inherit(r, wi)
  @ext(0x51, 0)
  model DisableAutoSync {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x52, 0)
  model ONMINDiff {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x53, 0)
  model ONMAXDiff {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x54, 0)
  model HydraulicMixer {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x55, 0)
  model EBUSFifoDiffCntMax {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x56, 0)
  model ZweipunktAnalogSlct {
    value: UCH;
  }

  /** Actual roomtemperature setpoint [°C] */
  @inherit(r, wi)
  @ext(0x57, 0)
  model ActualRoomTempDesired {
    value: temp;
  }

  @inherit(r, wi)
  @ext(0x58, 0)
  model WeekDayProgSwitch {
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x59, 0)
  model OperatingModeHwc {
    value: mcmode;
  }

  @inherit(r, wi)
  @ext(0x5a, 0)
  model RTCAdjustment {
    value: SIN;
  }

  @inherit(r, wi)
  @ext(0x5b, 0)
  model EEpromMaxInkonsCnt {
    value: UIN;
  }

  @inherit(r, wi)
  @ext(0x5c, 0)
  model POCResetCnt {
    value: UIN;
  }

  @inherit(r, wi)
  @ext(0x5d, 0)
  model WDResetCnt {
    value: UIN;
  }

  @inherit(r, wi)
  @ext(0x5e, 0)
  model LVResetCnt {
    value: UIN;
  }

  @inherit(r, wi)
  @ext(0x5f, 0)
  model CMResetCnt {
    value: UIN;
  }

  @inherit(r, wi)
  @ext(0x60, 0)
  model COMErrorCnt {
    value: UIN;
  }

  @inherit(r, wi)
  @ext(0x61, 0)
  model VariantDKRefreshCnt {
    value: UCH;
  }

  enum Values_YearCalendarActive {
    off: 0,
    on: 7,
  }

  enum Values_RoomTempSwitchOn {
    off: 0,
    modulating: 1,
    thermostat: 2,
  }

  enum Values_Variant {
    VRT_350: 0x0FF0F00F,
    VRT_360: 0x33CCCC33,
    SD_17: 0x3CC3C33C,
    SD_37: 0x66999966,
    VRT_360_: 0x69969669,
  }
  @condition(Id.Id.sw, "<=140")
  namespace Sw_le140 {
    /** actual room temperature [°C/Sensor state] */
    @inherit(r, wi)
    @ext(0xf, 0)
    model RoomTemp {
      value: tempsensor;
    }
  }
  @condition(Id.Id.sw, ">=141")
  namespace Sw_ge141 {
    @inherit(r, ws)
    @ext(0x66, 0)
    model DisplayedRoomTemp {
      value: temp;
    }
  }
}
