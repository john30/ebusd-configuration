import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./mcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotesthp_inc.tsp";
import "./errors_inc.tsp";
import "./roomtempoffset_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x50)
namespace ehp.mc {
  // ,EHP00,Heat pump AMU,EHP00 172 Mixer

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *u */
  @passive
  @base(MF, 0x9, 0x29)
  model u {
    @maxLength(2)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x9, 0xe)
  model wi {}
  // ##### MK: Parameters and information #####

  /** OperatingMode */
  @inherit(r, w)
  @ext(0x2b, 0)
  model OperatingMode {
    /** Operating mode for the first heating circuit */
    value: mcmode;
  }

  /** CfgHeatSinkType */
  @inherit(r, wi)
  @ext(0x3c, 0)
  model CfgHeatSinkType {
    /** BMR: configuration of heating circuit; for heat pumps, only "mixer circuit" or "fix value circuit" possible */
    value: mctype;
  }

  @condition(mc.CfgHeatSinkType.value, "1")
  namespace mixer {
    /** DayRoomSetPoint_MC */
    @inherit(r, w)
    @ext(0x32, 0)
    model TempDesired {
      /** Room set point for day operation and mixer circuit */
      value: temp1;
    }
  }

  @condition(mc.CfgHeatSinkType.value, "2")
  namespace fix {
    /** FixValueDay */
    @inherit(r, w)
    @ext(0x32, 0)
    model TempDesired {
      /** Fix value day flow set point */
      value: temp1;
    }
  }

  @condition(mc.CfgHeatSinkType.value, "1")
  namespace mixer {
    /** NightRoomSetPoint_MC */
    @inherit(r, w)
    @ext(0x33, 0)
    model TempDesiredLow {
      /** Room set point for night operation and mixer circuit */
      value: temp1;
    }
  }

  @condition(mc.CfgHeatSinkType.value, "2")
  namespace fix {
    /** FixValueNight */
    @inherit(r, w)
    @ext(0x33, 0)
    model TempDesiredLow {
      /** Fix value night flow set point */
      value: temp1;
    }
  }

  @condition(mc.CfgHeatSinkType.value, "1")
  namespace mixer {
    /** Heating curve */
    @inherit(r, w)
    @ext(0x35, 0)
    model HeatingCurve {
      /** BMR:Heating curve for whole system */
      value: curve;
    }
  }

  /** OtShutdownLimit */
  @inherit(r, w)
  @ext(0x36, 0)
  model OtShutdownLimit {
    /** BMR: Outside temperature above which heating circuits switch off */
    value: desiredtemp;
  }

  /** MinFlowTemp */
  @inherit(r, wi)
  @ext(0x30, 0)
  model FlowTempMin {
    /** BMR:Minimum Flow Temperature for circuit */
    value: temp0;
  }

  /** Flow setpoint */
  @inherit(r, w, u)
  @ext(0x46, 0)
  model FlowTempDesired {
    /** BMR:flow temperature that is actually desired by circuit */
    value: temp1;
  }

  /** MaxFlowTemp */
  @inherit(r, wi)
  @ext(0x31, 0)
  model FlowTempMax {
    /** BMR:Maximum Flow Temperature for circuit */
    value: temp0;
  }

  /** HcMaxPreHeating */
  @inherit(r, wi)
  @ext(0x38, 0)
  model HcMaxPreHeating {
    /** BMR: Maximum Preheating time in minutes */
    @unit("hours")
    value: UCH;
  }

  @condition(id.id.sw, "<=339")
  namespace sw__339 {
    /** Floor_Protection_Limit */
    @inherit(r, wi)
    @ext(0x7b, 1)
    model FloorProtectionLimit {
      /** Floor protection temperature at which the heat pump goes to error mode. */
      value: desiredtemp;
    }
  }

  @condition(id.id.sw, ">=340")
  namespace sw__340 {
    /** Floor_Protection_Limit */
    @inherit(r)
    @ext(0x7b, 1)
    model FloorProtectionLimit {
      /** Floor protection temperature at which the heat pump goes to error mode. */
      value: desiredtemp;
    }
  }

  /** FloorPavingDryingDay */
  @inherit(r, wi)
  @ext(0x3b, 0)
  model FloorPavingDryingDay {
    /** BMR: actual day of floor paving drying program (1...29) */
    value: UCH;
  }
  // ***** For cooling operation only *****

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** CoolingOperatingMode_HK2 */
    @inherit(r, w)
    @ext(0x8c, 1)
    model CoolingOperatingModeHc2 {
      /** Cooling operating mode: Available options: 3=Auto, 1=On, 2=Off */
      value: hwcmode;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** CoolingSupported_HK2 */
    @inherit(r, wi)
    @ext(0x86, 1)
    model CoolingSupportedHc2 {
      /** Defines if a specific circuit is allowed for cooling operation. In this case HK2. */
      value: yesno;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** Tot_24h_HK2 */
    @inherit(r)
    @ext(0x88, 1)
    model Tot24hHc2 {
      /** 24h outside temperature average. Circuit specific value. */
      value: temp;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** CoolingStartOffset_HK2 */
    @inherit(r, wi)
    @ext(0x87, 1)
    model CoolingStartOffsetHc2 {
      /** Circuit specific offset to the adjusted outside temperature cut-off value for demanding cooling operation. HK2 value. */
      value: temp1;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** Tot_AverageTime_HK2 */
    @inherit(r)
    @ext(0x89, 1)
    model TotAverageTimeHc2 {
      /** Circuit specific averaging time span in hours. HK2 value */
      @unit("hour")
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** DWMOffToHeatingDelay_HK2 */
    @inherit(r, wi)
    @ext(0x84, 1)
    model DWMOffToHeatingDelayHc2 {
      /** Circuit specific delay for standby to heating operation change: HK2 */
      @unit("hour")
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** DWMOffToCoolingDelay_HK2 */
    @inherit(r, wi)
    @ext(0x85, 1)
    model DWMOffToCoolingDelayHc2 {
      /** Circuit specific delay for standby to cooling operation change: HK2 */
      @unit("hour")
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** MinEfficiencyHysteresis_HK2 */
    @inherit(r, wi)
    @ext(0x8b, 1)
    model EfficiencyHysteresisHc2Min {
      /** If remote control with room temperature measurement used, minimum general flow (VF2) to heat circuit room temperature difference to release cooling operation. */
      value: calibration1;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** CoolingWhileHolidaySupported_HK2 */
    @inherit(r, wi)
    @ext(0x95, 1)
    model CoolingWhileHolidaySupportedHc2 {
      /** Indicates if cooling while holiday is desired (can be used for source regeneration). */
      value: yesno;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** CoolingCircuitStates_HK2 */
    @inherit(r)
    @ext(0x97, 1)
    model CoolingCircuitStatesHc2 {
      /** Contains bits for different states in the cooling circuit. Helpfull for problem identification. Should be given to development department together with problem description. */
      value: UIN;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** DesiredWorkingMode_HK2 */
    @inherit(r)
    @ext(0x7e, 1)
    model DesiredWorkingModeHc2 {
      /** f. Autocool : HeatingAutomatic, OffAutomatic, CoolingAutomatic; SM1 */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** LastDesiredWorkingMode_HK2 */
    @inherit(r)
    @ext(0x80, 1)
    model LastDesiredWorkingModeHc2 {
      /** f. Autocool : Standby, Heating or Cooling */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** CoolingRequest_HK2 */
    @inherit(r)
    @ext(0x83, 1)
    model CoolingRequestHc2 {
      /** Circuit specific cooling demand, dependant on cooling operating mode and cooling time frames and so on… */
      value: yesno;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** CoolingEfficiencyState_HK2 */
    @inherit(r)
    @ext(0x8a, 1)
    model CoolingEfficiencyStateHc2 {
      /** SM2 */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** CoolingModeStateCounter_HK2 */
    @inherit(r)
    @ext(0x8d, 1)
    model CoolingModeStateCounterHc2 {
      /** Counts up if pump is runnig in cooling mode */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** HCManualWorkingModeTriggeringActive_HK2 */
    @inherit(r)
    @ext(0x8f, 1)
    model HcManualWorkingModeTriggeringActiveHc2 {
      /** f. Autocool :Automatic or Manual */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=350")
  namespace sw__350 {
    /** AutocoolTestModeActive_HK2 */
    @inherit(r)
    @ext(0x82, 1)
    model AutocoolTestModeActiveHc2 {
      /** Test mode, only for developement! */
      value: onoff;
    }
  }
  // ***** for high efficiency pumps only *****

  @condition(id.id.sw, ">=407")
  namespace sw__407 {
    /** CHPumpStatus */
    @inherit(r)
    @ext(0xb9, 1)
    model HcPumpStatus {
      /** 0=HEP_ok: 1= HEP_error; >=2=noHEP */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=407")
  namespace sw__407 {
    /** CHPumpPWM */
    @inherit(r)
    @ext(0xba, 1)
    model HcPumpPWM {
      /** actual speed of central heating CH pump (7%=off) */
      value: percent0;
    }
  }

  @condition(id.id.sw, ">=407")
  namespace sw__407 {
    /** CH1P_PumpSpeedControlHeatBuffer */
    @inherit(r, wi)
    @ext(0xbf, 1)
    model Hc1PumpSpeedControlHeatBuffer {
      /** CH pump speed setpoint while buffer is loaded [%] */
      value: percent0;
    }
  }

  @condition(id.id.sw, ">=407")
  namespace sw__407 {
    /** CH1P_PumpSpeedControlDirectCircuit */
    @inherit(r, wi)
    @ext(0xc0, 1)
    model Hc1PumpSpeedControlDirectCircuit {
      /** CH pump speed setpoint while energybalancing and compressor=on [%] */
      value: percent0;
    }
  }

  @condition(id.id.sw, ">=414")
  namespace sw__414 {
    /** CH1P_PumpSpeedControlDirectCircuitWhileOff */
    @inherit(r, wi)
    @ext(0xe1, 1)
    model Hc1PumpSpeedControlDirectCircuitWhileO {
      /** CH pump speed setpoint while energybalancing and compressor=off */
      value: percent0;
    }
  }

  /** included parts */
  union _includes {
    mcmode_inc,
    timer_inc,
    iotesthp_inc,
    errors_inc,
    roomtempoffset_inc,
    quick_inc,
  }
}
