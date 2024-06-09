import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace iotestbsol_inc {
  // I/O test: solar

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
    off: 0x01,
    col1pump: 0x02,
    legiopump: 0x04,
    ma: 0x08,
  }
}
