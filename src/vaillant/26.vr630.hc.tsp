import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotest630_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x26)
namespace Vr630.Hc {
  // ,VR630,calorMATIC 630/3,0020092435 163 Burner
  // ##### Statistics #####

  /** StatPowerOn */
  @ext(0xcc, 0)
  model StatPowerOn is ReadonlyRegister<UIN>;

  /** StatOperatingHours */
  @ext(0xcd, 0)
  model StatOperatingHours is ReadonlyRegister<UIN>;

  /** StatMonthOfInstallation */
  @ext(0xce, 0)
  model StatMonthOfInstallation is ReadonlyRegister<UCH>;

  /** StatYearOfInstallation */
  @ext(0xcf, 0)
  model StatYearOfInstallation is ReadonlyRegister<UCH>;

  /** Stat15MinBusTimeout */
  @ext(0xd0, 0)
  model Stat15MinBusTimeout is ReadonlyRegister<UCH>;

  /** StatRTOSErrorcode */
  @ext(0xd1, 0)
  model StatRTOSErrorcode is ReadonlyRegister<UIN>;

  /** StatRestarts */
  @ext(0xd2, 0)
  model StatRestarts is ReadonlyRegister<UIN>;

  /** StatRTOSErrorCounter */
  @ext(0xd3, 0)
  model StatRTOSErrorCounter is ReadonlyRegister<UIN>;
  // ##### BK1: Data #####

  /** Vorlauftemp. IST */
  @ext(0x4, 0)
  model SumFlowSensor is ReadonlyRegister<tempsensor>;

  /** Außentemperatur */
  @ext(0x6, 0)
  model OutsideTemp is ReadonlyRegister<tempsensor>;

  /** Vorlauftemp. SOLL */
  @ext(0x46, 0)
  model FlowTempDesired is ReadonlyRegister<temp1>;

  /** TeleSwitch */
  @ext(0xa, 0)
  model TeleSwitch is ReadonlyRegister<onoff>;

  /** Ferienmodus aktiv */
  @ext(0x27, 0)
  model IsInHoliday is ReadonlyRegister<UCH>;

  /** Abschaltung wegen Speicherladung */
  @ext(0x47, 0)
  model IsInStorageFilling is ReadonlyRegister<yesno>;

  /** Sparfunktion */
  @ext(0x4b, 0)
  model CleaningLady is ReadonlyRegister<UCH>;

  /** Partymodus aktiv */
  @ext(0x4e, 0)
  model IsInParty is ReadonlyRegister<UCH>;

  /** Pump Status */
  @ext(0x8e, 0)
  model Hc1PumpPort is ReadonlyRegister<onoff>;
  // ##### BK1: Configuration #####

  /** AT-Abschaltgrenze */
  @ext(0x36, 0)
  model OtShutdownLimit is Register<desiredtemp>;

  /** Minimaltemperatur */
  @ext(0x30, 0)
  model FlowTempMin is Register<temp0>;

  /** Absenktemperatur */
  @ext(0x33, 0)
  model TempDesiredLow is Register<temp1>;

  /** Kreis deaktivieren */
  @ext(0xaa, 0)
  model BoilerCircuitDisabled is InstallRegister<yesno>;

  /** Operation mode */
  @ext(0x2b, 0)
  model OperatingMode is Register<mcmode>;

  /** Maximaltemperatur */
  @ext(0x31, 0)
  model FlowTempMax is Register<temp0>;

  /** Solltemperatur */
  @ext(0x32, 0)
  model TempDesired is Register<temp1>;

  /** Heating curve */
  @ext(0x35, 0)
  model HeatingCurve is Register<curve>;

  /** TeleSwitch */
  @ext(0x3f, 0)
  model TeleswitchOperatingMode is Register<mcmode>;
  @condition(Id.Id.sw, "<=400")
  namespace Sw_le400 {
    /** Max. Voraufheizung */
    @ext(0x38, 0)
    model HcMaxPreHeating is Register<hours>;
  }
  @condition(Id.Id.sw, ">=401")
  namespace Sw_ge401 {
    /** Max. Voraufheizung */
    @ext(0x38, 0)
    model HcMaxPreHeating is InstallRegister<minutes5>;
  }

  /** included parts */
  union _includes {
    Hcmode_inc,
    Timer_inc,
    Iotest630_inc,
    Errors_inc,
  }
}
