import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./wtc_inc.tsp";

using Ebus;
using Ebus.Num;

namespace Wolf;

// Exchange between the room controller (QQ 0x30) and heating module #1 (ZZ 0x50).
namespace em1 {
  /** room-controller / heating-module exchange */
  @passive
  @qq(0x30)
  model HcMode is Wolf.HcMode;
}
