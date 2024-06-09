import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace scan {
  /** default *r */
  @base(MF, 0x9)
  model r {}

  /** Scan ID */
  @inherit(r)
  @ext(0x24)
  @ext(0x25)
  @ext(0x26)
  @ext(0x27)
  model id {
    ign: IGN;

    @maxLength(2)
    prefix: STR;

    @maxLength(2)
    year: STR;

    @maxLength(2)
    week: STR;

    @maxLength(10)
    product: STR;

    @maxLength(4)
    supplier: STR;

    @maxLength(6)
    counter: STR;

    @maxLength(2)
    suffix: STR;
  }
}
