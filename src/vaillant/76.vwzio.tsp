import "@ebusd/ebus-typespec";
import "./_templates.tsp";

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

    flowtempdesired: D1C;
    hwctempdesired: D1C;
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

  /** circuit temperatures and pump state */
  @inherit(u_11)
  @ext(0x01)
  model Status01 {
    flow_temp: D1C;
    return_temp: D1C;
    outside_temp: D2B;
    hwc_temp: D1C;
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

  // ==============================================================================
  // 3. ENERGY TELEMETRY AND DIAGNOSTICS (APP f1 -> 76)
  // ==============================================================================

  /** default *u for precision energy (b516) */
  @passive
  @base(MF, 0x16)
  model u_16 {}

  /** precision energy yield and consumption */
  @inherit(u_16)
  @ext(0x14)
  model EnergyYieldPrecision {
    @values(Values_EnergyYieldStatus)
    status: UCH;

    /** cumulative environmental yield (kWh) */
    @unit("kWh")
    yield: EXP;

    /** cumulative electrical consumption (kWh) */
    @unit("kWh")
    consumed: EXP;
  }

  enum Values_EnergyYieldStatus {
    standby: 0,
    heating: 1,
    hwc: 2,
  }

  /** default *u for high precision IEEE 754 counters (b516 1000ffff) */
  @passive
  @base(MF, 0x16, 0x10, 0x00, 0xff, 0xff)
  model u_energy {
    @maxLength(7)
    ign: IGN;
  }

  /** energy header query */
  @inherit(u_energy)
  @ext(0x01, 0x00, 0x00, 0x00)
  model PrHeader {
    value: EXP;
  }

  /** electrical energy today */
  @inherit(u_energy)
  @ext(0x83, 0x03, 0x00, 0x00)
  model PrEnergyElectricToday {
    /** daily consumed electrical energy */
    @unit("Wh")
    energy: EXP;
  }

  /** electrical energy this month */
  @inherit(u_energy)
  @ext(0x83, 0x04, 0x00, 0x00)
  model PrEnergyElectricMonth {
    /** monthly consumed electrical energy */
    @unit("Wh")
    energy: EXP;
  }

  /** electrical energy total */
  @inherit(u_energy)
  @ext(0x83, 0x05, 0x00, 0x00)
  model PrEnergyElectricTotal {
    /** total historical consumed electrical energy */
    @unit("Wh")
    energy: EXP;
  }

  /** thermal energy today */
  @inherit(u_energy)
  @ext(0x49, 0x03, 0x00, 0x00)
  model PrEnergyThermalToday {
    /** daily delivered thermal energy */
    @unit("Wh")
    energy: EXP;
  }

  /** thermal energy this month */
  @inherit(u_energy)
  @ext(0x49, 0x04, 0x00, 0x00)
  model PrEnergyThermalMonth {
    /** monthly delivered thermal energy */
    @unit("Wh")
    energy: EXP;
  }

  /** thermal energy total */
  @inherit(u_energy)
  @ext(0x49, 0x05, 0x00, 0x00)
  model PrEnergyThermalTotal {
    /** total historical delivered thermal energy */
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

  /** total starts of heating mode */
  @inherit(u_rundata)
  @ext(0xc0, 0x0b)
  model RunStatsHcStarts {
    value: UIN;
  }

  /** total starts of Hwc mode */
  @inherit(u_rundata)
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

  /** default *u for error/status registers (b503) */
  @passive
  @base(MF, 0x03)
  model u_error {}

  /** current errors */
  @inherit(u_error)
  @ext(0x00, 0x01)
  model Currenterror {
    error: UIN;
    error_1: UIN;
    error_2: UIN;
    error_3: UIN;
    error_4: UIN;
  }

  /** Error History */
  @inherit(u_error)
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
  @inherit(u_error)
  @ext(0x00)
  model ErrorMemorySlot {
    @out
    slot: UCH;

    error: UIN;

    @maxLength(8)
    data: HEX;
  }

  // ==============================================================================
  // 4. SERVICE MODE / RELAY TEST (ORIGINAL)
  // ==============================================================================

  /** default *rs for user level "service" */
  @auth("service")
  @base(MF, 0x14, 0x05)
  model rs_serv {
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
  @inherit(rs_serv)
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
  @inherit(rs_serv)
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
  @inherit(rs_serv)
  @ext(0x45)
  model TestOutdoorTemp {
    @unit("°C")
    @divisor(10)
    value: SIN;
  }
}
