import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Timerhwc_inc {
  // DHW: Periods

  /** Periods Monday */
  @ext(0, 1)
  model HwcTimer_Monday is Timer<timer>;

  /** Periods Tuesday */
  @ext(1, 1)
  model HwcTimer_Tuesday is Timer<timer>;

  /** Periods Wednesday */
  @ext(0x2, 1)
  model HwcTimer_Wednesday is Timer<timer>;

  /** Periods Thursday */
  @ext(0x3, 1)
  model HwcTimer_Thursday is Timer<timer>;

  /** Periods Friday */
  @ext(0x4, 1)
  model HwcTimer_Friday is Timer<timer>;

  /** Periods Saturday */
  @ext(0x5, 1)
  model HwcTimer_Saturday is Timer<timer>;

  /** Periods Sunday */
  @ext(0x6, 1)
  model HwcTimer_Sunday is Timer<timer>;
}
