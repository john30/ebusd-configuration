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

// @zz(0xa0)
namespace Sol.Hwc {
  // ,sol00,VR 68,sol 210 DHW
  // ##### DHW: general #####

  /** DesiredTemperature: desired temperature (day temperature) for DHW */
  @ext(0x13, 0)
  model TempDesired is Register<temp1>;

  /** LegioStartDay */
  @inherit(r, wi)
  @ext(0x4e, 0)
  model LegioStartDay {
    /** Start day for legio protection */
    @values(Values_LegioStartDay)
    value: UCH;
  }

  /** LegioStartTime: Start time for legio protection */
  @ext(0x4f, 0)
  model LegioStartTime is InstallRegister<UCH>;

  /** SolarGain_LP_Delay: Set TRUE for LP delay in case of solar gain */
  @ext(0x5d, 0)
  model SolGainPressLowDelay is ReadonlyRegister<yesno>;

  /** Holiday function active: TRUE if holiday is active */
  @ext(0xb, 0)
  model IsInHoliday is ReadonlyRegister<yesno>;

  /** IsInBankHoliday: TRUE if BankHoliday is active */
  @ext(0x5f, 0)
  model IsInBankHoliday is ReadonlyRegister<yesno>;

  /** IsInSystemOff: TRUE if SystemOff is active */
  @ext(0x60, 0)
  model IsInSystemOff is ReadonlyRegister<yesno>;
  // ##### DHW: DHW #####

  /** Flow setpoint: Flow temperature setpoint calculated by VR68 */
  @ext(0x16, 0)
  model FlowTempDesired is ReadonlyRegister<temp1>;

  /** ActualDesiredTemp: Current tank setpoint. Depends on the programmed period and current time, operating mode … */
  @ext(0x1f, 0)
  model ActualTempDesired is ReadonlyRegister<temp1>;

  /** ManualTankSetpoint: DHW setpoint in case of manual mode */
  @ext(0x47, 0)
  model ManualStorageTempDesired is Register<temp>;

  /** QuickVetoSetpoint: DHW setpoint in case of quick veto */
  @ext(0x46, 0)
  model QuickVetoTempDesired is ReadonlyRegister<temp>;

  /** LegionellaPump: Legionella pump */
  @ext(0x7, 0)
  model LegionellaPump is ReadonlyRegister<onoff>;

  /** RuntimeLegionellaPump */
  @ext(0x41, 0)
  model RuntimeLegionellaPump is ReadonlyRegister<hoursum2>;

  /** DhwLegioProtectionMaxTimer: Maximal time the legio protection state is hold (indepent of reached temperature) */
  @ext(0x1a, 0)
  model HwcLegioProtectionMaxTimer is ReadonlyRegister<minutes0>;

  /** LegionellaProtectionActive: TRUE if legionella protection is active */
  @ext(0x49, 0)
  model LegionellaProtectionActive is ReadonlyRegister<yesno>;

  /** T_DHWOffset: Offset between desired temperature and setpoint */
  @ext(0x50, 0)
  model HwcTempOffset is InstallRegister<calibration0>;

  /** DhwLaggingTime: Lagging time after tank loading */
  @ext(0x22, 0)
  model HwcLaggingTime is InstallRegister<minutes0>;

  /** DHW_LoadingHysteresis: Hysteresis for DHW tank loading, if there is no special hysteresis (legionella, frost protection...). */
  @ext(0x5c, 0)
  model HwcLoadingHysteresis is ReadonlyRegister<desiredtemp>;

  /** DhwLoadingRequest: Flag: Loading request to the energy manager for DHW */
  @ext(0x1c, 0)
  model HwcLoadingRequest is ReadonlyRegister<yesno>;

  /** DhwLoadingEnabled: Flag: Loading enabled by the energy manager */
  @ext(0x1d, 0)
  model HwcLoadingEnabled is ReadonlyRegister<yesno>;

  /** DhwLegioTempOkTimer: Time for which the temperature for legio protection should be hold */
  @ext(0x20, 0)
  model HwcLegioTempOkTimer is ReadonlyRegister<temp0>;

  /** IsInQuickVeto: Flag: Quick veto active */
  @ext(0x4b, 0)
  model IsInQuickVeto is ReadonlyRegister<yesno>;

  /** IsInOneOffLoading: TRUE if one off loading is active */
  @ext(0x4a, 0)
  model IsInOneOffLoading is ReadonlyRegister<yesno>;

  enum Values_LegioStartDay {
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
  @condition(Id.Id.sw, "<201")
  namespace Sw_lt201 {
    /** OperatingMode430: Operating mode of solar DHW circuit for 430 (1 = auto, 2 = manual, 3 = off) */
    @ext(0xf, 0)
    model OperatingMode430 is Register<UCH>;
  }
  @condition(Id.Id.sw, ">=201")
  namespace Sw_ge201 {
    /** OperatingMode470: Operating mode of solar DHW circuit for 470 (1 = auto, 3 = off, 4 = on) */
    @ext(0xf, 0)
    model OperatingMode470 is ReadonlyRegister<UCH>;
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
