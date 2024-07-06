import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./timercc_inc.tsp";
import "./timerhwc_inc.tsp";
import "./errors_inc.tsp";
import "./timerhc_inc.tsp";
import "./tempsetpoints_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace _392 {
  // ,39200,VRT 392,39200 220
  // ##### general #####

  /** DisplayedRoomTemp: displayed room temperature */
  @ext(0x80, 0)
  model DisplayedRoomTemp is ReadonlyRegister<temp>;

  /** RaumtemperaturIst: raw value current room temperature and sensorstate (without any correction) */
  @ext(0, 0)
  model RoomTemp is ReadonlyRegister<tempsensor>;

  /** OutsideTempSensor: current outdoor temperature and sensorstate */
  @ext(0x62, 0)
  model OutsideTemp is ReadonlyRegister<tempsensor>;

  /** ActualWeekday: current day of week */
  @ext(0x5f, 0)
  model ActualWeekday is Register<bday>;

  /** current time */
  @ext(0x60, 0)
  model Time is Register<time>;

  /** current date */
  @ext(0x61, 0)
  model Date is Register<date>;

  /** StatusDcf: status of the DCF signal (0x00 = no DCF-Signal detected / no RTC value; 0x01 = DCF-signal detected; 0x02 = DCF-signal is being interpreted; 0x03 = DCF-data valid; 0x04 = RTC-data is valid) */
  @ext(0x2, 0)
  model StatusDcf is ReadonlyRegister<dcfstate>;

  /** Holiday function active: holidays active */
  @ext(0xb, 0)
  model IsInHoliday is ReadonlyRegister<yesno>;

  /** HC1_OPMode */
  @inherit(r, w)
  @ext(0x2f, 0)
  model Hc1OPMode {
    /** operation mode of the heating circuit */
    @values(Values_Hc1OPMode)
    value: UCH;
  }

  /** HC1_NightSetTemp: lowering temperature setpoint of the heating circuit */
  @ext(0x30, 0)
  model Hc1NightTemp is Register<temp1>;

  /** HC1_ManualOPRoomSetpoint: room setpoint in operation mode manual of the heating circuit */
  @ext(0x32, 0)
  model Hc1ManualOPRoomTempDesired is Register<temp1>;

  /** HC1_QuickVetoTemp: manual override setpoint of the heating circuit */
  @ext(0x3c, 0)
  model Hc1QuickVetoTemp is ReadonlyRegister<temp1>;

  /** HC1_QuickVetoActive: manual override of the heating circuit enabled */
  @ext(0x3d, 0)
  model Hc1QuickVetoActive is ReadonlyRegister<yesno>;

  /** Circuits_Name_HC */
  @inherit(r, w)
  @ext(0x3f, 0)
  model NameHc {
    /** labelling of the heating circuit */
    @maxLength(10)
    value: STR;
  }

  /** Circuits_Name_DHW */
  @inherit(r, w)
  @ext(0x3f, 0x78)
  model NameHwc {
    /** labelling of the domestic hot water circuit */
    @maxLength(10)
    value: STR;
  }

  /** HolidayRoomSetTemp: 4.5=frostprotect, room setpoint during holidays */
  @ext(0x40, 0)
  model HolidayRoomTemp is Register<D1C>;

  /** HolidayStartPeriod: start date of holidays */
  @ext(0x11, 0)
  model HolidayStartPeriod is Register<date>;

  /** HolidayEndPeriod: end date of holidays */
  @ext(0x12, 0)
  model HolidayEndPeriod is Register<date>;

  /** DHW_OPMode */
  @inherit(r, w)
  @ext(0x42, 0)
  model HwcOPMode {
    /** operation mode of the domestic hot water circuit */
    @values(Values_HwcOPMode)
    value: UCH;
  }

  /** DHW_DesiredTemp: setpoint of domestic hot water circuit */
  @ext(0x44, 0)
  model HwcTempDesired is Register<temp1>;

  /** DHW_QuickVetoTemp: manual override setpoint for the domestic hot water circuit */
  @ext(0x45, 0)
  model HwcQuickVetoTemp is ReadonlyRegister<temp1>;

  /** DHW_QuickVetoActive: manual override of the domestic hot water circuit enabled */
  @ext(0x43, 0)
  model HwcQuickVetoActive is ReadonlyRegister<yesno>;

  /** DHW_ManualOPSetpoint: setpoint of domestic hot water circuit in manual operation mode */
  @ext(0x4c, 0)
  model HwcManualOPTempDesired is Register<temp1>;

  /** SummerWinterTimeAdjust: enable automatic switching over to daylight saving's time (when a DCF receiver is connected to the BMU the value is set fix to ON) */
  @ext(0x53, 0)
  model SummerWinterTimeAdjust is Register<onoff>;

  /** DisplayedHK1RoomSetpoint: 0= >5°C, currently displayed room temperature setpoint */
  @ext(0x96, 0)
  model DisplayedHc1RoomTempDesired is ReadonlyRegister<temp1>;
  // ##### extra #####

  /** RoomTempCorrection: room temperature correction */
  @ext(0x57, 0)
  model RoomTempCorrection is InstallRegister<calibrations>;

  /** HC1_2stepanalogCtrl */
  @inherit(r, wi)
  @ext(0x36, 0)
  model Hc12stepanalogCtrl {
    /** two-point / analogue control */
    @values(Values_Hc12stepanalogCtrl)
    value: UCH;
  }

  /** HC1_LineMatchingAdaption: adjustment of closed loop control */
  @ext(0x37, 0)
  model Hc1LineMatchingAdaption is InstallRegister<SCH>;

  /** HC1ActualFlowSetPoint: calculated flow temperature setpoint of the heating circuit */
  @ext(0x3e, 0)
  model Hc1ActualFlowTempDesired is ReadonlyRegister<temp1>;

  /** DHW_LegioStartDay */
  @inherit(r, wi)
  @ext(0x49, 0)
  model HwcLegioStartDay {
    /** weekday on which legionella protection is started (may also be every day of the week) */
    @values(Values_HwcLegioStartDay)
    value: UCH;
  }

  /** DHW_LegioStartTime: time on which legionella protection is started */
  @ext(0x4a, 0)
  model HwcLegioStartTime is InstallRegister<time>;

  /** DHW_CircuitActive: domestic hot water circuit is enabled */
  @ext(0x4b, 0)
  model HwcCircuitActive is InstallRegister<yesno>;

  /** aucPhoneNumber_1: first part of the installer's telephone number */
  @ext(0x54, 0)
  model PhoneNumber1 is InstallRegister<phone>;

  /** aucPhoneNumber_2: second part of the installer's telephone number */
  @ext(0x54, 0x8)
  model PhoneNumber2 is InstallRegister<phone>;

  /** KeyCodeforConfigMenue */
  @inherit(r, wi)
  @ext(0x55, 0)
  model KeyCodeforConfigMenu {
    /** code for the installer's menues */
    @maxLength(4)
    value: HEX;
  }

  /** MaintenanceDate: date of the next maintenance service */
  @ext(0x59, 0)
  model MaintenanceDate is InstallRegister<date>;

  /** LcdContrastValue: setting of the LCD contrast */
  @ext(0x5a, 0)
  model LcdContrastValue is InstallRegister<UCH>;

  /** CircuPumpRunning: circulation pump's state */
  @ext(0x81, 0)
  model CirPump is ReadonlyRegister<onoff>;

  /** DHW_ActualDesired_Setpoint: current domestic hot water setpoint */
  @ext(0x86, 0)
  model HwcActualTempDesired is ReadonlyRegister<temp1>;
  // ##### developer's info #####

  /** StarteEepromAktualisierung: update of the EEPROM is to be started */
  @ext(0xe, 0)
  model StartEepromUpdate is ReadonlyRegister<onoff>;

  /** EepromAktualisierungAktiv: update of the EEPROM has been started */
  @ext(0xf, 0)
  model EepromUpdateActive is ReadonlyRegister<onoff>;

  /** RaumTempOffsetEigenErwaerm: room temperature intrinsic heating offset */
  @ext(0x15, 0)
  model RoomTempOffsetSelfWarming is ReadonlyRegister<temp>;

  /** CountryVariant: country variant (0 = west, 1 = east) */
  @ext(0x17, 0)
  model CountryVariant is ReadonlyRegister<UCH>;

  /** ActualRoomTempSetpointHC1: current room setpoint considering all basic conditions passed to the control algorithms */
  @ext(0x63, 0)
  model ActualRoomTempDesiredHc1 is ReadonlyRegister<temp>;

  /** HRUDetected: indicates that an airvent module / a heat recovery unit has been detected */
  @ext(0x6e, 0)
  model HRUDetected is ReadonlyRegister<yesno>;

  /** ACTOstorDetected: indicates that an ACTOstor has been detected */
  @ext(0x6f, 0)
  model ACTOstorDetected is ReadonlyRegister<yesno>;

  /** BMUB51101_ErrorStatus: error state of BMU received via eBUS service B51101 */
  @ext(0x70, 0)
  model BMUB51101ErrorStatus is ReadonlyRegister<UCH>;

  /** BMUB51101_TankTemp: hot water storage temperature received via eBUS service B5 11 01 */
  @ext(0x71, 0)
  model BMUB51101StorageTemp is ReadonlyRegister<temp1>;

  /** LegioProtectActive: legionella protection is active */
  @ext(0x73, 0)
  model LegioProtectActive is ReadonlyRegister<yesno>;

  /** BMUB51101_DHWState: flame is on because of either tapping or tank loading */
  @ext(0x75, 0)
  model BMUB51101HwcState is ReadonlyRegister<onoff>;

  /** EnermanState: current energy-manager-state (Off = 0, Heating = 1, DHW = 2, DHW pump lag = 3) */
  @ext(0x7a, 0)
  model EnermanState is ReadonlyRegister<UCH>;

  /** CP_LPLast24started: circulation respectively loading pump has been started during the last 24h */
  @ext(0x83, 0)
  model CPLPLast24started is ReadonlyRegister<yesno>;

  /** B51000FlowSetMonitor: flow temperature setpoint sent via B5 10 00 to the BMU */
  @ext(0x8d, 0)
  model B51000FlowSetMonitor is ReadonlyRegister<temp1>;

  /** ChimneySweepModeActive: chimney sweep mode has been enabled by the BMU */
  @ext(0x90, 0)
  model ChimneySweepModeActive is ReadonlyRegister<yesno>;

  enum Values_Hc1OPMode {
    off: 0,
    manual: 1,
    auto: 2,
  }

  enum Values_HwcOPMode {
    off: 0,
    manual: 1,
    auto: 2,
  }

  enum Values_Hc12stepanalogCtrl {
    two_point_control: 0,
    analogue_control: 1,
  }

  enum Values_HwcLegioStartDay {
    Mon: 0,
    Tue: 1,
    Wed: 2,
    Thu: 3,
    Fri: 4,
    Sat: 5,
    Sun: 6,
    off: 7,
    Mon_Sun: 8,
  }
  @condition(Id.Id.sw, ">=125")
  namespace Sw_ge125 {
    /** DisplayedDHWTankTemperature: display of the storage's temperature in C4 (also in case of an SP1 error) */
    @ext(0x9e, 0)
    model DisplayedHwcStorageTemp is ReadonlyRegister<temp1>;

    /** DHWLoadingInBMUActive: indicates that BMU is in DHW preparation */
    @ext(0x9d, 0)
    model HwcLoadingInBMUActive is ReadonlyRegister<yesno>;

    /** MonitorEEpromInkonsiNumber */
    @inherit(r)
    @ext(0x9f, 0)
    model MonitorEEpromInkonsiNumber {
      /** identification of the last eight EEPROM inconsistencies */
      @maxLength(8)
      value: HEX;
    }
  }
  @condition(Id.Id.sw, "<=209")
  namespace Sw_le209 {
    /** B51000CHDisableMonitor: copy of the M12 byte of the B5 10 00 service containing the disable bits */
    @ext(0x8e, 0)
    model B51000HcDisableMonitor is ReadonlyRegister<UCH>;
  }
  @condition(Id.Id.sw, ">=210")
  namespace Sw_ge210 {
    /** B51000M7OpModeMonitor: operation mode sent via B5 10 00 (0 = auto, 1 = forced off, 2 = forced CH, 3 = forced DHW) */
    @ext(0x65, 0)
    model B51000M7OpModeMonitor is ReadonlyRegister<UCH>;

    /** B51000M10DHWFlowSetMon: flow setpoint DHW sent via B5 10 00 */
    @ext(0x66, 0)
    model B51000M10HwcFlowSetMon is ReadonlyRegister<UCH>;

    /** B51000M12DisableBitsMon: bits 0-7: disable CH/disable DHW tapping/disable DHW tank loading/not used/clear burner blocking DHW/dis, disable bits sent via B5 10 00 (leftmost bit 0, rightmost bit 7) */
    @ext(0x67, 0)
    model B51000M12DisableBitsMon is ReadonlyRegister<UCH>;

    /** B51000M14Monitor: bits 0-7: remote control CH pump/release backup heater/release cooling/not used/left stop position DHW o, bits sent in M14 of B5 10 00 (leftmost bit 0, rightmost bit 7; relevant is bit 0: remote control of CH pump) */
    @ext(0x68, 0)
    model B51000M14Monitor is ReadonlyRegister<UCH>;
  }
  @condition(Id.Id.sw, ">=126")
  namespace Sw_ge126 {
    /** AssertFileName */
    @inherit(r)
    @ext(0xa0, 0)
    model AssertFileName {
      /** shows, if assert is enabled, the name of the module where the 'assert fail' occured */
      @maxLength(10)
      value: STR;
    }

    /** AssertLineNumber: assert fail occured in this line */
    @ext(0xa1, 0)
    model AssertLineNumber is ReadonlyRegister<UIN>;
  }

  /** included parts */
  union _includes {
    Timercc_inc,
    Timerhwc_inc,
    Errors_inc,
    Timerhc_inc,
    Tempsetpoints_inc,
  }
}
