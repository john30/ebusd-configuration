import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./b516_inc.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Vaillant;

// @zz(0x76)
namespace Vwzio {
  // ==============================================================================
  // 1. TARGET POWER AND MODULATION INSTRUCTION (CONTROLLER 10 -> 76)
  // ==============================================================================

  /** default *uw for controller 10 -> 76 */
  @passive
  @write
  @base(MF, 0x10)
  model uw_10 {}

  /** target power and mode from regulator */
  @inherit(uw_10)
  @ext(0x00)
  model SetMode {
    @values(Values_SetModeHcmode)
    hcmode: UCH;

    @unit("°C")
    flowtempdesired: D1C;

    @unit("°C")
    hwctempdesired: D1C;

    @unit("°C")
    hwcflowtempdesired: UCH;

    @maxLength(2)
    flags: HEX;
  }

  enum Values_SetModeHcmode {
    auto: 0,
    off: 1,
    heat: 2,
    water: 3,
  }

  // ==============================================================================
  // 2. TEMPERATURES AND PUMP STATES (CONTROLLER 10 -> 76)
  // ==============================================================================

  /** default *u for status (b511) */
  @passive
  @base(MF, 0x11)
  model u_11 {}

  /** default *r for status (b511) */
  @base(MF, 0x11)
  model r_11 {}

  /** circuit temperatures and pump state */
  @inherit(r_11, u_11)
  @ext(0x01)
  model Status01 {
    @unit("°C")
    flow_temp: D1C;

    @unit("°C")
    return_temp: D1C;

    @unit("°C")
    outside_temp: D2B;

    @unit("°C")
    hwc_temp: D1C;

    @unit("°C")
    storage_temp: D1C;

    @values(Values_PumpState)
    pumpstate: UCH;
  }

  enum Values_PumpState {
    off: 0,
    on: 1,
    overrun: 2,
    hwc: 4,
  }

  /** immersion heater runtime and start count in heating mode (sum of Hc+Hwc matches myVAILLANT app hydraulic station operating hours/cycles) */
  @inherit(r_11, u_11)
  @ext(0x18, 0x01)
  model RunStatsHeaterHc {
    @maxLength(1)
    ign: IGN;

    /** immersion heater runtime */
    @unit("min")
    runtime: ULG;

    /** start count */
    cycles: ULG;
  }

  /** immersion heater runtime and start count in hot water mode */
  @inherit(r_11, u_11)
  @ext(0x18, 0x02)
  model RunStatsHeaterHwc {
    @maxLength(1)
    ign: IGN;

    /** immersion heater runtime */
    @unit("min")
    runtime: ULG;

    /** start count */
    cycles: ULG;
  }

  /** default *u for secondary circuit (b512) */
  @passive
  @base(MF, 0x12)
  model u_12 {}

  /** secondary pump and circuit status */
  @inherit(u_12)
  @ext(0x0f, 0x02, 0x01)
  model SecondaryCircuitStatus {
    @maxLength(7)
    status: HEX;
  }

  /** secondary pump and circuit status standby */
  @inherit(u_12)
  @ext(0x0f, 0x00, 0x01)
  model SecondaryCircuitStatusStandby {
    @maxLength(7)
    status: HEX;
  }

  /** secondary pump and circuit status hwc */
  @inherit(u_12)
  @ext(0x0f, 0x02, 0x02)
  model SecondaryCircuitStatusHwc {
    @maxLength(7)
    status: HEX;
  }

  /** secondary pump and circuit status 03 */
  @inherit(u_12)
  @ext(0x0f, 0x03, 0x01)
  model SecondaryCircuitStatus03 {
    @maxLength(7)
    status: HEX;
  }

  /** hydraulic station pressure flow and operating state */
  @inherit(u_12)
  @ext(0x0f, 0x06, 0x13)
  model StationState {
    @maxLength(3)
    ign: IGN;

    /** system pressure */
    @unit("bar")
    @divisor(10)
    pressure: UCH;

    /** volumetric flow rate */
    @unit("l/h")
    flow: UIN;

    /** operating state */
    state: UCH;
  }

  // ==============================================================================
  // 3. ENERGY TELEMETRY AND DIAGNOSTICS (b516 - PASSIVE u & ON-DEMAND READ r)
  // ==============================================================================

  /** default *u for passive energy diagnostics (b516) */
  @passive
  @base(MF, 0x16)
  model u_16 {}

  /** default *r for on-demand energy telemetry (b516) */
  @base(MF, 0x16)
  model r_16 {}

  /** energy statistics EEPROM table descriptor */
  @inherit(r_16, u_16)
  @ext(0x11)
  model EnergyStatsDescriptor {
    @maxLength(9)
    data: HEX;
  }

  /** instantaneous power consumption and active mode */
  @inherit(r_16, u_16)
  @ext(0x14)
  model PowerStatus {
    /** active energy integration mode */
    @values(Values_PowerStatusMode)
    status: UCH;

    /** instantaneous electrical power */
    @unit("W")
    power: EXP;

    /** instantaneous fuel power */
    @unit("W")
    fuel_power: EXP;
  }

  enum Values_PowerStatusMode {
    standby: 0,
    heating: 1,
    hwc: 2,
    cooling: 3,
  }

  /** default *u for passive IEEE 754 energy counters (b516 1000ffff) */
  @passive
  @base(MF, 0x16, 0x10, 0x00, 0xff, 0xff)
  model u_energy {
    @maxLength(7)
    ign: IGN;
  }

  /** default *r for readable IEEE 754 energy counters (b516 1000ffff) */
  @base(MF, 0x16, 0x10, 0x00, 0xff, 0xff)
  model r_energy {
    @maxLength(7)
    ign: IGN;
  }

  /** total solar energy sum (active read provided via B516_inc.StatSolarEnergySum) */
  @inherit(u_energy)
  @ext(0x01, 0x00, 0x00, 0x00)
  model PrEnergySolarTotal {
    @unit("Wh")
    energy: EXP;
  }

  /** total heating electrical energy consumed */
  @inherit(r_energy, u_energy)
  @ext(0x83, 0x03, 0x00, 0x00)
  model PrEnergyElectricHc {
    /** cumulative heating and standby consumed electrical energy */
    @unit("Wh")
    energy: EXP;
  }

  /** total hot water electrical energy consumed */
  @inherit(r_energy, u_energy)
  @ext(0x83, 0x04, 0x00, 0x00)
  model PrEnergyElectricHwc {
    /** cumulative hot water consumed electrical energy */
    @unit("Wh")
    energy: EXP;
  }

  /** total heating thermal energy delivered */
  @inherit(r_energy, u_energy)
  @ext(0x49, 0x03, 0x00, 0x00)
  model PrEnergyThermalHc {
    /** cumulative heating delivered thermal energy */
    @unit("Wh")
    energy: EXP;
  }

  /** total hot water thermal energy delivered */
  @inherit(r_energy, u_energy)
  @ext(0x49, 0x04, 0x00, 0x00)
  model PrEnergyThermalHwc {
    /** cumulative hot water delivered thermal energy */
    @unit("Wh")
    energy: EXP;
  }

  /** default *u for diagnostic (b509 540200) */
  @passive
  @base(MF, 0x09, 0x54, 0x02, 0x00)
  model u_rundata {
    @maxLength(4)
    ign: IGN;
  }

  /** default *r for diagnostic (b509 540200) */
  @base(MF, 0x09, 0x54, 0x02, 0x00)
  model r_rundata {
    @maxLength(4)
    ign: IGN;
  }

  /** switching operations of the auxiliary heater (display D.074) */
  @inherit(r_rundata, u_rundata)
  @ext(0xc0, 0x0b)
  model RunStatsAuxHeaterSwitches {
    value: UIN;
  }

  /** total starts of Hwc mode */
  @inherit(r_rundata, u_rundata)
  @ext(0xc1, 0x0b)
  model RunStatsHwcStarts {
    value: UIN;
  }

  /** diagnostic code readout */
  @inherit(u_rundata)
  @ext(0xcc, 0x10)
  model RunDataDiagnostic {
    @maxLength(2)
    value: HEX;
  }

  /** electrical energy consumption of the immersion heater (display D.073) */
  @inherit(r_rundata, u_rundata)
  @ext(0x0c, 0x0b)
  model RunStatsHeaterEnergy {
    @unit("kWh")
    value: ULG;
  }

  /** immersion heater flow temperature (display: flow temperature immersion heater) */
  @inherit(r_rundata, u_rundata)
  @ext(0x4c, 0x09)
  model RunDataHeaterFlowTemp {
    @unit("°C")
    value: EXP;
  }

  // Passive-only (u) diagnostic telemetry & hydraulic status

  /** minimum volumetric flow rate safety threshold */
  @inherit(u_rundata)
  @ext(0xbf, 0x0d)
  model RunDataDiagbf0d {
    @unit("l/min")
    value: EXP;
  }

  /** hydraulic actuator position status diagnostic */
  @inherit(u_rundata)
  @ext(0xad, 0x0d)
  model RunDataDiagad0d {
    status: UCH;
  }

  /** backup heater relay status diagnostic */
  @inherit(u_rundata)
  @ext(0xac, 0x0d)
  model RunDataDiagac0d {
    status: UCH;
  }

  /** hydraulic module runtime counter 640b */
  @inherit(u_rundata)
  @ext(0x64, 0x0b)
  model RunDataDiag640b {
    @unit("h")
    hours: UIN;
  }

  /** hydraulic module cycle counter bd0b */
  @inherit(u_rundata)
  @ext(0xbd, 0x0b)
  model RunDataDiagbd0b {
    switches: ULG;
  }

  /** default *u for error/status registers (b503) */
  @passive
  @base(MF, 0x03)
  model u_error {}

  /** default *r for error/status registers (b503) */
  @base(MF, 0x03)
  model r_error {}

  /** current errors */
  @inherit(r_error, u_error)
  @ext(0x00, 0x01)
  model Currenterror {
    error: UIN;
    error_1: UIN;
    error_2: UIN;
    error_3: UIN;
    error_4: UIN;
  }

  /** Error History */
  @inherit(r_error, u_error)
  @ext(0x01, 0x01)
  model Errorhistory {
    @out
    index: UCH;

    status: UCH;
    time: VTM;
    date: HDA3;
    error: UIN;
  }

  /** error memory slot */
  @inherit(r_error, u_error)
  @ext(0x00)
  model ErrorMemorySlot {
    @out
    slot: UCH;

    error: UIN;

    @maxLength(8)
    data: HEX;
  }

  // ==============================================================================
  // 4. SERVICE MODE / RELAY TEST (PASSIVE u FOR READBACK TO PREVENT ACCIDENTAL RELAY ACTIVATION)
  // ==============================================================================

  /** default *us for user level "service" (passive-only to avoid active b514 test polling) */
  @passive
  @auth("service")
  @base(MF, 0x14, 0x05)
  model us_serv {
    @maxLength(2)
    ign: IGN;
  }

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x14, 0x05)
  model ws_serv {
    @maxLength(3)
    @constValue("03FFFF")
    ignore: HEX;
  }

  /** enable test 3 way valve */
  @inherit(ws_serv)
  @ext(0x02)
  model EnableTestThreeWayValve {}

  /** 3 way valve */
  @inherit(us_serv)
  @ext(0x02)
  model TestThreeWayValve {
    @values(Values_ThreeWayValve)
    value: UCH;
  }

  enum Values_ThreeWayValve {
    heating: 0,
    dhw: 1,
  }

  /** enable test hwc temperature */
  @inherit(ws_serv)
  @ext(0x2c)
  model EnableTestHwcTemp {}

  /** hwc temperature */
  @inherit(us_serv)
  @ext(0x2c)
  model TestHwcTemp {
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** enable test outdoor temperature */
  @inherit(ws_serv)
  @ext
  model EnableTestOutdoorTemp {}

  /** outdoor temperature */
  @inherit(us_serv)
  @ext(0x45)
  model TestOutdoorTemp {
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** included parts */
  union _includes {
    B516_inc,
  }
}
