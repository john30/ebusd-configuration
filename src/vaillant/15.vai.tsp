import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace Vai {
  // ,VAI00,0124,0020015281 189

  /** room temperature */
  @ext(0, 0)
  model RoomTemp is Register<tempsensor>;

  /** ventilation mode */
  @ext(0x24, 0)
  model Mode is Register<mcmode>;

  /** temporary high duration */
  @ext(0x58, 0)
  model HighDuration is Register<minutes2>;

  /** cooling days */
  @ext(0x36, 0)
  model CoolDays is Register<days>;

  @values(Values_CoolState)
  scalar coolState extends UCH;

  /** cooling status */
  @ext(0xa, 0)
  model CoolState is ReadonlyRegister<coolState>;

  /** party mode */
  @ext(0x32, 0)
  model Party is ReadonlyRegister<onoff>;

  /** eco mode */
  @ext(0x4f, 0)
  model EcoMode is Register<onoff>;

  model ecountil {
    @maxLength(1) ign: IGN;
    value: time2;
  }
  /** save mode until */
  @ext(0x50, 0)
  model EcoModeUntil is Register<ecountil>;

  /** time suffixed with 0x00 */
  model timesuf {
    value: time;
    @maxLength(1) @constValue(0) ign: IGN;
  }

  /** time */
  @ext(0x2c, 0)
  model Time is Register<timesuf>;

  /** date suffixed with 0x00 */
  model datesuf {
    value: date;
    @maxLength(1) @constValue(0) ign: IGN;
  }

  /** date */
  @ext(0x2d, 0)
  model Date is Register<datesuf>;

  /** ventilation level in level 2 (day) */
  @ext(0x17, 0)
  model NormalFlow is Register<airflowrate>;

  /** ventilation level in level 1 (night) */
  @ext(0x18, 0)
  model ReducedFlow is Register<airflowrate>;

  /** ventilation level in level high */
  @ext(0x4a, 0)
  model IntenseFlow is Register<airflowrate>;

  /** ventilation level in level bypass */
  @ext(0x48, 0)
  model BypassFlow is Register<airflowrate>;

  /** ventilation level in level holiday */
  @ext(0x49, 0)
  model HolidayFlow is Register<airflowrate>;

  /** filter days */
  @ext(0x46, 0)
  model FilterDays is Register<days>;

  model filterdays {
    @maxValue(180)
    value: UIN;
  }

  /** days between two filter change alarms */
  @ext(0x45, 0)
  model FilterDaysAlarm is Register<filterdays>;

  /** total yield */
  @ext(0x4d, 0)
  model Yield is Register<energy>;

  enum Values_CoolState {
    heat: 1,
    cool: 2,
  }
}
