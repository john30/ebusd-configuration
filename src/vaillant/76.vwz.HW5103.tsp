import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x76)
namespace Vwz.Hw5103 {
  /** default *r */
  @base(MF, 0x9, 0x54, 0x2, 0)
  model r_2 {
    @maxLength(4)
    value: IGN;
  }

  @inherit(r_2)
  @ext(0x6, 0x9)
  model ReturnFlowTemp {
    value: tempv;
  }

  @inherit(r_2)
  @ext(0x74, 0x9)
  model SystemPressure {
    value: pressv;
  }

  @inherit(r_2)
  @ext(0xad, 0xd)
  model ImmersionHeater {
    value: onoff;
  }

  @inherit(r_2)
  @ext(0xb6, 0x08)
  model CondensorOutletTemp {
    value: tempv;
  }

  @inherit(r_2)
  @ext(0xb8, 0xb)
  model VwzHours {
    @maxLength(2) ign: IGN;
    value: hoursum2;
  }

  @inherit(r_2)
  @ext(0xb9, 0xb)
  model VwzHoursHc {
    @maxLength(2) ign: IGN;
    value: hoursum2;
  }

  @inherit(r_2)
  @ext(0xbd, 0xb)
  model ImmersionHeaterHours {
    @maxLength(2) ign: IGN;
    value: hours;
  }

  @inherit(r_2)
  @ext(0xc0, 0xb)
  model ImmersionHeaterStarts {
    @maxLength(2) ign: IGN;
    value: cntstarts2;
  }

  @inherit(r_2)
  @ext(0xc1, 0xb)
  model PrioritySwitchingValveOps {
    @maxLength(2) ign: IGN;
    value: cntstarts2;
  }

  // @inherit(r_2)
  // @ext(0xc4, 0xb)
  // model BuildingCircuitPumpHours {
  //   @maxLength(2) ign: IGN;
  //   value: hours;
  // }

  // @inherit(r_2)
  // @ext(0xc5, 0x9)
  // model BuildingCircuitPumpPower {
  //   @unit("%")
  //   value: EXP;
  // }

  // @inherit(r_2)
  // @ext(0xc5, 0xb)
  // model BuildingCircuitPumpStarts {
  //   @maxLength(2) ign: IGN;
  //   value: cntstarts2;
  // }

  @inherit(r_2)
  @ext(0xfc, 0x8)
  model SupplyFlowTemp {
    value: tempv;
  }

  /** default *r */
  @base(MF, 0x14, 0x5)
  model r_3 {
    @maxLength(2)
    value: IGN;
  }

  @inherit(r_3)
  @ext(0x2, 0x3, 0xff, 0xff)
  model PrioritySwitchingValve {
    @maxLength(2) ign: IGN;
    value: switchvalve3;
  }

  @inherit(r_3)
  @ext(0x28, 0x03, 0xff, 0xff)
  model SupplyTemp {
    @divisor(10)
    value: temps2;
  }

  @inherit(r_3)
  @ext(0x29, 0x03, 0xff, 0xff)
  model ReturnTemp {
    @divisor(10)
    value: temps2;
  }

  @inherit(r_3)
  @ext(0x2c, 0x03, 0xff, 0xff)
  model HwcTemp {
    @divisor(10)
    value: temps2;
  }

  @inherit(r_3)
  @ext(0x7c, 0x03, 0xff, 0xff)
  model ElectricHeaterTempSwitch {
    value: openclose;
  }

  @inherit(r_3)
  @ext(0x7d, 0x03, 0xff, 0xff)
  model MI1Input {
    value: onoff;
  }

  @inherit(r_3)
  @ext(0x7e, 0x03, 0xff, 0xff)
  model MA2Output {
    value: onoff;
  }

  @inherit(r_3)
  @ext(0x7f, 0x03, 0xff, 0xff)
  model MA0Output {
    value: onoff;
  }

  @inherit(r_3)
  @ext(0x81, 0x03, 0xff, 0xff)
  model CondensorInletTemp {
    @divisor(10)
    value: temps2;
  }

  @inherit(r_3)
  @ext(0x82, 0x03, 0xff, 0xff)
  model ElectricHeaterSupplyTemp {
    @divisor(10)
    value: temps2;
  }
}
