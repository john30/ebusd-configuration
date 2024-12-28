import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Mcmode_inc {
  // MC: Operation mode

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
  @inherit(wm)
  @ext(1)
  model SetTempDesired {
    value: temp0;
  }

  /** Set operation mode */
  @inherit(wm)
  @ext(0x2)
  model SetMode {
    value: mcmode;
  }

  /** Set floor paving drying day */
  @inherit(wm)
  @ext(0x3)
  model SetFloorPavingDryingDay {
    value: days;
  }

  /** Set floor paving drying temperature */
  @inherit(wm)
  @ext(0x4)
  model SetFloorPavingDryingTemp {
    value: temp0;
  }

  /** Set type */
  @inherit(wm)
  @ext(0x8)
  model SetType {
    value: mctype;
  }
  // r 2-7: timer
  // w 9: timer

  /** Set desired low temperature */
  @inherit(wm)
  @ext(0xa)
  model SetTempDesiredLow {
    value: temp0;
  }

  /** Set heating curve */
  @inherit(wm)
  @ext(0xb)
  model SetHeatingCurve {
    value: curve;
  }

  /** Set outside shutdown temperature */
  @inherit(wm)
  @ext(0xc)
  model SetShutdownTemp {
    value: temp0;
  }

  /** Set pump idle period */
  @inherit(wm)
  @ext(0xd)
  model SetPumpIdlePeriod {
    value: minutes0;
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

  /** Set max pre-heating */
  @inherit(wm)
  @ext(0x10)
  model SetMaxPreHeating {
    value: hours;
  }

  /** Set max pre-heating */
  @inherit(wm)
  @ext(0x3f)
  model SetMaxPreHeatingFine {
    value: minutes5;
  }

  /** Parameters */
  @inherit(rm)
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
    maxpreheating: hours;
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

  /** Status flow desired/current */
  @inherit(rm)
  @ext(0xd)
  model Status {
    flowtempdesired: temp0;
    onoff: onoff;
    flowtemp: temp;
    tempdesired: temp0;
  }

  /** outside temperature */
  @inherit(rm)
  @ext(0x16)
  model Status16 {
    value: temp;
  }
}
