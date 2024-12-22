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

  @ext(0, 0)
  model ResvdStorage1Sensor is InstallRegister<tempsensor>;

  @ext(1, 0)
  model ResvdStorage2Sensor is InstallRegister<tempsensor>;

  @ext(0x2, 0)
  model ResvdStorage3Sensor is InstallRegister<tempsensor>;

  @ext(0x3, 0)
  model ResvdColl1Sensor is InstallRegister<tempsensor>;

  @ext(0x4, 0)
  model ResvdColl2Sensor is InstallRegister<tempsensor>;

  @ext(0x5, 0)
  model YieldSensor is InstallRegister<tempsensor>;

  @ext(0x6, 0)
  model ResvdCollPump1 is InstallRegister<UCH>;

  @inherit(r, wi)
  @ext(0x7, 0)
  model ActualPumpPower {
    @maxLength(2)
    value: HEX;
  }

  @ext(0x8, 0)
  model ResvdCollPump2 is InstallRegister<UCH>;

  @ext(0x9, 0)
  model UV1State is InstallRegister<UCH>;

  @ext(0xa, 0)
  model LegioPump is InstallRegister<onoff>;

  @ext(0xb, 0)
  model CirPump is InstallRegister<onoff>;

  @ext(0xc, 0)
  model ElectronicCartridge is InstallRegister<onoff>;

  @ext(0xd, 0)
  model C1C2State is InstallRegister<onoff>;

  @ext(0xe, 0)
  model BypassValve is InstallRegister<onoff>;

  @ext(0x10, 0)
  model RoomTempOffsetSelfWarming is InstallRegister<temp>;

  @ext(0x11, 0)
  model RoomTempOffset is InstallRegister<temp>;

  /** act. outside temperature [°C/sensor state] */
  @ext(0x12, 0)
  model OutsideTemp is InstallRegister<tempsensor>;

  @ext(0x13, 0)
  model OutsideTempOffset is InstallRegister<temp>;

  @ext(0x14, 0)
  model ActualTempDesired is InstallRegister<temp0>;

  @ext(0x15, 0)
  model OperatingMode is InstallRegister<mcmode>;

  @ext(0x16, 0)
  model ActualWeekday is InstallRegister<bday>;

  @ext(0x17, 0)
  model Time is InstallRegister<time>;

  @ext(0x18, 0)
  model ReducedNightTemp is InstallRegister<temp>;

  @ext(0x19, 0)
  model PrevOperatingMode is InstallRegister<mcmode>;

  @ext(0x1a, 0)
  model TeleSwOperatingMode is InstallRegister<mcmode>;

  @ext(0x1b, 0)
  model HwcState is InstallRegister<UCH>;

  @inherit(r, wi)
  @ext(0x1c, 0)
  model YearCalendarActive {
    @values(Values_YearCalendarActive)
    value: UCH;
  }

  @ext(0x1d, 0)
  model ClockSwitchSummerWinterDone is InstallRegister<onoff>;

  @ext(0x1e, 0)
  model Yield is InstallRegister<UIN>;

  @inherit(r, wi)
  @ext(0x1f, 0)
  model CollPumpHRuntime {
    uin: UIN;
    uin_1: UIN;
  }

  @ext(0x20, 0)
  model Date is InstallRegister<date>;

  @inherit(r, wi)
  @ext(0x21, 0)
  model RoomTempSwitchOn {
    @values(Values_RoomTempSwitchOn)
    value: UCH;
  }

  @ext(0x22, 0)
  model ROCRoomSet is InstallRegister<temp>;

  @ext(0x23, 0)
  model OffsetDesTemp is InstallRegister<temp>;

  @ext(0x24, 0)
  model StateOfRoomCon is InstallRegister<UCH>;

  @ext(0x25, 0)
  model LegioProtectionState is InstallRegister<onoff>;

  @ext(0x26, 0)
  model StatusDcf is InstallRegister<dcfstate>;

  @ext(0x27, 0)
  model DcfDaten is InstallRegister<UIN>;

  @ext(0x28, 0)
  model IsInHoliday is InstallRegister<UCH>;

  @ext(0x29, 0)
  model IsInParty is InstallRegister<onoff>;

  @ext(0x2a, 0)
  model IsInSingleHwcLoadingMode is InstallRegister<onoff>;

  @ext(0x2b, 0)
  model RestoreOpModeAfterHoliday is InstallRegister<onoff>;

  @ext(0x2c, 0)
  model IsInSavingsFunction is InstallRegister<onoff>;

  @inherit(r, wi)
  @ext(0x2d, 0)
  model SavingsFunctionTime {
    time: time;
    onoff: onoff;
  }

  @ext(0x2e, 0)
  model SwitchOffParty is InstallRegister<onoff>;

  @ext(0x2f, 0)
  model IsInTeleSwitch is InstallRegister<onoff>;

  @ext(0x30, 0)
  model IsInFloorPavingDrying is InstallRegister<onoff>;

  @ext(0x31, 0)
  model IsInQuickVeto is InstallRegister<onoff>;

  @ext(0x32, 0)
  model QuickVetoTemp is InstallRegister<temp>;

  @ext(0x33, 0)
  model StackeBUSTaskMax is InstallRegister<UCH>;

  @ext(0x34, 0)
  model StackMainTaskMax is InstallRegister<UCH>;

  @ext(0x35, 0)
  model StackLifeCheckTaskMax is InstallRegister<UCH>;

  @inherit(r, wi)
  @ext(0x36, 0)
  model Variant {
    @values(Values_Variant)
    value: ULG;
  }

  @ext(0x37, 0)
  model TimeWindows is InstallRegister<UIN>;

  @ext(0x38, 0)
  model EBUSCRC is InstallRegister<UCH>;

  @ext(0x39, 0)
  model HwcTempDesired is InstallRegister<temp>;

  @ext(0x3a, 0)
  model ComfTempEnabled is InstallRegister<onoff>;

  @inherit(r, wi)
  @ext(0x3b, 0)
  model ComfTempDesired {
    temp: temp;
    temp_1: temp;
    temp_2: temp;
    temp_3: temp;
  }

  @ext(0x3c, 0)
  model FrostProtectDelay is InstallRegister<UCH>;

  @ext(0x3d, 0)
  model HydraulicScheme is InstallRegister<UCH>;

  @inherit(r, wi)
  @ext(0x3e, 0)
  model SolHwcMaxLoadTemp {
    @maxLength(2)
    value: HEX;
  }

  @ext(0x3f, 0)
  model ONDiff is InstallRegister<UCH>;

  @ext(0x40, 0)
  model OffDiff is InstallRegister<UCH>;

  @ext(0x41, 0)
  model LegioProtectionEnabled is InstallRegister<yesno>;

  @ext(0x42, 0)
  model FillmodeStartTime is InstallRegister<UCH>;

  @ext(0x43, 0)
  model OperatingmodeStartTime is InstallRegister<UCH>;

  @ext(0x44, 0)
  model NumCollPanels is InstallRegister<UCH>;

  @ext(0x45, 0)
  model SolPumpBlockingTime is InstallRegister<UCH>;

  @ext(0x46, 0)
  model LoadingDelayEnabled is InstallRegister<onoff>;

  /** Solar flow rate [l/h] */
  @ext(0x47, 0)
  model SolFlowRate is InstallRegister<UIN>;

  @ext(0x48, 0)
  model EDControlEnabled is InstallRegister<onoff>;

  @ext(0x49, 0)
  model ResetYield is InstallRegister<onoff>;

  @ext(0x4a, 0)
  model ResetOperatingTimes is InstallRegister<onoff>;

  @ext(0x4b, 0)
  model PumpPower is InstallRegister<power>;

  @ext(0x4c, 0)
  model StartCircuitAeration is InstallRegister<onoff>;

  @ext(0x4d, 0)
  model HeatingCurve is InstallRegister<curve>;

  @ext(0x4e, 0)
  model ControlMode is InstallRegister<SCH>;

  @ext(0x4f, 0)
  model OtShutdownLimit is InstallRegister<temp>;

  @ext(0x50, 0)
  model FlowTempMin is InstallRegister<temp>;

  @ext(0x51, 0)
  model DisableAutoSync is InstallRegister<UCH>;

  @ext(0x52, 0)
  model ONMINDiff is InstallRegister<UCH>;

  @ext(0x53, 0)
  model ONMAXDiff is InstallRegister<UCH>;

  @ext(0x54, 0)
  model HydraulicMixer is InstallRegister<onoff>;

  @ext(0x55, 0)
  model EBUSFifoDiffCntMax is InstallRegister<UCH>;

  @ext(0x56, 0)
  model ZweipunktAnalogSlct is InstallRegister<UCH>;

  /** Actual roomtemperature setpoint [°C] */
  @ext(0x57, 0)
  model ActualRoomTempDesired is InstallRegister<temp>;

  @ext(0x58, 0)
  model WeekDayProgSwitch is InstallRegister<onoff>;

  @ext(0x59, 0)
  model OperatingModeHwc is InstallRegister<mcmode>;

  @ext(0x5a, 0)
  model RTCAdjustment is InstallRegister<SIN>;

  @ext(0x5b, 0)
  model EEpromMaxInkonsCnt is InstallRegister<UIN>;

  @ext(0x5c, 0)
  model POCResetCnt is InstallRegister<UIN>;

  @ext(0x5d, 0)
  model WDResetCnt is InstallRegister<UIN>;

  @ext(0x5e, 0)
  model LVResetCnt is InstallRegister<UIN>;

  @ext(0x5f, 0)
  model CMResetCnt is InstallRegister<UIN>;

  @ext(0x60, 0)
  model COMErrorCnt is InstallRegister<UIN>;

  @ext(0x61, 0)
  model VariantDKRefreshCnt is InstallRegister<UCH>;

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
    VRT_360_1: 0x69969669,
  }
  @condition(Id.Id.sw, "<=140")
  namespace Sw_le140 {
    /** actual room temperature [°C/Sensor state] */
    @ext(0xf, 0)
    model RoomTemp is InstallRegister<tempsensor>;
  }
  @condition(Id.Id.sw, ">=141")
  namespace Sw_ge141 {
    @ext(0x66, 0)
    model DisplayedRoomTemp is ServiceRegister<temp>;
  }
}
