import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x26)
namespace vr_71 {
  // ,VR_71,VR 71,104 104

  /** default *r */
  @base(MF, 0x23)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x23)
  model w {}

  @inherit(w)
  @ext(0x5)
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

    @values(values_R7)
    r7: UCH;

    @values(values_R8)
    r8: UCH;

    @values(values_R9)
    r9: UCH;

    @values(values_R10)
    r10: UCH;

    @values(values_R11)
    r11: UCH;

    @values(values_R12)
    r12: UCH;

    @maxLength(2)
    Rx: HEX;
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

  @inherit(w)
  @ext(0x2, 0x2)
  model Mc3FlowTempDesired {
    FTStatus: onoff;
    FTDesired: temp1;

    @in
    MixerStatus: onoff;

    @in
    MixerMovement: percents;
  }

  @inherit(r)
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

  @inherit(r)
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

  enum values_R7 {
    off: 0,
    on: 20,
  }

  enum values_R8 {
    off: 0,
    on: 20,
  }

  enum values_R9 {
    off: 0,
    on: 20,
  }

  enum values_R10 {
    off: 0,
    on: 20,
  }

  enum values_R11 {
    off: 0,
    on: 20,
  }

  enum values_R12 {
    off: 0,
    on: 20,
  }

  /** included parts */
  union _includes {
    errors_inc,
  }
}
