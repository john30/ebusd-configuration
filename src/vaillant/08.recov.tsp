import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x08)
namespace Recov {
  // ,recov,recoVair 260

  /** ventilation intensity day: 1-6 */
  @poll(2)
  @ext(0x8a, 0x3)
  model VentilationLevelDay is Register<UCH>;

  /** ventilation intensity night: 1-6 */
  @poll(2)
  @ext(0x8b, 0x3)
  model VentilationLevelNight is Register<UCH>;

  /** heat recovery */
  @inherit(r, w)
  @poll(2)
  @ext(0x8c, 0x3)
  model HeatRecovery {
    @values(Values_HeatRecovery)
    value: UCH;
  }

  /** frost protection element active */
  @poll(9)
  @ext(0xf1, 0xc)
  model FrostProtection is ReadonlyUpdateRegister<onoff>;

  /** current volume flow */
  @inherit(r, u)
  @poll(2)
  @ext(0x3, 0xe)
  model FlowActual {
    @unit("m3/h")
    value: UIN;
  }

  /** desired temperature */
  @ext(0x14, 0xe)
  model DesiredTemp is ReadonlyUpdateRegister<temp>;

  /** outside air temperature */
  @ext(0xc, 0xe)
  model OutsideAirTemp is ReadonlyUpdateRegister<tempsensor>;

  /** outgoing air temperature */
  @ext(0xd, 0xe)
  model ExitAirTemp is ReadonlyUpdateRegister<tempsensor>;

  /** exhaust air temperature */
  @ext(0xb4, 0xd)
  model ExhaustAirTemp is ReadonlyUpdateRegister<tempsensor>;

  /** relative humidity waste air */
  @poll(2)
  @ext(0x85, 0x3)
  model HumiWasteAir is ReadonlyUpdateRegister<percent>;

  /** supply air temperature */
  @ext(0xb3, 0xd)
  model SupplyAirTemp is ReadonlyUpdateRegister<tempsensor>;

  /** position of bypass flap */
  @inherit(r, u)
  @poll(9)
  @ext(0xb, 0xe)
  model BypassPosition {
    @divisor(10)
    value: UIN;
  }

  /** default *w */
  @write
  @base(MF, 0x22, 0)
  model w_1 {}

  /** Set Ventilation Day */
  @inherit(w_1)
  @ext(0x2, 0, 0xff, 0xff)
  model VentDay {}

  /** Set Ventilation Night */
  @inherit(w_1)
  @ext(1, 0, 0xff, 0xff)
  model VentNight {}

  /** Activate Boost Ventilation */
  @inherit(w_1)
  @ext(0x3, 0, 0xff, 0xff)
  model VentBoost {}

  enum Values_HeatRecovery {
    auto: 0,
    on: 1,
    off: 2,
  }
}
