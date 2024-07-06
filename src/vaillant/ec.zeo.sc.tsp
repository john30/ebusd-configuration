import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0xec)
namespace Zeo.Sc {
  // ,ZEO00,Zeolite AMU,ZEO00 197 Solar
  // ##### SOL: #####

  /** SolarCollPumpDcIntegrator: -50..50 */
  @ext(0xcb, 0)
  model SolCollPumpDcIntegrator is ReadonlyRegister<SIN>;

  /** SolEnableDiffTemp: 5..12K / 1K Auflösung */
  @ext(0xcd, 0)
  model SolEnableDiffTemp is ServiceRegister<temp0>;

  /** SolDisableDiffTemp: 1..10K / 1K Auflösung */
  @ext(0xce, 0)
  model SolDisableDiffTemp is ServiceRegister<temp0>;

  /** SolDhwMaxLoadTemp: 35..80°C / 1°C */
  @ext(0xcf, 0)
  model SolHwcMaxLoadTemp is ServiceRegister<temp0>;

  /** SolarConfigFlags */
  @ext(0xd0, 0)
  model SolConfigFlags is ReadonlyRegister<UCH>;

  /** SolarCollectorPumpED: 0..100% */
  @ext(0xd1, 0)
  model SolCollPumpED is ReadonlyRegister<UCH>;

  /** CollectorPumpSRuntime: runtime in seconds base for runtime in hours */
  @ext(0xd2, 0)
  model CollPumpSRuntime is ServiceRegister<UIN>;

  /** CollectorPumpHRuntime: runtime in hours */
  @ext(0xd3, 0)
  model CollPumpHRuntime is ServiceRegister<UIN>;

  /** SolarYieldMinute: nur Summe von dT ohne Volumenstrom nur mit PWM */
  @ext(0xd4, 0)
  model YieldMinute is ServiceRegister<UIN>;

  /** SolarYieldKw: um den Wert in KW zu bekommenmuß gerechnet werden:kW=x*SolarVolumnFlowUser*c */
  @ext(0xd5, 0)
  model Yield is ServiceRegister<UIN>;

  /** SolarFlowRate: 0..20l/h Wert des Taco-Setters für Ertragsermittlung */
  @ext(0xd6, 0)
  model SolFlowRate is ServiceRegister<UIN>;
}
