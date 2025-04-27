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

// @zz(0x23)
namespace Vr630.Cc {
  // ,VR630,calorMATIC 630/3,0020092435 163 Circulation
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

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
    Iotest630_inc,
    Errors_inc,
  }
}
