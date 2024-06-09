import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace timercool_inc {
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
  model coolingTimer_Monday {
    value: timer;
  }

  /** Periods Tuesday */
  @inherit(r, w)
  @ext(1, 0x3)
  model coolingTimer_Tuesday {
    value: timer;
  }

  /** Periods Wednesday */
  @inherit(r, w)
  @ext(0x2, 0x3)
  model coolingTimer_Wednesday {
    value: timer;
  }

  /** Periods Thursday */
  @inherit(r, w)
  @ext(0x3, 0x3)
  model coolingTimer_Thursday {
    value: timer;
  }

  /** Periods Friday */
  @inherit(r, w)
  @ext(0x4, 0x3)
  model coolingTimer_Friday {
    value: timer;
  }

  /** Periods Saturday */
  @inherit(r, w)
  @ext(0x5, 0x3)
  model coolingTimer_Saturday {
    value: timer;
  }

  /** Periods Sunday */
  @inherit(r, w)
  @ext(0x6, 0x3)
  model coolingTimer_Sunday {
    value: timer;
  }
}
