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
    @values(Values_)
    r1: UCH;

    @values(Values__1)
    r2: UCH;

    @values(Values__2)
    r3: UCH;

    @values(Values__3)
    r4: UCH;

    @values(Values__4)
    r5: UCH;

    @values(Values__5)
    r6: UCH;

    @values(Values__6)
    s7: UCH;
  }

  @inherit(w_1)
  @ext(0x2, 0)
  model Mc1FlowTempDesired {
    FTStatus: onoff;
    FTDesired: temp1;

    @in
    MixerStatus: onoff;

    @in
    MixerMovement: percents;
  }

  @inherit(w_1)
  @ext(0x2, 1)
  model Mc2FlowTempDesired {
    FTStatus: onoff;
    FTDesired: temp1;

    @in
    MixerStatus: onoff;

    @in
    MixerMovement: percents;
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

  enum Values_ {
    off: 0,
    on: 20,
  }

  enum Values__1 {
    off: 0,
    on: 20,
  }

  enum Values__2 {
    off: 0,
    on: 20,
  }

  enum Values__3 {
    off: 0,
    on: 20,
  }

  enum Values__4 {
    off: 0,
    on: 20,
  }

  enum Values__5 {
    off: 0,
    on: 20,
  }

  enum Values__6 {
    off: 0,
    on: 20,
  }

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
