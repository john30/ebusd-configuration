import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x23)
namespace Zeo.Cc {
  // ,ZEO00,Zeolite AMU,ZEO00 197 Circulation

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}
  // ##### CC: #####

  /** OperatingMode */
  @inherit(r)
  @ext(0x6, 0x2)
  model OperatingMode {
    value: mcmode;
  }

  /** MinFlowTemp */
  @inherit(r)
  @ext(0xb, 0x2)
  model FlowTempMin {
    /** 1 °C resolution */
    value: temp0;
  }

  /** MaxFlowTemp */
  @inherit(r)
  @ext(0xc, 0x2)
  model FlowTempMax {
    /** 1 °C resolution */
    value: temp0;
  }

  /** desired temperature */
  @inherit(r)
  @ext(0xd, 0x2)
  model TempDesired {
    /** 1/2 °C resolution */
    value: temp1;
  }

  /** CircuitDiaState */
  @inherit(r)
  @ext(0x18, 0x2)
  model CircuitDiaState {
    value: UCH;
  }

  /** CircuitsStates */
  @inherit(r)
  @ext(0x1e, 0x2)
  model CircuitsStates {
    value: UCH;
  }

  /** Flow setpoint */
  @inherit(r)
  @ext(0x1f, 0x2)
  model FlowTempDesired {
    /** 1/2 °C resolution */
    value: temp1;
  }

  /** CleaningLady */
  @inherit(r)
  @ext(0x23, 0x2)
  model CleaningLady {
    /** 0,5h */
    value: UCH;
  }

  /** ActualDesiredTemp */
  @inherit(r)
  @ext(0x33, 0x2)
  model ActualTempDesired {
    /** 1/2°C Auflösung */
    value: temp1;
  }

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
  }
}
