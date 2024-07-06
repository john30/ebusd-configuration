import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hcmode_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x08)
namespace Hmu {
  /** default *r */
  @base(MF, 0x11)
  model r_1 {}

  @inherit(r_1)
  @ext(0x7)
  model State {
    energy: UCH;

    @unit("kWh")
    energy_1: energy;

    @values(Values_onoff)
    onoff: UCH;

    @values(Values_state)
    state: UCH;
  }
  // Heatpump statistics

  /** default *r */
  @base(MF, 0x1a, 0x5, 0xff, 0x32)
  model r_2 {
    @maxLength(3)
    value: IGN;
  }

  @inherit(r_2)
  @ext(0)
  model EnergyHc {
    value: energy;
  }

  @inherit(r_2)
  @ext(1)
  model EnergyCool {
    value: energy;
  }

  @inherit(r_2)
  @ext(0x40)
  model Hours {
    value: energy;
  }

  @inherit(r_2)
  @ext(0x41)
  model HoursHc {
    value: energy;
  }

  @inherit(r_2)
  @ext(0x43)
  model HoursCool {
    value: energy;
  }
  // some more statistics from Live Monitor

  @inherit(r_2)
  @ext(0x21)
  model EnergyIntegral {
    /** current energy integral in °min */
    @unit("°min")
    value: integral;
  }

  @inherit(r_2)
  @ext(0x23)
  model CurrentYieldPower {
    /** current yielded energy from the environment in kW */
    @unit("kW")
    @divisor(10)
    value: D1B;
  }

  @inherit(r_2)
  @ext(0x24)
  model CurrentConsumedPower {
    /** current power consumption of the heatpump in kW */
    @unit("kW")
    @divisor(10)
    value: D1B;
  }

  @inherit(r_2)
  @ext(0x25)
  model CurrentCompressorUtil {
    /** current compressor utilization in percent */
    @unit("%")
    value: D1B;
  }
  // Total heating yields

  /** default *r */
  @base(MF, 0x16, 0x18)
  model r_3 {
    @maxLength(1)
    value: IGN;
  }

  @inherit(r_3)
  @ext(1)
  model YieldTotal {
    value: energy;
  }
  // Total electric power consumption

  @inherit(r_3)
  @ext(0x2)
  model ConsumptionTotal {
    value: energy;
  }
  // Ecologic energy Yields

  /** default *r */
  @base(MF, 0x16, 0x1a, 1)
  model r_4 {
    @maxLength(1)
    value: IGN;
  }

  @inherit(r_4)
  @ext(1, 0)
  model YieldThisYear1 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_4)
  @ext(0x2, 0)
  model YieldThisYear2 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_4)
  @ext(0x3, 0)
  model YieldThisYear3 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_4)
  @ext(0x4, 0)
  model YieldThisYear4 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_4)
  @ext(0x5, 0)
  model YieldThisYear5 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_4)
  @ext(0x6, 0)
  model YieldThisYear6 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_4)
  @ext(0x7, 0)
  model YieldThisYear7 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_4)
  @ext(0x8, 0)
  model YieldThisYear8 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_4)
  @ext(0x9, 0)
  model YieldThisYear9 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_4)
  @ext(0xa, 0)
  model YieldThisYear10 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_4)
  @ext(0xb, 0)
  model YieldThisYear11 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_4)
  @ext(0xc, 0)
  model YieldThisYear12 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }
  // Electric power consumption

  /** default *r */
  @base(MF, 0x16, 0x1a, 0x2)
  model r_5 {
    @maxLength(1)
    value: IGN;
  }

  @inherit(r_5)
  @ext(1, 0)
  model ConsumptionThisYear1 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x2, 0)
  model ConsumptionThisYear2 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x3, 0)
  model ConsumptionThisYear3 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x4, 0)
  model ConsumptionThisYear4 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x5, 0)
  model ConsumptionThisYear5 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x6, 0)
  model ConsumptionThisYear6 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x7, 0)
  model ConsumptionThisYear7 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x8, 0)
  model ConsumptionThisYear8 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x9, 0)
  model ConsumptionThisYear9 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0xa, 0)
  model ConsumptionThisYear10 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0xb, 0)
  model ConsumptionThisYear11 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0xc, 0)
  model ConsumptionThisYear12 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }
  // Values from UniTower Test Menu

  /** default *r */
  @base(MF, 0x14, 0x5)
  model r_6 {
    @maxLength(2)
    value: IGN;
  }

  @inherit(r_6)
  @ext(0x2b, 0x3, 0xff, 0xff)
  model WaterThroughput {
    /** current heating water flow rate in liters per hour */
    @unit("l/h")
    value: UIN;
  }

  enum Values_onoff {
    off: 0,
    on: 1,
  }

  enum Values_state {
    ready: 0x01,
    error: 0x0b,
    heating: 0x09,
    cooling: 0x11,
    heating_water: 0x81,
  }

  /** included parts */
  union _includes {
    Hcmode_inc,
    Errors_inc,
  }
}
