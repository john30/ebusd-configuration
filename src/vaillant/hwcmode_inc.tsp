import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Hwcmode_inc {
  // HWC/CC: Operation mode

  /** date/time */
  @inherit(rm)
  @ext(0)
  model DateTime {
    dcfstate: dcfstate;
    btime: btime;
    bdate: bdate;
    temp: temp2;
  }

  /** Operation mode */
  @inherit(rm)
  @ext(1)
  model Mode {
    temp: temp0;
    hwcmode: hwcmode;
    @maxLength(2) ign: IGN;
    hwcmode_1: hwcmode;
    mctype: mctype7;
    hex: HEX;
    daynight: daynight;
  }

  /** Set desired temperature */
  @inherit(wm)
  @ext(1)
  model SetTempDesired {
    value: temp0;
  }

  /** Set operation mode */
  @inherit(wm)
  @ext(0x2)
  model SetMode {
    value: hwcmode;
  }

  /** Set min flow temperature */
  @inherit(wm)
  @ext(0xe)
  model SetFlowTempMin {
    value: temp0;
  }

  /** Set max flow temperature */
  @inherit(wm)
  @ext(0xf)
  model SetFlowTempMax {
    value: temp0;
  }

  /** Parameters */
  @inherit(rm)
  @ext(0x9)
  model Params {
    temp: temp0;
    @maxLength(3) ign: IGN;
    mctype: mctype7;
    temps: temps;
    ign_1: IGN;
    temps_1: temps;
    temps_2: temps;
    ign_2: IGN;
  }

  /** Status flow temperature/mixer/pump/desired flow temperature */
  @inherit(rm)
  @ext(0xa)
  model Status0a {
    flowtemp: temp;
    mixer: mixer;
    pump: onoff;
    onoff: onoff;
    flowtempdesired: temp0;
  }

  /** Desired flow/status/flow/desired temperature */
  @inherit(rm)
  @ext(0xd)
  model Status {
    temp: temp0;
    onoff: onoff;
    temp_1: temp;
    temp_2: temp0;
  }

  /** outside temperature */
  @inherit(rm)
  @ext(0x16)
  model Status16 {
    value: temp;
  }
}
