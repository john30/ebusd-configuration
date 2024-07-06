import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x25)
namespace Zeo.Hwc {
  // ,ZEO00,Zeolite AMU,ZEO00 197 DHW
  // ##### DHW: #####

  /** OperatingMode: 1=Ein 2=Aus 3=Auto */
  @ext(0x6, 0)
  model OperatingMode is ReadonlyRegister<mcmode>;

  /** DesiredTemperature: 1/2 °C resolution */
  @ext(0xd, 0)
  model TempDesired is ReadonlyRegister<temp1>;

  /** CircuitDiaState */
  @ext(0x18, 0)
  model CircuitDiaState is ReadonlyRegister<UCH>;

  /** CircuitsStates */
  @ext(0x1e, 0)
  model CircuitsStates is ReadonlyRegister<UCH>;

  /** CleaningLady: 0,5h */
  @ext(0x23, 0)
  model CleaningLady is ReadonlyRegister<UCH>;

  /** DhwLegioProtectionMaxTimer */
  @ext(0x2d, 0)
  model HwcLegioProtectionMaxTimer is ReadonlyRegister<UCH>;

  /** ActualDesiredTemp: 1/2°C Auflösung */
  @ext(0x33, 0)
  model ActualTempDesired is ReadonlyRegister<temp1>;

  /** DhwLegioTempOkTimer */
  @ext(0x34, 0)
  model HwcLegioTempOkTimer is ReadonlyRegister<temp0>;

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
  }
}
