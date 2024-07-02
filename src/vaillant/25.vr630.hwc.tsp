import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotest630_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x25)
namespace Vr630.Hwc {
  // ,VR630,calorMATIC 630/3,0020092435 163 DHW

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}
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
  // ##### DHW: Data #####

  /** Current cylinder temp. */
  @inherit(r)
  @ext(0, 0)
  model Storage1Sensor2 {
    value: tempsensor;
  }

  /** circulation pump */
  @inherit(r)
  @ext(0xc, 0)
  model CirPump2 {
    value: onoff;
  }

  /** Loading pump status */
  @inherit(r)
  @ext(0x10, 0)
  model ThreeWayValveLoadingPump1 {
    value: onoff;
  }

  /** Legionellenpumpe */
  @inherit(r)
  @ext(0x11, 0)
  model LegioPump2 {
    value: onoff;
  }

  /** TeleSwitch */
  @inherit(r)
  @ext(0xa, 0)
  model TeleSwitch {
    value: onoff;
  }

  /** OneTimeCirculationSwitch */
  @inherit(r)
  @ext(0xb, 0)
  model OneTimeCirSwitch {
    /** non-recurring circulation pump running period */
    value: onoff;
  }

  /** Ferienmodus aktiv */
  @inherit(r)
  @ext(0x27, 0)
  model IsInHoliday {
    value: UCH;
  }

  /** Partymodus aktiv */
  @inherit(r)
  @ext(0x4e, 0)
  model IsInParty {
    value: UCH;
  }
  // ##### DHW: Configuration #####

  /** Ladepumpennachlauf */
  @inherit(r, w)
  @ext(0x61, 0)
  model HwcLaggingTime2 {
    value: minutes0;
  }

  /** Vorlauftemp. SOLL */
  @inherit(r)
  @ext(0x46, 0)
  model FlowTempDesired2 {
    value: temp1;
  }

  /** Parallel loading */
  @inherit(r, w)
  @ext(0x55, 0)
  model HcParallelStorageFillingEnabled2 {
    value: yesno;
  }

  /** Re-charge delay */
  @inherit(r, w)
  @ext(0x62, 0)
  model HwcLoadingDelay2 {
    value: minutes0;
  }

  /** Legionellenschutz Starttag */
  @inherit(r, w)
  @ext(0x8a, 0)
  model LegioStartDay2 {
    value: UCH;
  }

  /** Operation mode */
  @inherit(r, w)
  @ext(0x2b, 0)
  model OperatingMode2 {
    value: mcmode;
  }

  /** Speichersoll */
  @inherit(r, w)
  @ext(0x32, 0)
  model TempDesired2 {
    value: temp1;
  }

  /** TeleSwitch */
  @inherit(r, w)
  @ext(0x3f, 0)
  model TeleswitchOperatingMode2 {
    value: mcmode;
  }

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
    Iotest630_inc,
    Errors_inc,
  }
}
