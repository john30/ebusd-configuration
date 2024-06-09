import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace iotestbmc_inc {
  // I/O test: mixer

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
    off_cirpump: 0x01,
    hcpump: 0x02,
    hc2mixeropen: 0x04,
    hc2mixerclose: 0x08,
    hc2pump: 0x10,
  }
}
