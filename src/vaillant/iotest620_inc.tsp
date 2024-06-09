import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace iotest620_inc {
  // I/O test: 620

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
    valve1: 0,
    cirpump: 1,
    pump1: 2,
    hc2mixeropen: 3,
    hc2mixerclose: 4,
    hc2pump: 5,
    col1pump: 6,
    col2pump: 7,
    valve2: 8,
    valve3: 9,
    legiopump: 10,
    valve4: 11,
    c1c2: 12,
  }
}
