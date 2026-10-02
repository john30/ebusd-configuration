import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hcmode_hw5103_inc.tsp";
import "./errors_inc.tsp";
import "./b516_inc.tsp";
import "./b531_inc.tsp";
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

/** HMU display state: compressor power, environmental yield and heater main/backup operating mode */
  @inherit(r_1)
  @ext(0x7)
  model Status07 {
    /** compressor power */
    @unit("%")
    power: UCH;

    /** daily environmental energy yield */
    @divisor(10)
    dailyenvyield: energy;

    /** heater main enabled */
    @values(Values_onoff)
    display_b0_heaterenabled: BI0;

    /** reserved bit 1 */
    @values(Values_onoff)
    display_b1: BI1;

    /** backup heater active */
    @values(Values_onoff)
    display_b2_backupheater: BI2;

    /** reserved bit 3 */
    @values(Values_onoff)
    display_b3: BI3;

    /** reserved bit 4 */
    @values(Values_onoff)
    display_b4: BI4;

    /** noise reduction active */
    @values(Values_onoff)
    display_b5_noisereduction: BI5;

    /** DHW eco mode */
    @values(Values_onoff)
    display_b6_dhwecomode: BI6;

    /** reserved bit 7 */
    @values(Values_onoff)
    display_b7: BI7;

    // heater main operating mode (bit field; bit semantics per @hanjo in #614,
    // confirmed against a 72 h bus capture: only standby/heating/warmwater seen here)

    /** reserved bit 0 */
    @values(Values_onoff)
    heatermain_b0: BI0;

    /** error active (Komfortsicherung) */
    @values(Values_onoff)
    heatermain_b1_error: BI1;

    /** reserved bit 2 */
    @values(Values_onoff)
    heatermain_b2: BI2;

    /** heating active */
    @values(Values_onoff)
    heatermain_b3_heating: BI3;

    /** cooling active */
    @values(Values_onoff)
    heatermain_b4_cooling: BI4;

    /** pressure loss */
    @values(Values_onoff)
    heatermain_b5_pressureloss: BI5;

    /** reserved bit 6 */
    @values(Values_onoff)
    heatermain_b6: BI6;

    /** hot water active */
    @values(Values_onoff)
    heatermain_b7_warmwater: BI7;

    /** system pressure */
    @unit("bar")
    @divisor(30)
    DisplayPressure: UCH;

    // backup heater operating mode (same bit field as the main heater)

    /** reserved bit 0 */
    @values(Values_onoff)
    heaterbackup_b0: BI0;

    /** error active (Komfortsicherung) */
    @values(Values_onoff)
    heaterbackup_b1_error: BI1;

    /** reserved bit 2 */
    @values(Values_onoff)
    heaterbackup_b2: BI2;

    /** heating active */
    @values(Values_onoff)
    heaterbackup_b3_heating: BI3;

    /** cooling active */
    @values(Values_onoff)
    heaterbackup_b4_cooling: BI4;

    /** pressure loss */
    @values(Values_onoff)
    heaterbackup_b5_pressureloss: BI5;

    /** reserved bit 6 */
    @values(Values_onoff)
    heaterbackup_b6: BI6;

    /** hot water active */
    @values(Values_onoff)
    heaterbackup_b7_warmwater: BI7;
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

  /** air intake temperature */
  @inherit(r_2)
  @ext(0x26)
  model AirIntakeTemp {
    value: temp;
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
    @unit("L/h")
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
  @auth("install")
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

  /** EEV step count */
  @inherit(r_3)
  @ext(0x34, 0x0d)
  model EEVSteps {
    value: UIN;
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
    @minValue(10)
    @maxValue(90)
    temp: temp;
  }

  /** bivalence point central heating */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x2f)
  model HcBivalencePoint {
    @minValue(-30)
    @maxValue(20)
    temp: temp;
  }

  /** bivalence point domestic hot water */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x30)
  model HwcBivalencePoint {
    @minValue(-20)
    @maxValue(20)
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
    @minValue(15)
    @maxValue(90)
    temp: temp;
  }

  /** minimum allowed flow temperature */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x33)
  model MinFlowTemp {
    @minValue(15)
    @maxValue(90)
    temp: temp;
  }

  /** heating function enabled */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x34)
  model HcEnabled {
    yesno: yesno;
  }

  /** domestic hot water function enabled */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x35)
  model HwcEnabled {
    yesno: yesno;
  }

  /** hysteresis for cylinder charging */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x39)
  model HwcChargeHysteresis {
    value: hysteresis;
  }

  /** normal immersion heater activation */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x1e)
  model ImmersionHeaterEnabled {
    @values(Values_immersion_heater_applications)
    value: UIN;
  }

  /** emergency immersion heater activation */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x37)
  model EmergencyModeImmersionHeaterEnabled {
    // also called "limp home mode" and "Notbetrieb"
    @values(Values_immersion_heater_applications)
    value: UIN;
  }

  /** cooling target flow temperature */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x2b)
  model CoolTargetFlowTemp {
    @minValue(7)
    @maxValue(24)
    temp: temp;
  }

  /** start heating at energy integral value */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x1e)
  model CompStartHeatingFrom {
    @minValue(-100)
    @maxValue(-30)
    @step(5)
    value: integral;
  }

  /** start cooling at energy integral value */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x21)
  model CompStartCoolingFrom {
    @minValue(30)
    @maxValue(100)
    @step(5)
    value: integral;
  }

  /** hysteresis for heating */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x43)
  model CompHysteresisHeating {
    @minValue(3)
    @maxValue(15)
    value: hysteresis;
  }

  /** hysteresis for cooling */
  @inherit(r_3, wi_1)
  @ext(0x35, 0x3f)
  model CompHysteresisCooling {
    @minValue(3)
    @maxValue(15)
    value: hysteresis;
  }

  /** maximum allowed differential pressure */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x1f)
  model MaxRemainingDeltaP {
    @minValue(200)
    @maxValue(900)
    @step(10)
    value: pressm2;
  }

  /** domestic hot water charging mode */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x44)
  model HwcMode {
    @values(Values_Domestic_hot_water_mod__eco_normal_balance_)
    uch: UCH;
  }

  /** maximum block time by energy company (S21 contact) */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x2d)
  model MaximumS21BlockAllowed {
    @minValue(0)
    @maxValue(9)
    value: hour;
  }

  /** pump speed for heating */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x16)
  model BuildingCircuitPumpOutputHeating {
    /** pump percentage or auto */
    @values(Values_pumpperc)
    @minValue(49)
    @maxValue(100)
    value: percent2;
  }

  /** pump speed for cooling */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x17)
  model BuildingCircuitPumpOutputCooling {
    /** pump percentage or auto */
    @values(Values_pumpperc)
    @minValue(49)
    @maxValue(100)
    value: percent2;
  }

  /** pump speed for domestic hot water */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x18)
  model BuildingCircuitPumpOutputHwc {
    /** pump percentage or auto */
    @values(Values_pumpperc)
    @minValue(49)
    @maxValue(100)
    value: percent2;
  }

  /** minutes to wait after mains switch on */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x19)
  model BlockTimeAfterRestart {
    @minValue(0)
    @maxValue(120)
    value: minutes2;
  }

  /** maximum compressor speed in noise reduction mode */
  @inherit(r_3, wi_1)
  @ext(0x34, 0x28)
  @Ebus.example("40%", "3108b51a0405ff3428", "0aff021b280028003c0001")
  model NoiseReductionLevel {
    @maxValue(60)
    value: percent2;
  }

  /** number of main heat pump starts */
  @inherit(r_3)
  @ext(0x34, 0x30)
  model HMUSystemStarts {
    value: cntstarts2;
  }

  /** cooling enabled */
  @inherit(r_3, wi_1)
  @ext(0x33, 0x1b)
  model ActiveCoolingEnabled {
    value: onoff;
  }

  // B509
  /** default *r */
  @base(MF, 0x9, 0x54, 0x2, 0)
  model r_7 {
    @maxLength(4)
    ign: IGN;
  }

  /** current electrical power consumption */
  @inherit(r_7)
  @ext(0x5b, 0x0d)
  model RunDataElectricPowerConsumption {
    @unit("W")
    value: EXP;
  }

  /** building circuit flow */
  @inherit(r_7)
  @ext(0xba, 0x09)
  model RunDataBuildingCircuitFlow {
    @unit("L/h")
    value: EXP;
  }





  /** current thermal power output */
  @inherit(r_7)
  @ext(0x5e, 0x0d)
  model RunDataHeatOutput {
    @unit("W")
    value: EXP;
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


  /**
   * effective HMU flow-temperature target;
   * meaning inferred from observed operating behaviour
   */
  @inherit(r_7)
  @ext(0x4a, 0x0d)
  model RunDataTargetFlowTemp {
    value: tempv;
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
  /** evaporation temperature; corresponds to service value T.0.85 */
  @inherit(r_7)
  @ext(0xa7, 0x0e)
  model RunDataEvaporationTemp {
    value: tempv;
  }

  /** actual overheating/superheat; corresponds to service value T.0.88 */
  @inherit(r_7)
  @ext(0xa9, 0x0e)
  model RunDataOverheatingActualValue {
    @unit("K")
    value: EXP;

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
  @ext(0xbb, 0xb)
  model RunStatsCoolHours {
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
    Hcmode_HW5103_inc,
    Errors_inc,
    B516_inc,
    B531_inc,
  }

  enum Values_Domestic_hot_water_mod__eco_normal_balance_ {
    eco: 0,
    normal: 1,
    balance: 2,
  }

  enum Values_immersion_heater_applications {
    off: 0,
    heating: 1,
    dhw: 2,
    both: 3,
  }

  enum Values_pumpperc {
    auto: 49,
  }

}
