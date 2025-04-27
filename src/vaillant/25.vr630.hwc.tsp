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
  // ##### DHW: Data #####

  /** Current cylinder temp. */
  @ext(0, 0)
  model Storage1Sensor2 is ReadonlyRegister<tempsensor>;

  /** Circulation pump */
  @ext(0xc, 0)
  model CirPump2 is ReadonlyRegister<onoff>;

  /** Loading pump status */
  @ext(0x10, 0)
  model ThreeWayValveLoadingPump1 is ReadonlyRegister<onoff>;

  /** Legionellenpumpe */
  @ext(0x11, 0)
  model LegioPump2 is ReadonlyRegister<onoff>;

  /** TeleSwitch */
  @ext(0xa, 0)
  model TeleSwitch is ReadonlyRegister<onoff>;

  /** OneTimeCirculationSwitch: non-recurring circulation pump running period */
  @ext(0xb, 0)
  model OneTimeCirSwitch is ReadonlyRegister<onoff>;

  /** Ferienmodus aktiv */
  @ext(0x27, 0)
  model IsInHoliday is ReadonlyRegister<UCH>;

  /** Partymodus aktiv */
  @ext(0x4e, 0)
  model IsInParty is ReadonlyRegister<UCH>;
  // ##### DHW: Configuration #####

  /** Ladepumpennachlauf */
  @ext(0x61, 0)
  model HwcLaggingTime2 is Register<minutes0>;

  /** Vorlauftemp. SOLL */
  @ext(0x46, 0)
  model FlowTempDesired2 is ReadonlyRegister<temp1>;

  /** Parallel loading */
  @ext(0x55, 0)
  model HcParallelStorageFillingEnabled2 is Register<yesno>;

  /** Re-charge delay */
  @ext(0x62, 0)
  model HwcLoadingDelay2 is Register<minutes0>;

  /** Legionellenschutz Starttag */
  @ext(0x8a, 0)
  model LegioStartDay2 is Register<UCH>;

  /** Operation mode */
  @ext(0x2b, 0)
  model OperatingMode2 is Register<mcmode>;

  /** Speichersoll */
  @ext(0x32, 0)
  model TempDesired2 is Register<temp1>;

  /** TeleSwitch */
  @ext(0x3f, 0)
  model TeleswitchOperatingMode2 is Register<mcmode>;

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
    Iotest630_inc,
    Errors_inc,
  }
}
