import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x08)
namespace Hmu.Hw5103 {
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

  /** current compressor utilization */
  @inherit(r_2)
  @ext(0x25)
  model CurrentCompressorUtil {
    @unit("%")
    value: D1B;
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

  /** default *r */
  @base(MF, 0x9, 0x54, 0x2, 0)
  model r_7 {
    @maxLength(4)
    value: IGN;
  }

  @inherit(r_7)
  @ext(0xd, 0xa)
  model CompressorSpeed {
    @unit("rps")
    value: EXP;
  }

  /** (EEV Position in different scale?) */
  @inherit(r_7)
  @ext(0x28, 0xa)
  model EEVPositionAbs {
    value: UIN;
  }

  @inherit(r_7)
  @ext(0x47, 0xa)
  model Fan1Speed {
    @unit("rpm")
    value: EXP;
  }

  @inherit(r_7)
  @ext(0x49, 0xa)
  model Fan2Speed {
    @unit("rpm")
    value: EXP;
  }

  @inherit(r_7)
  @ext(0x53, 0xd)
  model Statuscode {
    value: hmucode;
  }

  @inherit(r_7)
  @ext(0x5b, 0xd)
  model ElectricPowerConsumption {
    /** current electrical power consumption (Watt) */
    @unit("W")
    value: EXP;
  }

  @inherit(r_7)
  @ext(0x6a, 0x9)
  model HighPressure {
    value: pressv;
  }

  @inherit(r_7)
  @ext(0x98, 0x8)
  model CompressorInletTemp {
    value: tempv;
  }

  @inherit(r_7)
  @ext(0xa2, 0x8)
  model CompressorOutletTemp {
    value: tempv;
  }

  @inherit(r_7)
  @ext(0xac, 0x8)
  model EEVOutletTemp {
    value: tempv;
  }

  @inherit(r_7)
  @ext(0xb8, 0xb)
  model HMUHours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xb9, 0xb)
  model HcHours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xbc, 0xb)
  model HwcHours {
    /** total runtime of Hwc mode */
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xc2, 0xb)
  model CompressorHours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xc3, 0xb)
  model CompressorStarts {
    value: cntstarts2;
  }

  @inherit(r_7)
  @ext(0xc4, 0xb)
  model BuildingCircuitPumpHours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xc5, 0x9)
  model BuildingCircuitPumpPower {
    @unit("%")
    value: EXP;
  }

  @inherit(r_7)
  @ext(0xc5, 0xb)
  model BuildingCircuitPumpStarts {
    /** total starts of building circuit pump */
    value: cntstarts2;
  }

  @inherit(r_7)
  @ext(0xc8, 0xb)
  model FourPortValveHours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xc9, 0xb)
  model FourPortValveSwitches {
    value: cntstarts2;
  }

  @inherit(r_7)
  @ext(0xd7, 0xb)
  model Fan1Hours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xd8, 0xb)
  model Fan1Starts {
    value: cntstarts2;
  }

  @inherit(r_7)
  @ext(0xd9, 0xb)
  model Fan2Hours {
    value: hoursum2;
  }

  @inherit(r_7)
  @ext(0xda, 0xb)
  model Fan2Starts {
    value: cntstarts2;
  }

  @inherit(r_7)
  @ext(0xde, 0x8)
  model AirInletTemp {
    value: tempv;
  }

  /** default *r */
  @base(MF, 0x11)
  model r_8 {}

  /** compressor runtime in min and starts in Hc mode */
  @inherit(r_8)
  @ext(0x18, 1)
  model CompressorRuntimeHc {
    @maxLength(1) ign: IGN;
    runtime: minutes4;
    cycles: cntstarts;
  }

  /** compressor runtime in min and starts in Hwc mode */
  @inherit(r_8)
  @ext(0x18, 0x2)
  model CompressorRuntimeHwc {
    @maxLength(1) ign: IGN;
    runtime: minutes4;
    cycles: cntstarts;
  }


}
