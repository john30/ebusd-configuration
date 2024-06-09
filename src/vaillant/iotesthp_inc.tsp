import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace iotesthp_inc {
  // I/O Test: heat pump

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
    coolvalve: 1,
    sourcepump: 2,
    hcpump: 3,
    injector: 4,
    caseheater: 5,
    backup: 6,
    hwchcvalve: 7,
    cirpump: 8,
    sc2pump: 9,
    hc2pump: 10,
    hc2mixeropen: 11,
    hc2mixerclose: 12,
  }
}
