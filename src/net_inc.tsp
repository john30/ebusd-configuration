import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Net_inc {
  /** default *b */
  @passive
  @zz(BROADCAST)
  model b {}

  /** reset network state */
  @inherit(b)
  @ext(0xff, 0)
  model Netresetstate {}

  /** reset network config */
  @inherit(b)
  @ext(0xff, 1)
  model Netresetcfg {}

  /** network loss */
  @inherit(b)
  @ext(0xff, 0x2)
  model Netloss {}
}
