import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Iotestact_inc {
  // I/O test: Actostor

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
    off: 0,
    cirpump: 1,
    pump1: 2,
    pump2: 3,
    al: 4,
  }
}
