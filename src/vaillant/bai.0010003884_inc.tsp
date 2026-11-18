import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010003884_inc {
  // ,BAI00,auroCOMPACT VSC S 196/2-C 200,0010003884
  // solar messages only: the rest of this device is covered by bai.308523 via id_hw=7401

  /** d.14 PumpspeedSetpoint: PWM pump speed */
  @ext(0xa, 0x4)
  model PumpspeedDesired is ReadonlyRegister<percent0>;

  /** d.38 TCollector_DK: Collector temperature */
  @ext(0x78, 0)
  model CollTemp is ReadonlyRegister<tempsensor>;

  /** d.39 TSolarBack_DK: Solar yield sensor */
  @ext(0x68, 0)
  model SolBackTemp is ReadonlyRegister<tempsensor>;

  /** d.42 TSB_DK: Temperature of tank bottom */
  @ext(0x6, 0)
  model SBTemp is ReadonlyRegister<tempsensor>;

  /** d.59 SolarYieldkWh_DK */
  @ext(0x72, 0)
  model Yield is ReadonlyRegister<energy>;

  /** SolarPump_DK: Modulation of solarpump */
  @ext(0x7d, 0)
  model SolPump is ReadonlyRegister<percent0>;
}
