import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./yield3f40_inc.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
import "./errors_inc.tsp";
import "./iotestbsol_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0xa1)
namespace Sol.Cc {
  // ,sol00,VR 68,sol 210 Circulation

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}
  // ##### CP: Circulation pump #####

  /** circulation pump */
  @inherit(r)
  @ext(0x5, 0)
  model CirPump {
    /** Circulation Pump ZP */
    value: onoff;
  }
  // ##### CP: CP #####

  /** OperatingMode */
  @inherit(r)
  @ext(0xf, 0)
  model OperatingMode {
    /** Operating mode of CP circuit (1 = auto, 2 = manual, 3 = off, 4 = on) */
    value: mcmode;
  }

  /** included parts */
  union _includes {
    Yield3f40_inc,
    Hwcmode_inc,
    Timer_inc,
    Errors_inc,
    Iotestbsol_inc,
  }
}
