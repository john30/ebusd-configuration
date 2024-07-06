import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Broadcast {
  /** default *b */
  @passive
  @zz(BROADCAST)
  @base(MF, 0x16)
  model b {}

  /** default *wi */
  @write
  @zz(BROADCAST)
  @base(MF, 0x16)
  model wi_1 {}

  /** date/time */
  @inherit(b, wi_1)
  @ext(0)
  model Vdatetime {
    time: BTI;
    date: BDA;
  }

  /** outside temperature */
  @inherit(b)
  @ext(1)
  model Outsidetemp {
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
  model HwcStatus {
    onoff: onoff;
    vf1: temp0;
    onoff_1: onoff;
  }

  /** quick - hot water tank filling */
  @inherit(b_1)
  @ext(0x6)
  model Load {
    value: onoff;
  }
}
