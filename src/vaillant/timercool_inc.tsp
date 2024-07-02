import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Timercool_inc {
  // MC: Cooling periods

  /** default *r */
  @base(MF, 0x15)
  model r {
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x15)
  model w {}

  /** Periods Monday */
  @inherit(r, w)
  @ext(0, 0x3)
  model CoolingTimer_Monday {
    value: timer;
  }

  /** Periods Tuesday */
  @inherit(r, w)
  @ext(1, 0x3)
  model CoolingTimer_Tuesday {
    value: timer;
  }

  /** Periods Wednesday */
  @inherit(r, w)
  @ext(0x2, 0x3)
  model CoolingTimer_Wednesday {
    value: timer;
  }

  /** Periods Thursday */
  @inherit(r, w)
  @ext(0x3, 0x3)
  model CoolingTimer_Thursday {
    value: timer;
  }

  /** Periods Friday */
  @inherit(r, w)
  @ext(0x4, 0x3)
  model CoolingTimer_Friday {
    value: timer;
  }

  /** Periods Saturday */
  @inherit(r, w)
  @ext(0x5, 0x3)
  model CoolingTimer_Saturday {
    value: timer;
  }

  /** Periods Sunday */
  @inherit(r, w)
  @ext(0x6, 0x3)
  model CoolingTimer_Sunday {
    value: timer;
  }
}
