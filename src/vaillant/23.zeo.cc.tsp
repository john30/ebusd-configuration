import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x23)
namespace Zeo.Cc {
  // ,ZEO00,Zeolite AMU,ZEO00 197 Circulation
  // ##### CC: #####

  /** OperatingMode */
  @ext(0x6, 0x2)
  model OperatingMode is ReadonlyRegister<mcmode>;

  /** MinFlowTemp: 1 °C resolution */
  @ext(0xb, 0x2)
  model FlowTempMin is ReadonlyRegister<temp0>;

  /** MaxFlowTemp: 1 °C resolution */
  @ext(0xc, 0x2)
  model FlowTempMax is ReadonlyRegister<temp0>;

  /** DesiredTemperature: 1/2 °C resolution */
  @ext(0xd, 0x2)
  model TempDesired is ReadonlyRegister<temp1>;

  /** CircuitDiaState */
  @ext(0x18, 0x2)
  model CircuitDiaState is ReadonlyRegister<UCH>;

  /** CircuitsStates */
  @ext(0x1e, 0x2)
  model CircuitsStates is ReadonlyRegister<UCH>;

  /** Flow setpoint: 1/2 °C resolution */
  @ext(0x1f, 0x2)
  model FlowTempDesired is ReadonlyRegister<temp1>;

  /** CleaningLady: 0,5h */
  @ext(0x23, 0x2)
  model CleaningLady is ReadonlyRegister<UCH>;

  /** ActualDesiredTemp: 1/2°C Auflösung */
  @ext(0x33, 0x2)
  model ActualTempDesired is ReadonlyRegister<temp1>;

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
  }
}
