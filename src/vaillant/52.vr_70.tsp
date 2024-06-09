import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x52)
namespace vr_70 {
  // ,VR_70,VR 70,109 109

  /** default *r */
  @base(MF, 0x23)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x23)
  model w {}

  @inherit(w)
  @ext(1)
  model SetActorState {
    @values(values_R1)
    r1: UCH;

    @values(values_R2)
    r2: UCH;

    @values(values_R3)
    r3: UCH;

    @values(values_R4)
    r4: UCH;

    @values(values_R5)
    r5: UCH;

    @values(values_R6)
    r6: UCH;

    @values(values_S7)
    s7: UCH;
  }

  @inherit(w)
  @ext(0x2, 0)
  model Mc1FlowTempDesired {
    FTStatus: onoff;
    FTDesired: temp1;

    @in
    MixerStatus: onoff;

    @in
    MixerMovement: percents;
  }

  @inherit(w)
  @ext(0x2, 1)
  model Mc2FlowTempDesired {
    FTStatus: onoff;
    FTDesired: temp1;

    @in
    MixerStatus: onoff;

    @in
    MixerMovement: percents;
  }

  @inherit(r)
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

  enum values_R1 {
    off: 0,
    on: 20,
  }

  enum values_R2 {
    off: 0,
    on: 20,
  }

  enum values_R3 {
    off: 0,
    on: 20,
  }

  enum values_R4 {
    off: 0,
    on: 20,
  }

  enum values_R5 {
    off: 0,
    on: 20,
  }

  enum values_R6 {
    off: 0,
    on: 20,
  }

  enum values_S7 {
    off: 0,
    on: 20,
  }

  /** included parts */
  union _includes {
    errors_inc,
  }
}
