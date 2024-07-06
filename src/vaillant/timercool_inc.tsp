import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Timercool_inc {
  // MC: Cooling periods

  /** Periods Monday */
  @ext(0, 0x3)
  model CoolingTimer_Monday is Timer<timer>;

  /** Periods Tuesday */
  @ext(1, 0x3)
  model CoolingTimer_Tuesday is Timer<timer>;

  /** Periods Wednesday */
  @ext(0x2, 0x3)
  model CoolingTimer_Wednesday is Timer<timer>;

  /** Periods Thursday */
  @ext(0x3, 0x3)
  model CoolingTimer_Thursday is Timer<timer>;

  /** Periods Friday */
  @ext(0x4, 0x3)
  model CoolingTimer_Friday is Timer<timer>;

  /** Periods Saturday */
  @ext(0x5, 0x3)
  model CoolingTimer_Saturday is Timer<timer>;

  /** Periods Sunday */
  @ext(0x6, 0x3)
  model CoolingTimer_Sunday is Timer<timer>;
}
