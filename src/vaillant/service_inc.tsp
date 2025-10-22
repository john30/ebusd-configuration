import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Service_inc {
  // Service message

  /** default *r */
  @base(MF, 0x3, 0)
  model r_1 {}

  /** Current service message */
  @inherit(r_1)
  @ext(0x2)
  model Currentservice {
    value: errors;
  }
  // Service message history

  /** default *r */
  @base(MF, 0x3, 1)
  model r_2 {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x3, 0x2)
  model wi_1 {}

  /** Service message history */
  @inherit(r_2)
  @ext(0x2)
  model Servicehistory {
    @out
    index: UCH;

    errorhistory: errorhistory;
  }

  /** Clear service message history */
  @inherit(wi_1)
  @ext(0x2)
  model Clearservicehistory {
    @in
    cleared: yesno;
  }
}
