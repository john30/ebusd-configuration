import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace roomtempoffset_inc {
  // MC: Room offset calculation

  /** default *w */
  @write
  @base(MF, 0x5, 0x2d)
  model w {}

  /** Room offset calculation */
  @inherit(w)
  model RoomTempOffset {
    value: temp;
  }
}
