import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./wtc_inc.tsp";

using Ebus;
using Ebus.Num;

namespace Wolf;

// Exchange between the room controller (QQ 0xf0) and heating module #3 (ZZ 0x52).
namespace em3 {
  /** room-controller / heating-module exchange */
  @passive
  @qq(0xf0)
  model HcMode is Wolf.HcMode;
}
