import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./mcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotest630_inc.tsp";
import "./errors_inc.tsp";
import "./roomtempoffset_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x51)
namespace Vr630.Mc._3 {
  // ,VR630,calorMATIC 630/3,0020092435 163 Mixer
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
  // ##### MK2: Data #####

  /** Vorlauftemp. IST */
  @ext(0x3, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** Vorlauftemp. SOLL */
  @ext(0x46, 0)
  model FlowTempDesired is ReadonlyRegister<temp1>;

  /** TeleSwitch */
  @ext(0xa, 0)
  model TeleSwitch is ReadonlyRegister<onoff>;

  /** Ferienmodus aktiv */
  @ext(0x27, 0)
  model IsInHoliday is ReadonlyRegister<UCH>;

  /** Speicherladung aktiv */
  @ext(0x47, 0)
  model IsInStorageFilling is ReadonlyRegister<yesno>;

  /** Sparfunktion */
  @ext(0x4b, 0)
  model CleaningLady is ReadonlyRegister<UCH>;

  /** Partymodus aktiv */
  @ext(0x4e, 0)
  model IsInParty is ReadonlyRegister<UCH>;

  /** Mischeransteuerung */
  @ext(0xf, 0)
  model MixerDutyCycle is ReadonlyRegister<SCH>;

  /** Pump Status */
  @ext(0x94, 0)
  model HcPumpPort is ReadonlyRegister<onoff>;
  // ##### MK2: Configuration #####

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
  @inherit(r, wi)
  @ext(0x3c, 0)
  model CfgHeatSinkType {
    @values(Values_CfgHeatSinkType)
    value: UCH;
  }

  /** Pump blockage time */
  @ext(0x4f, 0)
  model HcPumpIdlePeriod is Register<minutes0>;

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

  /** FloorPavingDryingDay3: Current day of floor paving drying routine */
  @ext(0x3b, 0)
  model FloorPavingDryingDay is ReadonlyRegister<UCH>;

  /** TeleSwitch */
  @ext(0x3f, 0)
  model TeleswitchOperatingMode is Register<mcmode>;

  enum Values_CfgHeatSinkType {
    disabled: 0,
    mixer: 1,
    water: 2,
    fixvalue: 3,
    backflow: 4,
  }
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
    Mcmode_inc,
    Timer_inc,
    Iotest630_inc,
    Errors_inc,
    Roomtempoffset_inc,
    Quick_inc,
  }
}
