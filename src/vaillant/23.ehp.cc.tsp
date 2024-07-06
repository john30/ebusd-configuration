import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotesthp_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x23)
namespace Ehp.Cc {
  // ,EHP00,Heat pump AMU,EHP00 172 Circulation
  // ##### CC: Parameters and information #####

  /** CirculationPumpED: defines the percentage of a 10 minutes period to power the pump */
  @ext(0xe6, 1)
  model CirPumpED is Register<UCH>;

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
    Iotesthp_inc,
    Errors_inc,
  }
}
