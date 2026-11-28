import "@ebusd/ebus-typespec";
import "../_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Wolf;
alias MF = 0x50; // Ebus.Id.Values_manufacturers.Kromschröder

/** temperature */
@unit("°C")
@divisor(10)
scalar temp10 extends UIN;

/** signed temperature, e.g. outside temperature */
@unit("°C")
@divisor(10)
scalar stemp10 extends SIN;

/** water pressure */
@unit("bar")
@divisor(100)
scalar press100 extends UIN;

/** percent */
@unit("%")
scalar percent extends UIN;

/** minutes */
@unit("min")
scalar minutes extends UIN;

/** hours */
@unit("h")
scalar hours extends UIN;

@unit("U/sec")
scalar speed extends UIN;

/** default *r for register */
@base(MF, 0x22, 0x00) // todo 0x00 should rather be crc8 of following bytes, see https://github.com/john30/ebusd/issues/167
model regr {}

/** default *w for register */
@write(true)
@base(MF, 0x23, 0x00)
model regw {}

/** read/write register */
@inherit(regr, regw) //todo first byte of ext always 0x0 on write
model Register<T, suffixValue extends valueof string = "9d010000"> {
  value: T;

  @maxLength(4)
  @out(true)
  @constValue(suffixValue)
  suffix: HEX;
}

/** read only register */
@inherit(regr)
model ReadonlyRegister<T> {
  value: T;
}

/** error code as displayed with parameters HG 80 to HG 89 (source: Wolf installation manual) */
enum Values_errorcode {
  /** flow temperature exceeded the TBV shutdown limit */
  tbv_overheat: 0x01,

  /** no flame on burner start */
  no_flame: 0x04,

  /** flame lost during operation */
  flame_loss: 0x05,

  /** flow/return temperature exceeded the TW shutdown limit */
  tw_overheat: 0x06,

  /** max flue gas temperature exceeded */
  tba_overheat: 0x07,

  /** flue gas damper faulty */
  damper: 0x08,

  /** flow sensor 2 faulty */
  flow2_sensor: 0x0a,

  /** flame detected before burner start */
  fake_flame: 0x0b,

  /** flow sensor 1 faulty */
  flow1_sensor: 0x0c,

  /** hot water storage sensor faulty */
  hwc_sensor: 0x0e,

  /** outside temperature sensor faulty */
  outside_sensor: 0x0f,

  /** lack of air (differential pressure switch) */
  air: 0x16,

  /** differential pressure switch failed to switch off */
  diffpressure: 0x17,

  /** gas blower did not reach target speed */
  blower_speed: 0x19,

  /** gas blower did not stop */
  blower_stop: 0x1a,

  /** water pressure switch triggered */
  pressureswitch: 0x28,

  /** flow temperature 1 more than 12 K above flow temperature 2 */
  flowcheck: 0x29,

  /** flow rate sensor faulty */
  flowsensor: 0x2d,

  /** hot water outlet temperature sensor faulty */
  hwcflow_sensor: 0x2e,

  /** hot water loading time exceeded */
  loadingtime: 0x34,

  /** manifold sensor faulty */
  manifold_sensor: 0x4e,
}

/** burner operation mode as broadcast with PBSB 0x0503 */
enum Values_burnermode {
  off: 0x00,
  start: 0x03,
  ignition: 0x06,
  on: 0x07,
  fault: 0x08,
  shutdown: 0x0a,
}
