import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x75)
namespace Rcc {
  // ,RC C,VR 90/3,0020040079 162
  // ##### remote control #####

  /** RaumtemperaturIst: room temperature */
  @ext(0, 0)
  model RoomTemp is ReadonlyRegister<tempsensor>;

  /** RaumtemperaturIstOffset */
  @ext(0x1f, 0)
  model RoomTempOffset is InstallRegister<temp>;

  /** RaumTempOffsetEigenErwaerm */
  @ext(0x20, 0)
  model RoomTempOffsetSelfWarming is ReadonlyRegister<temp>;

  /** HolidayPeriod */
  @inherit(r, w)
  @ext(0x43, 0)
  model HolidayPeriod {
    hfrom: hfrom;
    hto: hto;
    hfrom_1: hfrom;
    hto_1: hto;
  }

  /** RoomSetTempHoliday */
  @ext(0x22, 0)
  model RoomTempHoliday is Register<temp>;

  /** LcdContrastPwmValue: contrast for the display */
  @ext(0x36, 0)
  model LcdContrastPwmValue is InstallRegister<UCH>;
}
