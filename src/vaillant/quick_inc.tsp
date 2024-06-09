import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace quick_inc {
  // MC: quick commands

  /** default *w */
  @write
  @base(MF, 0x5)
  model w {}

  /** Quick - party */
  @inherit(w)
  @ext(0x5)
  model party {
    value: onoff;
  }

  /** quick - hot water tank filling */
  @inherit(w)
  @ext(0x6)
  model load {
    value: onoff;
  }

  /** Quick - cleaning lady */
  @inherit(w)
  @ext(0x7)
  model save {
    value: TTH;
  }
}
