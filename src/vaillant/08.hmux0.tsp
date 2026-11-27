import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./b516_inc.tsp";
import "./errors_inc.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Vaillant;

// @zz(0x08)
namespace Hmux0 {
  // ==============================================================================
  // 1. REAL-TIME TELEMETRY AND REFRIGERATION CIRCUIT (PASSIVE u & ON-DEMAND READ r)
  // ==============================================================================

  /** default *uw for controller 10 -> 08 */
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

  /** default *uw for circulation pump */
  @passive
  @write
  @base(MF, 0x12)
  model uw_12 {}

  /** Status circulation pump */
  @inherit(uw_12)
  @ext(0x00)
  model StatusCirPump {
    @values(Values_StatusCirPump)
    value: UCH;
  }

  enum Values_StatusCirPump {
    off: 0,
    on: 100,
  }

  /** Status circulation pump target */
  @inherit(uw_12)
  @ext(0x04)
  model StatusCirPumpTarget {
    value: UCH;
  }

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
    /** cumulative heating consumed electrical energy */
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

  /** total cooling electrical energy consumed */
  @inherit(r_energy, u_energy)
  @ext(0x83, 0x05, 0x00, 0x00)
  model PrEnergyElectricCool {
    /** cumulative cooling consumed electrical energy */
    @unit("Wh")
    energy: EXP;
  }

  /** total heating fuel energy consumed (unsupported on heat pump) */
  @inherit(r_energy, u_energy)
  @ext(0x84, 0x03, 0x00, 0x00)
  model PrEnergyFuelHc {
    @unit("Wh")
    energy: EXP;
  }

  /** total hot water fuel energy consumed (unsupported on heat pump) */
  @inherit(r_energy, u_energy)
  @ext(0x84, 0x04, 0x00, 0x00)
  model PrEnergyFuelHwc {
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

  /** total cooling thermal energy extracted */
  @inherit(r_energy, u_energy)
  @ext(0x49, 0x05, 0x00, 0x00)
  model PrEnergyThermalCool {
    /** cumulative cooling extracted thermal energy */
    @unit("Wh")
    energy: EXP;
  }

  /** total heating environmental energy yield */
  @inherit(r_energy, u_energy)
  @ext(0x42, 0x03, 0x00, 0x00)
  model PrEnergyEnvYieldHc {
    /** cumulative heating environmental energy yield */
    @unit("Wh")
    energy: EXP;
  }

  /** total hot water environmental energy yield */
  @inherit(r_energy, u_energy)
  @ext(0x42, 0x04, 0x00, 0x00)
  model PrEnergyEnvYieldHwc {
    /** cumulative hot water environmental energy yield */
    @unit("Wh")
    energy: EXP;
  }

  /** total cooling environmental energy yield */
  @inherit(r_energy, u_energy)
  @ext(0x42, 0x05, 0x00, 0x00)
  model PrEnergyEnvYieldCool {
    @unit("Wh")
    energy: EXP;
  }

  /** default *u for compressor state (b511) */
  @passive
  @base(MF, 0x11)
  model u_11 {}

  /** default *r for compressor state (b511) */
  @base(MF, 0x11)
  model r_11 {}

  /** compressor state and modulation */
  @inherit(r_11, u_11)
  @ext(0x00)
  model StateCompressor {
    /** flow temperature (same as RunDataFlowTemp) */
    @unit("°C")
    flow_temp: D2C;

    @maxLength(1)
    ign: IGN;

    /** compressor modulation in 0.5 % steps (= display value, approx. 0.989 * compressor speed[rps] - 18.8) */
    @unit("%")
    @divisor(2)
    modulation: UCH;

    /** operating mode flags (4 = heating, 24 = hot water seen) */
    mode_flags: UCH;

    /** state bytes (1st: 09 compressor on heating, 19 hot water; 4th: mirror of modulation byte) */
    @maxLength(4)
    state_bytes: HEX;
  }

  /** compressor runtime and start count in heating mode (sum of Hc+Hwc+Cool runtime/starts matches myVAILLANT app operating hours/cycles) */
  @inherit(r_11, u_11)
  @ext(0x18, 0x01)
  model RunStatsCompressorHc {
    @maxLength(1)
    ign: IGN;

    /** compressor runtime */
    @unit("min")
    runtime: ULG;

    /** start count */
    cycles: ULG;
  }

  /** compressor runtime and start count in hot water mode */
  @inherit(r_11, u_11)
  @ext(0x18, 0x02)
  model RunStatsCompressorHwc {
    @maxLength(1)
    ign: IGN;

    /** compressor runtime */
    @unit("min")
    runtime: ULG;

    /** start count */
    cycles: ULG;
  }

  /** compressor runtime and start count in cooling mode */
  @inherit(r_11, u_11)
  @ext(0x18, 0x03)
  model RunStatsCompressorCool {
    @maxLength(1)
    ign: IGN;

    /** compressor runtime */
    @unit("min")
    runtime: ULG;

    /** start count */
    cycles: ULG;
  }

  // ==============================================================================
  // 2. RUN DATA DIAGNOSTIC SENSORS (b509 - PASSIVE u, ON-DEMAND READ r & SLOW POLL r9)
  // ==============================================================================

  /** default *u for raw 4-byte unsupported run data responses (b509 540200) */
  @passive
  @base(MF, 0x09, 0x54, 0x02, 0x00)
  model u_raw_rundata {}

  /** default *u for run data (b509 540200) */
  @passive
  @base(MF, 0x09, 0x54, 0x02, 0x00)
  model u_rundata {
    @maxLength(4)
    ign: IGN;
  }

  /** default *r for run data polling */
  @base(MF, 0x09, 0x54, 0x02, 0x00)
  model r_rundata {
    @maxLength(4)
    ign: IGN;
  }

  @inherit(r_rundata, u_rundata)
  @ext(0x0d, 0x0a)
  model RunDataCompressorSpeed {
    @unit("rps")
    value: EXP;
  }

  /** (EEV Position in different scale?) */
  @inherit(r_rundata, u_rundata)
  @ext(0x28, 0x0a)
  model RunDataEEVPositionAbs {
    value: UIN;
  }

  @inherit(r_rundata, u_rundata)
  @ext(0x47, 0x0a)
  model RunDataFan1Speed {
    @unit("rpm")
    value: EXP;
  }

  @inherit(r_rundata, u_rundata)
  @ext(0x49, 0x0a)
  model RunDataFan2Speed {
    @unit("rpm")
    value: EXP;
  }

  /** unsupported status register on HMUX0 */
  @inherit(u_raw_rundata)
  @ext(0x53, 0x0d)
  model RunDataUnsupported530d {
    /** HMU Status code (use HMUStatusCode b503 0003) */
    @maxLength(4)
    data: HEX;
  }

  /** current electrical power consumption (Watt) */
  @poll(1)
  @inherit(r_rundata, u_rundata)
  @ext(0x5b, 0x0d)
  model RunDataElectricPowerConsumption {
    @unit("W")
    power: EXP;
  }

  /** refrigerant high pressure */
  @poll(9)
  @inherit(r_rundata, u_rundata)
  @ext(0x6a, 0x09)
  model RunDataHighPressure {
    @unit("bar")
    press: EXP;
  }

  /** compressor inlet suction temperature */
  @poll(9)
  @inherit(r_rundata, u_rundata)
  @ext(0x98, 0x08)
  model RunDataCompressorInletTemp {
    @unit("°C")
    value: EXP;
  }

  /** compressor outlet discharge temperature */
  @poll(9)
  @inherit(r_rundata, u_rundata)
  @ext(0xa2, 0x08)
  model RunDataCompressorOutletTemp {
    @unit("°C")
    value: EXP;
  }

  /** expansion valve outlet temperature */
  @poll(9)
  @inherit(r_rundata, u_rundata)
  @ext(0xac, 0x08)
  model RunDataEEVOutletTemp {
    @unit("°C")
    value: EXP;
  }

  /** refrigerant temperature after the building heat exchanger / EEV (Vaillant data export: TRefriBuildHexEev) */
  @inherit(r_rundata, u_rundata)
  @ext(0xb6, 0x08)
  model RunDataCondenserOutTemp {
    @unit("°C")
    value: EXP;
  }

  /** current flow temp, accurate to 2 decimal places */
  @poll(2)
  @inherit(r_rundata, u_rundata)
  @ext(0xfc, 0x08)
  model RunDataFlowTemp {
    @unit("°C")
    value: EXP;
  }

  /** current return temp, accurate to 2 decimal places */
  @poll(2)
  @inherit(r_rundata, u_rundata)
  @ext(0x06, 0x09)
  model RunDataReturnTemp {
    @unit("°C")
    value: EXP;
  }

  /** building circuit water flow rate (display D.060) */
  @poll(2)
  @inherit(r_rundata, u_rundata)
  @ext(0x09, 0x0b)
  model RunDataFlowRate {
    /** building circuit volumetric water flow rate */
    @unit("l/h")
    value: UIN;
  }

  /** maximum residual pump head (display D.231, constant setting) */
  @inherit(r_rundata, u_rundata)
  @ext(0x68, 0x0b)
  model RunDataMaxResidualHead {
    @unit("mbar")
    value: UIN;
  }

  @inherit(r_rundata, u_rundata)
  @ext(0xb8, 0x0b)
  model RunStatsHMUHours {
    @unit("h")
    value: UIN;
  }

  @inherit(r_rundata, u_rundata)
  @ext(0xb9, 0x0b)
  model RunStatsHcHours {
    @unit("h")
    value: UIN;
  }

  /** cooling operating hours (Vaillant data export: ApplianceOperatingHoursCooling) */
  @inherit(u_rundata)
  @ext(0xbb, 0x0b)
  model RunStatsCoolingHours {
    @unit("h")
    value: ULG;
  }

  /** total runtime of Hwc mode */
  @inherit(r_rundata, u_rundata)
  @ext(0xbc, 0x0b)
  model RunStatsHwcHours {
    @unit("h")
    value: UIN;
  }

  /** switching operations of the auxiliary heater (display D.074) */
  @poll(9)
  @inherit(r_rundata, u_rundata)
  @ext(0xc0, 0x0b)
  model RunStatsAuxHeaterSwitches {
    value: UIN;
  }

  /** DHW 3-way valve switches (Vaillant data export: DHW_TWV_Commutations) */
  @inherit(r_rundata, u_rundata)
  @ext(0xc1, 0x0b)
  model RunStatsHwcValveSwitches {
    value: ULG;
  }

  @inherit(r_rundata, u_rundata)
  @ext(0xc2, 0x0b)
  model RunStatsCompressorHours {
    @unit("h")
    value: UIN;
  }

  /** start count */
  @inherit(r_rundata, u_rundata)
  @ext(0xc3, 0x0b)
  model RunStatsCompressorStarts {
    value: UIN;
  }

  @inherit(r_rundata, u_rundata)
  @ext(0xc4, 0x0b)
  model RunStatsBuildingPumpHours {
    @unit("h")
    value: UIN;
  }

  @inherit(r_rundata, u_rundata)
  @ext(0xc5, 0x09)
  model RunDataBuildingCPumpPower {
    @unit("%")
    value: EXP;
  }

  /** total starts of building circuit pump */
  @inherit(r_rundata, u_rundata)
  @ext(0xc5, 0x0b)
  model RunStatsBuildingCPumpStarts {
    value: UIN;
  }

  @inherit(r_rundata, u_rundata)
  @ext(0xc8, 0x0b)
  model RunStats4PortValveHours {
    @unit("h")
    value: UIN;
  }

  /** start count */
  @inherit(r_rundata, u_rundata)
  @ext(0xc9, 0x0b)
  model RunStats4PortValveSwitches {
    value: UIN;
  }

  @inherit(r_rundata, u_rundata)
  @ext(0xd7, 0x0b)
  model RunStatsFan1Hours {
    @unit("h")
    value: UIN;
  }

  /** start count */
  @inherit(r_rundata, u_rundata)
  @ext(0xd8, 0x0b)
  model RunStatsFan1Starts {
    value: UIN;
  }

  @inherit(r_rundata, u_rundata)
  @ext(0xd9, 0x0b)
  model RunStatsFan2Hours {
    @unit("h")
    value: UIN;
  }

  /** start count */
  @inherit(r_rundata, u_rundata)
  @ext(0xda, 0x0b)
  model RunStatsFan2Starts {
    value: UIN;
  }

  /** outdoor air inlet temperature */
  @poll(9)
  @inherit(r_rundata, u_rundata)
  @ext(0xde, 0x08)
  model RunDataAirInletTemp {
    @unit("°C")
    value: EXP;
  }

  /** crank case heater hours (Vaillant data export: HP_CrankCaseHeaterOperatingHours; not cooling) */
  @inherit(r_rundata, u_rundata)
  @ext(0xe1, 0x0b)
  model RunStatsCrankCaseHeaterHours {
    @unit("h")
    value: ULG;
  }

  /** crank case heater switches (Vaillant data export: HP_CrankCaseHeaterCommutations; not cooling) */
  @inherit(r_rundata, u_rundata)
  @ext(0xe2, 0x0b)
  model RunStatsCrankCaseHeaterSwitches {
    value: ULG;
  }

  /** condensate tray heater hours (Vaillant data export: HP_CondensateTrayHeaterOperatingHours; defrost = RunStats4PortValveHours) */
  @inherit(r_rundata, u_rundata)
  @ext(0xe3, 0x0b)
  model RunStatsCondensateTrayHeaterHours {
    @unit("h")
    value: ULG;
  }

  /** condensate tray heater switches (Vaillant data export: HP_CondensateTrayHeaterCommutations; defrosts = RunStats4PortValveSwitches) */
  @inherit(r_rundata, u_rundata)
  @ext(0xe4, 0x0b)
  model RunStatsCondensateTrayHeaterSwitches {
    value: ULG;
  }

  /** compressor safety relay hours (Vaillant data export: HP_CompressorSafetyRelayOperatingHours) */
  @inherit(u_rundata)
  @ext(0xe5, 0x0b)
  model RunStatsCompressorSafetyRelayHours {
    @unit("h")
    value: ULG;
  }

  /** compressor safety relay switches (Vaillant data export: HP_CompressorSafetyRelayCommutations) */
  @inherit(u_rundata)
  @ext(0xe6, 0x0b)
  model RunStatsCompressorSafetyRelaySwitches {
    value: ULG;
  }

  /** compressor flow temperature target (display: flow temperature target compressor) */
  @inherit(r_rundata, u_rundata)
  @ext(0x4a, 0x0d)
  model RunDataFlowTempDesired {
    @unit("°C")
    value: EXP;
  }

  /** water side heat output (equals flow rate x spread x 1.163 within 0.3 %) */
  @inherit(r_rundata, u_rundata)
  @ext(0x5e, 0x0d)
  model RunDataHeatOutput {
    @unit("W")
    value: EXP;
  }

  /** compressor energy integral (display: energy integral compressor) */
  @inherit(r_rundata, u_rundata)
  @ext(0xfe, 0x0a)
  model RunDataEnergyIntegral {
    @unit("°min")
    value: SIN;
  }

  /** evaporation temperature (display: evaporation temperature; Vaillant data export: RefrigerantCircuitEvaporationTemperature) */
  @inherit(r_rundata, u_rundata)
  @ext(0xd1, 0x10)
  model RunDataEvaporationTemp {
    @unit("°C")
    @divisor(16)
    value: SIN;
  }

  /** suction line superheat (display: superheat; Vaillant data export: RefrigerantCircuitCurrentSuperheating) */
  @inherit(r_rundata, u_rundata)
  @ext(0xd7, 0x10)
  model RunDataSuperheat {
    @unit("K")
    @divisor(16)
    value: SIN;
  }

  /** condenser liquid outlet temperature (condensation temperature minus this value matches display subcooling; Vaillant data export: BuildingCircuitHeatExchangerOutletTemperature) */
  @inherit(r_rundata, u_rundata)
  @ext(0xdb, 0x10)
  model RunDataCondensateTemp {
    @unit("°C")
    @divisor(16)
    value: SIN;
  }

  // ==============================================================================
  // 3. STATISTICS AND GLOBAL STATE (PASSIVE u & ON-DEMAND READ r)
  // ==============================================================================

  @inherit(r_11, u_11)
  @ext(0x07)
  model State {
    energy: UCH;

    @unit("kWh")
    energy_1: UIN;

    @values(Values_OnOff)
    onoff: UCH;

    @values(Values_Hmux0State)
    state: UCH;
  }

  enum Values_OnOff {
    off: 0,
    on: 1,
  }

  enum Values_Hmux0State {
    ready: 1,
    error: 11,
    heating: 9,
    cooling: 17,
    heating_water: 129,
  }

  /** flow/return/outside/hwc/storage temperature/pump status */
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
    venting: 8,
  }

  /** operating mode/maximum temp/current temp (passive; unsupported on heat pump) */
  @inherit(u_11)
  @ext(0x02)
  model Status02 {
    @values(Values_HwcMode)
    hwcmode: UCH;

    @unit("°C")
    max_temp: UCH;

    @unit("°C")
    current_temp: D1C;

    @unit("°C")
    max_temp_1: UCH;

    @unit("°C")
    current_temp_1: D1C;
  }

  enum Values_HwcMode {
    disabled: 0,
    on: 1,
    off: 2,
    auto: 3,
  }

  /** Status (passive; unsupported on heat pump) */
  @inherit(u_11)
  @ext(0x03)
  model Status {
    @unit("°C")
    temp: D2C;

    @unit("bar")
    press: FLT;

    @unit("bar")
    press_1: FLT;

    @values(Values_StatusHcmode)
    hcmode: UCH;

    @maxLength(1)
    hex: HEX;
  }

  enum Values_StatusHcmode {
    off: 0,
    cooling: 1,
    heat: 3,
    water: 4,
  }

  /** default *u for error/status registers (b503) */
  @passive
  @base(MF, 0x03)
  model u_error {}

  /** default *r for error/status registers (b503) */
  @base(MF, 0x03)
  model r_error {}

  /** Current errors */
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

    /** BCD minutes, hours */
    time: BTM;

    /** BCD day, month, year */
    date: BDA3;

    /** followed by 1 (HMU) or 2 (VWZIO) bytes of unknown data that change between reads of the same entry */
    error: UIN;
  }

  /** outdoor unit status code */
  @inherit(r_error, u_error)
  @ext(0x00, 0x03)
  model HMUStatusCode {
    @values(Values_HMUStatusCode)
    status: UIN;

    @maxLength(8)
    data: HEX;
  }

  enum Values_HMUStatusCode {
    frost_protect: 34,
    standby: 100,
    heat_compressor_shutdown: 101,
    heat_compressor_blocked: 102,
    heat_prerun: 103,
    heat_compressor_active: 104,
    heat_overrun: 107,
    cool_compressor_shutdown: 111,
    cool_compressor_blocked: 112,
    cool_prerun: 113,
    cool_compressor_active: 114,
    cool_overrun: 117,
    heat_immersion_heater_active: 125,
    hwc_compressor_blocked: 132,
    hwc_prerun: 133,
    hwc_compressor_active: 134,
    hwc_immersion_heater_active: 135,
    hwc_overrun: 137,
    heat_immersion_heater_shutdown: 141,
    heat_immersion_heater_blocked: 142,
    hwc_immersion_heater_shutdown: 151,
    hwc_immersion_heater_blocked: 152,
    air_purging_program_active: 202,
    compressor_oil_heating_active: 240,
    fan1_blocked: 252,
    fan1_airinlet_too_high: 255,
    fan1_airinlet_too_low: 256,
    fan2_blocked: 260,
    building_circuit_flow_too_low: 275,
    building_circuit_pump_fault: 277,
    frequency_converter_fault_compressor: 280,
    frequency_converter_fault_mains_voltage: 281,
    frequency_converter_fault_overheating: 282,
    deicing_time_too_long: 283,
    deicing_flow_temp_too_low: 284,
    compressor_outlet_temp_too_high: 285,
    hot_gas_temp_switch_open: 286,
    fan1_wind: 287,
    fan2_wind: 288,
    current_limt_active: 289,
    high_pressure_switch_open: 302,
    compressor_outlet_temp_too_high_1: 303,
    evaporation_temp_too_low: 304,
    condensation_temp_too_low: 305,
    evaporation_temp_too_high: 306,
    condensation_temp_too_high: 308,
    building_circuit_return_temp_too_low: 312,
    building_circuit_return_temp_too_high: 314,
    immersion_heater_flow_temp_too_high: 351,
    deicing_active: 516,
    frequency_converter_fault: 575,
    connection_fault_frequency_converter: 581,
    four_port_valve_position_fault: 590,
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

  /** compressor availability status */
  @passive
  @base(MF, 0x07)
  model u_avail {}

  @inherit(u_avail)
  @ext(0x09)
  model CompressorAvailability {
    @out
    request: UCH;

    /** availability code */
    status: UIN;
  }

  /** diagnostic feature support */
  @passive
  @base(MF, 0x1a)
  model u_diagfeat {}

  @inherit(u_diagfeat)
  @ext(0x05, 0x00, 0x0c)
  model DiagFeatureSupport {
    @out
    @maxLength(1)
    feature_id: HEX;

    /** feature support status */
    status: UIN;
  }

  /** default *u for extended b51a 05ff diagnostic/config registers */
  @passive
  @base(MF, 0x1a, 0x05, 0xff)
  model u_1a_ff {
    @maxLength(3)
    ign: IGN;
  }

  /** default *r for extended b51a 05ff diagnostic/config registers */
  @base(MF, 0x1a, 0x05, 0xff)
  model r_1a_ff {
    @maxLength(3)
    ign: IGN;
  }

  /** default *w for extended b51a 06ff config registers */
  @write
  @base(MF, 0x1a, 0x06, 0xff)
  model w_1a_ff {}

  /** condensation temperature (display: condensation temperature) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x35, 0x46)
  model RunDataCondensationTemp {
    @unit("°C")
    @divisor(16)
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** compressor silent operation level */
  @poll(9)
  @inherit(r_1a_ff, u_1a_ff, w_1a_ff)
  @ext(0x34, 0x28)
  model CompressorSilentOperationLevel {
    /** compressor silent operation level */
    @unit("%")
    value: UCH;
  }

  /** central regulator heartbeat */
  @passive
  @base(MF, 0x13)
  model u_heartbeat {}

  @inherit(u_heartbeat)
  @ext(0x05, 0x28)
  model Heartbeat {
    /** heartbeat watchdog */
    value: UCH;
  }

  /** return temperature sensor (Vaillant data export: ReturnTemperatureSensor) */
  @inherit(u_rundata)
  @ext(0xcc, 0x10)
  model RunDataReturnTempSensor {
    @unit("°C")
    @divisor(16)
    value: SIN;
  }

  /** fan unit air inlet temperature (Vaillant data export: FanUnitAirInletTemperature) */
  @inherit(u_rundata)
  @ext(0x03, 0x0b)
  model RunDataFanAirInletTemp {
    @unit("°C")
    @divisor(16)
    value: SIN;
  }

  /** flow temperature sensor (Vaillant data export: FlowTemperatureSensor) */
  @inherit(u_rundata)
  @ext(0xfd, 0x0a)
  model RunDataFlowTempSensor {
    @unit("°C")
    @divisor(16)
    value: SIN;
  }

  /** status list, first entry matches HMUStatusCode b503 0003 (Vaillant data export: StatusList; 0xffff = empty) */
  @inherit(u_rundata)
  @ext(0x88, 0x13)
  model RunDataStatusList {
    s1: UIN;
    s2: UIN;
    s3: UIN;
    s4: UIN;
    s5: UIN;
  }

  /** fault list (Vaillant data export: FaultList; 0xffff = empty) */
  @inherit(u_rundata)
  @ext(0x8b, 0x13)
  model RunDataFaultList {
    s1: UIN;
    s2: UIN;
    s3: UIN;
    s4: UIN;
    s5: UIN;
  }

  // Passive-only (u) diagnostic & unverified inverter parameters (no active polling)

  /** evaporator capacity (Vaillant data export: AI_EvapCapacity, 0.1 kW) */
  @inherit(u_rundata)
  @ext(0x00, 0x0b)
  model RunDataEvapCapacity {
    @unit("kW")
    @divisor(10)
    value: ULG;
  }

  /** electrical power consumption in 100 W steps (= RunDataElectricPowerConsumption rounded, also during defrost; Vaillant data export: AI_ApplCapacity) */
  @inherit(u_rundata)
  @ext(0x01, 0x0b)
  model RunDataElectricPower100 {
    @unit("W")
    @factor(100)
    value: ULG;
  }

  /** inverter input current limit (Vaillant data export: Inv_InputCurrentLimit; float reads 15.0 while Vaillant reports 0) */
  @inherit(u_rundata)
  @ext(0x7c, 0x08)
  model RunDataInverterCurrentLimit {
    @unit("A")
    value: EXP;
  }

  /** superheat target (Vaillant data export: RefrigerantCircuitTargetSuperheating) */
  @inherit(u_rundata)
  @ext(0xd6, 0x10)
  model RunDataSuperheatTarget {
    @unit("K")
    @divisor(16)
    value: SIN;
  }

  /** SCOP heating, current month (Vaillant data export: ScopCurrentMonthCentralHeating) */
  @inherit(u_rundata)
  @ext(0xf4, 0x0a)
  model RunDataScopHcMonth {
    @divisor(10)
    value: UCH;
  }

  /** SCOP heating, total (Vaillant data export: ScopTotalCentralHeating) */
  @inherit(u_rundata)
  @ext(0xf6, 0x0a)
  model RunDataScopHcTotal {
    @divisor(10)
    value: UCH;
  }

  /** SCOP domestic hot water, current month (Vaillant data export: ScopCurrentMonthDomesticHotWater) */
  @inherit(u_rundata)
  @ext(0xf8, 0x0a)
  model RunDataScopHwcMonth {
    @divisor(10)
    value: UCH;
  }

  /** SCOP domestic hot water, total (Vaillant data export: ScopTotalDomesticHotWater) */
  @inherit(u_rundata)
  @ext(0xfa, 0x0a)
  model RunDataScopHwcTotal {
    @divisor(10)
    value: UCH;
  }

  /** D.374 subcooling target (display verified) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x35, 0x4a)
  model SubcoolingTargetTemp {
    @unit("K")
    @divisor(16)
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.375 subcooling (display verified) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x35, 0x4b)
  model SubcoolingTemp {
    @unit("K")
    @divisor(16)
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** environment circuit heat exchanger (evaporator) inlet temperature (Vaillant data export: EnvironmentCircuitHeatExchangerInletTemperature) */
  @inherit(u_1a_ff)
  @ext(0x37, 0x02)
  model RunDataEnvHexInletTempB51a {
    @unit("°C")
    @divisor(16)
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** compressor inlet (suction gas) temperature (Vaillant data export: CompressorInletTemperature; close to RunDataEvaporationTemp d110 because superheat is ~0 K) */
  @inherit(u_1a_ff)
  @ext(0x37, 0x04)
  model RunDataCompressorInletTempB51a {
    @unit("°C")
    @divisor(16)
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** compressor outlet temperature (Vaillant data export: CompressorOutletTemperature) */
  @inherit(u_1a_ff)
  @ext(0x37, 0x05)
  model RunDataCompressorOutletTempB51a {
    @unit("°C")
    @divisor(16)
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** refrigerant high pressure (= RunDataHighPressure 6a09 within 0.1 bar in 40 same-minute samples; D.511 by the #637 key; Vaillant data export: RefrigerantCircuitHighPressureSensor) */
  @inherit(u_1a_ff)
  @ext(0x37, 0x0b)
  model RunDataHighPressureB51a {
    @unit("bar")
    @divisor(10)
    value: UIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** currently active error codes of the outdoor unit (0xffff = empty slot; seen: 22 = F.22 low water pressure, 733 = F.733 evaporation temperature too low; Vaillant data export calls this register MaintenanceList) */
  @inherit(u_rundata)
  @ext(0x8c, 0x13)
  model RunDataActiveErrors {
    error: UIN;
    error_1: UIN;
    error_2: UIN;
    error_3: UIN;
    error_4: UIN;
  }

  /** building circuit water pressure (1/64 bar, follows the controller water pressure) */
  @inherit(u_rundata)
  @ext(0x3b, 0x0b)
  model RunDataWaterPressure {
    @unit("bar")
    @divisor(64)
    value: UIN;
  }

  enum Values_DcodeHwcMode {
    eco: 0,
    normal: 1,
    balance: 2,
  }

  enum Values_DcodeCooling {
    no_cooling: 0,
    active_cooling: 1,
  }

  enum Values_DcodeAnode {
    not_connected: 0,
  }

  // Installer settings and counters via b51a 05ff HH LL (D-code key from #637), checked against the
  // hydraulic station display (aroTHERM plus VWL 75/8.1 A + VWZ MEH 97, 2026-11-15). HMU (08) and VWZIO (76)
  // answer identically. Settings answer "ff 02 <type> <value LE16> <min LE16> <max LE16> <step>",
  // measured values "ff 08 <type> <value LE32> ...", unsupported codes "ff 01".

  /** D.230 compressor start heating at energy integral (display -60 °min; setting, range -120..-30 step 5) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x34, 0x1e)
  model CompressorStartHeatingFrom {
    @unit("°min")
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.233 compressor start cooling at energy integral (display 60 °min; setting, range 30..120 step 5) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x34, 0x21)
  model CompressorStartCoolingFrom {
    @unit("°min")
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.231 maximum residual pump head (display 900 mbar; setting, range 200..900 step 10) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x34, 0x1f)
  model MaxResidualHeadSetting {
    @unit("mbar")
    value: UIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.245 maximum utility block time (display 5 h; setting, range 0..9) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x34, 0x2d)
  model MaxBlockTimeUtility {
    @unit("h")
    value: UIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.248 number of switch-on operations (display 32) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x34, 0x30)
  model PowerOnCount {
    value: ULG;

    @maxLength(3)
    ign_2: IGN;
  }

  /** D.267 compressor hysteresis heating (display 7.0 K; setting, range 3..15 K) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x34, 0x43)
  model CompressorHysteresisHeating {
    @unit("K")
    @divisor(16)
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.268 DHW operating mode (display Eco = 0; 1/2 unverified) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x34, 0x44)
  model HwcOperatingMode {
    @values(Values_DcodeHwcMode)
    value: UIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.363 compressor hysteresis cooling (display 5.0 K; setting, range 3..15 K) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x35, 0x3f)
  model CompressorHysteresisCooling {
    @unit("K")
    @divisor(16)
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.122 building circuit pump setting heating (29 = minimum = display Auto) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x33, 0x16)
  model BuildingPumpConfigHeating {
    @unit("%")
    value: UIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.123 building circuit pump setting cooling (29 = minimum = display Auto) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x33, 0x17)
  model BuildingPumpConfigCooling {
    @unit("%")
    value: UIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.124 building circuit pump setting DHW (29 = minimum = display Auto) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x33, 0x18)
  model BuildingPumpConfigHwc {
    @unit("%")
    value: UIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.125 switch-on delay after power on (display 0 min; setting, range 0..120) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x33, 0x19)
  model SwitchOnDelay {
    @unit("min")
    value: UIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.127 cooling possible (display "Aktive Kühlung" = 1) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x33, 0x1b)
  model CoolingPossible {
    @values(Values_DcodeCooling)
    value: UIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.131 compressor current limit (display 16 A; setting, range 13..16) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x33, 0x1f)
  model CompressorCurrentLimit {
    @unit("A")
    value: UIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.201 compressor starts (display 939 = RunStatsCompressorStarts) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x34, 0x01)
  model CompressorStartsDcode {
    value: ULG;

    @maxLength(3)
    ign_2: IGN;
  }

  /** D.269 impressed current anode status (display "Anode nicht angeschlossen" = 0) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x34, 0x45)
  model AnodeStatus {
    @values(Values_DcodeAnode)
    value: UIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** D.367 building circuit pump modulation (display 77.8 %) */
  @inherit(r_1a_ff, u_1a_ff)
  @ext(0x35, 0x43)
  model BuildingPumpModulation {
    @unit("%")
    @divisor(16)
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
  }

  /** included parts */
  union _includes {
    B516_inc,
  }

  // Polled by the myVAILLANT gateway; names, units and enums from the Vaillant data export (EU Data Act,
  // aroTHERM plus VWL 75/8.1 A, HMUX0 SW 0405, 2026-11-26).

  /** four way valve, on = defrost (Vaillant data export: FourWayValve) */
  @inherit(u_rundata)
  @ext(0x19, 0x0a)
  model RunDataFourWayValve {
    @values(Values_OnOff)
    value: UCH;
  }

  /** noise reduction demand (Vaillant data export: ASW1_NoiseReductionDemand) */
  @inherit(u_rundata)
  @ext(0x4e, 0x0d)
  model RunDataNoiseReductionDemand {
    @values(Values_OnOff)
    value: UCH;
  }

  /** tank setpoint at the heat pump (Vaillant data export: TankSetpoint) */
  @inherit(u_rundata)
  @ext(0x58, 0x0b)
  model RunDataTankSetpoint {
    @unit("°C")
    @divisor(16)
    value: UIN;
  }

  /** DHW operation mode at the indoor unit (Vaillant data export: DomesticHotWaterOperationMode; same value as D.268) */
  @inherit(u_rundata)
  @ext(0x77, 0x0b)
  model RunDataHwcOperationMode {
    @values(Values_DcodeHwcMode)
    value: UCH;
  }

  /** maximum power in noise reduction mode (Vaillant data export: HP_MaxNoiseRedPower) */
  @inherit(u_rundata)
  @ext(0x7c, 0x0b)
  model RunDataMaxNoiseRedPower {
    @unit("%")
    value: UCH;
  }

  /** refrigerant high pressure switch, 1 = closed (Vaillant data export: RefrigerantCircuitHighPressureSwitch) */
  @inherit(u_rundata)
  @ext(0xf7, 0x09)
  model RunDataHighPressureSwitch {
    value: UCH;
  }

  /** irreversible limp home list (Vaillant data export: LimpHomeModeIrreversibleList; 0xffff = empty) */
  @inherit(u_rundata)
  @ext(0x8a, 0x13)
  model RunDataLimpHomeList {
    s1: UIN;
    s2: UIN;
    s3: UIN;
    s4: UIN;
    s5: UIN;
  }
}
