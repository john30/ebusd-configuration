import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./mcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotesthp_inc.tsp";
import "./errors_inc.tsp";
import "./roomtempoffset_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x50)
namespace Ehp.Mc {
  // ,EHP00,Heat pump AMU,EHP00 172 Mixer
  // ##### MK: Parameters and information #####

  /** OperatingMode: Operating mode for the first heating circuit */
  @ext(0x2b, 0)
  model OperatingMode is Register<mcmode>;

  /** CfgHeatSinkType: BMR: configuration of heating circuit; for heat pumps, only "mixer circuit" or "fix value circuit" possible */
  @ext(0x3c, 0)
  model CfgHeatSinkType is InstallRegister<mctype>;

  /** OtShutdownLimit: BMR: Outside temperature above which heating circuits switch off */
  @ext(0x36, 0)
  model OtShutdownLimit is Register<desiredtemp>;

  /** MinFlowTemp: BMR:Minimum Flow Temperature for circuit */
  @ext(0x30, 0)
  model FlowTempMin is InstallRegister<temp0>;

  /** Flow setpoint: BMR:flow temperature that is actually desired by circuit */
  @ext(0x46, 0)
  model FlowTempDesired is UpdateRegister<temp1>;

  /** MaxFlowTemp: BMR:Maximum Flow Temperature for circuit */
  @ext(0x31, 0)
  model FlowTempMax is InstallRegister<temp0>;

  /** HcMaxPreHeating: BMR: Maximum Preheating time in minutes */
  @ext(0x38, 0)
  model HcMaxPreHeating is InstallRegister<minutes5>;

  /** FloorPavingDryingDay: BMR: actual day of floor paving drying program (1...29) */
  @ext(0x3b, 0)
  model FloorPavingDryingDay is InstallRegister<UCH>;
  // ***** For cooling operation only *****
  // ***** for high efficiency pumps only *****
  @condition(Mc.CfgHeatSinkType.value, "1")
  namespace Mixer {
    /** DayRoomSetPoint_MC: Room set point for day operation and mixer circuit */
    @ext(0x32, 0)
    model TempDesired is Register<temp1>;

    /** NightRoomSetPoint_MC: Room set point for night operation and mixer circuit */
    @ext(0x33, 0)
    model TempDesiredLow is Register<temp1>;

    /** BMR:Heating curve for whole system */
    @ext(0x35, 0)
    model HeatingCurve is Register<curve>;
  }
  @condition(Mc.CfgHeatSinkType.value, "2")
  namespace Fix {
    /** FixValueDay: Fix value day flow set point */
    @ext(0x32, 0)
    model TempDesired is Register<temp1>;

    /** FixValueNight: Fix value night flow set point */
    @ext(0x33, 0)
    model TempDesiredLow is Register<temp1>;
  }
  @condition(Id.Id.sw, "<=339")
  namespace Sw_le339 {
    /** Floor_Protection_Limit: Floor protection temperature at which the heat pump goes to error mode. */
    @ext(0x7b, 1)
    model FloorProtectionLimit is InstallRegister<desiredtemp>;
  }
  @condition(Id.Id.sw, ">=340")
  namespace Sw_ge340 {
    /** Floor_Protection_Limit: Floor protection temperature at which the heat pump goes to error mode. */
    @ext(0x7b, 1)
    model FloorProtectionLimit is ReadonlyRegister<desiredtemp>;
  }
  @condition(Id.Id.sw, ">=350")
  namespace Sw_ge350 {
    /** CoolingOperatingMode_HK2: Cooling operating mode: Available options: 3=Auto, 1=On, 2=Off */
    @ext(0x8c, 1)
    model CoolingOperatingModeHc2 is Register<hwcmode>;

    /** CoolingSupported_HK2: Defines if a specific circuit is allowed for cooling operation. In this case HK2. */
    @ext(0x86, 1)
    model CoolingSupportedHc2 is InstallRegister<yesno>;

    /** Tot_24h_HK2: 24h outside temperature average. Circuit specific value. */
    @ext(0x88, 1)
    model Tot24hHc2 is ReadonlyRegister<temp>;

    /** CoolingStartOffset_HK2: Circuit specific offset to the adjusted outside temperature cut-off value for demanding cooling operation. HK2 value. */
    @ext(0x87, 1)
    model CoolingStartOffsetHc2 is InstallRegister<temp1>;

    /** Tot_AverageTime_HK2: Circuit specific averaging time span in hours. HK2 value */
    @ext(0x89, 1)
    model TotAverageTimeHc2 is ReadonlyRegister<hours>;

    /** DWMOffToHeatingDelay_HK2: Circuit specific delay for standby to heating operation change: HK2 */
    @ext(0x84, 1)
    model DWMOffToHeatingDelayHc2 is InstallRegister<hours>;

    /** DWMOffToCoolingDelay_HK2: Circuit specific delay for standby to cooling operation change: HK2 */
    @ext(0x85, 1)
    model DWMOffToCoolingDelayHc2 is InstallRegister<hours>;

    /** MinEfficiencyHysteresis_HK2: If remote control with room temperature measurement used, minimum general flow (VF2) to heat circuit room temperature difference to release cooling operation. */
    @ext(0x8b, 1)
    model EfficiencyHysteresisHc2Min is InstallRegister<calibration1>;

    /** CoolingWhileHolidaySupported_HK2: Indicates if cooling while holiday is desired (can be used for source regeneration). */
    @ext(0x95, 1)
    model CoolingWhileHolidaySupportedHc2 is InstallRegister<yesno>;

    /** CoolingCircuitStates_HK2: Contains bits for different states in the cooling circuit. Helpfull for problem identification. Should be given to development department together with problem description. */
    @ext(0x97, 1)
    model CoolingCircuitStatesHc2 is ReadonlyRegister<UIN>;

    /** DesiredWorkingMode_HK2: f. Autocool : HeatingAutomatic, OffAutomatic, CoolingAutomatic; SM1 */
    @ext(0x7e, 1)
    model DesiredWorkingModeHc2 is ReadonlyRegister<UCH>;

    /** LastDesiredWorkingMode_HK2: f. Autocool : Standby, Heating or Cooling */
    @ext(0x80, 1)
    model LastDesiredWorkingModeHc2 is ReadonlyRegister<UCH>;

    /** CoolingRequest_HK2: Circuit specific cooling demand, dependant on cooling operating mode and cooling time frames and so on… */
    @ext(0x83, 1)
    model CoolingRequestHc2 is ReadonlyRegister<yesno>;

    /** CoolingEfficiencyState_HK2: SM2 */
    @ext(0x8a, 1)
    model CoolingEfficiencyStateHc2 is ReadonlyRegister<UCH>;

    /** CoolingModeStateCounter_HK2: Counts up if pump is runnig in cooling mode */
    @ext(0x8d, 1)
    model CoolingModeStateCounterHc2 is ReadonlyRegister<UCH>;

    /** HCManualWorkingModeTriggeringActive_HK2: f. Autocool :Automatic or Manual */
    @ext(0x8f, 1)
    model HcManualWorkingModeTriggeringActiveHc2 is ReadonlyRegister<UCH>;

    /** AutocoolTestModeActive_HK2: Test mode, only for developement! */
    @ext(0x82, 1)
    model AutocoolTestModeActiveHc2 is ReadonlyRegister<onoff>;
  }
  @condition(Id.Id.sw, ">=407")
  namespace Sw_ge407 {
    /** CHPumpStatus: 0=HEP_ok: 1= HEP_error; >=2=noHEP */
    @ext(0xb9, 1)
    model HcPumpStatus is ReadonlyRegister<UCH>;

    /** CHPumpPWM: actual speed of central heating CH pump (7%=off) */
    @ext(0xba, 1)
    model HcPumpPWM is ReadonlyRegister<percent0>;

    /** CH1P_PumpSpeedControlHeatBuffer: CH pump speed setpoint while buffer is loaded [%] */
    @ext(0xbf, 1)
    model Hc1PumpSpeedControlHeatBuffer is InstallRegister<percent0>;

    /** CH1P_PumpSpeedControlDirectCircuit: CH pump speed setpoint while energybalancing and compressor=on [%] */
    @ext(0xc0, 1)
    model Hc1PumpSpeedControlDirectCircuit is InstallRegister<percent0>;
  }
  @condition(Id.Id.sw, ">=414")
  namespace Sw_ge414 {
    /** CH1P_PumpSpeedControlDirectCircuitWhileOff: CH pump speed setpoint while energybalancing and compressor=off */
    @ext(0xe1, 1)
    model Hc1PumpSpeedControlDirectCircuitWhileO is InstallRegister<percent0>;
  }

  /** included parts */
  union _includes {
    Mcmode_inc,
    Timer_inc,
    Iotesthp_inc,
    Errors_inc,
    Roomtempoffset_inc,
    Quick_inc,
  }
}
