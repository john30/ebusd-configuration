import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotesthp_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x23)
namespace ehp.cc {
  // ,EHP00,Heat pump AMU,EHP00 172 Circulation

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}
  // ##### CC: Parameters and information #####

  /** CirculationPumpED */
  @inherit(r, w)
  @ext(0xe6, 1)
  model CirPumpED {
    /** defines the percentage of a 10 minutes period to power the pump */
    value: UCH;
  }

  /** included parts */
  union _includes {
    hwcmode_inc,
    timer_inc,
    iotesthp_inc,
    errors_inc,
  }
}
