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
  model YieldHwc {
    value: energy4;
  }

  @inherit(r_2)
  @ext(0x17)
  model CopHwc {
    @divisor(10)
    value: UIN;
  }

  /** operation hours */
  @inherit(r_2)
  @ext(0x40)
  model Hours {
    value: hoursum;
  }

  /** operation hours heating */
  @inherit(r_2)
  @ext(0x41)
  model HoursHc {
    value: hoursum;
  }

  /** operation hours cooling */
  @inherit(r_2)
  @ext(0x43)
  model HoursCool {
    value: hoursum;
  }

  /** operation hours hot water */
  @inherit(r_2)
  @ext(0x44)
  model HoursHwc {
    value: hoursum;
  }
  // some more statistics from Live Monitor

  /** target flow temperature */
  @inherit(r_2)
  @ext(0x1f)
  model TargetFlowTemp {
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
  // example: 3108b51a0405ff3223 / 0aff083500000000000000

  /** current yielded energy from the environment */
  @inherit(r_2)
  @ext(0x23)
  model CurrentYieldPower {
    @unit("kW")
    @divisor(10)
    value: D1B;
  }
  // example: 3108b51a0405ff3224 / 0aff083501000000000000

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
  model CurrentCompressorUtil {
    @unit("%")
    value: D1B;
  }

  /** air intake temperature */
  @inherit(r_2)
  @ext(0x26)
  model AirIntakeTemp {
    value: temp;
  }
  // Values from Live Monitor

  /** heat circuit target temperature */
  @inherit(r_2)
  @ext(0x1c)
  model TargetTempHc {
    @unit("°C")
    value: D2C;
  }

  @inherit(r_2)
  @ext(0x27)
  model SourceTempOutput {
    @unit("°C")
    value: D2C;
  }

  @inherit(r_2)
  @ext(0x3c)
  model BuildingCircuitFlow {
    @unit("l/h")
    value: UIN;
  }

  @inherit(r_2)
  @ext(0x3d)
  model FlowPressure {
    @divisor(4)
    value: D2C;
  }

  @inherit(r_2)
  @ext(0x3e)
  model SourcePressure {
    @divisor(4)
    value: D2C;
  }
  // example: 3108b51a0405ff324d / 02ff01 (not working!)

  @inherit(r_2)
  @ext(0x4d)
  model TotalEnergyUsage {
    @unit("kWh")
    value: energy;
  }

  /** default *r */
  @base(MF, 0x1a, 0x5, 0xff, 0x34)
  model r_3 {
    @maxLength(3)
    value: IGN;
  }
  // TODO ff34 prefix also seen as e534 in PR 330,see also duplication in StatCompressorHours with b434 and others. this seems to be HW/SW specific and needs to be sorted out.

  /** default *u */
  @passive
  @base(MF, 0x1a, 0x5, 0xe5, 0x34)
  model u_1 {
    @maxLength(3)
    value: IGN;
  }

  @inherit(r_3, u_1)
  @ext(0)
  model CompressorHours {
    value: hoursum2;
  }

  @inherit(r_3, u_1)
  @ext(1)
  model CompressorStarts {
    value: UIN;
  }

  @inherit(r_3, u_1)
  @ext(0x2)
  model BuildingPumpHours {
    value: hoursum2;
  }

  @inherit(r_3, u_1)
  @ext(0x3)
  model BuildingPumpStarts {
    value: UIN;
  }

  @inherit(r_3, u_1)
  @ext(0x6)
  model FourWayValveHours {
    value: hoursum2;
  }

  @inherit(r_3, u_1)
  @ext(0x7)
  model FourWayValveSwitches {
    value: UIN;
  }

  @inherit(r_3, u_1)
  @ext(0xd)
  model EEVSteps {
    value: UIN;
  }

  @inherit(r_3, u_1)
  @ext(0x30)
  model FourWayValveSwitchingOperations {
    value: UIN;
  }

  @inherit(r_3, u_1)
  @ext(0x51)
  model Fan1Hours {
    value: hoursum2;
  }

  @inherit(r_3, u_1)
  @ext(0x52)
  model Fan1Starts {
    value: UIN;
  }

  @inherit(r_3, u_1)
  @ext(0x5e)
  model Fan2Hours {
    value: hoursum2;
  }

  @inherit(r_3, u_1)
  @ext(0x5f)
  model Fan2Starts {
    value: UIN;
  }
  // Heat pump configuration menu values

  @inherit(r_3)
  @ext(0x8f, 0x35, 0x2d)
  model HeatCurve {
    @maxLength(3)
    ign: IGN;

    /** heat curve 0.1 to 4.0 */
    @divisor(10)
    bcd: BCD;
  }

  @inherit(r_3)
  @ext(0x8f, 0x35, 0x2e)
  model SummerSwitchOffTemp {
    @maxLength(3)
    ign: IGN;

    /** Switch-off temperature summer (°C) */
    @unit("°C")
    d2c: D2C;
  }

  @inherit(r_3)
  @ext(0x8f, 0x35, 0x2f)
  model HcBivalencePoint {
    @maxLength(3)
    ign: IGN;

    /** Central heating bivalence point (°C) */
    @unit("°C")
    d2c: D2C;
  }

  @inherit(r_3)
  @ext(0x8f, 0x35, 0x30)
  model HwcBivalencePoint {
    @maxLength(3)
    ign: IGN;

    /** Bivalence point domestic hot water (°C) */
    @unit("°C")
    d2c: D2C;
  }

  @inherit(r_3)
  @ext(0x8f, 0x35, 0x32)
  model MaxFlowTemp {
    @maxLength(3)
    ign: IGN;

    /** Maximum flow temperature (°C) */
    @unit("°C")
    d2c: D2C;
  }

  @inherit(r_3)
  @ext(0x8f, 0x35, 0x33)
  model MinFlowTemp {
    @maxLength(3)
    ign: IGN;

    /** Minimum flow temperature (°C) */
    @unit("°C")
    d2c: D2C;
  }

  @inherit(r_3)
  @ext(0x8f, 0x35, 0x34)
  model HcModeActive {
    @maxLength(3)
    ign: IGN;

    /** Central heating mode active (yes/no) */
    @values(Values_Central_heating_mode_active__yes_no_)
    uch: UCH;
  }

  @inherit(r_3)
  @ext(0x8f, 0x35, 0x35)
  model HwcModeActive {
    @maxLength(3)
    ign: IGN;

    /** Domestic hot water mode active (yes/no) */
    @values(Values_Domestic_hot_water_mode_active__yes_no_)
    uch: UCH;
  }

  @inherit(r_3)
  @ext(0x8f, 0x35, 0x39)
  model HwcChargeHysteresis {
    @maxLength(3)
    ign: IGN;

    /** Hysteresis Hwc charging (°K) */
    @unit("°K")
    d2c: D2C;
  }

  @inherit(r_3)
  @ext(0xc4, 0x33, 0x1e)
  model ImmersionHeaterMode {
    @maxLength(3)
    ign: IGN;

    /** Immersion heater mode (on/off) */
    @values(Values_Immersion_heater_mode__on_off_)
    uch: UCH;
  }

  @inherit(r_3)
  @ext(0xf8, 0x34, 0x43)
  model CompressorHysteresisHc {
    @maxLength(3)
    ign: IGN;

    /** Compressor hysteresis central heating (°K) */
    @unit("°K")
    d2c: D2C;
  }

  @inherit(r_3)
  @ext(0x86, 0x35, 0x3f)
  model CompressorHysteresisCooling {
    @maxLength(3)
    ign: IGN;

    /** Compressor hysteresis cooling (°K) */
    d2c: D2C;
  }

  @inherit(r_3)
  @ext(0x52, 0x34, 0x44)
  model HwcMode {
    @maxLength(3)
    ign: IGN;

    /** Domestic hot water mod (eco/normal/balance) */
    @values(Values_Domestic_hot_water_mod__eco_normal_balance_)
    uch: UCH;
  }

  @inherit(r_3)
  @ext(0xc6, 0x32, 0x7)
  model TargetTempHwc {
    @maxLength(3)
    ign: IGN;

    /** Target Hwc temperature (°C) */
    @unit("°C")
    d2c: D2C;
  }
  // Total heating yields

  /** default *r */
  @base(MF, 0x16, 0x18)
  model r_4 {
    @maxLength(1)
    value: IGN;
  }

  @inherit(r_4)
  @ext(1)
  model YieldTotal {
    value: energy;
  }
  // Total electric power consumption

  @inherit(r_4)
  @ext(0x2)
  model ConsumptionTotal {
    value: energy;
  }
  // Ecologic energy Yields

  /** default *r */
  @base(MF, 0x16, 0x1a, 1)
  model r_5 {
    @maxLength(1)
    value: IGN;
  }

  @inherit(r_5)
  @ext(1, 0)
  model YieldThisYear1 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x2, 0)
  model YieldThisYear2 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x3, 0)
  model YieldThisYear3 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x4, 0)
  model YieldThisYear4 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x5, 0)
  model YieldThisYear5 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x6, 0)
  model YieldThisYear6 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x7, 0)
  model YieldThisYear7 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x8, 0)
  model YieldThisYear8 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0x9, 0)
  model YieldThisYear9 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0xa, 0)
  model YieldThisYear10 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
  @ext(0xb, 0)
  model YieldThisYear11 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_5)
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
  model r_6 {
    @maxLength(1)
    value: IGN;
  }

  @inherit(r_6)
  @ext(1, 0)
  model ConsumptionThisYear1 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_6)
  @ext(0x2, 0)
  model ConsumptionThisYear2 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_6)
  @ext(0x3, 0)
  model ConsumptionThisYear3 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_6)
  @ext(0x4, 0)
  model ConsumptionThisYear4 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_6)
  @ext(0x5, 0)
  model ConsumptionThisYear5 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_6)
  @ext(0x6, 0)
  model ConsumptionThisYear6 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_6)
  @ext(0x7, 0)
  model ConsumptionThisYear7 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_6)
  @ext(0x8, 0)
  model ConsumptionThisYear8 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_6)
  @ext(0x9, 0)
  model ConsumptionThisYear9 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_6)
  @ext(0xa, 0)
  model ConsumptionThisYear10 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_6)
  @ext(0xb, 0)
  model ConsumptionThisYear11 {
    month: D1B;

    @maxLength(1)
    ign: IGN;

    energy: energy;
  }

  @inherit(r_6)
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
    @out
    @maxLength(3)
    @constValue("03FFFF")
    ignore: HEX;
  }

  /** read EEV position */
  @inherit(ws_1)
  @ext(0x15)
  model EnableTestEEVPosition {}

  /** EEV position */
  @inherit(rs)
  @ext(0x15)
  model TestEEVPosition {
    /** T.0.21 */
    value: percent0;
  }

  /** read compressor outlet temperature */
  @inherit(ws_1)
  @ext(0x37)
  model EnableTestCompressorExitTemp {}

  /** compressor outlet temperature */
  @inherit(rs)
  @ext(0x37)
  model TestCompressorExitTemp {
    /** T.0.55 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** read compressor inlet temperature */
  @inherit(ws_1)
  @ext(0x38)
  model EnableTestCompressorIntakeTemp {}

  /** compressor inlet temperature */
  @inherit(rs)
  @ext(0x38)
  model TestCompressorInletTemp {
    /** T.0.56 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** read current heating water flow rate */
  @inherit(ws_1)
  @ext(0x2b)
  model EnableTestWaterThroughput {}

  /** current heating water flow rate */
  @inherit(rs)
  @ext(0x2b)
  model TestWaterThroughput {
    /** T.0.45 */
    @unit("l/h")
    value: UIN;
  }

  /** read compressor speed */
  @inherit(ws_1)
  @ext(0x5d)
  model EnableTestCompressorSpeed {}

  /** compressor speed */
  @inherit(rs)
  @ext(0x5d)
  model TestCompressorSpeed {
    /** T.0.93 */
    @unit("U/s")
    @divisor(10)
    value: SIN;
  }
  // installer level test menu sensor/actor test from PR #174

  /** building pump power */
  @inherit(rs)
  @ext(1)
  model TestBuildingPumpPower {
    /** T.0.01 */
    value: percent0;
  }

  /** fan 1 */
  @inherit(rs)
  @ext(0x11)
  model TestFan1 {
    /** T.0.02 */
    value: percent0;
  }

  /** fan 2 */
  @inherit(rs)
  @ext(0x12)
  model TestFan2 {
    /** T.0.02 */
    value: percent0;
  }

  /** condensate tray heater */
  @inherit(rs)
  @ext(0x13)
  model TestCondensateTrayHeater {
    /** T.0.19 */
    value: onoff;
  }

  /** 4 way valve */
  @inherit(rs)
  @ext(0x14)
  model TestFourWayValve {
    /** T.0.20 */
    value: onoff;
  }

  /** heating coil compressor */
  @inherit(rs)
  @ext(0x17)
  model TestHeatingCoilCompressor {
    /** T.0.23 */
    value: onoff;
  }

  /** read flow temperature */
  @inherit(ws_1)
  @ext(0x28)
  model EnableTestFlowTemp {}

  /** flow temperature */
  @inherit(rs)
  @ext(0x28)
  model TestFlowTemp {
    /** T.0.40 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** read return temperature */
  @inherit(ws_1)
  @ext(0x29)
  model EnableTestReturnTemp {}

  /** return temperature */
  @inherit(rs)
  @ext(0x29)
  model TestReturnTemp {
    /** T.0.41 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** building water pressure */
  @inherit(rs)
  @ext(0x2a)
  model TestBuildingWaterPress {
    /** T.0.42 */
    @unit("bar")
    @divisor(10)
    value: UIN;
  }

  /** air intake temperature */
  @inherit(rs)
  @ext(0x30)
  model TestAirIntakeTemp {
    /** T.0.48 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** EEV outlet temperature */
  @inherit(rs)
  @ext(0x39)
  model TestEEVOutletTemp {
    /** T.0.57 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** condensor outlet temperature */
  @inherit(rs)
  @ext(0x3b)
  model TestCondensorOutletTemp {
    /** T.0.59 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** read high pressure */
  @inherit(ws_1)
  @ext(0x3f)
  model EnableTestHighPress {}

  /** high pressure */
  @inherit(rs)
  @ext(0x3f)
  model TestHighPress {
    /** T.0.63 */
    @unit("bar")
    @divisor(10)
    value: SIN;
  }

  /** low pressure */
  @inherit(rs)
  @ext(0x40)
  model TestLowPress {
    /** T.0.64 */
    @unit("bar")
    @divisor(10)
    value: SIN;
  }

  /** high pressure switch */
  @inherit(rs)
  @ext(0x43)
  model TestHighPressureSwitch {
    /** T.0.67 */
    @values(Values_TestHighPressureSwitch)
    value: UCH;
  }

  /** read evaporation temperature */
  @inherit(ws_1)
  @ext(0x55)
  model EnableTestEvaporationTemp {}

  /** evaporation temperature */
  @inherit(rs)
  @ext(0x55)
  model TestEvaporationTemp {
    /** T.0.85 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** read condensate temperature */
  @inherit(ws_1)
  @ext(0x56)
  model EnableTestCondensateTemp {}

  /** condensate temperature */
  @inherit(rs)
  @ext(0x56)
  model TestCondensateTemp {
    /** T.0.86 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** overheating target value */
  @inherit(rs)
  @ext(0x57)
  model TestOverheatingTargetValue {
    /** T.0.87 */
    @unit("K")
    @divisor(10)
    value: SIN;
  }

  /** overheating current value */
  @inherit(rs)
  @ext(0x58)
  model TestOverheatingActualValue {
    /** T.0.88 */
    @unit("K")
    @divisor(10)
    value: SIN;
  }

  /** sub cooling target value */
  @inherit(rs)
  @ext(0x59)
  model TestSubcoolingTargetValue {
    /** T.0.89 */
    @unit("K")
    @divisor(10)
    value: SIN;
  }

  /** sub cooling current value */
  @inherit(rs)
  @ext(0x5a)
  model TestSubcoolingActualValue {
    /** T.0.90 */
    @unit("K")
    @divisor(10)
    value: SIN;
  }

  /** temperature switch compressor outlet */
  @inherit(rs)
  @ext(0x7b)
  model TestTempSwitchCompressorOutlet {
    /** T.0.123 */
    @values(Values_TestTempSwitchCompressorOutlet)
    value: UCH;
  }

  /** priority switch valve WW */
  @inherit(rs)
  @ext(0x2)
  model TestPrioritySwitchingValve {
    /** T.1.02 */
    value: switchvalve;
  }

  /** storage temperature */
  @inherit(rs)
  @ext(0x2c)
  model TestCylinderTemp {
    /** T.1.44 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** lockout contact S20 */
  @inherit(rs)
  @ext(0x2e)
  model TestLockoutContactS20 {
    /** T.1.46 */
    @values(Values_TestLockoutContactS20)
    value: UCH;
  }

  /** outside temperature */
  @inherit(rs)
  @ext(0x45)
  model TestOutdoorTemp {
    /** T.1.69 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** system temperature */
  @inherit(rs)
  @ext(0x46)
  model TestSystemTemp {
    /** T.1.70 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** DCF status */
  @inherit(rs)
  @ext(0x47)
  model TestDCFStatus {
    /** T.1.71 */
    value: dcfstate;
  }

  /** lockout contact S21 */
  @inherit(rs)
  @ext(0x48)
  model TestLockoutContactS21 {
    /** T.1.72 */
    @values(Values_TestLockoutContactS21)
    value: UCH;
  }

  /** MA1 output */
  @inherit(rs)
  @ext(0x77)
  model TestMA1Output {
    /** T.1.119 */
    value: onoff;
  }

  /** STB heater */
  @inherit(rs)
  @ext(0x7c)
  model TestImmersionHeaterSafetyCutOut {
    /** T.1.124 */
    @values(Values_TestImmersionHeaterSafetyCutOut)
    value: UCH;
  }

  /** ME input */
  @inherit(rs)
  @ext(0x7d)
  model TestMIInput {
    /** T.1.125 */
    value: SIN;
  }

  /** MA2 output */
  @inherit(rs)
  @ext(0x7e)
  model TestMO2Output {
    /** T.1.126 */
    value: onoff;
  }

  /** MA3 output */
  @inherit(rs)
  @ext(0x7f)
  model TestMO3Output {
    /** T.1.127 */
    value: onoff;
  }

  /** condensor inlet temperature */
  @inherit(rs)
  @ext(0x81)
  model TestCondensorInletTemp {
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** Vorlauftemperatur Heizstab */
  @inherit(rs)
  @ext(0x82)
  model TestFlowTempImmersionHeater {
    /** T1.130 */
    @unit("°C")
    @divisor(10)
    value: SIN;
  }

  /** default *rs for user level "service" */
  @auth("service")
  @base(MF, 0x14, 0x5)
  model rs_1 {
    @maxLength(2)
    value: IGN;
  }

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x14, 0x5)
  model ws_2 {
    @maxLength(3)
    @constValue("000000")
    ignore: HEX;
  }

  /** read EEV temperature */
  @inherit(ws_2)
  @ext(0x3b)
  model EnableTestEEVTemp {
    @out
    @maxLength(3)
    value: HEX;
  }

  /** EEV temperature */
  @inherit(rs_1)
  @ext(0x3b, 0, 0, 0)
  model TestEEVTemp {
    @maxLength(2)
    ign: IGN;

    /** °C */
    @divisor(10)
    sin: SIN;
  }
  // Values from Live Monitor. EnableLiveMonitorMain message needs to be sent before the read message works.

  /** default *us for user level "service" */
  @passive
  @auth("service")
  @base(MF, 0x3, 0)
  model us {}

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x3, 0)
  model ws_3 {}

  /** enable live monitor read status */
  @inherit(ws_3)
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
  model rs_2 {
    @maxLength(3)
    value: IGN;
  }
  // example: 3108b51a040500321f / 0a000805f0000000000000

  /** desired supply temperature */
  @inherit(rs_2)
  @ext(0x1f)
  model LiveMonitorDesiredSupplyTemp {
    value: temp;
  }
  // example: 3108b51a0405003220 / 0a0008081b010000000000

  /** current supply temperature */
  @inherit(rs_2)
  @ext(0x20)
  model LiveMonitorCurrentSupplyTemp {
    value: temp;
  }
  // example:108b51a0405003223 / 0a00083500000000000000

  /** current power generated */
  @inherit(rs_2)
  @ext(0x23)
  model LiveMonitorCurrentYieldPower {
    @unit("kW")
    @divisor(10)
    value: UIN;
  }
  // example: 3108b51a0405003224 / 0a00083500000000000000

  /** current power consumption */
  @inherit(rs_2)
  @ext(0x24)
  model LiveMonitorCurrentConsumedPower {
    @unit("kW")
    @divisor(10)
    value: UIN;
  }
  // example:08b51a0405003225 / 0a00081b00000000000000

  /** compressor modulation */
  @inherit(rs_2)
  @ext(0x25)
  model LiveMonitorCurrentCompressorUtil {
    @unit("%")
    value: D1B;
  }
  // example: 3108b51a0405003226 / 0a000808df000000000000

  /** air intake temperature */
  @inherit(rs_2)
  @ext(0x26)
  model LiveMonitorAirIntakeTemp {
    value: temp;
  }
  // installer level test menu statistics from PR #174

  /** default *ri for user level "install" */
  @auth("install")
  @base(MF, 0x1a, 0x5)
  model ri {
    @maxLength(3)
    value: IGN;
  }

  /** compressor hours */
  @inherit(ri)
  @ext(0xb4, 0x34, 0)
  model StatCompressorHours {
    value: hoursum;
  }

  /** compressor starts */
  @inherit(ri)
  @ext(0xb4, 0x34, 1)
  model StatCompressorStarts {
    value: UIN;
  }

  /** building pump hours */
  @inherit(ri)
  @ext(0xb4, 0x34, 0x2)
  model StatBuildingPumpHours {
    value: hoursum;
  }

  /** building pump starts */
  @inherit(ri)
  @ext(0xb4, 0x34, 0x3)
  model StatBuildingPumpStarts {
    value: UIN;
  }

  /** 4 way valve hours */
  @inherit(ri)
  @ext(0x7, 0x34, 0x6)
  model StatFourWayValveHours {
    value: hoursum;
  }

  /** 4 way valve switching operations */
  @inherit(ri)
  @ext(0x36, 0x34, 0x7)
  model StatFourWayValveSwitchingOperations {
    value: UIN;
  }

  /** fan 1 hours */
  @inherit(ri)
  @ext(0x3c, 0x34, 0x51)
  model StatFan1Hours {
    value: hoursum;
  }

  /** fan 1 starts */
  @inherit(ri)
  @ext(0xd6, 0x34, 0x52)
  model StatFan1Starts {
    value: UIN;
  }

  /** EEV steps */
  @inherit(ri)
  @ext(0xe4, 0x34, 0xd)
  model StatEEVSteps {
    value: UIN;
  }
  // stats from PR 407,potentially for HW5103+SW0607 only

  /** default *r */
  @base(MF, 0x9, 0x54, 0x2, 0)
  model r_7 {
    @maxLength(4)
    value: IGN;
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
    @unit("rpm")
    value: EXP;
  }

  @inherit(r_7)
  @ext(0x49, 0xa)
  model RunDataFan2Speed {
    @unit("rpm")
    value: EXP;
  }

  @inherit(r_7)
  @ext(0x53, 0xd)
  model RunDataStatuscode {
    @values(Values_RunDataStatuscode)
    value: UIN;
  }

  @inherit(r_7)
  @ext(0x5b, 0xd)
  model RunDataElectricPowerConsumption {
    /** current electrical power consumption (Watt) */
    @unit("W")
    value: EXP;
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
  @ext(0xfc, 0x8)
  model RunDataFlowTemp {
    /** current flow temp, accurate to 2 decimal places */
    value: tempv;
  }

  @inherit(r_7)
  @ext(0x6, 0x9)
  model RunDataReturnTemp {
    /** current return temp, accurate to 2 decimal places */
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

  /** default *r */
  @base(MF, 0x11)
  model r_8 {}

  /** compressor runtime in min and starts in Hc mode */
  @inherit(r_8)
  @ext(0x18, 1)
  model RunStatsCompressorHc {
    @maxLength(1) ign: IGN;
    runtime: minutes4;
    cycles: cntstarts;
  }

  /** compressor runtime in min and starts in Hwc mode */
  @inherit(r_8)
  @ext(0x18, 0x2)
  model RunStatsCompressorHwc {
    @maxLength(1) ign: IGN;
    runtime: minutes4;
    cycles: cntstarts;
  }

  enum Values_state {
    ready: 0x01,
    error: 0x0b,
    heating: 0x09,
    cooling: 0x11,
    heating_water: 0x81,
  }

  enum Values_Central_heating_mode_active__yes_no_ {
    no: 0,
    yes: 1,
  }

  enum Values_Domestic_hot_water_mode_active__yes_no_ {
    no: 0,
    yes: 1,
  }

  enum Values_Immersion_heater_mode__on_off_ {
    off: 0,
    on: 1,
  }

  enum Values_Domestic_hot_water_mod__eco_normal_balance_ {
    eco: 0,
    normal: 1,
    balance: 2,
  }

  enum Values_TestHighPressureSwitch {
    open: 0,
    close: 1,
  }

  enum Values_TestTempSwitchCompressorOutlet {
    open: 0,
    close: 1,
  }

  enum Values_TestLockoutContactS20 {
    close: 0,
    open: 1,
  }

  enum Values_TestLockoutContactS21 {
    close: 0,
    open: 1,
  }

  enum Values_TestImmersionHeaterSafetyCutOut {
    close: 0,
    open: 1,
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

  enum Values_RunDataStatuscode {
    Frost_protection: 34,
    Standby: 100,
    Heating_Compressor_shutdown: 101,
    Heating_Compressor_blocked: 102,
    Heating_Prerun: 103,
    Heating_Compressor_active: 104,
    Heating_Overrun: 107,
    Cooling_Compressor_shutdown: 111,
    Cooling_Compressor_blocked: 112,
    Cooling_Prerun: 113,
    Cooling_Compressor_active: 114,
    Cooling_Overrun: 117,
    Heating_Immersion_heater_active: 125,
    Warm_Water_Compressor_blocked: 132,
    Warm_Water_Prerun: 133,
    Warm_Water_Compressor_active: 134,
    Warm_Water_Immersion_Heater_active: 135,
    Warm_Water_Overrun: 137,
    Heating_Immersion_Heater_shutdown: 141,
    Heating_Immersion_Heater_blocked: 142,
    Warm_Water_Immersion_Heater_shutdown: 151,
    Warm_Water_Immersion_Heater_blocked: 152,
    Air_purging_program_active: 202,
    Compressor_oil_heating_activated: 240,
    Fan_1_blocked: 252,
    Fan_1_air_inlet_too_high: 255,
    Fan_1_air_inlet_too_low: 256,
    Fan_2_blocked: 260,
    Building_circuit_flow_too_low: 275,
    Building_circuit_pump_fault: 277,
    Frequency_converter_fault_Compressor: 280,
    Frequency_converter_fault_Mains_voltage: 281,
    Frequency_converter_fault_Overheating: 282,
    Deicing_time_too_long: 283,
    Deicing_flow_temperature_too_low: 284,
    Compressor_outlet_temperature_too_high: 285,
    Hot_gas_temperature_switch_open: 286,
    Fan_1_Wind: 287,
    Fan_2_Wind: 288,
    Current_limt_active: 289,
    High_pressure_switch_open: 302,
    Compressor_outlet_temperature_too_high_1: 303,
    Evaporation_temperature_too_low: 304,
    Condensation_temperature_too_low: 305,
    Evaporation_temperature_too_high: 306,
    Condensation_temperature_too_high: 308,
    Building_circuit_return_temperature_too_low: 312,
    Building_circuit_return_temperature_too_high: 314,
    Immersion_heater_Flow_temperature_too_high: 351,
    Deicing_active: 516,
    Frequency_converter_fault: 575,
    Connection_fault_frequency_converter: 581,
    _4_port_valve_position_fault: 590,
  }

  /** included parts */
  union _includes {
    Hcmode_inc,
    Errors_inc,
  }
}
