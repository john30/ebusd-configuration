import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./wtc_inc.tsp";

using Ebus;
using Ebus.Num;

namespace Wolf;

// Status the second boiler (source QQ 0x13) sends to the controller (ZZ 0x10 from the file name).
namespace bc2 {
  /** passive, incoming only */
  @passive
  @qq(0x13)
  model up {}

  /** boiler status */
  @inherit(up)
  model WTCStatus is Status;

  /** boiler burner load */
  @inherit(up)
  model WTCPower is Power;
}
