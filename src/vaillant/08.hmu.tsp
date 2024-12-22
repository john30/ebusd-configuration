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
    energy_1: energy;
    onoff: onoff;

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
  // additions from PR 160 for HMU;0304;8802;0010019765
  // Test menus on VWZ. EnableTest message needs to be sent before each of the read messages work.

  /** default *rs for user level "service" */
  @auth("service")
  @base(MF, 0x14, 0x5)
  model rs {
    @maxLength(2)
    value: IGN;
  }

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x14, 0x5)
  model ws_1 {
    @maxLength(3)
    @constValue("03FFFF")
    ignore: HEX;
  }

  /** Read T.008 */
  @inherit(ws_1)
  @ext(0x15)
  model EnableTestEEVPosition {}

  /** T.008 value */
  @inherit(rs)
  @ext(0x15)
  model TestEEVPosition {
    value: UIN;
  }

  /** Read T.026 */
  @inherit(ws_1)
  @ext(0x37)
  model EnableTestCompressorExitTemp {}

  /** T.026 value */
  @inherit(rs)
  @ext(0x37)
  model TestCompressorExitTemp {
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** Read T.027 */
  @inherit(ws_1)
  @ext(0x38)
  model EnableTestCompressorIntakeTemp {}

  /** T.027 value */
  @inherit(rs)
  @ext(0x38)
  model TestCompressorIntakeTemp {
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** Read T.016 */
  @inherit(ws_1)
  @ext(0x2b)
  model EnableTestWaterThroughput {}

  /** current heating water flow rate */
  @inherit(rs)
  @ext(0x2b)
  model TestWaterThroughput {
    @unit("l/h")
    value: UIN;
  }

  /** Read T.068 */
  @inherit(ws_1)
  @ext(0x5d)
  model EnableTestCompressorSpeed {}

  /** T.068 value */
  @inherit(rs)
  @ext(0x5d)
  model TestCompressorSpeed {
    @divisor(10)
    value: UIN;
  }
  // Values from Live Monitor. EnableLiveMonitor message needs to be sent before each of the read messages work.

  /** default *us for user level "service" */
  @passive
  @auth("service")
  @base(MF, 0x3, 0)
  model us {}

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x3, 0)
  model ws_2 {}

  /** enable live monitor read status */
  @inherit(ws_2)
  @ext(0x3)
  model EnableiveMonitorMain {}
  // example: 244;Heating 3108b503020003 / 0af401ffffffffffffffff

  /** live monitor status */
  @inherit(us)
  @qq(0x71)
  @ext(0x3)
  model LiveMonitorMain {
    @values(Values_status)
    status: UCH;

    @values(Values_function)
    function: UCH;
  }

  /** default *rs for user level "service" */
  @auth("service")
  @base(MF, 0x1a, 0x5, 0, 0x32)
  model rs_1 {
    @maxLength(3)
    value: IGN;
  }
  // example: 3108b51a040500321f / 0a000805f0000000000000

  /** desired supply temperature */
  @inherit(rs_1)
  @ext(0x1f)
  model LiveMonitorDesiredSupplyTemp {
    value: temp;
  }
  // example: 3108b51a0405003220 / 0a0008081b010000000000

  /** current supply temperature */
  @inherit(rs_1)
  @ext(0x20)
  model LiveMonitorCurrentSupplyTemp {
    value: temp;
  }
  // example:108b51a0405003223 / 0a00083500000000000000

  /** current power generated */
  @inherit(rs_1)
  @ext(0x23)
  model LiveMonitorCurrentYieldPower {
    @unit("kW")
    @divisor(10)
    value: UIN;
  }
  // example: 3108b51a0405003224 / 0a00083500000000000000

  /** current power consumption */
  @inherit(rs_1)
  @ext(0x24)
  model LiveMonitorCurrentConsumedPower {
    @unit("kW")
    @divisor(10)
    value: UIN;
  }
  // example:08b51a0405003225 / 0a00081b00000000000000

  /** compressor modulation */
  @inherit(rs_1)
  @ext(0x25)
  model LiveMonitorCurrentCompressorUtil {
    @unit("%")
    value: D1B;
  }
  // example: 3108b51a0405003226 / 0a000808df000000000000

  /** air intake temperature */
  @inherit(rs_1)
  @ext(0x26)
  model LiveMonitorAirIntakeTemp {
    value: temp;
  }

  enum Values_state {
    ready: 0x01,
    error: 0x0b,
    heating: 0x09,
    cooling: 0x11,
    heating_water: 0x81,
  }

  enum Values_status {
    Controller_starting: 0x39,
    Standby: 0xf4,
    Supply_on: 0xf5,
    Heating_Flow_ok: 0xf6,
    Heating_temperature_self_test: 0xf7,
    Heating_Start: 0xf8,
    Heating_Fan_on: 0xfa,
    EEV_switch: 0xfc,
    Compressor_starting: 0xfd,
    Heating_compressor_on: 0xfe,
    Compressor_off: 0x00,
    Compressor_coast_down: 0x02,
    Deicing_start: 0x03,
    Deicing: 0x04,
    Deicing_end: 0x05,
    Cooling_Flow_on: 0x12,
    Cooling_temperature_self_test: 0x14,
    Cooling_starting: 0x15,
    Cooling_Fan_on: 0x17,
    Cooling_Flow_ok: 0x13,
    Cooling_EEV: 0x19,
    Cooling_compressor_starting: 0x1a,
    Cooling_compressor_on: 0x1b,
    Cooling_ending: 0x1d,
    Start_condition_not_met: 0x29,
    Device_error: 0x57,
    Flow_error_in_distribution_system: 0x44,
  }

  enum Values_function {
    Heating: 0x01,
    Cooling: 0x02,
  }

  /** included parts */
  union _includes {
    Hcmode_inc,
    Errors_inc,
  }
}
