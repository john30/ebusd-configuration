import "@ebusd/ebus-typespec";
import "../opdata_inc.tsp";
import "../net_inc.tsp";
import "./wtc_inc.tsp";
using Ebus;

namespace Wolf;

namespace Broadcast {
  /** default *b */
  @passive
  @zz(BROADCAST)
  model b {}

  /** boiler status broadcast by the WTC */
  @inherit(b)
  model KaStatus is Status;

  @inherit(b)
  model RcTarget is Opdata_inc.RcTarget;

  @inherit(b)
  model RcOperation is Opdata_inc.RcOperation;

  @inherit(b)
  model ControlCmd is Opdata_inc.ControlCmd;

  union _includes {
    Net_inc,
  }
}
