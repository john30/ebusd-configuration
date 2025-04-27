import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Errors_inc {
  // Current errors

  /** default *r */
  @base(MF, 0x3, 0)
  model r_1 {}

  /** Current errors */
  @inherit(r_1)
  @ext(1)
  model Currenterror {
    value: errors;
  }
  // Error history

  /** default *r */
  @base(MF, 0x3, 1)
  model r_2 {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x3, 0x2)
  model wi_1 {}

  /** Error_History */
  @inherit(r_2)
  @ext(1)
  model Errorhistory {
    @out
    index: UCH;

    errorhistory: errorhistory;
  }

  /** Clear error history */
  @inherit(wi_1)
  @ext(1)
  model Clearerrorhistory {
    @in
    cleared: yesno;
  }
}
