import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Quick_inc {
  // MC: quick commands

  /** Quick - party */
  @inherit(wm)
  @ext(0x5)
  model Party {
    value: onoff;
  }

  /** quick - hot water tank filling */
  @inherit(wm)
  @ext(0x6)
  model Load {
    value: onoff;
  }

  /** Quick - cleaning lady */
  @inherit(wm)
  @ext(0x7)
  model Save {
    value: TTH;
  }
}
