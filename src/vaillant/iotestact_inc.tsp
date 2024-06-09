import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace iotestact_inc {
  // I/O test: Actostor

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x6)
  model wi {}

  /** I/O test */
  @inherit(wi)
  @ext(0x2)
  model iotest {
    @values(values_iotest)
    value: UCH;
  }

  /** stop I/O test */
  @inherit(wi)
  @ext(1)
  model ioteststop {}

  enum values_iotest {
    off: 0,
    cirpump: 1,
    pump1: 2,
    pump2: 3,
    al: 4,
  }
}
