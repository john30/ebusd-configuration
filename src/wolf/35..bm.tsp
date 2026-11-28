import "@ebusd/ebus-typespec";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Wolf;

/** Wolf Bedienmodul BM at slave 0x35, identifies with empty ID and SW 0x0204 */
@zz(0x35)
namespace bm {
  /** Room temperature at the BM */
  @id(0x11, 0)
  model Roomtemp is ReadonlyRegister<stemp10>;

  /** Room comfort temperature setpoint */
  @id(0x5, 0)
  model Roomtempdesired is ReadonlyRegister<stemp10>;
}
