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

  /** System Date: current date */
  @ext(0x61, 0)
  model Date is Register<date>;

  /** System Time: current time */
  @ext(0x60, 0)
  model Time is Register<time>;

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

  /** HolidayStartPeriod: start date of holiday */
  @ext(0x11, 0)
  model HolidayStartPeriod is Register<date>;

  /** HolidayEndPeriod: end date of holiday */
  @ext(0x12, 0)
  model HolidayEndPeriod is Register<date>;

  /** LcdContrastValue: setting of the LCD contrast */
  @ext(0x5a, 0)
  model LcdContrastValue is Register<UCH>;

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
