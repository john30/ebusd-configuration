import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0xec)
namespace zeo.sc {
  // ,ZEO00,Zeolite AMU,ZEO00 197 Solar

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x9, 0xe)
  model ws {}
  // ##### SOL: #####

  /** SolarCollPumpDcIntegrator */
  @inherit(r)
  @ext(0xcb, 0)
  model SolCollPumpDcIntegrator {
    /** -50..50 */
    value: SIN;
  }

  /** SolEnableDiffTemp */
  @inherit(r, ws)
  @ext(0xcd, 0)
  model SolEnableDiffTemp {
    /** 5..12K / 1K Auflösung */
    value: temp0;
  }

  /** SolDisableDiffTemp */
  @inherit(r, ws)
  @ext(0xce, 0)
  model SolDisableDiffTemp {
    /** 1..10K / 1K Auflösung */
    value: temp0;
  }

  /** SolDhwMaxLoadTemp */
  @inherit(r, ws)
  @ext(0xcf, 0)
  model SolHwcMaxLoadTemp {
    /** 35..80°C / 1°C */
    value: temp0;
  }

  /** SolarConfigFlags */
  @inherit(r)
  @ext(0xd0, 0)
  model SolConfigFlags {
    value: UCH;
  }

  /** SolarCollectorPumpED */
  @inherit(r)
  @ext(0xd1, 0)
  model SolCollPumpED {
    /** 0..100% */
    value: UCH;
  }

  /** CollectorPumpSRuntime */
  @inherit(r, ws)
  @ext(0xd2, 0)
  model CollPumpSRuntime {
    /** runtime in seconds base for runtime in hours */
    value: UIN;
  }

  /** CollectorPumpHRuntime */
  @inherit(r, ws)
  @ext(0xd3, 0)
  model CollPumpHRuntime {
    /** runtime in hours */
    value: UIN;
  }

  /** SolarYieldMinute */
  @inherit(r, ws)
  @ext(0xd4, 0)
  model YieldMinute {
    /** nur Summe von dT ohne Volumenstrom nur mit PWM */
    value: UIN;
  }

  /** SolarYieldKw */
  @inherit(r, ws)
  @ext(0xd5, 0)
  model Yield {
    /** um den Wert in KW zu bekommenmuß gerechnet werden:kW=x*SolarVolumnFlowUser*c */
    value: UIN;
  }

  /** SolarFlowRate */
  @inherit(r, ws)
  @ext(0xd6, 0)
  model SolFlowRate {
    /** 0..20l/h Wert des Taco-Setters für Ertragsermittlung */
    value: UIN;
  }
}
