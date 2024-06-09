import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace timerhwc_inc {
  // DHW: Periods

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
  @ext(0, 1)
  model hwcTimer_Monday {
    value: timer;
  }

  /** Periods Tuesday */
  @inherit(r, w)
  @ext(1, 1)
  model hwcTimer_Tuesday {
    value: timer;
  }

  /** Periods Wednesday */
  @inherit(r, w)
  @ext(0x2, 1)
  model hwcTimer_Wednesday {
    value: timer;
  }

  /** Periods Thursday */
  @inherit(r, w)
  @ext(0x3, 1)
  model hwcTimer_Thursday {
    value: timer;
  }

  /** Periods Friday */
  @inherit(r, w)
  @ext(0x4, 1)
  model hwcTimer_Friday {
    value: timer;
  }

  /** Periods Saturday */
  @inherit(r, w)
  @ext(0x5, 1)
  model hwcTimer_Saturday {
    value: timer;
  }

  /** Periods Sunday */
  @inherit(r, w)
  @ext(0x6, 1)
  model hwcTimer_Sunday {
    value: timer;
  }
}
