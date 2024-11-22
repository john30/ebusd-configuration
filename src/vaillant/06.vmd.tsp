import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x06)
namespace Vmd {
  // ,VMD01,VMS 8/D

  /** T5 Sensor: Solar collector Temperature */
  @ext(0x5, 0)
  model T5 is ReadonlyRegister<tempsensor>;

  /** T1 Sensor: Temperature in solar back flow (from solar collector) */
  @ext(0x7, 0)
  model T1 is ReadonlyRegister<tempsensor>;

  /** T7 Sensor: Average temperature in tank (computed from T6 and mid tank sensor values)) */
  @ext(0xc, 0)
  model T7 is ReadonlyRegister<tempsensor>;

  /** PowerOnCounter: Power On Counter (in hours) */
  @ext(0x19, 0)
  model PowerOnCounter is ReadonlyRegister<UIN>;

  /** T6 Sensor: Average temperature in tank (computed from T6 and mid tank sensor values)) */
  @ext(0xa1, 0)
  model T6 is ReadonlyRegister<tempsensor>;

  /** FlowRate */
  @inherit(r, wi)
  @ext(0x9e, 0)
  model FlowRate {
    /** chosen flow rate of the collector pump (to calculate solar gain) */
    @unit("l/min")
    @divisor(10)
    value: SIN;
  }
}
