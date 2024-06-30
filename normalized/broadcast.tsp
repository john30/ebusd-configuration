import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Broadcast {
  /** default *r */
  model r {}

  /** default *b */
  @passive
  @zz(BROADCAST)
  model b {}

  /** default *w */
  @write
  @zz(BROADCAST)
  model w {}

  /** date/time */
  @inherit(b)
  @ext(0x7, 0)
  model Datetime {
    outsidetemp: temp2;
    time: btime;
    date: bdate;
  }

  // model Id is Ebus.Id.Id;

  /** Inquiry of existence */
  @inherit(w)
  @zz(BROADCAST)
  @ext(0x7, 0xfe)
  model Queryexistence {}

  /** sign of life */
  @inherit(b)
  @ext(0x7, 0xff)
  model Signoflife {}

  /** error message */
  @inherit(b)
  @ext(0xfe, 1)
  model Error {
    @maxLength(10)
    error: STR;
  }
}
