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
  // ##### general #####

  /** OutsideTempSensor: current outdoor temperature and sensorstate */
  @ext(0x3, 0)
  model OutsideTemp is ReadonlyRegister<tempsensor>;

  /** OperatingMode: operating mode */
  @ext(0x5, 0)
  model OperatingMode is Register<mcmode>;

  /** ActualWeekday: current day of week */
  @ext(0x6, 0)
  model ActualWeekday is Register<bday>;

  /** current time */
  @ext(0x7, 0)
  model Time is Register<time>;

  /** ReducedNightTemp: drop temperature setpoint */
  @ext(0x8, 0)
  model ReducedNightTemp is Register<temp>;

  /** YearCalendarActive: enable calendar (=> automatic switching to and fro daylight savings time) */
  @ext(0xb, 0)
  model YearCalendarActive is InstallRegister<onoff>;

  /** current date (calendar must be enabled previously!) */
  @ext(0xd, 0)
  model Date is Register<date>;

  /** Heating curve: holiday function - remaining days */
  @ext(0x11, 0)
  model IsInHoliday is ReadonlyRegister<UCH>;

  /** IsInQuickVeto: temperature override (quick veto) */
  @ext(0x16, 0)
  model IsInQuickVeto is ReadonlyRegister<onoff>;

  /** QuickVetoTemp: room temperature setpoint during activated quick veto function */
  @ext(0x17, 0)
  model QuickVetoTemp is ReadonlyRegister<temp>;

  /** DesiredDHWTemp: DHW setpoint */
  @ext(0x1e, 0)
  model HwcTempDesired is Register<temp>;

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

  /** RaumtemperaturIstOffset: room temperature correction */
  @ext(0x2, 0)
  model RoomTempOffset is InstallRegister<temp>;

  /** OutDoorTempCorr: outside temperature correction */
  @ext(0x4, 0)
  model OutsideTempOffset is InstallRegister<temp>;

  /** heating curve (only relevant if an outside temperature sensor is connected to the BMU) */
  @ext(0x23, 0)
  model HeatingCurve is InstallRegister<curve>;

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

  /** MaxStackeBUSTask: maximum number of bytes needed for the eBUS task stack */
  @ext(0x18, 0)
  model StackeBUSTaskMax is ReadonlyRegister<UCH>;

  /** MaxStackMainTask: maximum number of bytes needed for the main task stack */
  @ext(0x19, 0)
  model StackMainTaskMax is ReadonlyRegister<UCH>;

  /** MaxStackLifeCheckTask: maximum number of bytes needed for the life check task stack */
  @ext(0x1a, 0)
  model StackLifeCheckTaskMax is ReadonlyRegister<UCH>;

  /** eBUSFifoDiffCntMax: max. eBUS-fifo level */
  @ext(0x28, 0)
  model EBUSFifoDiffCntMax is ReadonlyRegister<UCH>;

  /** RTCAdjustment: adjustment value for RTC-timer (add or subtract 1sec in RTC-synchronisation time every x minute(s); add: positive value; sub: negative value) */
  @ext(0x2c, 0)
  model RTCAdjustment is ReadonlyRegister<SIN>;

  /** EEpromMaxInkonsCnt: EEPROM inconsistency counter */
  @ext(0x2d, 0)
  model EEpromMaxInkonsCnt is ReadonlyRegister<UIN>;

  /** POCResetCnt: power on resets */
  @ext(0x2e, 0)
  model POCResetCnt is ReadonlyRegister<UIN>;

  /** WDResetCnt: watchdog resets */
  @ext(0x2f, 0)
  model WDResetCnt is ReadonlyRegister<UIN>;

  /** LVResetCnt: low voltage resets */
  @ext(0x30, 0)
  model LVResetCnt is ReadonlyRegister<UIN>;

  /** CMResetCnt: clock monitor resets */
  @ext(0x31, 0)
  model CMResetCnt is ReadonlyRegister<UIN>;

  /** COMErrorCnt: eBUS-communication errors */
  @ext(0x32, 0)
  model COMErrorCnt is ReadonlyRegister<UIN>;

  /** VariantDKRefreshCnt: counts how often variant ID has been corrected */
  @ext(0x33, 0)
  model VariantDKRefreshCnt is ReadonlyRegister<UCH>;

  /** RfCommErrorPending: radio communication fails */
  @ext(0x35, 0)
  model RfCommErrorPending is ReadonlyRegister<onoff>;

  /** BMU_ErrorStatus_DK: error status of the BMU */
  @ext(0x36, 0)
  model BMUErrorStatus is ReadonlyRegister<UCH>;

  /** BatteryError: low battery */
  @ext(0x37, 0)
  model BatteryError is ReadonlyRegister<onoff>;

  /** eBUSCommErrorPending: eBUS communication fails */
  @ext(0x39, 0)
  model EBUSCommErrorPending is ReadonlyRegister<onoff>;

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
    /** DisplayedRoomTemp: displayed room temperature */
    @ext(0x3e, 0)
    model DisplayedRoomTemp is ReadonlyRegister<temp>;
  }
  @condition(Id.Id.sw, "=102-131")
  namespace Sw_102_131 {
    /** RaumtemperaturIst: raw value current room temperature */
    @ext(0, 0)
    model RoomTemp is ReadonlyRegister<tempsensor>;
  }

  /** included parts */
  union _includes {
    Timerhc_inc,
    Errors_inc,
  }
}
