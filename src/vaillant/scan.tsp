import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Scan {
  /** default *r */
  @base(MF, 0x9)
  model r_1 {}

  /** Scan ID */
  @inherit(r_1)
  @ext(0x24)
  @chain(0, #[0x25], #[0x26], #[0x27])
  model Id {
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
