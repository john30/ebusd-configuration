import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
import "./service_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x08)
namespace V3x {
  // ,v3x00,VR39,0020139898
  // ##### dia level 1 #####

  /** d.13 Circulation pump */
  @ext(0x7b, 0)
  model CirPump is ReadonlyRegister<onoff>;
  // ##### dia level 2 #####

  /** d.17 Return regulation */
  @ext(0xc, 0x4)
  model ReturnRegulation is InstallRegister<onoff>;

  /** d.18 CH pump mode */
  @inherit(r, wi)
  @ext(0x49, 0x4)
  model HcPumpMode {
    @values(Values_HcPumpMode)
    value: UCH;
  }

  enum Values_HcPumpMode {
    post_run: 0,
    permanent: 1,
    winter: 2,
  }

  /** included parts */
  union _includes {
    Errors_inc,
    Service_inc,
  }
}
