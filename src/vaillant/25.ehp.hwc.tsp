import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotesthp_inc.tsp";
import "./errors_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x25)
namespace ehp.hwc {
  // ,EHP00,Heat pump AMU,EHP00 172 DHW

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x9, 0xe)
  model wi {}
  // ##### DHW: Parameters and information #####

  /** OperatingMode */
  @inherit(r, w)
  @ext(0x2b, 0)
  model OperatingMode {
    /** Operating mode for the DHWcircuit */
    value: hwcmode;
  }

  /** Tank_Setpoint_Stop */
  @inherit(r, wi)
  @ext(0x82, 0)
  model StorageTempDesiredStop {
    /** DHW temperature at which loading stops */
    value: temp;
  }

  /** Tank_Setpoint_Start */
  @inherit(r, wi)
  @ext(0x83, 0)
  model StorageTempDesiredStart {
    /** DHW temperature at which loading starts */
    value: temp;
  }

  /** LegioProtectionEnabled */
  @inherit(r, wi)
  @ext(0x40, 0)
  model LegioProtectionEnabled {
    /** BMR:enables/disables the anti-legionella feature */
    value: yesno;
  }

  @condition(id.id.sw, ">=337")
  namespace sw__337 {
    /** LegioProtectionDay */
    @inherit(r, wi)
    @ext(0x7c, 1)
    model LegioProtectionDay {
      /** Legionella protection day (0-6:mo-so, 7:off). Displayed as abbreviations. Additional parameter has to be set for activation or deactivation. */
      value: bday;
    }
  }

  /** Legionella_Start_Time */
  @inherit(r, wi)
  @ext(0x67, 0)
  model LegionellaStartTime {
    /** start time for legionella protection (different from BMR) */
    value: time2;
  }

  @condition(id.id.sw, ">=407")
  namespace sw__407 {
    /** CH1P_PumpSpeed_layered_tank */
    @inherit(r, wi)
    @ext(0xc1, 1)
    model Hc1PumpSpeedLayeredStorage {
      /** CH pump speed setpoint while shiftloading DHW tank [%] */
      value: percent0;
    }
  }

  @condition(id.id.sw, ">=407")
  namespace sw__407 {
    /** CH1P_PumpSpeed_coil_tank */
    @inherit(r, wi)
    @ext(0xc2, 1)
    model Hc1PumpSpeedCoilStorage {
      /** CH pump speed setpoint while loading DHW tank with coils [%] */
      value: percent0;
    }
  }

  @condition(id.id.sw, ">=407")
  namespace sw__407 {
    /** DHW_Tank_is_coil */
    @inherit(r, wi)
    @ext(0xcd, 1)
    model HwcStorageIsCoil {
      /** DHW tank is shift loading type if no */
      value: yesno;
    }
  }

  @condition(id.id.sw, ">=415")
  namespace sw__415 {
    /** TappingDetectionLimit */
    @inherit(r, wi)
    @ext(0xe8, 1)
    model TappingDetectionLimit {
      /** turns on backup heater, if temperature drops below this value; 0=function is off */
      value: UCH;
    }
  }

  /** included parts */
  union _includes {
    hwcmode_inc,
    timer_inc,
    iotesthp_inc,
    errors_inc,
    quick_inc,
  }
}
