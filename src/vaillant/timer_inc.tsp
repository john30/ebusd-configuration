import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace timer_inc {
  // CC/DHW: Periods

  /** default *r */
  @base(MF, 0x4)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x5, 0x9)
  model w {}

  /** Periods Monday */
  @inherit(r)
  @ext(0x2)
  model Timer_Monday {
    value: timer;
  }

  /** Periods Tuesday */
  @inherit(r)
  @ext(0x3)
  model Timer_Tuesday {
    value: timer;
  }

  /** Periods Wednesday */
  @inherit(r)
  @ext(0x4)
  model Timer_Wednesday {
    value: timer;
  }

  /** Periods Thursday */
  @inherit(r)
  @ext(0x5)
  model Timer_Thursday {
    value: timer;
  }

  /** Periods Friday */
  @inherit(r)
  @ext(0x6)
  model Timer_Friday {
    value: timer;
  }

  /** Periods Saturday */
  @inherit(r)
  @ext(0x7)
  model Timer_Saturday {
    value: timer;
  }

  /** Periods Sunday */
  @inherit(r)
  @ext(0x8)
  model Timer_Sunday {
    value: timer;
  }

  /** Periods Monday */
  @inherit(w)
  @ext(1)
  model Timer_Monday {
    value: timer;
  }

  /** Periods Tuesday */
  @inherit(w)
  @ext(0x2)
  model Timer_Tuesday {
    value: timer;
  }

  /** Periods Wednesday */
  @inherit(w)
  @ext(0x3)
  model Timer_Wednesday {
    value: timer;
  }

  /** Periods Thursday */
  @inherit(w)
  @ext(0x4)
  model Timer_Thursday {
    value: timer;
  }

  /** Periods Friday */
  @inherit(w)
  @ext(0x5)
  model Timer_Friday {
    value: timer;
  }

  /** Periods Saturday */
  @inherit(w)
  @ext(0x6)
  model Timer_Saturday {
    value: timer;
  }

  /** Periods Sunday */
  @inherit(w)
  @ext(0x7)
  model Timer_Sunday {
    value: timer;
  }
}
