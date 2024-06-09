import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace general {
  /** default *r */
  @base(MF, 0x13)
  model r {}

  /** register value range */
  @inherit(r)
  @ext(0x4)
  model valuerange {
    /** register number */
    @out
    id: UIN;

    @maxLength(2)
    ign: IGN;

    /** current value */
    cur: UIN;

    /** minimum value */
    min: UIN;

    /** maximum value */
    max: UIN;

    /** default value */
    def: UIN;
  }
}
