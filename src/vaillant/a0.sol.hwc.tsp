import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./yield3f40_inc.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
import "./errors_inc.tsp";
import "./iotestbsol_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0xa0)
namespace sol.hwc {
  // ,sol00,VR 68,sol 210 DHW

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
  // ##### DHW: general #####

  /** desired temperature */
  @inherit(r, w)
  @ext(0x13, 0)
  model TempDesired {
    /** desired temperature (day temperature) for DHW */
    value: temp1;
  }

  /** LegioStartDay */
  @inherit(r, wi)
  @ext(0x4e, 0)
  model LegioStartDay {
    /** Start day for legio protection */
    @values(values_LegioStartDay)
    value: UCH;
  }

  /** LegioStartTime */
  @inherit(r, wi)
  @ext(0x4f, 0)
  model LegioStartTime {
    /** Start time for legio protection */
    value: UCH;
  }

  /** SolarGain_LP_Delay */
  @inherit(r)
  @ext(0x5d, 0)
  model SolGainPressLowDelay {
    /** Set TRUE for LP delay in case of solar gain */
    value: yesno;
  }

  /** Holiday function active */
  @inherit(r)
  @ext(0xb, 0)
  model IsInHoliday {
    /** TRUE if holiday is active */
    value: yesno;
  }

  /** IsInBankHoliday */
  @inherit(r)
  @ext(0x5f, 0)
  model IsInBankHoliday {
    /** TRUE if BankHoliday is active */
    value: yesno;
  }

  /** IsInSystemOff */
  @inherit(r)
  @ext(0x60, 0)
  model IsInSystemOff {
    /** TRUE if SystemOff is active */
    value: yesno;
  }
  // ##### DHW: DHW #####

  @condition(id.id.sw, "<201")
  namespace sw_201 {
    /** OperatingMode430 */
    @inherit(r, w)
    @ext(0xf, 0)
    model OperatingMode430 {
      /** Operating mode of solar DHW circuit for 430 (1 = auto, 2 = manual, 3 = off) */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=201")
  namespace sw__201 {
    /** OperatingMode470 */
    @inherit(r)
    @ext(0xf, 0)
    model OperatingMode470 {
      /** Operating mode of solar DHW circuit for 470 (1 = auto, 3 = off, 4 = on) */
      value: UCH;
    }
  }

  /** Flow setpoint */
  @inherit(r)
  @ext(0x16, 0)
  model FlowTempDesired {
    /** Flow temperature setpoint calculated by VR68 */
    value: temp1;
  }

  /** ActualDesiredTemp */
  @inherit(r)
  @ext(0x1f, 0)
  model ActualTempDesired {
    /** Current tank setpoint. Depends on the programmed period and current time, operating mode … */
    value: temp1;
  }

  /** ManualTankSetpoint */
  @inherit(r, w)
  @ext(0x47, 0)
  model ManualStorageTempDesired {
    /** DHW setpoint in case of manual mode */
    value: temp;
  }

  /** QuickVetoSetpoint */
  @inherit(r)
  @ext(0x46, 0)
  model QuickVetoTempDesired {
    /** DHW setpoint in case of quick veto */
    value: temp;
  }

  /** Legionella pump */
  @inherit(r)
  @ext(0x7, 0)
  model LegionellaPump {
    /** Legionella pump */
    value: onoff;
  }

  /** RuntimeLegionellaPump */
  @inherit(r)
  @ext(0x41, 0)
  model RuntimeLegionellaPump {
    value: hoursum2;
  }

  /** DhwLegioProtectionMaxTimer */
  @inherit(r)
  @ext(0x1a, 0)
  model HwcLegioProtectionMaxTimer {
    /** Maximal time the legio protection state is hold (indepent of reached temperature) */
    value: minutes0;
  }

  /** LegionellaProtectionActive */
  @inherit(r)
  @ext(0x49, 0)
  model LegionellaProtectionActive {
    /** TRUE if legionella protection is active */
    value: yesno;
  }

  /** T_DHW_Offset */
  @inherit(r, wi)
  @ext(0x50, 0)
  model HwcTempOffset {
    /** Offset between desired temperature and setpoint */
    value: calibration0;
  }

  /** DhwLaggingTime */
  @inherit(r, wi)
  @ext(0x22, 0)
  model HwcLaggingTime {
    /** Lagging time after tank loading */
    value: minutes0;
  }

  /** DHW_LoadingHysteresis */
  @inherit(r)
  @ext(0x5c, 0)
  model HwcLoadingHysteresis {
    /** Hysteresis for DHW tank loading, if there is no special hysteresis (legionella, frost protection...). */
    value: desiredtemp;
  }

  /** DhwLoadingRequest */
  @inherit(r)
  @ext(0x1c, 0)
  model HwcLoadingRequest {
    /** Flag: Loading request to the energy manager for DHW */
    value: yesno;
  }

  /** DhwLoadingEnabled */
  @inherit(r)
  @ext(0x1d, 0)
  model HwcLoadingEnabled {
    /** Flag: Loading enabled by the energy manager */
    value: yesno;
  }

  /** DhwLegioTempOkTimer */
  @inherit(r)
  @ext(0x20, 0)
  model HwcLegioTempOkTimer {
    /** Time for which the temperature for legio protection should be hold */
    value: temp0;
  }

  /** IsInQuickVeto */
  @inherit(r)
  @ext(0x4b, 0)
  model IsInQuickVeto {
    /** Flag: Quick veto active */
    value: yesno;
  }

  /** IsInOneOffLoading */
  @inherit(r)
  @ext(0x4a, 0)
  model IsInOneOffLoading {
    /** TRUE if one off loading is active */
    value: yesno;
  }

  enum values_LegioStartDay {
    Mon: 0,
    Tue: 1,
    Wed: 2,
    Thu: 3,
    Fri: 4,
    Sat: 5,
    Sun: 6,
    off: 7,
    Mon_Sun: 8,
  }

  /** included parts */
  union _includes {
    yield3f40_inc,
    hwcmode_inc,
    timer_inc,
    errors_inc,
    iotestbsol_inc,
  }
}
