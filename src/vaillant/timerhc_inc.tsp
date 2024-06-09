import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace timerhc_inc {
  // HC: Periods

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
  @ext(0, 0)
  model hcTimer_Monday {
    value: timer;
  }

  /** Periods Tuesday */
  @inherit(r, w)
  @ext(1, 0)
  model hcTimer_Tuesday {
    value: timer;
  }

  /** Periods Wednesday */
  @inherit(r, w)
  @ext(0x2, 0)
  model hcTimer_Wednesday {
    value: timer;
  }

  /** Periods Thursday */
  @inherit(r, w)
  @ext(0x3, 0)
  model hcTimer_Thursday {
    value: timer;
  }

  /** Periods Friday */
  @inherit(r, w)
  @ext(0x4, 0)
  model hcTimer_Friday {
    value: timer;
  }

  /** Periods Saturday */
  @inherit(r, w)
  @ext(0x5, 0)
  model hcTimer_Saturday {
    value: timer;
  }

  /** Periods Sunday */
  @inherit(r, w)
  @ext(0x6, 0)
  model hcTimer_Sunday {
    value: timer;
  }
}
