import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x08)
namespace Hmu.Hw5103 {
  // B509
  /** default *r */
  @base(MF, 0x9, 0x54, 0x2, 0)
  model r_0 {
    @maxLength(4)
    value: IGN;
  }

  @inherit(r_0)
  @ext(0xd, 0xa)
  model CompressorSpeed {
    @unit("rps")
    value: EXP;
  }

  @inherit(r_0)
  @ext(0x28, 0xa)
  model EevPositionAbs {
    value: UIN;
  }

  @inherit(r_0)
  @ext(0x47, 0xa)
  model Fan1Speed {
    @unit("rpm")
    value: EXP;
  }

  @inherit(r_0)
  @ext(0x49, 0xa)
  model Fan2Speed {
    @unit("rpm")
    value: EXP;
  }

  @inherit(r_0)
  @ext(0x53, 0xd)
  model Statuscode {
    value: hmucode;
  }

/**
  @inherit(r_0)
  @ext(0x5b, 0xd)
  model ElectricPowerConsumption {
    @unit("W")
    value: EXP;
  }
*/

  @inherit(r_0)
  @ext(0x6a, 0x9)
  model HighPressure {
    value: pressv;
  }

  @inherit(r_0)
  @ext(0x98, 0x8)
  model CompressorInletTemp {
    value: tempv;
  }

  @inherit(r_0)
  @ext(0xa2, 0x8)
  model CompressorOutletTemp {
    value: tempv;
  }

/**
  @inherit(r_0)
  @ext(0xa6, 0xe)
  model DiagFlowTemp {
    value: tempv;
  }

  @inherit(r_0)
  @ext(0xa7, 0xe)
  model DiagEvaporationTemp {
    value: tempv;
  }

  @inherit(r_0)
  @ext(0xa9, 0xe)
  model DiagOverheatingActualValue {
    value: tempv;
  }
*/

  @inherit(r_0)
  @ext(0xac, 0x8)
  model EevOutletTemp {
    value: tempv;
  }

  @inherit(r_0)
  @ext(0xb8, 0xb)
  model HoursTotal {
    value: hoursum2;
  }

  @inherit(r_0)
  @ext(0xb9, 0xb)
  model HoursHeating {
    value: hoursum2;
  }

  @inherit(r_0)
  @ext(0xbc, 0xb)
  model HoursHwc {
    value: hoursum2;
  }

/**
  @inherit(r_0)
  @ext(0xbd, 0x9)
  model DiagWaterThroughput {
    @unit("l/h")
    value: EXP;
  }
*/

  @inherit(r_0)
  @ext(0xc2, 0xb)
  model CompressorHours {
    value: hoursum2;
  }

  @inherit(r_0)
  @ext(0xc3, 0xb)
  model CompressorStarts {
    value: cntstarts2;
  }

  @inherit(r_0)
  @ext(0xc4, 0xb)
  model BuildingPumpHours {
    value: hoursum2;
  }

  @inherit(r_0)
  @ext(0xc5, 0x9)
  model BuildingPumpPower {
    @unit("%")
    value: EXP;
  }

  @inherit(r_0)
  @ext(0xc5, 0xb)
  model BuildingPumpStarts {
    value: cntstarts2;
  }

  @inherit(r_0)
  @ext(0xc8, 0xb)
  model FourPortValveHours {
    value: hoursum2;
  }

  @inherit(r_0)
  @ext(0xc9, 0xb)
  model FourPortValveSwitches {
    value: cntstarts2;
  }

  @inherit(r_0)
  @ext(0xd7, 0xb)
  model Fan1Hours {
    value: hoursum2;
  }

  @inherit(r_0)
  @ext(0xd8, 0xb)
  model Fan1Starts {
    value: cntstarts2;
  }

  @inherit(r_0)
  @ext(0xd9, 0xb)
  model Fan2Hours {
    value: hoursum2;
  }

  @inherit(r_0)
  @ext(0xda, 0xb)
  model Fan2Starts {
    value: cntstarts2;
  }

  @inherit(r_0)
  @ext(0xde, 0x8)
  model AirInletTemp {
    value: tempv;
  }

  // B511
  /** default *r */
  @base(MF, 0x11)
  model r_1 {}

  @inherit(r_1)
  @ext(1)
  model Status {
    supplytemp: temp1;
    returntemp: temp1;
    @maxLength(4) ign: IGN;
    pumpstate: pumpstate;
  }

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

  // B516
  /** default *r */
  @base(MF, 0x16)
  model r_2 {
    @maxLength(1)
    value: IGN;
  }

  @inherit(r_2)
  @ext(0x14)
  model PowerConsumptionHmu {
    @unit("W")
    value: EXP;
  }

  // B51A FF32xx
  /** default *r */
  @base(MF, 0x1a, 0x5, 0xff, 0x32)
  model r_3 {
    @maxLength(3)
    value: IGN;
  }

  @inherit(r_3)
  @ext(0)
  model YieldHeatingDay {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_3)
  @ext(1)
  model YieldCoolingDay {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_3)
  @ext(0x2)
  model YieldHwcDay {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_3)
  @ext(0xe)
  model YieldHeatingMonth {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_3)
  @ext(0xf)
  model CopHeatingMonth {
    @divisor(10)
    value: UIN;
  }

  @inherit(r_3)
  @ext(0x10)
  model YieldHeating {
    @unit("kWh")
    value: energy;
  }

  @inherit(r_3)
  @ext(0x11)
  model CopHeating {
    @divisor(10)
    value: UIN;
  }

  @inherit(r_3)
  @ext(0x12)
  model YieldHwcMonth {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_3)
  @ext(0x13)
  model CopHwcMonth {
    @divisor(10)
    value: UIN;
  }

  @inherit(r_3)
  @ext(0x16)
  model YieldHwc {
    value: energy;
  }

  @inherit(r_3)
  @ext(0x17)
  model CopHwc {
    @divisor(10)
    value: UIN;
  }

  @inherit(r_3)
  @ext(0x1e)
  model CompressorBlocktime {
    @unit("min")
    value: UIN;
  }

  @inherit(r_3)
  @ext(0x1f)
  model SupplyTempWeighted {
    @unit("°C")
    @divisor(10)
    value: D2C;
  }

  @inherit(r_3)
  @ext(0x20)
  model FlowTemp {
    @unit("°C")
    value: D2C;
  }

  @inherit(r_3)
  @ext(0x21)
  model EnergyIntegral {
    value: integral;
  }

/**
  @inherit(r_3)
  @ext(0x22)
  model SourceTempInput {
    @unit("°C")
    value: D2C;
  }
*/

  @inherit(r_3)
  @ext(0x23)
  model CurrentYieldPower {
    @unit("kW")
    @divisor(10)
    value: D1B;
  }

  @inherit(r_3)
  @ext(0x24)
  model CurrentConsumedPower {
    @unit("kW")
    @divisor(10)
    value: D1B;
  }

  @inherit(r_3)
  @ext(0x25)
  model CompressorModulation {
    @unit("%")
    value: D2C;
  }

  @inherit(r_3)
  @ext(0x2A)
  model YieldCoolingMonth {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_3)
  @ext(0x2B)
  model CopCoolingMonth {
    @divisor(10)
    value: UIN;
  }

  @inherit(r_3)
  @ext(0x2C)
  model YieldCooling {
    @unit("kWh")
    @divisor(10)
    value: energy;
  }

  @inherit(r_3)
  @ext(0x2D)
  model CopCooling {
    @divisor(10)
    value: UIN;
  }


  @inherit(r_3)
  @ext(0x3c)
  model WaterThroughput {
    @unit("l/h")
    value: UIN;
  }

  @condition(Id.Id.sw, ">=902")
  @inherit(r_3)
  @ext(0x3d)
  model FlowPressure {
    @unit("bar")
    @divisor(4)
    value: D2C;
  }

  @inherit(r_3)
  @ext(0x4d)
  model TotalEnergyUsage {
    @unit("kWh")
    value: energy;
  }
}
