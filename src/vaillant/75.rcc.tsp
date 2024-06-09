import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x75)
namespace rcc {
  // ,RC C,VR 90/3,0020040079 162

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
  // ##### remote control #####

  /** RaumtemperaturIst */
  @inherit(r)
  @ext(0, 0)
  model RoomTemp {
    /** room temperature */
    value: tempsensor;
  }

  /** RaumtemperaturIstOffset */
  @inherit(r, wi)
  @ext(0x1f, 0)
  model RoomTempOffset {
    value: temp;
  }

  /** RaumTempOffsetEigenErwaerm */
  @inherit(r)
  @ext(0x20, 0)
  model RoomTempOffsetSelfWarming {
    value: temp;
  }

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
  @inherit(r, w)
  @ext(0x22, 0)
  model RoomTempHoliday {
    value: temp;
  }

  /** LcdContrastPwmValue */
  @inherit(r, wi)
  @ext(0x36, 0)
  model LcdContrastPwmValue {
    /** contrast for the display */
    value: UCH;
  }
}
