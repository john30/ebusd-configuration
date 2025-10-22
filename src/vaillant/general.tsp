import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace General {
  /** default *r */
  @base(MF, 0x13)
  model r_1 {}

  /** register value range */
  @inherit(r_1)
  @ext(0x4)
  model Valuerange {
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
