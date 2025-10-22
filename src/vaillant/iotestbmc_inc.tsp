import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Iotestbmc_inc {
  // I/O test: mixer

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
    off_cirpump: 0x01,
    hcpump: 0x02,
    hc2mixeropen: 0x04,
    hc2mixerclose: 0x08,
    hc2pump: 0x10,
  }
}
