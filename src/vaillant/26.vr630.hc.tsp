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

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x9, 0xe)
  model wi {}
  // ##### Statistics #####

  /** StatPowerOn */
  @inherit(r)
  @ext(0xcc, 0)
  model StatPowerOn {
    value: UIN;
  }

  /** StatOperatingHours */
  @inherit(r)
  @ext(0xcd, 0)
  model StatOperatingHours {
    value: UIN;
  }

  /** StatMonthOfInstallation */
  @inherit(r)
  @ext(0xce, 0)
  model StatMonthOfInstallation {
    value: UCH;
  }

  /** StatYearOfInstallation */
  @inherit(r)
  @ext(0xcf, 0)
  model StatYearOfInstallation {
    value: UCH;
  }

  /** Stat15MinBusTimeout */
  @inherit(r)
  @ext(0xd0, 0)
  model Stat15MinBusTimeout {
    value: UCH;
  }

  /** StatRTOSErrorcode */
  @inherit(r)
  @ext(0xd1, 0)
  model StatRTOSErrorcode {
    value: UIN;
  }

  /** StatRestarts */
  @inherit(r)
  @ext(0xd2, 0)
  model StatRestarts {
    value: UIN;
  }

  /** StatRTOSErrorCounter */
  @inherit(r)
  @ext(0xd3, 0)
  model StatRTOSErrorCounter {
    value: UIN;
  }
  // ##### BK1: Data #####

  /** Vorlauftemp. IST */
  @inherit(r)
  @ext(0x4, 0)
  model SumFlowSensor {
    value: tempsensor;
  }

  /** Außentemperatur */
  @inherit(r)
  @ext(0x6, 0)
  model OutsideTemp {
    value: tempsensor;
  }

  /** Vorlauftemp. SOLL */
  @inherit(r)
  @ext(0x46, 0)
  model FlowTempDesired {
    value: temp1;
  }

  /** TeleSwitch */
  @inherit(r)
  @ext(0xa, 0)
  model TeleSwitch {
    value: onoff;
  }

  /** Ferienmodus aktiv */
  @inherit(r)
  @ext(0x27, 0)
  model IsInHoliday {
    value: UCH;
  }

  /** Abschaltung wegen Speicherladung */
  @inherit(r)
  @ext(0x47, 0)
  model IsInStorageFilling {
    value: yesno;
  }

  /** Sparfunktion */
  @inherit(r)
  @ext(0x4b, 0)
  model CleaningLady {
    value: UCH;
  }

  /** Partymodus aktiv */
  @inherit(r)
  @ext(0x4e, 0)
  model IsInParty {
    value: UCH;
  }

  /** Pump Status */
  @inherit(r)
  @ext(0x8e, 0)
  model Hc1PumpPort {
    value: onoff;
  }
  // ##### BK1: Configuration #####

  /** AT-Abschaltgrenze */
  @inherit(r, w)
  @ext(0x36, 0)
  model OtShutdownLimit {
    value: desiredtemp;
  }

  /** Minimaltemperatur */
  @inherit(r, w)
  @ext(0x30, 0)
  model FlowTempMin {
    value: temp0;
  }

  /** Absenktemperatur */
  @inherit(r, w)
  @ext(0x33, 0)
  model TempDesiredLow {
    value: temp1;
  }

  /** Kreis deaktivieren */
  @inherit(r, wi)
  @ext(0xaa, 0)
  model BoilerCircuitDisabled {
    value: yesno;
  }

  /** Operation mode */
  @inherit(r, w)
  @ext(0x2b, 0)
  model OperatingMode {
    value: mcmode;
  }

  /** Maximaltemperatur */
  @inherit(r, w)
  @ext(0x31, 0)
  model FlowTempMax {
    value: temp0;
  }

  /** Solltemperatur */
  @inherit(r, w)
  @ext(0x32, 0)
  model TempDesired {
    value: temp1;
  }

  /** Heating curve */
  @inherit(r, w)
  @ext(0x35, 0)
  model HeatingCurve {
    value: curve;
  }

  /** TeleSwitch */
  @inherit(r, w)
  @ext(0x3f, 0)
  model TeleswitchOperatingMode {
    value: mcmode;
  }
  @condition(Id.Id.sw, "<=400")
  namespace Sw_le400 {
    /** Max. Voraufheizung */
    @inherit(r, w)
    @ext(0x38, 0)
    model HcMaxPreHeating {
      value: hours;
    }
  }
  @condition(Id.Id.sw, ">=401")
  namespace Sw_ge401 {
    /** Max. Voraufheizung */
    @inherit(r, wi)
    @ext(0x38, 0)
    model HcMaxPreHeating {
      @unit("min / 5")
      value: UCH;
    }
  }

  /** included parts */
  union _includes {
    Hcmode_inc,
    Timer_inc,
    Iotest630_inc,
    Errors_inc,
  }
}
