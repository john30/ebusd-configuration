import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x52)
namespace Vr_70 {
  // ,VR_70,VR 70,109 109

  /** default *r */
  @base(MF, 0x23)
  model r_1 {}

  /** default *w */
  @write
  @base(MF, 0x23)
  model w_1 {}

  @inherit(w_1)
  @ext(1)
  model SetActorState {
    @values(Values_ActorState)
    r1: UCH;

    @values(Values_ActorState)
    r2: UCH;

    @values(Values_ActorState)
    r3: UCH;

    @values(Values_ActorState)
    r4: UCH;

    @values(Values_ActorState)
    r5: UCH;

    @values(Values_ActorState)
    r6: UCH;

    @values(Values_ActorState)
    s7: UCH;
  }

  @inherit(w_1)
  @ext(0x2, 0)
  model Mc1Operation {
    status: onoff;
    flowtempdesired: temp1;

    @in
    pump: onoff;

    @in
    mixer: percents;
  }

  @inherit(w_1)
  @ext(0x2, 1)
  model Mc2Operation {
    status: onoff;
    flowtempdesired: temp1;

    @in
    pump: onoff;

    @in
    mixer: percents;
  }

  @inherit(r_1)
  @ext(0x3)
  model SensorData {
    s1: temp;
    s2: temp;
    s3: temp;
    s4: temp;
    s5: temp;
    s6: temp;

    @maxLength(3)
    ignore: HEX;
  }

  enum Values_ActorState {
    off: 0,
    on: 20,
  }

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
