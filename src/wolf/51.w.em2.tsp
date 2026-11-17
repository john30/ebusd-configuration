import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./wtc_inc.tsp";

using Ebus;
using Ebus.Num;

namespace Wolf;

// Exchange between the room controller (QQ 0x70) and heating module #2 (ZZ 0x51).
namespace em2 {
  /** room-controller / heating-module exchange */
  @passive
  @qq(0x70)
  model HcMode is Wolf.HcMode;
}
