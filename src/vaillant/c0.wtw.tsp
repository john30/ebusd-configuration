import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

@zz(0xc0)
namespace Wtw {
  // ,WTW04,0124,1000535200 190

  /** room temperature */
  @ext(0, 0)
  model RoomTemp is Register<tempsensor>;

  /** Supply air inlet temperature */
  @ext(1, 0)
  model AirInletTemp is ReadonlyUpdateRegister<tempsensor>;

  /** Supply air outlet temperature */
  @ext(0x2, 0)
  model AirOutletTemp is ReadonlyUpdateRegister<tempsensor>;

  /** Exhaust air inlet temperature */
  @ext(0x3, 0)
  model ExhaustAirInletTemp is ReadonlyUpdateRegister<tempsensor>;

  /** Exhaust air outlet temperature */
  @ext(0x4, 0)
  model ExhaustAirOutletTemp is ReadonlyUpdateRegister<tempsensor>;

  @values(Values_bypass)
  scalar bypass extends UCH;

  enum Values_bypass {
    auto: 0,
    off: 1,
    on: 2,
  }

  /** Bypass status */
  @ext(0xa, 0)
  model BypassValve is Register<bypass>;

  // @unit("m3/h")
  // @divisor(3.333) // todo not possible to have this divisor yet (900=270qm/h, 166=50qm/h), thus using l/s instead
  @unit("l/s")
  @divisor(12) // 900=75l/s, 166=13.8l/s, factor to get qm/h is 3.6
  @minValue(13) @maxValue(112) @step(5)
  scalar ventilation extends UIN;

  /** ventilation level */
  @ext(0x15, 0)
  model Ventilation is Register<ventilation>;

  /** volume flow correction */
  @ext(0x20, 0)
  model FlowCorrection is Register<D1B>;

  /** bypass position */
  @ext(0x9, 0)
  model BypassPos is ReadonlyUpdateRegister<percent0>;

  /** frost protection */
  @ext(0x47, 0)
  model FrostProtection is Register<onoff>;

  /** filter days */
  @ext(0x46, 0)
  model FilterDays is UpdateRegister<days>;

  /** days between two filter change alarms */
  @ext(0x45, 0)
  model FilterDaysAlarm is ReadonlyUpdateRegister<days>;

  /** total yield */
  @ext(0x4d, 0)
  model Yield is UpdateRegister<energy>;

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
