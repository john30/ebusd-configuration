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

  /** system cooling broadcast status */
  @inherit(b_1)
  @ext(0x5c)
  model CoolingStatus {
    /** cooling broadcast status */
    @values(Values_CoolingStatus)
    status: UCH;
  }

  enum Values_CoolingStatus {
    off: 0,
    on: 1,
  }

  /** default *b for b508 */
  @passive
  @zz(BROADCAST)
  @base(MF, 0x8)
  model b_8 {}

  /** system status broadcast */
  @inherit(b_8)
  @ext(0x9)
  model SystemStatus {
    /** system status */
    status: UCH;
  }
}
