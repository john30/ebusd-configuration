import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Timertariff_inc {
  // Periods high tariff

  /** Periods Monday */
  @ext(0, 0x4)
  model TariffTimer_Monday is Timer<timer>;

  /** Periods Tuesday */
  @ext(1, 0x4)
  model TariffTimer_Tuesday is Timer<timer>;

  /** Periods Wednesday */
  @ext(0x2, 0x4)
  model TariffTimer_Wednesday is Timer<timer>;

  /** Periods Thursday */
  @ext(0x3, 0x4)
  model TariffTimer_Thursday is Timer<timer>;

  /** Periods Friday */
  @ext(0x4, 0x4)
  model TariffTimer_Friday is Timer<timer>;

  /** Periods Saturday */
  @ext(0x5, 0x4)
  model TariffTimer_Saturday is Timer<timer>;

  /** Periods Sunday */
  @ext(0x6, 0x4)
  model TariffTimer_Sunday is Timer<timer>;
}
