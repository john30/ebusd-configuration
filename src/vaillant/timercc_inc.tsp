import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace timercc_inc {
  // CC: Periods

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
  @ext(0, 0x2)
  model ccTimer_Monday {
    value: timer;
  }

  /** Periods Tuesday */
  @inherit(r, w)
  @ext(1, 0x2)
  model ccTimer_Tuesday {
    value: timer;
  }

  /** Periods Wednesday */
  @inherit(r, w)
  @ext(0x2, 0x2)
  model ccTimer_Wednesday {
    value: timer;
  }

  /** Periods Thursday */
  @inherit(r, w)
  @ext(0x3, 0x2)
  model ccTimer_Thursday {
    value: timer;
  }

  /** Periods Friday */
  @inherit(r, w)
  @ext(0x4, 0x2)
  model ccTimer_Friday {
    value: timer;
  }

  /** Periods Saturday */
  @inherit(r, w)
  @ext(0x5, 0x2)
  model ccTimer_Saturday {
    value: timer;
  }

  /** Periods Sunday */
  @inherit(r, w)
  @ext(0x6, 0x2)
  model ccTimer_Sunday {
    value: timer;
  }
}
