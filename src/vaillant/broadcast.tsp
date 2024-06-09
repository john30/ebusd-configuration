import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace broadcast {
  /** default *b */
  @passive
  @zz(BROADCAST)
  @base(MF, 0x16)
  model b {}

  /** default *wi */
  @write
  @zz(BROADCAST)
  @base(MF, 0x16)
  model wi {}

  /** date/time */
  @inherit(b, wi)
  @ext(0)
  model vdatetime {
    time: BTI;
    date: BDA;
  }

  /** outside temperature */
  @inherit(b)
  @ext(1)
  model outsidetemp {
    value: temp2;
  }

  /** default *b */
  @passive
  @zz(BROADCAST)
  @base(MF, 0x5)
  model b_1 {}

  /** state hot water */
  @inherit(b_1)
  @ext(0x27)
  model hwcStatus {
    onoff: onoff;
    vf1: temp0;
    onoff_1: onoff;
  }

  /** quick - hot water tank filling */
  @inherit(b_1)
  @ext(0x6)
  model load {
    value: onoff;
  }
}
