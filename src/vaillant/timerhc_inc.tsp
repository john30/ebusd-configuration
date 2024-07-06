import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Timerhc_inc {
  // HC: Periods

  /** Periods Monday */
  @ext(0, 0)
  model HcTimer_Monday is Timer<timer>;

  /** Periods Tuesday */
  @ext(1, 0)
  model HcTimer_Tuesday is Timer<timer>;

  /** Periods Wednesday */
  @ext(0x2, 0)
  model HcTimer_Wednesday is Timer<timer>;

  /** Periods Thursday */
  @ext(0x3, 0)
  model HcTimer_Thursday is Timer<timer>;

  /** Periods Friday */
  @ext(0x4, 0)
  model HcTimer_Friday is Timer<timer>;

  /** Periods Saturday */
  @ext(0x5, 0)
  model HcTimer_Saturday is Timer<timer>;

  /** Periods Sunday */
  @ext(0x6, 0)
  model HcTimer_Sunday is Timer<timer>;
}
