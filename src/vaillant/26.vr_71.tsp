import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
import "./b516_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x26)
namespace Vr_71 {
  // ,VR_71,VR 71,104 104

  /** default *r */
  @base(MF, 0x23)
  model r_1 {}

  /** default *w */
  @write
  @base(MF, 0x23)
  model w_1 {}

  @inherit(w_1)
  @ext(0x5)
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
    r7: UCH;

    @values(Values_ActorState)
    r8: UCH;

    @values(Values_ActorState)
    r9: UCH;

    @values(Values_ActorState)
    r10: UCH;

    @values(Values_ActorState)
    r11: UCH;

    @values(Values_ActorState)
    r12: UCH;

    @maxLength(2)
    Rx: HEX;
  }

  @inherit(w_1)
  @ext(0x2, 0)
  model Mc1Operation {
    @values(Values_McStatus)
    status: UCH;

    flowtempdesired: temp1;

    @in
    pump: onoff;

    @in
    mixer: percents;
  }

  @inherit(w_1)
  @ext(0x2, 1)
  model Mc2Operation {
    @values(Values_McStatus)
    status: UCH;

    flowtempdesired: temp1;

    @in
    pump: onoff;

    @in
    mixer: percents;
  }

  @inherit(w_1)
  @ext(0x2, 0x2)
  model Mc3Operation {
    @values(Values_McStatus)
    status: UCH;

    flowtempdesired: temp1;

    @in
    pump: onoff;

    @in
    mixer: percents;
  }

  @inherit(r_1)
  @ext(0x6)
  model SensorData1 {
    s1: temp;
    s2: temp;
    s3: temp;
    s4: temp;
    s5: temp;
    s6: temp;
    s7: temp;

    @maxLength(2)
    ignore: HEX;
  }

  @inherit(r_1)
  @ext(0x7)
  model SensorData2 {
    s8: temp;
    s9: temp;
    s10: temp;
    s11: temp;
    s12: temp;
    Sx: temp;

    @maxLength(3)
    ignore: HEX;
  }

  enum Values_ActorState {
    off: 0,
    on: 20,
  }

  /**
   * Mixer-circuit operation status. See issue #620.
   *
   * Value 4 is written by the controller in a short daily burst (~5 min) on
   * otherwise-off circuits — a "keep valve operable" maintenance run
   * (anti-seize).
   *
   * Value 2 occurs on cooling-capable systems while the circuit is cooling
   * (reported for a VR 71 + VRC 700 driving aroVAIR convectors: flow target
   * 10 °C at 2 versus 42.5-44 °C at 1). On those systems 1 therefore means
   * "heating" rather than a generic "on"; the label is kept as `on` because
   * this field used the shared `onoff` type before, and renaming it would
   * change the reported state for every existing installation.
   */
  enum Values_McStatus {
    off: 0,
    on: 1,
    cooling: 2,
    keepValveOperable: 4,
  }

  /** included parts */
  union _includes {
    Errors_inc,
    B516_inc,
  }
}
