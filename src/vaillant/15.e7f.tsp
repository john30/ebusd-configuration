import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./timerhc_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace E7f {
  // ,E7f00,ExaCONTROL E7 radio,E7f00 206

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

  /** OutsideTempSensor */
  @inherit(r)
  @ext(0x3, 0)
  model OutsideTemp {
    /** current outdoor temperature and sensorstate */
    value: tempsensor;
  }

  /** OperatingMode */
  @inherit(r, w)
  @ext(0x5, 0)
  model OperatingMode {
    /** OperatingMode */
    value: mcmode;
  }

  /** Actual Weekday */
  @inherit(r, w)
  @ext(0x6, 0)
  model ActualWeekday {
    /** current day of week */
    value: bday;
  }

  /** time */
  @inherit(r, w)
  @ext(0x7, 0)
  model Time {
    /** current time */
    value: time;
  }

  /** ReducedNightTemp */
  @inherit(r, w)
  @ext(0x8, 0)
  model ReducedNightTemp {
    /** drop temperature setpoint */
    value: temp;
  }

  /** YearCalendarActive */
  @inherit(r, wi)
  @ext(0xb, 0)
  model YearCalendarActive {
    /** enable calendar (=> automatic switching to and fro daylight savings time) */
    value: onoff;
  }

  /** date */
  @inherit(r, w)
  @ext(0xd, 0)
  model Date {
    /** current date (calendar must be enabled previously!) */
    value: date;
  }

  /** Heating curve */
  @inherit(r)
  @ext(0x11, 0)
  model IsInHoliday {
    /** holiday function - remaining days */
    value: UCH;
  }

  /** IsInQuickVeto */
  @inherit(r)
  @ext(0x16, 0)
  model IsInQuickVeto {
    /** temperature override (quick veto) */
    value: onoff;
  }

  /** QuickVetoTemp */
  @inherit(r)
  @ext(0x17, 0)
  model QuickVetoTemp {
    /** room temperature setpoint during activated quick veto function */
    value: temp;
  }

  /** DesiredDHWTemp */
  @inherit(r, w)
  @ext(0x1e, 0)
  model HwcTempDesired {
    /** DHW setpoint */
    value: temp;
  }

  /** DesiredComfTemp */
  @inherit(r, w)
  @ext(0x20, 0)
  model ComfTempDesired {
    /** room temperature setpoint */
    temp: temp;

    temp_1: temp;
    temp_2: temp;
    temp_3: temp;
  }
  // ##### extra #####

  /** RaumtemperaturIstOffset */
  @inherit(r, wi)
  @ext(0x2, 0)
  model RoomTempOffset {
    /** room temperature correction */
    value: temp;
  }

  /** OutDoorTempCorr */
  @inherit(r, wi)
  @ext(0x4, 0)
  model OutsideTempOffset {
    /** outside temperature correction */
    value: temp;
  }

  /** Heating curve */
  @inherit(r, wi)
  @ext(0x23, 0)
  model HeatingCurve {
    /** heating curve (only relevant if an outside temperature sensor is connected to the BMU) */
    value: curve;
  }

  /** ZweipunktAnalogSlct */
  @inherit(r, wi)
  @ext(0x29, 0)
  model ZweipunktAnalogSlct {
    /** two-point / analogue control */
    @values(Values_ZweipunktAnalogSlct)
    value: UCH;
  }

  /** WeekDayProgSwitch */
  @inherit(r, wi)
  @ext(0x2b, 0)
  model WeekDayProgSwitch {
    /** switch from weekly program over to a daily one */
    @values(Values_WeekDayProgSwitch)
    value: UCH;
  }
  // ##### internal #####

  /** MaxStackeBUSTask */
  @inherit(r)
  @ext(0x18, 0)
  model StackeBUSTaskMax {
    /** maximum number of bytes needed for the eBUS task stack */
    value: UCH;
  }

  /** MaxStackMainTask */
  @inherit(r)
  @ext(0x19, 0)
  model StackMainTaskMax {
    /** maximum number of bytes needed for the main task stack */
    value: UCH;
  }

  /** MaxStackLifeCheckTask */
  @inherit(r)
  @ext(0x1a, 0)
  model StackLifeCheckTaskMax {
    /** maximum number of bytes needed for the life check task stack */
    value: UCH;
  }

  /** eBUSFifoDiffCntMax */
  @inherit(r)
  @ext(0x28, 0)
  model EBUSFifoDiffCntMax {
    /** max. eBUS-fifo level */
    value: UCH;
  }

  /** RTCAdjustment */
  @inherit(r)
  @ext(0x2c, 0)
  model RTCAdjustment {
    /** adjustment value for RTC-timer (add or subtract 1sec in RTC-synchronisation time every x minute(s); add: positive value; sub: negative value) */
    value: SIN;
  }

  /** EEpromMaxInkonsCnt */
  @inherit(r)
  @ext(0x2d, 0)
  model EEpromMaxInkonsCnt {
    /** EEPROM inconsistency counter */
    value: UIN;
  }

  /** POCResetCnt */
  @inherit(r)
  @ext(0x2e, 0)
  model POCResetCnt {
    /** power on resets */
    value: UIN;
  }

  /** WDResetCnt */
  @inherit(r)
  @ext(0x2f, 0)
  model WDResetCnt {
    /** watchdog resets */
    value: UIN;
  }

  /** LVResetCnt */
  @inherit(r)
  @ext(0x30, 0)
  model LVResetCnt {
    /** low voltage resets */
    value: UIN;
  }

  /** CMResetCnt */
  @inherit(r)
  @ext(0x31, 0)
  model CMResetCnt {
    /** clock monitor resets */
    value: UIN;
  }

  /** COMErrorCnt */
  @inherit(r)
  @ext(0x32, 0)
  model COMErrorCnt {
    /** eBUS-communication errors */
    value: UIN;
  }

  /** VariantDKRefreshCnt */
  @inherit(r)
  @ext(0x33, 0)
  model VariantDKRefreshCnt {
    /** counts how often variant ID has been corrected */
    value: UCH;
  }

  /** RfCommErrorPending */
  @inherit(r)
  @ext(0x35, 0)
  model RfCommErrorPending {
    /** radio communication fails */
    value: onoff;
  }

  /** BMU_ErrorStatus_DK */
  @inherit(r)
  @ext(0x36, 0)
  model BMUErrorStatus {
    /** error status of the BMU */
    value: UCH;
  }

  /** BatteryError */
  @inherit(r)
  @ext(0x37, 0)
  model BatteryError {
    /** low battery */
    value: onoff;
  }

  /** eBUSCommErrorPending */
  @inherit(r)
  @ext(0x39, 0)
  model EBUSCommErrorPending {
    /** eBUS communication fails */
    value: onoff;
  }

  enum Values_ZweipunktAnalogSlct {
    two_point_control: 0,
    analogue_control: 1,
  }

  enum Values_WeekDayProgSwitch {
    daily: 1,
    weekly: 7,
  }
  @condition(Id.Id.sw, ">=201")
  namespace Sw_ge201 {
    /** DisplayedRoomTemp */
    @inherit(r)
    @ext(0x3e, 0)
    model DisplayedRoomTemp {
      /** displayed room temperature */
      value: temp;
    }
  }
  @condition(Id.Id.sw, "=102-131")
  namespace Sw_102_131 {
    /** RaumtemperaturIst */
    @inherit(r)
    @ext(0, 0)
    model RoomTemp {
      /** raw value current room temperature */
      value: tempsensor;
    }
  }

  /** included parts */
  union _includes {
    Timerhc_inc,
    Errors_inc,
  }
}
