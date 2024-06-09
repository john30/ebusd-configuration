import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace errors_inc {
  // Current errors

  /** default *r */
  @base(MF, 0x3, 0)
  model r {}

  /** Current errors */
  @inherit(r)
  @ext(1)
  model currenterror {
    value: errors;
  }
  // Error history

  /** default *r */
  @base(MF, 0x3, 1)
  model r_1 {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x3, 0x2)
  model wi {}

  /** Error_History */
  @inherit(r_1)
  @ext(1)
  model errorhistory {
    @out
    index: UCH;

    errorhistory: errorhistory;
  }

  /** Clear error history */
  @inherit(wi)
  @ext(1)
  model clearerrorhistory {
    @in
    cleared: yesno;
  }
}
