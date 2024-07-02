import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./timerhwc_inc.tsp";
import "./timerhc_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace _160 {
  // ,35000,VTS 160,173 173

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

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x9, 0xe)
  model ws {}

  /** System Date */
  @inherit(r, w)
  @ext(0x61, 0)
  model Date {
    /** current date */
    value: date;
  }

  /** System Time */
  @inherit(r, w)
  @ext(0x60, 0)
  model Time {
    /** current time */
    value: time;
  }

  /** System OnOFF */
  @inherit(r, w)
  @ext(1, 0)
  model SystemOnOff {
    @values(Values_SystemOnOff)
    value: UCH;
  }

  /** Operation mode */
  @inherit(r, w)
  @ext(0x2f, 0)
  model OperatingMode {
    @values(Values_OperatingMode)
    value: UCH;
  }

  /** Override mode */
  @inherit(r, w)
  @ext(0x5d, 0)
  model OverrideMode {
    @values(Values_OverrideMode)
    value: UCH;
  }

  /** HolidayStartPeriod */
  @inherit(r, w)
  @ext(0x11, 0)
  model HolidayStartPeriod {
    /** start date of holiday */
    value: date;
  }

  /** HolidayEndPeriod */
  @inherit(r, w)
  @ext(0x12, 0)
  model HolidayEndPeriod {
    /** end date of holiday */
    value: date;
  }

  /** LcdContrastValue */
  @inherit(r, w)
  @ext(0x5a, 0)
  model LcdContrastValue {
    /** setting of the LCD contrast */
    value: UCH;
  }

  enum Values_SystemOnOff {
    on: 0,
    off: 1,
  }

  enum Values_OperatingMode {
    Auto: 2,
    Comfort: 3,
  }

  enum Values_OverrideMode {
    None: 0,
    Party: 1,
    Holiday: 4,
  }

  /** included parts */
  union _includes {
    Timerhwc_inc,
    Timerhc_inc,
  }
}
