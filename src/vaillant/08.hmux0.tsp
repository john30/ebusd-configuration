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
  // 1. REAL-TIME TELEMETRY AND REFRIGERATION CIRCUIT (PASSIVE u - BROADCAST/UPDATE)
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

  /** default *r for on-demand and passively decoded energy telemetry (b516) */
  @base(MF, 0x16)
  model r_16 {}

  /** energy statistics EEPROM table descriptor */
  @inherit(u_16)
  @ext(0x11)
  model EnergyStatsDescriptor {
    @maxLength(9)
    data: HEX;
  }

  /** instantaneous power consumption and active mode */
  @inherit(r_16)
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

  /** default *r for readable and passively decoded IEEE 754 energy counters (b516 1000ffff) */
  @base(MF, 0x16, 0x10, 0x00, 0xff, 0xff)
  model r_energy {
    @maxLength(7)
    ign: IGN;
  }

  /** total solar energy sum */
  @inherit(u_energy)
  @ext(0x01, 0x00, 0x00, 0x00)
  model PrEnergySolarTotal {
    @unit("Wh")
    energy: EXP;
  }

  /** total heating electrical energy consumed */
  @inherit(r_energy)
  @ext(0x83, 0x03, 0x00, 0x00)
  model PrEnergyElectricHc {
    /** cumulative heating consumed electrical energy */
    @unit("Wh")
    energy: EXP;
  }

  /** total hot water electrical energy consumed */
  @inherit(r_energy)
  @ext(0x83, 0x04, 0x00, 0x00)
  model PrEnergyElectricHwc {
    /** cumulative hot water consumed electrical energy */
    @unit("Wh")
    energy: EXP;
  }

  /** total cooling electrical energy consumed */
  @inherit(r_energy)
  @ext(0x83, 0x05, 0x00, 0x00)
  model PrEnergyElectricCool {
    /** cumulative cooling consumed electrical energy */
    @unit("Wh")
    energy: EXP;
  }

  /** total heating fuel energy consumed (unsupported on heat pump) */
  @inherit(u_energy)
  @ext(0x84, 0x03, 0x00, 0x00)
  model PrEnergyFuelHc {
    @unit("Wh")
    energy: EXP;
  }

  /** total hot water fuel energy consumed (unsupported on heat pump) */
  @inherit(u_energy)
  @ext(0x84, 0x04, 0x00, 0x00)
  model PrEnergyFuelHwc {
    @unit("Wh")
    energy: EXP;
  }

  /** total heating thermal energy delivered */
  @inherit(r_energy)
  @ext(0x49, 0x03, 0x00, 0x00)
  model PrEnergyThermalHc {
    /** cumulative heating delivered thermal energy */
    @unit("Wh")
    energy: EXP;
  }

  /** total hot water thermal energy delivered */
  @inherit(r_energy)
  @ext(0x49, 0x04, 0x00, 0x00)
  model PrEnergyThermalHwc {
    /** cumulative hot water delivered thermal energy */
    @unit("Wh")
    energy: EXP;
  }

  /** total cooling thermal energy extracted */
  @inherit(r_energy)
  @ext(0x49, 0x05, 0x00, 0x00)
  model PrEnergyThermalCool {
    /** cumulative cooling extracted thermal energy */
    @unit("Wh")
    energy: EXP;
  }

  /** total heating environmental energy yield */
  @inherit(r_energy)
  @ext(0x42, 0x03, 0x00, 0x00)
  model PrEnergyEnvYieldHc {
    /** cumulative heating environmental energy yield */
    @unit("Wh")
    energy: EXP;
  }

  /** total hot water environmental energy yield */
  @inherit(r_energy)
  @ext(0x42, 0x04, 0x00, 0x00)
  model PrEnergyEnvYieldHwc {
    /** cumulative hot water environmental energy yield */
    @unit("Wh")
    energy: EXP;
  }

  /** total cooling environmental energy yield */
  @inherit(u_energy)
  @ext(0x42, 0x05, 0x00, 0x00)
  model PrEnergyEnvYieldCool {
    @unit("Wh")
    energy: EXP;
  }

  /** default *u for compressor state (b511) */
  @passive
  @base(MF, 0x11)
  model u_11 {}

  /** compressor state and modulation */
  @inherit(u_11)
  @ext(0x00)
  model StateCompressor {
    /** compressor speed */
    @unit("rpm")
    comp_speed: UIN;

    /** outdoor fan speed */
    @unit("rpm")
    fan_speed: UIN;

    /** compressor modulation */
    @unit("%")
    modulation: UCH;

    /** state bytes */
    @maxLength(4)
    state_bytes: HEX;
  }

  /** refrigerant circuit temperatures */
  @inherit(u_11)
  @ext(0x01, 0x01)
  model CircuitTemps {
    /** heat pump flow temperature */
    @unit("°C")
    flow_temp: D1C;

    /** heat pump return temperature */
    @unit("°C")
    return_temp: D1C;

    /** compressor discharge temperature */
    @unit("°C")
    discharge_temp: D1C;

    /** evaporator temperature */
    @unit("°C")
    evaporator_temp: D1C;

    @maxLength(1)
    ign: IGN;

    /** outdoor pump PWM modulation */
    @unit("%")
    pump_pwm: UCH;

    @maxLength(3)
    ign_2: IGN;
  }

  /** compressor runtime and start count in heating mode (sum of Hc+Hwc+Cool runtime/starts matches myVAILLANT app operating hours/cycles) */
  @inherit(u_11)
  @ext(0x18, 0x01)
  model RunStatsCompressorHc {
    @maxLength(1)
    ign: IGN;

    @unit("min")
    runtime: ULG;

    /** start count */
    cycles: ULG;
  }

  /** compressor runtime and start count in hot water mode */
  @inherit(u_11)
  @ext(0x18, 0x02)
  model RunStatsCompressorHwc {
    @maxLength(1)
    ign: IGN;

    @unit("min")
    runtime: ULG;

    /** start count */
    cycles: ULG;
  }

  /** compressor runtime and start count in cooling mode */
  @inherit(u_11)
  @ext(0x18, 0x03)
  model RunStatsCompressorCool {
    @maxLength(1)
    ign: IGN;

    @unit("min")
    runtime: ULG;

    /** start count */
    cycles: ULG;
  }

  // ==============================================================================
  // 2. RUN DATA DIAGNOSTIC SENSORS (b509 - PASSIVE u AND ACTIVE r)
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

  @inherit(u_rundata)
  @ext(0x0d, 0x0a)
  model RunDataCompressorSpeed {
    @unit("rps")
    value: EXP;
  }

  /** (EEV Position in different scale?) */
  @inherit(u_rundata)
  @ext(0x28, 0x0a)
  model RunDataEEVPositionAbs {
    value: UIN;
  }

  @inherit(u_rundata)
  @ext(0x47, 0x0a)
  model RunDataFan1Speed {
    @unit("rpm")
    value: EXP;
  }

  @inherit(u_rundata)
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
  @inherit(r_rundata)
  @ext(0x5b, 0x0d)
  model RunDataElectricPowerConsumption {
    @unit("W")
    power: EXP;
  }

  /** refrigerant high pressure */
  @poll(3)
  @inherit(r_rundata)
  @ext(0x6a, 0x09)
  model RunDataHighPressure {
    @unit("bar")
    press: EXP;
  }

  /** compressor inlet suction temperature */
  @poll(9)
  @inherit(r_rundata)
  @ext(0x98, 0x08)
  model RunDataCompressorInletTemp {
    @unit("°C")
    value: EXP;
  }

  /** compressor outlet discharge temperature */
  @poll(9)
  @inherit(r_rundata)
  @ext(0xa2, 0x08)
  model RunDataCompressorOutletTemp {
    @unit("°C")
    value: EXP;
  }

  /** expansion valve outlet temperature */
  @poll(9)
  @inherit(r_rundata)
  @ext(0xac, 0x08)
  model RunDataEEVOutletTemp {
    @unit("°C")
    value: EXP;
  }

  /** condenser outlet temperature */
  @inherit(u_rundata)
  @ext(0xb6, 0x08)
  model RunDataCondenserOutTemp {
    @unit("°C")
    value: EXP;
  }

  /** current flow temp, accurate to 2 decimal places */
  @poll(2)
  @inherit(r_rundata)
  @ext(0xfc, 0x08)
  model RunDataFlowTemp {
    @unit("°C")
    value: EXP;
  }

  /** current return temp, accurate to 2 decimal places */
  @poll(2)
  @inherit(r_rundata)
  @ext(0x06, 0x09)
  model RunDataReturnTemp {
    @unit("°C")
    value: EXP;
  }

  /** building circuit water flow rate (display D.060) */
  @inherit(u_rundata)
  @ext(0x09, 0x0b)
  model RunDataFlowRate {
    /** building circuit volumetric water flow rate */
    @unit("l/h")
    value: UIN;
  }

  /** maximum residual pump head (display D.231, constant setting) */
  @inherit(u_rundata)
  @ext(0x68, 0x0b)
  model RunDataMaxResidualHead {
    @unit("mbar")
    value: UIN;
  }

  @inherit(u_rundata)
  @ext(0xb8, 0x0b)
  model RunStatsHMUHours {
    @unit("h")
    value: UIN;
  }

  @inherit(u_rundata)
  @ext(0xb9, 0x0b)
  model RunStatsHcHours {
    @unit("h")
    value: UIN;
  }

  /** total runtime of Hwc mode */
  @inherit(u_rundata)
  @ext(0xbc, 0x0b)
  model RunStatsHwcHours {
    @unit("h")
    value: UIN;
  }

  /** switching operations of the auxiliary heater (display D.074) */
  @inherit(u_rundata)
  @ext(0xc0, 0x0b)
  model RunStatsAuxHeaterSwitches {
    value: UIN;
  }

  /** total starts of Hwc mode */
  @inherit(u_rundata)
  @ext(0xc1, 0x0b)
  model RunStatsHwcStarts {
    value: UIN;
  }

  @inherit(u_rundata)
  @ext(0xc2, 0x0b)
  model RunStatsCompressorHours {
    @unit("h")
    value: UIN;
  }

  /** start count */
  @inherit(u_rundata)
  @ext(0xc3, 0x0b)
  model RunStatsCompressorStarts {
    value: UIN;
  }

  @inherit(u_rundata)
  @ext(0xc4, 0x0b)
  model RunStatsBuildingPumpHours {
    @unit("h")
    value: UIN;
  }

  @inherit(u_rundata)
  @ext(0xc5, 0x09)
  model RunDataBuildingCPumpPower {
    @unit("%")
    value: EXP;
  }

  /** total starts of building circuit pump */
  @inherit(u_rundata)
  @ext(0xc5, 0x0b)
  model RunStatsBuildingCPumpStarts {
    value: UIN;
  }

  @inherit(u_rundata)
  @ext(0xc8, 0x0b)
  model RunStats4PortValveHours {
    @unit("h")
    value: UIN;
  }

  /** start count */
  @inherit(u_rundata)
  @ext(0xc9, 0x0b)
  model RunStats4PortValveSwitches {
    value: UIN;
  }

  @inherit(u_rundata)
  @ext(0xd7, 0x0b)
  model RunStatsFan1Hours {
    @unit("h")
    value: UIN;
  }

  /** start count */
  @inherit(u_rundata)
  @ext(0xd8, 0x0b)
  model RunStatsFan1Starts {
    value: UIN;
  }

  @inherit(u_rundata)
  @ext(0xd9, 0x0b)
  model RunStatsFan2Hours {
    @unit("h")
    value: UIN;
  }

  /** start count */
  @inherit(u_rundata)
  @ext(0xda, 0x0b)
  model RunStatsFan2Starts {
    value: UIN;
  }

  /** outdoor air inlet temperature */
  @poll(9)
  @inherit(r_rundata)
  @ext(0xde, 0x08)
  model RunDataAirInletTemp {
    @unit("°C")
    value: EXP;
  }

  /** cooling operating hours */
  @inherit(u_rundata)
  @ext(0xe1, 0x0b)
  model RunStatsCoolingHours {
    @unit("h")
    value: UIN;
  }

  /** cooling start count */
  @inherit(u_rundata)
  @ext(0xe2, 0x0b)
  model RunStatsCoolingStarts {
    value: UIN;
  }

  /** defrost operating hours */
  @inherit(u_rundata)
  @ext(0xe3, 0x0b)
  model RunStatsDeiceHours {
    @unit("h")
    value: UIN;
  }

  /** defrost start count */
  @inherit(u_rundata)
  @ext(0xe4, 0x0b)
  model RunStatsDeiceStarts {
    value: UIN;
  }

  /** backup electric heater operating hours */
  @inherit(u_rundata)
  @ext(0xe5, 0x0b)
  model RunStatsImmersionHeaterHours {
    @unit("h")
    value: UIN;
  }

  /** backup electric heater start count */
  @inherit(u_rundata)
  @ext(0xe6, 0x0b)
  model RunStatsImmersionHeaterStarts {
    value: UIN;
  }

  /** compressor flow temperature target (display: flow temperature target compressor) */
  @inherit(u_rundata)
  @ext(0x4a, 0x0d)
  model RunDataFlowTempDesired {
    @unit("°C")
    value: EXP;
  }

  /** compressor energy integral (display: energy integral compressor) */
  @inherit(u_rundata)
  @ext(0xfe, 0x0a)
  model RunDataEnergyIntegral {
    @unit("°min")
    value: SIN;
  }

  /** evaporation temperature (display: evaporation temperature) */
  @inherit(u_rundata)
  @ext(0xd1, 0x10)
  model RunDataEvaporationTemp {
    @unit("°C")
    @divisor(16)
    value: SIN;
  }

  /** suction line superheat (display: superheat) */
  @inherit(u_rundata)
  @ext(0xd7, 0x10)
  model RunDataSuperheat {
    @unit("K")
    @divisor(16)
    value: SIN;
  }

  /** condenser liquid outlet temperature (condensation temperature minus this value matches display subcooling) */
  @inherit(u_rundata)
  @ext(0xdb, 0x10)
  model RunDataCondensateTemp {
    @unit("°C")
    @divisor(16)
    value: SIN;
  }

  // ==============================================================================
  // 3. STATISTICS AND GLOBAL STATE (PASSIVE u)
  // ==============================================================================

  @inherit(u_11)
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
  @inherit(u_11)
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

  /** operating mode/maximum temp/current temp */
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

  /** Status */
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

  /** Current errors */
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

  /** outdoor unit status code */
  @inherit(u_error)
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
  @inherit(u_error)
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

  /** condensation temperature (display: condensation temperature) */
  @inherit(u_diagfeat)
  @ext(0x05, 0xff, 0x35, 0x46)
  model RunDataCondensationTemp {
    @maxLength(3)
    ign: IGN;

    @unit("°C")
    @divisor(16)
    value: SIN;

    @maxLength(5)
    ign_2: IGN;
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

  /** diagnostic code readout */
  @inherit(u_rundata)
  @ext(0xcc, 0x10)
  model RunDataDiagnostic {
    @maxLength(2)
    value: HEX;
  }

  /** diagnostic code 030b readout */
  @inherit(u_rundata)
  @ext(0x03, 0x0b)
  model RunDataDiag030b {
    @maxLength(2)
    value: HEX;
  }

  /** diagnostic code fd0a readout */
  @inherit(u_rundata)
  @ext(0xfd, 0x0a)
  model RunDataDiagfd0a {
    @maxLength(2)
    value: HEX;
  }

  /** diagnostic code 8813 readout */
  @inherit(u_rundata)
  @ext(0x88, 0x13)
  model RunDataDiag8813 {
    @maxLength(10)
    value: HEX;
  }

  /** diagnostic code 8b13 readout */
  @inherit(u_rundata)
  @ext(0x8b, 0x13)
  model RunDataDiag8b13 {
    @maxLength(10)
    value: HEX;
  }

  /** included parts */
  union _includes {
    B516_inc,
  }
}
