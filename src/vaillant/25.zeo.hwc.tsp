import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x25)
namespace Zeo.Hwc {
  // ,ZEO00,Zeolite AMU,ZEO00 197 DHW

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}
  // ##### DHW: #####

  /** OperatingMode */
  @inherit(r)
  @ext(0x6, 0)
  model OperatingMode {
    /** 1=Ein 2=Aus 3=Auto */
    value: mcmode;
  }

  /** desired temperature */
  @inherit(r)
  @ext(0xd, 0)
  model TempDesired {
    /** 1/2 °C resolution */
    value: temp1;
  }

  /** CircuitDiaState */
  @inherit(r)
  @ext(0x18, 0)
  model CircuitDiaState {
    value: UCH;
  }

  /** CircuitsStates */
  @inherit(r)
  @ext(0x1e, 0)
  model CircuitsStates {
    value: UCH;
  }

  /** CleaningLady */
  @inherit(r)
  @ext(0x23, 0)
  model CleaningLady {
    /** 0,5h */
    value: UCH;
  }

  /** DhwLegioProtectionMaxTimer */
  @inherit(r)
  @ext(0x2d, 0)
  model HwcLegioProtectionMaxTimer {
    value: UCH;
  }

  /** ActualDesiredTemp */
  @inherit(r)
  @ext(0x33, 0)
  model ActualTempDesired {
    /** 1/2°C Auflösung */
    value: temp1;
  }

  /** DhwLegioTempOkTimer */
  @inherit(r)
  @ext(0x34, 0)
  model HwcLegioTempOkTimer {
    value: temp0;
  }

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
  }
}
