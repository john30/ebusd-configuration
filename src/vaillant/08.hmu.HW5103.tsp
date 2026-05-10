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

  // Settings that can be changed from the indoors controller unit

  /** default *r */
  @base(MF, 0x1a, 0x5, 0xff)
  model r_3 {
    @maxLength(3)
    ign: IGN;
  }

  /** default *w */
  @write
  @auth("install")
  @base(MF, 0x1a, 0x6, 0xff)
  model wi_1 {
  }

  /** heat curve 0.1 to 4.0 */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x2d)
  model HeatCurve {
    @divisor(10)
    bcd: BCD;
  }

  /** summer switch-off temperature */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x2e)
  model SummerSwitchOffTemp {
    temp: temp;
  }

  /** bivalence point central heating */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x2f)
  model HcBivalencePoint {
    temp: temp;
  }

  /** bivalence point domestic hot water */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x30)
  model HwcBivalencePoint {
    temp: temp;
  }

  /** alternative point central heating */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x31)
  model HcAlternativePoint {
    temp: temp;
  }

  /** maximum allowed flow temperature */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x32)
  model MaxFlowTemp {
    temp: temp;
  }

  /** minimum allowed flow temperature */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x33)
  model MinFlowTemp {
    temp: temp;
  }

  /** central heating activation */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x34)
  model HcModeActive {
    yesno: yesno;
  }

  /** domestic hot water activation */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x35)
  model HwcModeActive {
    yesno: yesno;
  }

  /** hysteresis for cylinder charging */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x39)
  model HwcChargeHysteresis {
    calibration: calibration;
  }

  /** immersion heater activation */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x1e)
  model ImmersionHeaterMode {
    onoff: onoff;
  }

  /** limp home mode activation */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x37)
  model LimpHomeMode {
    //onoff: onoff;
  }

  /** cooling target flow temperature */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x2b)
  model CoolTargetFlow {
    temp: temp;
  }

  /** start heating at energy integral value */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x1e)
  model CompStartHeatingFrom {
    value: integral;
  }

  /** start cooling at energy integral value */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x21)
  model CompStartCoolingFrom {
    value: integral;
  }

  /** hysteresis for heating */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x43)
  model CompHysteresisHeating {
    value: integral;
  }

  /** hysteresis for cooling */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x3f)
  model CompHysteresisCooling {
    value: integral;
  }

  /** maximum allowed differential pressure */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x1f)
  model MaxRemainingDeltaP {
    value: integral;
  }

  /** domestic hot water charging mode */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x44)
  model HwcMode {
    @values(Values_Domestic_hot_water_mod__eco_normal_balance_)
    uch: UCH;
  }

  /** maximum anti-cycling time */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x2d)
  model MaxAntiCyclingTime {
    value: integral;
  }

  /** pump speed for heating */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x16)
  model BuildingCircuitPumpOutputHeating {
    /** pump percentage or auto */
    @values(Values_pumpperc)
    value: percentp;
  }

  /** pump speed for cooling */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x17)
  model BuildingCircuitPumpOutputCooling {
    /** pump percentage or auto */
    @values(Values_pumpperc)
    value: percentp;
  }

  /** pump speed for domestic hot water */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x18)
  model BuildingCircuitPumpOutputDhw {
    /** pump percentage or auto */
    @values(Values_pumpperc)
    value: percentp;
  }

  /** minutes to wait after mains switch on */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x19)
  model ResetAntiCyclingTime {
    value: minutes2;
  }

  /** noise reduction factor applied when in silent mode */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x28)
  @Ebus.example("40%", "3108b51a0405ff3428", "0aff021b280028003c0001")
  model CompNoiseReductionFactor {
    @minValue(30)
    @maxValue(60)
    value: percentp;
  }

  /** cooling technology */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x1b)
  model CoolingTechnology {
    // none / active cooling
    value: minutes2;
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

  enum Values_Domestic_hot_water_mod__eco_normal_balance_ {
    eco: 0,
    normal: 1,
    balance: 2,
  }

  enum Values_pumpperc {
    auto: 49,
  }
}
