import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Iotest630_inc {
  // I/O test: 630

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x6)
  model wi_1 {}

  /** I/O test */
  @inherit(wi_1)
  @ext(0x2)
  model Iotest {
    @values(Values_iotest)
    value: UCH;
  }

  /** stop I/O test */
  @inherit(wi_1)
  @ext(1)
  model Ioteststop {}

  enum Values_iotest {
    valve1: 0,
    cirpump: 1,
    pump1: 2,
    hc2mixeropen: 3,
    hc2mixerclose: 4,
    hc2pump: 5,
    hc3mixeropen: 6,
    hc3mixerclose: 7,
    hc3pump: 8,
    level1: 9,
    level2: 10,
    av: 11,
    c1c2: 12,
  }
}
