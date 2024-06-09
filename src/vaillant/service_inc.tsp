import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace service_inc {
  // Service message

  /** default *r */
  @base(MF, 0x3, 0)
  model r {}

  /** Current service message */
  @inherit(r)
  @ext(0x2)
  model currentservice {
    value: errors;
  }
  // Service message history

  /** default *r */
  @base(MF, 0x3, 1)
  model r_1 {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x3, 0x2)
  model wi {}

  /** Service message history */
  @inherit(r_1)
  @ext(0x2)
  model servicehistory {
    @out
    index: UCH;

    errorhistory: errorhistory;
  }

  /** Clear service message history */
  @inherit(wi)
  @ext(0x2)
  model clearservicehistory {
    @in
    cleared: yesno;
  }
}
