import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Roomtempoffset_inc {
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
