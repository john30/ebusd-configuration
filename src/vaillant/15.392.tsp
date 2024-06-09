import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./timercc_inc.tsp";
import "./timerhwc_inc.tsp";
import "./errors_inc.tsp";
import "./timerhc_inc.tsp";
import "./tempsetpoints_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x15)
namespace _392 {
  // ,39200,VRT 392,39200 220

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
  // ##### general #####

  /** DisplayedRoomTemp */
  @inherit(r)
  @ext(0x80, 0)
  model DisplayedRoomTemp {
    /** displayed room temperature */
    value: temp;
  }

  /** RaumtemperaturIst */
  @inherit(r)
  @ext(0, 0)
  model RoomTemp {
    /** raw value current room temperature and sensorstate (without any correction) */
    value: tempsensor;
  }

  /** OutsideTempSensor */
  @inherit(r)
  @ext(0x62, 0)
  model OutsideTemp {
    /** current outdoor temperature and sensorstate */
    value: tempsensor;
  }

  /** Actual Weekday */
  @inherit(r, w)
  @ext(0x5f, 0)
  model ActualWeekday {
    /** current day of week */
    value: bday;
  }

  /** time */
  @inherit(r, w)
  @ext(0x60, 0)
  model Time {
    /** current time */
    value: time;
  }

  /** date */
  @inherit(r, w)
  @ext(0x61, 0)
  model Date {
    /** current date */
    value: date;
  }

  /** StatusDcf */
  @inherit(r)
  @ext(0x2, 0)
  model StatusDcf {
    /** status of the DCF signal (0x00 = no DCF-Signal detected / no RTC value; 0x01 = DCF-signal detected; 0x02 = DCF-signal is being interpreted; 0x03 = DCF-data valid; 0x04 = RTC-data is valid) */
    value: dcfstate;
  }

  /** Holiday function active */
  @inherit(r)
  @ext(0xb, 0)
  model IsInHoliday {
    /** holidays active */
    value: yesno;
  }

  /** HC1_OPMode */
  @inherit(r, w)
  @ext(0x2f, 0)
  model Hc1OPMode {
    /** operation mode of the heating circuit */
    @values(values_Hc1OPMode)
    value: UCH;
  }

  /** HC1_NightSetTemp */
  @inherit(r, w)
  @ext(0x30, 0)
  model Hc1NightTemp {
    /** lowering temperature setpoint of the heating circuit */
    value: temp1;
  }

  /** HC1_ManualOPRoomSetpoint */
  @inherit(r, w)
  @ext(0x32, 0)
  model Hc1ManualOPRoomTempDesired {
    /** room setpoint in operation mode manual of the heating circuit */
    value: temp1;
  }

  /** HC1_QuickVetoTemp */
  @inherit(r)
  @ext(0x3c, 0)
  model Hc1QuickVetoTemp {
    /** manual override setpoint of the heating circuit */
    value: temp1;
  }

  /** HC1_QuickVetoActive */
  @inherit(r)
  @ext(0x3d, 0)
  model Hc1QuickVetoActive {
    /** manual override of the heating circuit enabled */
    value: yesno;
  }

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

  /** HolidayRoomSetTemp */
  @inherit(r, w)
  @ext(0x40, 0)
  model HolidayRoomTemp {
    /** 4.5=frostprotect, room setpoint during holidays */
    value: D1C;
  }

  /** HolidayStartPeriod */
  @inherit(r, w)
  @ext(0x11, 0)
  model HolidayStartPeriod {
    /** start date of holidays */
    value: date;
  }

  /** HolidayEndPeriod */
  @inherit(r, w)
  @ext(0x12, 0)
  model HolidayEndPeriod {
    /** end date of holidays */
    value: date;
  }

  /** DHW_OPMode */
  @inherit(r, w)
  @ext(0x42, 0)
  model HwcOPMode {
    /** operation mode of the domestic hot water circuit */
    @values(values_HwcOPMode)
    value: UCH;
  }

  /** DHW_DesiredTemp */
  @inherit(r, w)
  @ext(0x44, 0)
  model HwcTempDesired {
    /** setpoint of domestic hot water circuit */
    value: temp1;
  }

  /** DHW_QuickVetoTemp */
  @inherit(r)
  @ext(0x45, 0)
  model HwcQuickVetoTemp {
    /** manual override setpoint for the domestic hot water circuit */
    value: temp1;
  }

  /** DHW_QuickVetoActive */
  @inherit(r)
  @ext(0x43, 0)
  model HwcQuickVetoActive {
    /** manual override of the domestic hot water circuit enabled */
    value: yesno;
  }

  /** DHW_ManualOPSetpoint */
  @inherit(r, w)
  @ext(0x4c, 0)
  model HwcManualOPTempDesired {
    /** setpoint of domestic hot water circuit in manual operation mode */
    value: temp1;
  }

  /** SummerWinterTimeAdjust */
  @inherit(r, w)
  @ext(0x53, 0)
  model SummerWinterTimeAdjust {
    /** enable automatic switching over to daylight saving's time (when a DCF receiver is connected to the BMU the value is set fix to ON) */
    value: onoff;
  }

  @condition(id.id.sw, ">=125")
  namespace sw__125 {
    /** DisplayedDHWTankTemperature */
    @inherit(r)
    @ext(0x9e, 0)
    model DisplayedHwcStorageTemp {
      /** display of the storage's temperature in C4 (also in case of an SP1 error) */
      value: temp1;
    }
  }

  /** DisplayedHK1RoomSetpoint */
  @inherit(r)
  @ext(0x96, 0)
  model DisplayedHc1RoomTempDesired {
    /** 0= >5°C, currently displayed room temperature setpoint */
    value: temp1;
  }
  // ##### extra #####

  /** RoomTempCorrection */
  @inherit(r, wi)
  @ext(0x57, 0)
  model RoomTempCorrection {
    /** room temperature correction */
    value: calibrations;
  }

  /** HC1_2stepanalogCtrl */
  @inherit(r, wi)
  @ext(0x36, 0)
  model Hc12stepanalogCtrl {
    /** two-point / analogue control */
    @values(values_Hc12stepanalogCtrl)
    value: UCH;
  }

  /** HC1_LineMatchingAdaption */
  @inherit(r, wi)
  @ext(0x37, 0)
  model Hc1LineMatchingAdaption {
    /** adjustment of closed loop control */
    value: SCH;
  }

  /** HC1ActualFlowSetPoint */
  @inherit(r)
  @ext(0x3e, 0)
  model Hc1ActualFlowTempDesired {
    /** calculated flow temperature setpoint of the heating circuit */
    value: temp1;
  }

  /** DHW_LegioStartDay */
  @inherit(r, wi)
  @ext(0x49, 0)
  model HwcLegioStartDay {
    /** weekday on which legionella protection is started (may also be every day of the week) */
    @values(values_HwcLegioStartDay)
    value: UCH;
  }

  /** DHW_LegioStartTime */
  @inherit(r, wi)
  @ext(0x4a, 0)
  model HwcLegioStartTime {
    /** time on which legionella protection is started */
    value: time;
  }

  /** DHW_CircuitActive */
  @inherit(r, wi)
  @ext(0x4b, 0)
  model HwcCircuitActive {
    /** domestic hot water circuit is enabled */
    value: yesno;
  }

  /** aucPhoneNumber_1 */
  @inherit(r, wi)
  @ext(0x54, 0)
  model PhoneNumber1 {
    /** first part of the installer's telephone number */
    @maxLength(9)
    value: STR;
  }

  /** aucPhoneNumber_2 */
  @inherit(r, wi)
  @ext(0x54, 0x8)
  model PhoneNumber2 {
    /** second part of the installer's telephone number */
    @maxLength(9)
    value: STR;
  }

  /** KeyCodeforConfigMenue */
  @inherit(r, wi)
  @ext(0x55, 0)
  model KeyCodeforConfigMenu {
    /** code for the installer's menues */
    @maxLength(4)
    value: HEX;
  }

  /** MaintenanceDate */
  @inherit(r, wi)
  @ext(0x59, 0)
  model MaintenanceDate {
    /** date of the next maintenance service */
    value: date;
  }

  /** LcdContrastValue */
  @inherit(r, wi)
  @ext(0x5a, 0)
  model LcdContrastValue {
    /** setting of the LCD contrast */
    value: UCH;
  }

  /** CircuPumpRunning */
  @inherit(r)
  @ext(0x81, 0)
  model CirPump {
    /** circulation pump's state */
    value: onoff;
  }

  /** DHW_ActualDesired_Setpoint */
  @inherit(r)
  @ext(0x86, 0)
  model HwcActualTempDesired {
    /** current domestic hot water setpoint */
    value: temp1;
  }
  // ##### developer's info #####

  /** StarteEepromAktualisierung */
  @inherit(r)
  @ext(0xe, 0)
  model StartEepromUpdate {
    /** update of the EEPROM is to be started */
    value: onoff;
  }

  /** EepromAktualisierungAktiv */
  @inherit(r)
  @ext(0xf, 0)
  model EepromUpdateActive {
    /** update of the EEPROM has been started */
    value: onoff;
  }

  /** RaumTempOffsetEigenErwaerm */
  @inherit(r)
  @ext(0x15, 0)
  model RoomTempOffsetSelfWarming {
    /** room temperature intrinsic heating offset */
    value: temp;
  }

  /** CountryVariant */
  @inherit(r)
  @ext(0x17, 0)
  model CountryVariant {
    /** country variant (0 = west, 1 = east) */
    value: UCH;
  }

  /** ActualRoomTempSetpointHC1 */
  @inherit(r)
  @ext(0x63, 0)
  model ActualRoomTempDesiredHc1 {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    value: temp;
  }

  /** HRUDetected */
  @inherit(r)
  @ext(0x6e, 0)
  model HRUDetected {
    /** indicates that an airvent module / a heat recovery unit has been detected */
    value: yesno;
  }

  /** ACTOstorDetected */
  @inherit(r)
  @ext(0x6f, 0)
  model ACTOstorDetected {
    /** indicates that an ACTOstor has been detected */
    value: yesno;
  }

  /** BMUB51101_ErrorStatus */
  @inherit(r)
  @ext(0x70, 0)
  model BMUB51101ErrorStatus {
    /** error state of BMU received via eBUS service B51101 */
    value: UCH;
  }

  /** BMUB51101_TankTemp */
  @inherit(r)
  @ext(0x71, 0)
  model BMUB51101StorageTemp {
    /** hot water storage temperature received via eBUS service B5 11 01 */
    value: temp1;
  }

  /** LegioProtectActive */
  @inherit(r)
  @ext(0x73, 0)
  model LegioProtectActive {
    /** legionella protection is active */
    value: yesno;
  }

  /** BMUB51101_DHWState */
  @inherit(r)
  @ext(0x75, 0)
  model BMUB51101HwcState {
    /** flame is on because of either tapping or tank loading */
    value: onoff;
  }

  /** EnermanState */
  @inherit(r)
  @ext(0x7a, 0)
  model EnermanState {
    /** current energy-manager-state (Off = 0, Heating = 1, DHW = 2, DHW pump lag = 3) */
    value: UCH;
  }

  /** CP_LPLast24started */
  @inherit(r)
  @ext(0x83, 0)
  model CPLPLast24started {
    /** circulation respectively loading pump has been started during the last 24h */
    value: yesno;
  }

  /** B51000FlowSetMonitor */
  @inherit(r)
  @ext(0x8d, 0)
  model B51000FlowSetMonitor {
    /** flow temperature setpoint sent via B5 10 00 to the BMU */
    value: temp1;
  }

  @condition(id.id.sw, "<=209")
  namespace sw__209 {
    /** B51000CHDisableMonitor */
    @inherit(r)
    @ext(0x8e, 0)
    model B51000HcDisableMonitor {
      /** copy of the M12 byte of the B5 10 00 service containing the disable bits */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=210")
  namespace sw__210 {
    /** B51000M7OpModeMonitor */
    @inherit(r)
    @ext(0x65, 0)
    model B51000M7OpModeMonitor {
      /** operation mode sent via B5 10 00 (0 = auto, 1 = forced off, 2 = forced CH, 3 = forced DHW) */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=210")
  namespace sw__210 {
    /** B51000M10DHWFlowSetMon */
    @inherit(r)
    @ext(0x66, 0)
    model B51000M10HwcFlowSetMon {
      /** flow setpoint DHW sent via B5 10 00 */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=210")
  namespace sw__210 {
    /** B51000M12DisableBitsMon */
    @inherit(r)
    @ext(0x67, 0)
    model B51000M12DisableBitsMon {
      /** bits 0-7: disable CH/disable DHW tapping/disable DHW tank loading/not used/clear burner blocking DHW/dis, disable bits sent via B5 10 00 (leftmost bit 0, rightmost bit 7) */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=210")
  namespace sw__210 {
    /** B51000M14Monitor */
    @inherit(r)
    @ext(0x68, 0)
    model B51000M14Monitor {
      /** bits 0-7: remote control CH pump/release backup heater/release cooling/not used/left stop position DHW o, bits sent in M14 of B5 10 00 (leftmost bit 0, rightmost bit 7; relevant is bit 0: remote control of CH pump) */
      value: UCH;
    }
  }

  /** ChimneySweepModeActive */
  @inherit(r)
  @ext(0x90, 0)
  model ChimneySweepModeActive {
    /** chimney sweep mode has been enabled by the BMU */
    value: yesno;
  }

  @condition(id.id.sw, ">=125")
  namespace sw__125 {
    /** DHWLoadingInBMUActive */
    @inherit(r)
    @ext(0x9d, 0)
    model HwcLoadingInBMUActive {
      /** indicates that BMU is in DHW preparation */
      value: yesno;
    }
  }

  @condition(id.id.sw, ">=125")
  namespace sw__125 {
    /** MonitorEEpromInkonsiNumber */
    @inherit(r)
    @ext(0x9f, 0)
    model MonitorEEpromInkonsiNumber {
      /** identification of the last eight EEPROM inconsistencies */
      @maxLength(8)
      value: HEX;
    }
  }

  @condition(id.id.sw, ">=126")
  namespace sw__126 {
    /** AssertFileName */
    @inherit(r)
    @ext(0xa0, 0)
    model AssertFileName {
      /** shows, if assert is enabled, the name of the module where the 'assert fail' occured */
      @maxLength(10)
      value: STR;
    }
  }

  @condition(id.id.sw, ">=126")
  namespace sw__126 {
    /** AssertLineNumber */
    @inherit(r)
    @ext(0xa1, 0)
    model AssertLineNumber {
      /** assert fail occured in this line */
      value: UIN;
    }
  }

  enum values_Hc1OPMode {
    off: 0,
    manual: 1,
    auto: 2,
  }

  enum values_HwcOPMode {
    off: 0,
    manual: 1,
    auto: 2,
  }

  enum values_Hc12stepanalogCtrl {
    two_point_control: 0,
    analogue_control: 1,
  }

  enum values_HwcLegioStartDay {
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

  /** included parts */
  union _includes {
    timercc_inc,
    timerhwc_inc,
    errors_inc,
    timerhc_inc,
    tempsetpoints_inc,
  }
}
