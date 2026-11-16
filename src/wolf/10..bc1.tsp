import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./wtc_inc.tsp";

using Ebus;
using Ebus.Num;

namespace Wolf;

// Status the first boiler (source QQ 0x03) sends to the controller (ZZ 0x10 from the file name).
namespace bc1 {
  /** passive, incoming only */
  @passive
  @qq(0x03)
  model up {}

  /** boiler status */
  @inherit(up)
  model WTCStatus is Status;

  /** boiler burner load */
  @inherit(up)
  model WTCPower is Power;
}
