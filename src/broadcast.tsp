import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./opdata_inc.tsp";
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

  model Id is Ebus.Id.Id;
  model IdQuery is Ebus.Id.IdQuery;
  model IdAnswer is Ebus.Id.IdAnswer;

  /** Inquiry of existence */
  @inherit(w)
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

  @inherit(b)
  model RcTarget is Opdata_inc.RcTarget;

  @inherit(b)
  model RcOperation is Opdata_inc.RcOperation;

  @inherit(b)
  model ControlCmd is Opdata_inc.ControlCmd;

  /** reset network state */
  @inherit(b)
  @ext(0xff, 0)
  model Netresetstate {}

  /** reset network config */
  @inherit(b)
  @ext(0xff, 1)
  model Netresetcfg {}

  /** network loss */
  @inherit(b)
  @ext(0xff, 0x2)
  model Netloss {}
}
