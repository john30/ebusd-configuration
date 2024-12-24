import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x08)
namespace Recov {
  // ,recov,recoVair 260

  /** Ventilation level day: 1-6 */
  @poll(2)
  @ext(0x8a, 0x3)
  model VentilationLevelDay is Register<UCH>;

  /** Ventilation level night: 1-6 */
  @poll(2)
  @ext(0x8b, 0x3)
  model VentilationLevelNight is Register<UCH>;

  /** Heat recovery */
  @inherit(r, w)
  @poll(2)
  @ext(0x8c, 0x3)
  model HeatRecovery {
    @values(Values_HeatRecovery)
    value: UCH;
  }

  /** frost protection element active */
  @poll(9)
  @ext(0xf1, 0xc)
  model FrostProtection is ReadonlyUpdateRegister<onoff>;

  /** Days left until filter change */
  @inherit(r, w)
  @ext(0x35, 0xe)
  model FilterChangeDaysLeft {
    @unit("days")
    value: UIN;
  }

  /** Days left until maintenance */
  @inherit(r, w)
  @ext(0x36, 0xe)
  model MaintenanceDaysLeft {
    @unit("days")
    value: UIN;
  }

  /** Energy yield today */
  @inherit(r)
  @ext(0x56, 0xe)
  model YieldToday {
    @unit("kWh")
    @divisor(10)
    value: ULG;
  }

  /** Energy yield yesterday */
  @inherit(r)
  @ext(0x57, 0xe)
  model YieldYesterday {
    @unit("kWh")
    @divisor(10)
    value: ULG;
  }

  /** Energy yield month */
  @inherit(r)
  @ext(0x58, 0xe)
  model YieldMonth {
    @unit("kWh")
    @divisor(10)
    value: ULG;
  }

  /** Energy yield year */
  @inherit(r)
  @ext(0x59, 0xe)
  model YieldYear {
    @unit("kWh")
    value: ULG;
  }

  /** Energy yield total */
  @inherit(r)
  @ext(0x5a, 0xe)
  model YieldTotal {
    @unit("kWh")
    value: ULG;
  }

  /** Installation height */
  @inherit(r, w)
  @ext(0x1a, 0xe)
  model InstallationHeight {
    @unit("m")
    value: UIN;
  }

  /** Exhaust air disbalance */
  @ext(0x1b, 0xe)
  model ExhaustAirDisbalance is Register<percents>;

  /** Nominal flow NL */
  @inherit(r, w)
  @ext(0x1c, 0xe)
  model NominalFlow {
    @unit("m3/h")
    value: UIN;
  }

  /** Reduced ventilation to NL */
  @ext(0x1d, 0xe)
  model ReducedVolumeFlow is Register<percent>;

  /** Intenstive ventilation to NL */
  @ext(0x1e, 0xe)
  model IntensiveVolumeFlow is Register<percent>;

  /** Heat exchanger typ */
  @inherit(r, w)
  @ext(0x25, 0xe)
  model HeadExchangerType {
    @values(Values_HeadExchangerType)
    value: UCH;
  }

  /** Frost protection element */
  @inherit(r, w)
  @ext(0x26, 0xe)
  model FrostProtectionElement {
    @values(Values_FrostProtectionElement)
    value: UCH;
  }

  /** Air-earth collector available */
  @ext(0x28, 0xe)
  model AirEarthCollector is Register<yesno>;

  /** Max. diff.temp. bypass */
  @ext(0x2a, 0xe)
  model BypassMaxDiffTemp is Register<temp>;

  /** Pressure monitor available */
  @ext(0x2b, 0xe)
  model PressureMonitor is Register<yesno>;

  /** Step switch available */
  @ext(0x2c, 0xe)
  model StepSwitch is Register<yesno>;

  /** Air quality sensor number */
  @ext(0x2d, 0xe)
  model AirQualitySensorNumber is Register<UCH>;

  /** min CO2 content */
  @inherit(r, w)
  @ext(0x2e, 0xe)
  model MinCO2Content {
    @unit("ppm")
    value: UIN;
  }

  /** max CO2 content */
  @inherit(r, w)
  @ext(0x2f, 0xe)
  model MaxCO2Content {
    @unit("ppm")
    value: UIN;
  }

  /** min air humidity */
  @ext(0x30, 0xe)
  model MinAirHumidity is Register<percent0>;

  /** max air humidity */
  @ext(0x31, 0xe)
  model MaxAirHumidity is Register<percent0>;

  /** Supply air speed */
  @inherit(r)
  @ext(1, 0xe)
  model SupplyAirSpeed {
    @unit("rpm")
    value: UIN;
  }

  /** Exhaust air speed */
  @inherit(r)
  @ext(0x2, 0xe)
  model ExhaustAirSpeed {
    @unit("rpm")
    value: UIN;
  }

  /** Supply air internal actual flow */
  @inherit(r, u)
  @poll(2)
  @ext(0x3, 0xe)
  model SupplyFlowActual {
    @unit("m3/h")
    value: UIN;
  }

  /** Supply air internal target flow */
  @inherit(r)
  @ext(0x4, 0xe)
  model SupplyFlowTarget {
    @unit("m3/h")
    value: UIN;
  }

  /** Exhaust air internal actual flow */
  @inherit(r)
  @ext(0x5, 0xe)
  model ExhaustFlowActual {
    @unit("m3/h")
    value: UIN;
  }

  /** Exhaust air internal target flow */
  @inherit(r)
  @ext(0x6, 0xe)
  model ExhaustFlowTarget {
    @unit("m3/h")
    value: UIN;
  }

  /** Ventilation stage */
  @inherit(r, w)
  @ext(0x15, 0xe)
  model VentilationStage {
    @values(Values_VentilationStage)
    value: UCH;
  }

  /** desired temperature */
  @ext(0x14, 0xe)
  model DesiredTemp is UpdateRegister<temp>;

  /** Intensive ventilation */
  @ext(0xca, 0xd)
  model IntensiveVentilation is Register<onoff>;

  /** Outside air temperature */
  @ext(0xc, 0xe)
  model OutsideAirTemp is ReadonlyUpdateRegister<tempsensor>;

  /** Exit air temperature */
  @ext(0xd, 0xe)
  model ExitAirTemp is ReadonlyUpdateRegister<tempsensor>;

  /** Exhaust air temperature */
  @ext(0xb4, 0xd)
  model ExhaustAirTemp is ReadonlyUpdateRegister<tempsensor>;

  /** Exhaust air humidity */
  @ext(0x85, 0x3)
  model ExhaustAirHumidity is ReadonlyUpdateRegister<percent>;

  /** Supply air temperature */
  @ext(0xb3, 0xd)
  model SupplyAirTemp is ReadonlyUpdateRegister<tempsensor>;

  /** Bypass flap position */
  @poll(9)
  @ext(0xb, 0xe)
  model BypassPosition is ReadonlyUpdateRegister<percent>;

  /** default *w */
  @write
  @base(MF, 0x22, 0)
  model w_1 {}

  /** Set Ventilation Day */
  @inherit(w_1)
  @ext(0x2, 0, 0xff, 0xff)
  model VentDay {}

  /** Set Ventilation Night */
  @inherit(w_1)
  @ext(1, 0, 0xff, 0xff)
  model VentNight {}

  /** Activate Boost Ventilation */
  @inherit(w_1)
  @ext(0x3, 0, 0xff, 0xff)
  model VentBoost {}

  enum Values_HeatRecovery {
    auto: 0,
    on: 1,
    off: 2,
  }

  enum Values_HeadExchangerType {
    Standard: 0,
    Enthalpy: 1,
  }

  enum Values_FrostProtectionElement {
    unavailable: 0,
    electrical: 1,
    hydraulic: 2,
  }

  enum Values_VentilationStage {
    low: 0,
    auto: 1,
    medium: 2,
    high: 3,
  }
}
