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

  /** 24h outside temperature average (same value as mc Tot24hHc2) */
  @inherit(b)
  @ext(4)
  model Tot24h {
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

  /** system mode: 0=off, 1=heat, 2=cool, 4=water */
  @inherit(b_1)
  @ext(0x4a)
  model SystemMode {
    @values(Values_SystemMode)
    value: UCH;

    @maxLength(1)
    ign: IGN;
  }

  enum Values_SystemMode {
    off: 0,
    heat: 1,
    cool: 2,
    water: 4,
  }
}
