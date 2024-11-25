import "@ebusd/ebus-typespec";
import "../_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Ochsner;

scalar group extends UCH;

scalar value extends BI0_7;

/** data type */
scalar type extends HEX;

scalar unit extends HEX;

/** maximum value */
scalar maxu extends UIN;

/** minimum value */
scalar minu extends UIN;

/** maximum value */
scalar maxs extends SIN;

/** minimum value */
scalar mins extends SIN;

model command {
  group: group;
  value: value;
  type: type;
  unit: unit;
}

/** parameter */
model param {
  command: command;
  max: maxs;
  min: mins;
}

/** temperature */
@unit("°C")
@divisor(10)
scalar tempt extends SIN;

@unit("%")
scalar humidity extends UIN;

scalar status extends UCH;

@unit("%")
@divisor(100)
scalar percent100 extends SIN;

/** heat pump status */
@values(Values_hpstatus)
scalar hpstatus extends UCH;

@divisor(10)
scalar volume extends UIN;

@unit("kWh")
@divisor(10)
scalar kwh extends UIN;

@unit("MWh")
scalar mwh extends UIN;

@unit("h")
scalar hours extends HCD;

@divisor(100)
scalar cycles extends HCD;

enum Values_hpstatus {
  off: 0,
  heat: 1,
  preload_heat: 2,
  extern_off: 3,
  cool: 4,
  preload_cool: 5,
  preload_defrost: 6,
  defrost: 7,
  error: 8,
  drain: 9,
  dT_monitor: 10,
  preheat_defrost: 11,
  defrost_1: 12,
  defrost_2: 13,
  defrost_3: 14,
  alarm: 15,
  error_1: 16,
  blocked: 17,
  tWVmax_shutdown: 21,
  tWVdesired_shutdown: 22,
  tWEmax_shutdown: 23,
  tWAmin_shutdown: 24,
  tKAmin_shutdown: 25,
  bivalence_shutdown: 26,
  hotwater_charge_lock: 27,
  minimal_offtime: 28,
  minimal_ontime: 29,
}
