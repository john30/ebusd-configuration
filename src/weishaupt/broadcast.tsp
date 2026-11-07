import "@ebusd/ebus-typespec";
import "../opdata_inc.tsp";
import "../net_inc.tsp";
using Ebus;

namespace Weishaupt;

namespace Broadcast {
  /** default *b */
  @passive
  @zz(BROADCAST)
  model b {}

}
