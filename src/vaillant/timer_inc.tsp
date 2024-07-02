import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Timer_inc {
  // CC/DHW: Periods

  /** default *r */
  @base(MF, 0x4, 0x2)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x5, 0x9, 1)
  model w {}

  /** Periods Monday */
  @inherit(r, w)
  model Timer_Monday {
    value: timer;
  }

  /** default *r */
  @base(MF, 0x4, 0x3)
  model r_1 {}

  /** default *w */
  @write
  @base(MF, 0x5, 0x9, 0x2)
  model w_1 {}

  /** Periods Tuesday */
  @inherit(r_1, w_1)
  model Timer_Tuesday {
    value: timer;
  }

  /** default *r */
  @base(MF, 0x4, 0x4)
  model r_2 {}

  /** default *w */
  @write
  @base(MF, 0x5, 0x9, 0x3)
  model w_2 {}

  /** Periods Wednesday */
  @inherit(r_2, w_2)
  model Timer_Wednesday {
    value: timer;
  }

  /** default *r */
  @base(MF, 0x4, 0x5)
  model r_3 {}

  /** default *w */
  @write
  @base(MF, 0x5, 0x9, 0x4)
  model w_3 {}

  /** Periods Thursday */
  @inherit(r_3, w_3)
  model Timer_Thursday {
    value: timer;
  }

  /** default *r */
  @base(MF, 0x4, 0x6)
  model r_4 {}

  /** default *w */
  @write
  @base(MF, 0x5, 0x9, 0x5)
  model w_4 {}

  /** Periods Friday */
  @inherit(r_4, w_4)
  model Timer_Friday {
    value: timer;
  }

  /** default *r */
  @base(MF, 0x4, 0x7)
  model r_5 {}

  /** default *w */
  @write
  @base(MF, 0x5, 0x9, 0x6)
  model w_5 {}

  /** Periods Saturday */
  @inherit(r_5, r_5)
  model Timer_Saturday {
    value: timer;
  }

  /** default *r */
  @base(MF, 0x4, 0x8)
  model r_6 {}

  /** default *w */
  @write
  @base(MF, 0x5, 0x9, 0x7)
  model w_6 {}

  /** Periods Sunday */
  @inherit(r_6, w_6)
  model Timer_Sunday {
    value: timer;
  }
}
