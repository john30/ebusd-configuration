import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010023671_inc {
  // ,BAI00,Ray 9 KE/14,0010023671
  // ##### dia level 1 #####

  /** d.00 heating partload: maximum heating power, the boiler modulates below it in 1 kW steps */
  @ext(0x6c, 0)
  model PartloadHcKW is InstallRegister<power>;

  /** d.05 flow setpoint: flow temperature target the boiler currently uses */
  @ext(0x39, 0)
  model FlowTempDesired is ReadonlyRegister<temp>;

  /** d.09 eBUS flow setpoint: last flow temperature received via B510, kept until boiler restart */
  @ext(0xbe, 0x1)
  model EbusFlowTempDesired is ReadonlyRegister<temp>;

  /** d.10 Central heating pump: internal heating pump */
  @ext(0x44, 0)
  model WP is ReadonlyRegister<onoff>;

  /** d.14 Desired heating pump power */
  @inherit(r, wi)
  @ext(0xa1, 0)
  model PumpPowerDesired {
    /** PWM-Desired central heating pump power */
    @unit("%")
    @values(Values_PumpPowerDesired)
    value: UCH;
  }

  /** d.15 Current heating pump power: Current central heating pump power */
  @ext(0x73, 0)
  model PumpPower is ReadonlyRegister<percent0>;

  /** d.16 room thermostat 24 V: External controls heat demand (Clamp 3'-4') */
  @ext(0xe, 0)
  model DCRoomthermostat is ReadonlyRegister<onoff>;

  /** d.18 CH pump mode */
  @inherit(r, wi)
  @ext(0xb7, 0)
  model HcPumpMode {
    /** Pump mode */
    @values(Values_HcPumpMode)
    value: UCH;
  }

  /** d.23 heating switch: heating enabled (winter mode), off = summer mode, stored permanently */
  @ext(0xf2, 0x3)
  model HeatingSwitch is InstallRegister<onoff>;

  /** d.29 Primary circuit flow rate */
  @ext(0xfb, 0)
  model PrimaryCircuitFlowrate is ReadonlyRegister<flowrate100>;

  /** d.40 TFT_DK: flow temperature */
  @ext(0x18, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** d.71 Max value flow temp: Adjustment of maximum central heating setpoint range (45 to 85 °C) */
  @ext(0xa5, 0)
  model FlowsetHcMax is InstallRegister<temp>;

  /** d.90 Digital control recognized: Digital regulator status */
  @ext(0x74, 0)
  model EBusHeatcontrol is ReadonlyRegister<yesno>;

  /** d.155 actual heating power */
  @inherit(r)
  @ext(0xc9, 0x3)
  model ActualHeatOutput {
    @unit("kW")
    @divisor(100)
    value: UIN;
  }

  // ##### other #####

  /** controller demand: heat demand in % of nominal power, capped by d.00 */
  @ext(0xed, 0x3)
  model ControllerDemand is ReadonlyRegister<percent0>;

  /** DHWSwitch: DHW on/off */
  @ext(0xf3, 0x3)
  model HwcSwitch is Register<onoff>;

  /** Statenumber_DK: status number */
  @ext(0xab, 0)
  model Statenumber is ReadonlyRegister<UCH>;

  /** Waterpressure: water pressure */
  @ext(0x2, 0)
  model WaterPressure is ReadonlyRegister<presssensor>;

  enum Values_PumpPowerDesired {
    auto: 0,
    _53: 1,
    _60: 2,
    _70: 3,
    _85: 4,
    _100: 5,
  }

  enum Values_HcPumpMode {
    permanent: 1,
    eco: 3,
  }
}
