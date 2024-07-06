import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Mcmode_inc {
  // MC: Operation mode

  /** default *r */
  @base(MF, 0x4)
  model r_1 {}

  /** default *w */
  @write
  @base(MF, 0x5)
  model w_1 {}

  /** date/time */
  @inherit(r_1)
  @ext(0)
  model DateTime {
    dcfstate: dcfstate;
    btime: btime;
    bdate: bdate;
    temp: temp2;
  }

  /** Operation mode */
  @inherit(r_1)
  @ext(1)
  model Mode {
    tempdesired: temp0;
    mcmode: mcmode;
    floorpavingdryingday: days;
    floorpavingdryingtemp: temp0;
    teleswitchmode: mcmode;
    mctype: mctype7;
    ign: IGN;
    daynight: daynight;
  }

  /** Set desired temperature */
  @inherit(w_1)
  @ext(1)
  model SetTempDesired {
    value: temp0;
  }

  /** Set operation mode */
  @inherit(w_1)
  @ext(0x2)
  model SetMode {
    value: mcmode;
  }

  /** Set floor paving drying day */
  @inherit(w_1)
  @ext(0x3)
  model SetFloorPavingDryingDay {
    value: days;
  }

  /** Set floor paving drying temperature */
  @inherit(w_1)
  @ext(0x4)
  model SetFloorPavingDryingTemp {
    value: temp0;
  }

  /** Set type */
  @inherit(w_1)
  @ext(0x8)
  model SetType {
    value: mctype;
  }
  // r 2-7: timer
  // w 9: timer

  /** Set desired low temperature */
  @inherit(w_1)
  @ext(0xa)
  model SetTempDesiredLow {
    value: temp0;
  }

  /** Set heating curve */
  @inherit(w_1)
  @ext(0xb)
  model SetHeatingCurve {
    value: curve;
  }

  /** Set outside shutdown temperature */
  @inherit(w_1)
  @ext(0xc)
  model SetShutdownTemp {
    value: temp0;
  }

  /** Set pump idle period */
  @inherit(w_1)
  @ext(0xd)
  model SetPumpIdlePeriod {
    value: minutes0;
  }

  /** Set min flow temperature */
  @inherit(w_1)
  @ext(0xe)
  model SetFlowTempMin {
    value: temp0;
  }

  /** Set max flow temperature */
  @inherit(w_1)
  @ext(0xf)
  model SetFlowTempMax {
    value: temp0;
  }

  /** Set max pre-heating */
  @inherit(w_1)
  @ext(0x10)
  model SetMaxPreHeating {
    value: hours12;
  }

  /** Parameters */
  @inherit(r_1)
  @ext(0x9)
  model Params {
    tempdesired: temp0;
    tempdesiredlow: temps;
    curve: curve;
    mctype: mctype7;
    shutdowntemp: temps;
    pumpidleperiod: minutes0;
    flowtempmin: temps;
    flowtempmax: temps;
    maxpreheating: hours12;
  }

  /** Status flow temperature/mixer/pump/desired flow temperature */
  @inherit(r_1)
  @ext(0xa)
  model Status0a {
    flowtemp: temp;
    mixer: mixer;
    pump: onoff;
    onoff: onoff;
    flowtempdesired: temp0;
  }

  /** Status flow desired/current */
  @inherit(r_1)
  @ext(0xd)
  model Status {
    flowtempdesired: temp0;
    onoff: onoff;
    flowtemp: temp;
    tempdesired: temp0;
  }

  /** outside temperature */
  @inherit(r_1)
  @ext(0x16)
  model Status16 {
    value: temp;
  }
}
