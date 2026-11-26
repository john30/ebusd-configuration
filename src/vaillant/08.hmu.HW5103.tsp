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
namespace Hmu_HW5103 {
  /** default *r */
  @base(MF, 0x11)
  model r_1 {}

  @condition(Id.Id.sw, ">=902")
  @inherit(r_1)
  @ext(0x18, 1)
  model CompressorHc {
    @maxLength(1) ign: IGN;
    runtime: minutes4;
    cycles: cntstarts;
  }

  @condition(Id.Id.sw, ">=902")
  @inherit(r_1)
  @ext(0x18, 0x2)
  model CompressorHwc {
    @maxLength(1) ign: IGN;
    runtime: minutes4;
    cycles: cntstarts;
  }

  /** default *r */
  @base(MF, 0x1a, 0x5, 0xff, 0x32)
  model r_2 {
    @maxLength(3)
    ign: IGN;
  }

  @inherit(r_2)
  @ext(0)
  model YieldHcDay {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_2)
  @ext(1)
  model YieldCoolDay {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_2)
  @ext(0x2)
  model YieldHwcDay {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_2)
  @ext(0xe)
  model YieldHcMonth {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_2)
  @ext(0xf)
  model CopHcMonth {
    @divisor(10)
    value: UIN;
  }

  @inherit(r_2)
  @ext(0x10)
  model YieldHc {
    @unit("kWh")
    value: energy;
  }

  @inherit(r_2)
  @ext(0x11)
  model CopHc {
    @divisor(10)
    value: UIN;
  }

  @inherit(r_2)
  @ext(0x12)
  model YieldHwcMonth {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_2)
  @ext(0x13)
  model CopHwcMonth {
    @divisor(10)
    value: UIN;
  }

  /** energy yield hot water */
  @inherit(r_2)
  @ext(0x16)
  @Ebus.example("2227 kWh", "08b51a0405ff3216", "0aff0826b3080000000000")
  model YieldHwc {
    value: energy4;
  }

  @inherit(r_2)
  @ext(0x17)
  model CopHwc {
    @divisor(10)
    value: UIN;
  }

  @inherit(r_2)
  @ext(0x1e)
  model CompressorBlocktime {
    @unit("min")
    value: UIN;
  }

  @inherit(r_2)
  @ext(0x1f)
  model SupplyTempWeighted {
    value: temp;
  }

  /** current flow temperature */
  @inherit(r_2)
  @ext(0x20)
  model FlowTemp {
    value: temp;
  }

  /** current energy integral */
  @inherit(r_2)
  @ext(0x21)
  model EnergyIntegral {
    value: integral;
  }

  /** current yielded energy from the environment */
  @inherit(r_2)
  @ext(0x23)
  model CurrentYieldPower {
    @unit("kW")
    @divisor(10)
    value: D1B;
  }

  /** current power consumption */
  @inherit(r_2)
  @ext(0x24)
  model CurrentConsumedPower {
    @unit("kW")
    @divisor(10)
    value: D1B;
  }

  /** current compressor utilization */
  @inherit(r_2)
  @ext(0x25)
  @Ebus.example("52%", "3108b51a0405ff3225", "0aff08384d030000000000")
  model CurrentCompressorUtil {
    value: percent;
  }

  @inherit(r_2)
  @ext(0x2A)
  model YieldCoolingMonth {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_2)
  @ext(0x2B)
  model CopCoolingMonth {
    @divisor(10)
    value: UIN;
  }

  @inherit(r_2)
  @ext(0x2C)
  model YieldCooling {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_2)
  @ext(0x2D)
  model CopCooling {
    @divisor(10)
    value: UIN;
  }

  @inherit(r_2)
  @ext(0x3c)
  model BuildingCircuitFlow {
    @unit("l/h")
    value: UIN;
  }

  @condition(Id.Id.sw, ">=902")
  @inherit(r_2)
  @ext(0x3d)
  model FlowPressure {
    @unit("bar")
    @divisor(4)
    value: D2C;
  }

  @inherit(r_2)
  @ext(0x4d)
  model TotalEnergyUsage {
    @unit("kWh")
    value: energy;
  }

  // B509
  /** default *r */
  @base(MF, 0x9, 0x54, 0x2, 0)
  model r_7 {
    @maxLength(4)
    ign: IGN;
  }

  @inherit(r_7)
  @ext(0xd, 0xa)
  model RunDataCompressorSpeed {
    @unit("rps")
    value: EXP;
  }

  /** (EEV Position in different scale?) */
  @inherit(r_7)
  @ext(0x28, 0xa)
  model RunDataEEVPositionAbs {
    value: UIN;
  }

  @inherit(r_7)
  @ext(0x47, 0xa)
  model RunDataFan1Speed {
    value: fanspeedv;
  }

  @inherit(r_7)
  @ext(0x49, 0xa)
  model RunDataFan2Speed {
    value: fanspeedv;
  }

  @inherit(r_7)
  @ext(0x53, 0xd)
  model RunDataStatuscode {
    value: hmucode;
  }

  @inherit(r_7)
  @ext(0x6a, 0x9)
  model RunDataHighPressure {
    value: pressv;
  }

  @inherit(r_7)
  @ext(0x98, 0x8)
  model RunDataCompressorInletTemp {
    value: tempv;
  }

  @inherit(r_7)
  @ext(0xa2, 0x8)
  model RunDataCompressorOutletTemp {
    value: tempv;
  }

  @inherit(r_7)
  @ext(0xac, 0x8)
  model RunDataEEVOutletTemp {
    value: tempv;
  }

  @inherit(r_7)
  @ext(0xb8, 0xb)
  model RunStatsHMUHours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xb9, 0xb)
  model RunStatsHcHours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xbc, 0xb)
  model RunStatsHwcHours {
    /** total runtime of Hwc mode */
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xc2, 0xb)
  model RunStatsCompressorHours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xc3, 0xb)
  model RunStatsCompressorStarts {
    value: cntstarts2;
  }

  @inherit(r_7)
  @ext(0xc4, 0xb)
  model RunStatsBuildingPumpHours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xc5, 0x9)
  model RunDataBuildingCPumpPower {
    @unit("%")
    value: EXP;
  }

  @inherit(r_7)
  @ext(0xc5, 0xb)
  model RunStatsBuildingCPumpStarts {
    /** total starts of building circuit pump */
    value: cntstarts2;
  }

  @inherit(r_7)
  @ext(0xc8, 0xb)
  model RunStats4PortValveHours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xc9, 0xb)
  model RunStats4PortValveSwitches {
    value: cntstarts2;
  }

  @inherit(r_7)
  @ext(0xd7, 0xb)
  model RunStatsFan1Hours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xd8, 0xb)
  model RunStatsFan1Starts {
    value: cntstarts2;
  }

  @inherit(r_7)
  @ext(0xd9, 0xb)
  model RunStatsFan2Hours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xda, 0xb)
  model RunStatsFan2Starts {
    value: cntstarts2;
  }

  @inherit(r_7)
  @ext(0xde, 0x8)
  model RunDataAirInletTemp {
    value: tempv;
  }

  // ---------------------------------------------------------------------------
  // Additions 2026-11-26 from the Vaillant EU Data Act export (myVaillant
  // "download data"): the gateway (NETX3, f1) polls these registers since
  // 2026-11-23 every 1-5 min. Names/units/register numbers are Vaillant's own
  // ("symbolicAddress" = register, e.g. 3422 = 0x0d5e -> ext 0x5e, 0xd).
  // Byte-exact cross check against a passive eBUS log: 10.433 values, 0 diffs.
  // Vaillant name given in the doc comment.
  // ---------------------------------------------------------------------------

  // B509 54 02 00 <reg_lo> <reg_hi>, answer 02 01 <reg_lo> <reg_hi> <data>

  /** thermal (condensation) power, Vaillant ASW1_CondensationCapacity */
  @inherit(r_7)
  @ext(0x5e, 0xd)
  @Ebus.example("4140 W", "08b509055402005e0d", "0802015e0d62608145")
  model RunDataThermalPower {
    @unit("W")
    value: EXP;
  }

  /** electrical power consumption, Vaillant ASW1_PowerConsumption */
  @inherit(r_7)
  @ext(0x5b, 0xd)
  @Ebus.example("1097.8 W", "08b509055402005b0d", "0802015b0d963a8944")
  model RunDataElectricPowerConsumption {
    @unit("W")
    value: EXP;
  }

  /** flow temperature, accurate to 2 decimal places, Vaillant FlowTemperatureSensor */
  @inherit(r_7)
  @ext(0xfc, 0x8)
  model RunDataFlowTemp {
    value: tempv;
  }

  /** return temperature, accurate to 2 decimal places, Vaillant ReturnTemperatureSensor */
  @inherit(r_7)
  @ext(0x6, 0x9)
  @Ebus.example("28.68 °C", "08b509055402000609", "0802010609e06ce541")
  model RunDataReturnTemp {
    value: tempv;
  }

  /** desired flow temperature incl. hot water, Vaillant DesiredFlowTemperature */
  @inherit(r_7)
  @ext(0x4a, 0xd)
  model RunDataDesiredFlowTemp {
    value: tempv;
  }

  /** water pressure, Vaillant WaterPressureSensor */
  @inherit(r_7)
  @ext(0x74, 0x9)
  model RunDataWaterPressure {
    value: pressv;
  }

  /** 4 way valve (on = defrosting), Vaillant FourWayValve */
  @inherit(r_7)
  @ext(0x19, 0xa)
  model RunDataFourWayValve {
    value: onoff;
  }

  /** Vaillant ESC */
  @inherit(r_7)
  @ext(0x4, 0xa)
  model RunDataESC {
    value: yesno;
  }

  /** condensation temperature, Vaillant RefrigerantCircuitCondensationTemperature */
  @inherit(r_7)
  @ext(0xa6, 0xe)
  model RunDataCondensationTemp {
    value: tempv;
  }

  /** evaporation temperature, Vaillant RefrigerantCircuitEvaporationTemperature */
  @inherit(r_7)
  @ext(0xa7, 0xe)
  model RunDataEvaporationTemp {
    value: tempv;
  }

  /** target superheating, Vaillant RefrigerantCircuitTargetSuperheating */
  @inherit(r_7)
  @ext(0xa8, 0xe)
  model RunDataTargetSuperheat {
    @unit("K")
    value: EXP;
  }

  /** current superheating, Vaillant RefrigerantCircuitCurrentSuperheating */
  @inherit(r_7)
  @ext(0xa9, 0xe)
  model RunDataSuperheat {
    @unit("K")
    value: EXP;
  }

  /** current subcooling, Vaillant RefrigerantCircuitCurrentSubcooling */
  @inherit(r_7)
  @ext(0xaa, 0xe)
  model RunDataSubcooling {
    @unit("K")
    value: EXP;
  }

  /** setpoint subcooling, Vaillant RefrigerantCircuitSetpointSubcooling */
  @inherit(r_7)
  @ext(0xac, 0xe)
  model RunDataTargetSubcooling {
    @unit("K")
    value: EXP;
  }

  /** refrigerant temperature after building heat exchanger/EEV, Vaillant TRefriBuildHexEev */
  @inherit(r_7)
  @ext(0xb6, 0x8)
  model RunDataRefrigerantBuildHexTemp {
    value: tempv;
  }

  /** building circuit heat exchanger outlet temperature (0 if not fitted), Vaillant BuildingCircuitHeatExchangerOutletTemperature */
  @inherit(r_7)
  @ext(0xba, 0x8)
  model RunDataBuildingHexOutletTemp {
    value: tempv;
  }

  /** building circuit heat exchanger inlet temperature (0 if not fitted), Vaillant BuildingCircuitHeatExchangerInletTemperature */
  @inherit(r_7)
  @ext(0xc4, 0x8)
  model RunDataBuildingHexInletTemp {
    value: tempv;
  }

  /** building circuit flow (vortex sensor), Vaillant VortexFlow_lph */
  @inherit(r_7)
  @ext(0xba, 0x9)
  model RunDataVortexFlow {
    @unit("l/h")
    value: EXP;
  }

  /** building circuit flow DN15 scaling, Vaillant VortexFlowDN15_lph */
  @inherit(r_7)
  @ext(0xbc, 0x9)
  model RunDataVortexFlowDN15 {
    @unit("l/h")
    value: EXP;
  }

  /** building circuit flow DN20 scaling (approx. 2x DN15), Vaillant VortexFlowDN20_lph */
  @inherit(r_7)
  @ext(0xbd, 0x9)
  model RunDataVortexFlowDN20 {
    @unit("l/h")
    value: EXP;
  }

  /** inverter input current limit (raw 13.5 seen, Vaillant shows 0), Vaillant Inv_InputCurrentLimit */
  @inherit(r_7)
  @ext(0x7c, 0x8)
  model RunDataInverterCurrentLimit {
    @unit("A")
    value: EXP;
  }

  /** requested operation mode, Vaillant ASW1_ReqOpMode */
  @inherit(r_7)
  @ext(0x48, 0xd)
  model RunDataReqOpMode {
    @values(Values_hmureqopmode)
    value: UCH;
  }

  /** current operation mode, Vaillant ASW1_CurOpMode */
  @inherit(r_7)
  @ext(0x49, 0xd)
  model RunDataCurOpMode {
    @values(Values_hmucuropmode)
    value: UCH;
  }

  /** noise reduction demand, Vaillant ASW1_NoiseReductionDemand */
  @inherit(r_7)
  @ext(0x4e, 0xd)
  model RunDataNoiseReductionDemand {
    value: yesno;
  }

  /** maintenance list (65535 = empty), Vaillant MaintenanceList */
  @inherit(r_7)
  @ext(0x54, 0xd)
  model RunDataMaintenanceList {
    code1: UIN;
    code2: UIN;
    code3: UIN;
    code4: UIN;
    code5: UIN;
  }

  /** emergency list (65535 = empty), Vaillant EmergencyList */
  @inherit(r_7)
  @ext(0x55, 0xd)
  model RunDataEmergencyList {
    code1: UIN;
    code2: UIN;
    code3: UIN;
    code4: UIN;
    code5: UIN;
  }

  /** fault list (65535 = empty), Vaillant FaultList */
  @inherit(r_7)
  @ext(0x56, 0xd)
  model RunDataFaultList {
    code1: UIN;
    code2: UIN;
    code3: UIN;
    code4: UIN;
    code5: UIN;
  }

  /** crank case heater hours, Vaillant HP_CrankCaseHeaterOperatingHours */
  @inherit(r_7)
  @ext(0xe1, 0xb)
  model RunStatsCrankCaseHeaterHours {
    @unit("h")
    value: ULG;
  }

  /** crank case heater switches, Vaillant HP_CrankCaseHeaterCommutations */
  @inherit(r_7)
  @ext(0xe2, 0xb)
  model RunStatsCrankCaseHeaterSwitches {
    value: ULG;
  }

  /** condensate tray heater hours, Vaillant HP_CondensateTrayHeaterOperatingHours */
  @inherit(r_7)
  @ext(0xe3, 0xb)
  model RunStatsCondensateTrayHeaterHours {
    @unit("h")
    value: ULG;
  }

  /** condensate tray heater switches, Vaillant HP_CondensateTrayHeaterCommutations */
  @inherit(r_7)
  @ext(0xe4, 0xb)
  model RunStatsCondensateTrayHeaterSwitches {
    value: ULG;
  }

  /** compressor safety relay hours, Vaillant HP_CompressorSafetyRelayOperatingHours */
  @inherit(r_7)
  @ext(0xe5, 0xb)
  model RunStatsCompressorSafetyRelayHours {
    @unit("h")
    value: ULG;
  }

  /** compressor safety relay switches, Vaillant HP_CompressorSafetyRelayCommutations */
  @inherit(r_7)
  @ext(0xe6, 0xb)
  model RunStatsCompressorSafetyRelaySwitches {
    value: ULG;
  }

  /** flow setpoint backup heater, Vaillant ASW0_FlowSetpointBackupHeater */
  @inherit(r_7)
  @ext(0xea, 0xc)
  model RunDataBackupHeaterFlowSetpoint {
    value: tempv;
  }

  /** refrigerant high pressure switch, Vaillant RefrigerantCircuitHighPressureSwitch */
  @inherit(r_7)
  @ext(0xf7, 0x9)
  model RunDataHighPressureSwitch {
    value: yesno;
  }

  // B51A 05 FF 32 <nr>, answer FF 08 <type> <value LE>

  /** appliance hours powered, Vaillant ApplianceOperatingHoursPowered */
  @inherit(r_2)
  @ext(0x40)
  model OperatingHoursPowered {
    @unit("h")
    value: ULG;
  }

  /** appliance hours central heating, Vaillant ApplianceOperatingHoursCentralHeating */
  @inherit(r_2)
  @ext(0x41)
  model OperatingHoursHc {
    @unit("h")
    value: ULG;
  }

  /** appliance hours cooling, Vaillant ApplianceOperatingHoursCooling */
  @inherit(r_2)
  @ext(0x43)
  model OperatingHoursCooling {
    @unit("h")
    value: ULG;
  }

  /** appliance hours hot water, Vaillant ApplianceOperatingHoursDomesticHotWater */
  @inherit(r_2)
  @ext(0x44)
  model OperatingHoursHwc {
    @unit("h")
    value: ULG;
  }

  // B51A 05 FF 34 <nr>, answer FF 08 <type> <value LE> (counters)
  // or FF 02 <type> <value> <min> <max> <step> (parameters)

  /** default *r (b51a 05 ff 34) */
  @base(MF, 0x1a, 0x5, 0xff, 0x34)
  model r_x34 {
    @maxLength(3)
    ign: IGN;
  }

  /** building pump hours, Vaillant WaterPumpOperatingHours */
  @inherit(r_x34)
  @ext(0x2)
  model BuildingPumpHours {
    value: hoursum2;
  }

  /** building pump starts, Vaillant WaterPumpCommutations */
  @inherit(r_x34)
  @ext(0x3)
  model BuildingPumpStarts {
    value: UIN;
  }

  /** 4 way valve hours (defrost), Vaillant FourWayValveOperatingHours */
  @inherit(r_x34)
  @ext(0x6)
  model FourWayValveHours {
    value: hoursum2;
  }

  /** 4 way valve switches (= number of defrosts), Vaillant FourWayValveCommutations */
  @inherit(r_x34)
  @ext(0x7)
  @Ebus.example("1032", "08b51a0405ff3407", "0aff082808040000000000")
  model FourWayValveSwitches {
    value: UIN;
  }

  /** fan hours, Vaillant VentilatorOperatingHours */
  @inherit(r_x34)
  @ext(0x51)
  model Fan1Hours {
    value: hoursum2;
  }

  /** fan starts, Vaillant VentilatorCounter */
  @inherit(r_x34)
  @ext(0x52)
  model Fan1Starts {
    value: UIN;
  }

  /** maximum remaining pressure head (parameter), Vaillant MaximumRemainingPressureHead */
  @inherit(r_x34)
  @ext(0x1f)
  model MaxRemainingPressureHead {
    @unit("mbar")
    value: UIN;
  }

  /** hot water operation mode (parameter, set at the indoor unit), Vaillant DomesticHotWaterOperationMode */
  @inherit(r_x34)
  @ext(0x44)
  @Ebus.example("balanced", "08b51a0405ff3444", "0aff020002000000020001")
  model HwcOperationMode {
    @values(Values_hmuhwcopmode)
    value: UIN;
  }

  /** current operation mode of the outdoor unit (ASW1_CurOpMode) */
  enum Values_hmucuropmode {
    off: 0,
    heating: 1,
    hwc: 2,
    defrost: 4,
  }

  /** requested operation mode of the outdoor unit (ASW1_ReqOpMode) */
  enum Values_hmureqopmode {
    none: 0,
    heating: 1,
    hwc: 5,
  }

  /** hot water operation mode (all three values seen on the device) */
  enum Values_hmuhwcopmode {
    eco: 0,
    normal: 1,
    balanced: 2,
  }

  // B516
  /** default *r */
  @base(MF, 0x16)
  model r_x16 {
    @maxLength(1)
    ign: IGN;
  }

  @inherit(r_x16)
  @ext(0x14)
  model PowerConsumptionHmu {
    @unit("kW")
    @divisor(1000)
    value: EXP;
  }

  /** included parts */
  union _includes {
    Hcmode_inc,
    Errors_inc,
  }
}
