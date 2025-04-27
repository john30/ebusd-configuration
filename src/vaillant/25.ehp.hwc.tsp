import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotesthp_inc.tsp";
import "./errors_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x25)
namespace Ehp.Hwc {
  // ,EHP00,Heat pump AMU,EHP00 172 DHW
  // ##### DHW: Parameters and information #####

  /** OperatingMode: Operating mode for the DHWcircuit */
  @ext(0x2b, 0)
  model OperatingMode is Register<hwcmode>;

  /** Tank_Setpoint_Stop: DHW temperature at which loading stops */
  @ext(0x82, 0)
  model StorageTempDesiredStop is InstallRegister<temp>;

  /** Tank_Setpoint_Start: DHW temperature at which loading starts */
  @ext(0x83, 0)
  model StorageTempDesiredStart is InstallRegister<temp>;

  /** LegioProtectionEnabled: BMR:enables/disables the anti-legionella feature */
  @ext(0x40, 0)
  model LegioProtectionEnabled is InstallRegister<yesno>;

  /** Legionella_Start_Time: start time for legionella protection (different from BMR) */
  @ext(0x67, 0)
  model LegionellaStartTime is InstallRegister<time2>;
  @condition(Id.Id.sw, ">=337")
  namespace Sw_ge337 {
    /** LegioProtectionDay: Legionella protection day (0-6:mo-so, 7:off). Displayed as abbreviations. Additional parameter has to be set for activation or deactivation. */
    @ext(0x7c, 1)
    model LegioProtectionDay is InstallRegister<bday>;
  }
  @condition(Id.Id.sw, ">=407")
  namespace Sw_ge407 {
    /** CH1P_PumpSpeed_layered_tank: CH pump speed setpoint while shiftloading DHW tank [%] */
    @ext(0xc1, 1)
    model Hc1PumpSpeedLayeredStorage is InstallRegister<percent0>;

    /** CH1P_PumpSpeed_coil_tank: CH pump speed setpoint while loading DHW tank with coils [%] */
    @ext(0xc2, 1)
    model Hc1PumpSpeedCoilStorage is InstallRegister<percent0>;

    /** DHW_Tank_is_coil: DHW tank is shift loading type if no */
    @ext(0xcd, 1)
    model HwcStorageIsCoil is InstallRegister<yesno>;
  }
  @condition(Id.Id.sw, ">=415")
  namespace Sw_ge415 {
    /** TappingDetectionLimit: turns on backup heater, if temperature drops below this value; 0=function is off */
    @ext(0xe8, 1)
    model TappingDetectionLimit is InstallRegister<UCH>;
  }

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
    Iotesthp_inc,
    Errors_inc,
    Quick_inc,
  }
}
