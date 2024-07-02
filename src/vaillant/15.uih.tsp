import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./yield8485_inc.tsp";
import "./yield8485r_inc.tsp";
import "./yield8485_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace Uih {
  // ,UIH00,CI,UIH00 169

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

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x9, 0xe)
  model ws {}
  // ##### Earned energy #####
  // ##### Parameters and information #####

  /** Aussentemperatur */
  @inherit(r)
  @ext(1, 0)
  model OutsideTemp {
    /** out door temperature */
    value: tempsensor;
  }

  /** EhpHydraulicMap */
  @inherit(r, ws)
  @ext(0x29, 0)
  model EhpHydraulicMap {
    /** hydraulic scheme */
    value: UCH;
  }

  /** EhpBasicStatus */
  @inherit(r)
  @ext(0x50, 0)
  model EhpBasicStatus {
    /** AMU basic state (copy from AMU) */
    value: UCH;
  }

  /** StateEM */
  @inherit(r)
  @ext(0x4b, 0)
  model StateEM {
    /** state of energie manager:0: EmOff,1: EmDhwRequest,2: EmDhw,3: EmTankPunmpOverrun,4: EmHeating,5: EmOverpressureFromDhw,6: EmOverpressureFromCh,7: EmWaitForChDemandOverpressure,8: EmWaitForChDemandHeating,9: EmWaitForChDemandEndOfDhw */
    value: UCH;
  }

  /** LanguageVariant */
  @inherit(r, w)
  @ext(0x26, 0)
  model LanguageVariant {
    /** language of the menue */
    value: UCH;
  }

  /** Holiday periods */
  @inherit(r, w)
  @ext(0x43, 0)
  model HolidayPeriods {
    /** Holiday periods */
    hfrom: hfrom;

    hto: hto;
    hfrom_1: hfrom;
    hto_1: hto;
  }

  /** RoomSetTempHoliday */
  @inherit(r, w)
  @ext(0x22, 0)
  model RoomTempHoliday {
    /** desired room setpoint for holiday */
    value: temp;
  }

  /** KeyCodeforConfigMenue */
  @inherit(r, wi)
  @ext(0x2c, 0)
  model KeyCodeforConfigMenu {
    /** key code for the config menue */
    @maxLength(4)
    value: HEX;
  }

  /** SystemDesiredFlowTemp */
  @inherit(r)
  @ext(0x5, 0)
  model FlowTempDesired {
    value: temp;
  }

  /** system flow temp */
  @inherit(r)
  @ext(0x2, 0)
  model FlowTemp {
    /** systen flow temperature */
    value: tempsensor;
  }

  /** MaxChSupportTime */
  @inherit(r, wi)
  @ext(0x4d, 0)
  model HcSupportTimeMax {
    /** Maximum CH loading period when there is a DHW simultaneous demand */
    value: minutes0;
  }

  /** MaxDhwLoadingTime */
  @inherit(r, wi)
  @ext(0x4c, 0)
  model HwcLoadingTimeMax {
    /** Maximum DHW loading period when there is a Central Heating simultaneous demand */
    value: minutes0;
  }

  /** TempIncrease */
  @inherit(r, wi)
  @ext(0x2f, 0)
  model TempIncrease {
    /** temperature increase */
    value: temp;
  }

  /** PreShutDownTime */
  @inherit(r, wi)
  @ext(0x2d, 0)
  model PreShutDownTime {
    /** PreShutDownTime */
    value: minutes0;
  }

  /** FrostOverRideTime */
  @inherit(r, wi)
  @ext(0x2e, 0)
  model FrostOverRideTime {
    /** FrostOverRideTime */
    @unit("hours")
    value: UCH;
  }

  /** EhpBackupHeaterRelease */
  @inherit(r)
  @ext(0x71, 0)
  model EhpBackupRelease {
    /** backup heater release */
    value: onoff;
  }

  /** EhpTimeOfPredictedPowerCut */
  @inherit(r)
  @ext(0x73, 0)
  model EhpTimeOfPredictedPowerCut {
    /** time of the next predicted power cut */
    value: time;
  }

  /** TempFailDetectTime */
  @inherit(r, wi)
  @ext(0x33, 0)
  model TempFailDetectTime {
    /** temperature fail detection time */
    value: temp0;
  }

  /** EhpHeatBufferAvailable */
  @inherit(r, wi)
  @ext(0x5c, 0)
  model EhpHeatBufferAvailable {
    /** heat buffer is available */
    value: onoff;
  }
  // ##### HC Names and Tel No #####

  /** aaucHcNames CH2 */
  @inherit(r, w)
  @ext(0x41, 0x8)
  model HcName2 {
    /** name of CH2 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH3 */
  @inherit(r, w)
  @ext(0x41, 0x10)
  model HcName3 {
    /** name of CH3 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH4 */
  @inherit(r, w)
  @ext(0x41, 0x18)
  model HcName4 {
    /** name of CH4 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH5 */
  @inherit(r, w)
  @ext(0x41, 0x20)
  model HcName5 {
    /** name of CH5 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH6 */
  @inherit(r, w)
  @ext(0x41, 0x28)
  model HcName6 {
    /** name of CH6 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH7 */
  @inherit(r, w)
  @ext(0x41, 0x30)
  model HcName7 {
    /** name of CH7 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH8 */
  @inherit(r, w)
  @ext(0x41, 0x38)
  model HcName8 {
    /** name of CH8 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH9 */
  @inherit(r, w)
  @ext(0x41, 0x40)
  model HcName9 {
    /** name of CH9 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH10 */
  @inherit(r, w)
  @ext(0x41, 0x48)
  model HcName10 {
    /** name of CH10 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH11 */
  @inherit(r, w)
  @ext(0x41, 0x50)
  model HcName11 {
    /** name of CH11 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH12 */
  @inherit(r, w)
  @ext(0x41, 0x58)
  model HcName12 {
    /** name of CH12 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH13 */
  @inherit(r, w)
  @ext(0x41, 0x60)
  model HcName13 {
    /** name of CH13 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH14 */
  @inherit(r, w)
  @ext(0x41, 0x68)
  model HcName14 {
    /** name of CH14 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH15 */
  @inherit(r, w)
  @ext(0x41, 0x70)
  model HcName15 {
    /** name of CH15 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames CH16 */
  @inherit(r, w)
  @ext(0x41, 0x78)
  model HcName16 {
    /** name of CH16 */
    @maxLength(11)
    value: STR;
  }

  /** aucPhoneNumber_part1 */
  @inherit(r, wi)
  @ext(0x42, 0)
  model PhoneNumberPart1 {
    /** phone number part 1 */
    @maxLength(9)
    value: STR;
  }

  /** aucPhoneNumber_part2 */
  @inherit(r, wi)
  @ext(0x42, 0x8)
  model PhoneNumberPart2 {
    /** phone number part 2 */
    @maxLength(9)
    value: STR;
  }
  @condition(Id.Id.sw, ">=202")
  namespace Sw_ge202 {
    /** EarnedEnergySum */
    @inherit(r)
    @ext(0x87, 0)
    model YieldSum {
      value: ULG;
    }

    /** EarnedEnergyOld */
    @inherit(r, wi)
    @ext(0x86, 0)
    model YieldOld {
      /** Contains earned energy sum stored from AMU last midnight. Required for data transmission between PCBs. */
      value: ULG;
    }
  }
  @condition(Id.Id.sw, "<=345")
  namespace Sw_le345 {
    /** child protection */
    @inherit(r)
    @ext(0x6e, 0)
    model ChildProtection {
      /** child protection */
      value: yesno;
    }
  }
  @condition(Id.Id.sw, ">=220")
  namespace Sw_ge220 {
    /** CoolingDay */
    @inherit(r)
    @ext(0x7c, 0)
    model CoolingDay {
      value: UCH;
    }

    /** CoolingActive */
    @inherit(r)
    @ext(0x83, 0)
    model CoolingActive {
      value: onoff;
    }
  }
  @condition(Id.Id.sw, ">=250")
  namespace Sw_ge250 {
    /** DiagnoseMode */
    @inherit(r)
    @ext(0x8f, 0)
    model DiagnoseMode {
      /** _DiaMode_Not=0, _DiaMode_Off, _DiaMode_CH, _DiaMode_DhwLoading, _DiaMode_Cooling, _DiaMode_Deicing */
      value: UCH;
    }

    /** EmState_WorkingMode */
    @inherit(r)
    @ext(0x90, 0)
    model EmStateWorkingMode {
      /** 0 = Standby1 = CH2 = Cooling */
      value: UCH;
    }

    /** EmStateCooling */
    @inherit(r)
    @ext(0x91, 0)
    model EmStateCooling {
      /** 0=off1=DhwReq2=Dhw3=TankPOverrun4=Heating5=OverpresFDhw6=OverpresFCh7=WaitChDemOverp8=WaitChDemCH9=WaitChDemEndDhw10=CoolingHSOff11=CoolingHSOn12=DhwWhileCool13=CoolingDhw14=StandbyHSOff15=DhwWhileStandby */
      value: UCH;
    }

    /** EmStateStandby */
    @inherit(r)
    @ext(0x92, 0)
    model EmStateStandby {
      /** 0=off1=DhwReq2=Dhw3=TankPOverrun4=Heating5=OverpresFDhw6=OverpresFCh7=WaitChDemOverp8=WaitChDemCH9=WaitChDemEndDhw10=CoolingHSOff11=CoolingHSOn12=DhwWhileCool13=CoolingDhw14=StandbyHSOff15=DhwWhileStandby */
      value: UCH;
    }

    /** EmStateCH */
    @inherit(r)
    @ext(0x93, 0)
    model EmStateHc {
      /** 0=off1=DhwReq2=Dhw3=TankPOverrun4=Heating5=OverpresFDhw6=OverpresFCh7=WaitChDemOverp8=WaitChDemCH9=WaitChDemEndDhw10=CoolingHSOff11=CoolingHSOn12=DhwWhileCool13=CoolingDhw14=StandbyHSOff15=DhwWhileStandby */
      value: UCH;
    }

    /** DHW_Demand */
    @inherit(r)
    @ext(0x94, 0)
    model HwcDemand {
      value: onoff;
    }

    /** CH_Demand */
    @inherit(r)
    @ext(0x95, 0)
    model HcDemand {
      value: onoff;
    }

    /** Cooling_Demand */
    @inherit(r)
    @ext(0x96, 0)
    model CoolingDemand {
      value: onoff;
    }

    /** EmSystemMode */
    @inherit(r)
    @ext(0x97, 0)
    model EmSystemMode {
      /** 0 = Off1 = Heating2 = Cooling3 = Dhw4 = DhwDuringCH5 = DhwDuringCooling */
      value: UCH;
    }

    /** ParallelCoolingDhwPossible */
    @inherit(r)
    @ext(0x98, 0)
    model ParallelCoolingHwcPossible {
      value: onoff;
    }

    /** DesiredWorkingMode */
    @inherit(r)
    @ext(0x9a, 0)
    model DesiredWorkingMode {
      /** 0 = Standby1 = CH2 = Cooling */
      value: UCH;
    }

    /** SysWithCoolingSupport */
    @inherit(r)
    @ext(0x9b, 0)
    model SysWithCoolingSupport {
      value: onoff;
    }
  }
  @condition(Id.Id.sw, ">=362")
  namespace Sw_ge362 {
    /** reserve 1 */
    @inherit(r)
    @ext(0x9d, 0)
    model Reserve1 {
      /** for future use */
      value: UCH;
    }
  }

  /** included parts */
  union _includes {
    @condition(Id.Id.sw, "<=349")
    Yield8485_inc,

    @condition(Id.Id.sw, "=350-363")
    Yield8485r_inc,

    @condition(Id.Id.sw, ">=364")
    Yield8485_inc,
  }
}
