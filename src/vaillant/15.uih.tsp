import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./yield8485_inc.tsp";
import "./yield8485r_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace Uih {
  // ,UIH00,CI,UIH00 169
  // ##### Earned energy #####
  // ##### Parameters and information #####

  /** Aussentemperatur: out door temperature */
  @ext(1, 0)
  model OutsideTemp is ReadonlyRegister<tempsensor>;

  /** EhpHydraulicMap: hydraulic scheme */
  @ext(0x29, 0)
  model EhpHydraulicMap is ServiceRegister<UCH>;

  /** EhpBasicStatus: AMU basic state (copy from AMU) */
  @ext(0x50, 0)
  model EhpBasicStatus is ReadonlyRegister<UCH>;

  /** StateEM: state of energie manager:0: EmOff,1: EmDhwRequest,2: EmDhw,3: EmTankPunmpOverrun,4: EmHeating,5: EmOverpressureFromDhw,6: EmOverpressureFromCh,7: EmWaitForChDemandOverpressure,8: EmWaitForChDemandHeating,9: EmWaitForChDemandEndOfDhw */
  @ext(0x4b, 0)
  model StateEM is ReadonlyRegister<UCH>;

  /** LanguageVariant: language of the menue */
  @ext(0x26, 0)
  model LanguageVariant is Register<UCH>;

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

  /** RoomSetTempHoliday: desired room setpoint for holiday */
  @ext(0x22, 0)
  model RoomTempHoliday is Register<temp>;

  /** KeyCodeforConfigMenue */
  @inherit(r, wi)
  @ext(0x2c, 0)
  model KeyCodeforConfigMenu {
    /** key code for the config menue */
    @maxLength(4)
    value: HEX;
  }

  /** SystemDesiredFlowTemp */
  @ext(0x5, 0)
  model FlowTempDesired is ReadonlyRegister<temp>;

  /** SystemFlowTemp: systen flow temperature */
  @ext(0x2, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** MaxChSupportTime: Maximum CH loading period when there is a DHW simultaneous demand */
  @ext(0x4d, 0)
  model HcSupportTimeMax is InstallRegister<minutes0>;

  /** MaxDhwLoadingTime: Maximum DHW loading period when there is a Central Heating simultaneous demand */
  @ext(0x4c, 0)
  model HwcLoadingTimeMax is InstallRegister<minutes0>;

  /** TempIncrease: temperature increase */
  @ext(0x2f, 0)
  model TempIncrease is InstallRegister<temp>;

  /** PreShutDownTime: pre shut down time */
  @ext(0x2d, 0)
  model PreShutDownTime is InstallRegister<minutes0>;

  /** FrostOverRideTime: frost over ride time */
  @ext(0x2e, 0)
  model FrostOverRideTime is InstallRegister<hours>;

  /** EhpBackupHeaterRelease: backup heater release */
  @ext(0x71, 0)
  model EhpBackupRelease is ReadonlyRegister<onoff>;

  /** EhpTimeOfPredictedPowerCut: time of the next predicted power cut */
  @ext(0x73, 0)
  model EhpTimeOfPredictedPowerCut is ReadonlyRegister<time>;

  /** TempFailDetectTime: temperature fail detection time */
  @ext(0x33, 0)
  model TempFailDetectTime is InstallRegister<temp0>;

  /** EhpHeatBufferAvailable: heat buffer is available */
  @ext(0x5c, 0)
  model EhpHeatBufferAvailable is InstallRegister<onoff>;
  // ##### HC Names and Tel No #####

  /** aaucHcNames CH2: name of CH2 */
  @ext(0x41, 0x8)
  model HcName2 is Register<hcname>;

  /** aaucHcNames CH3: name of CH3 */
  @ext(0x41, 0x10)
  model HcName3 is Register<hcname>;

  /** aaucHcNames CH4: name of CH4 */
  @ext(0x41, 0x18)
  model HcName4 is Register<hcname>;

  /** aaucHcNames CH5: name of CH5 */
  @ext(0x41, 0x20)
  model HcName5 is Register<hcname>;

  /** aaucHcNames CH6: name of CH6 */
  @ext(0x41, 0x28)
  model HcName6 is Register<hcname>;

  /** aaucHcNames CH7: name of CH7 */
  @ext(0x41, 0x30)
  model HcName7 is Register<hcname>;

  /** aaucHcNames CH8: name of CH8 */
  @ext(0x41, 0x38)
  model HcName8 is Register<hcname>;

  /** aaucHcNames CH9: name of CH9 */
  @ext(0x41, 0x40)
  model HcName9 is Register<hcname>;

  /** aaucHcNames CH10: name of CH10 */
  @ext(0x41, 0x48)
  model HcName10 is Register<hcname>;

  /** aaucHcNames CH11: name of CH11 */
  @ext(0x41, 0x50)
  model HcName11 is Register<hcname>;

  /** aaucHcNames CH12: name of CH12 */
  @ext(0x41, 0x58)
  model HcName12 is Register<hcname>;

  /** aaucHcNames CH13: name of CH13 */
  @ext(0x41, 0x60)
  model HcName13 is Register<hcname>;

  /** aaucHcNames CH14: name of CH14 */
  @ext(0x41, 0x68)
  model HcName14 is Register<hcname>;

  /** aaucHcNames CH15: name of CH15 */
  @ext(0x41, 0x70)
  model HcName15 is Register<hcname>;

  /** aaucHcNames CH16: name of CH16 */
  @ext(0x41, 0x78)
  model HcName16 is Register<hcname>;

  /** aucPhoneNumber part 1: phone number part 1 */
  @ext(0x42, 0)
  model PhoneNumberPart1 is InstallRegister<phone>;

  /** aucPhoneNumber part 2: phone number part 2 */
  @ext(0x42, 0x8)
  model PhoneNumberPart2 is InstallRegister<phone>;
  @condition(Id.Id.sw, ">=202")
  namespace Sw_ge202 {
    /** EarnedEnergySum */
    @ext(0x87, 0)
    model YieldSum is ReadonlyRegister<ULG>;

    /** EarnedEnergyOld: Contains earned energy sum stored from AMU last midnight. Required for data transmission between PCBs. */
    @ext(0x86, 0)
    model YieldOld is InstallRegister<ULG>;
  }
  @condition(Id.Id.sw, "<=345")
  namespace Sw_le345 {
    /** Child protection */
    @ext(0x6e, 0)
    model ChildProtection is ReadonlyRegister<yesno>;
  }
  @condition(Id.Id.sw, ">=220")
  namespace Sw_ge220 {
    /** CoolingDay */
    @ext(0x7c, 0)
    model CoolingDay is ReadonlyRegister<UCH>;

    /** CoolingActive */
    @ext(0x83, 0)
    model CoolingActive is ReadonlyRegister<onoff>;
  }
  @condition(Id.Id.sw, ">=250")
  namespace Sw_ge250 {
    /** DiagnoseMode: _DiaMode_Not=0, _DiaMode_Off, _DiaMode_CH, _DiaMode_DhwLoading, _DiaMode_Cooling, _DiaMode_Deicing */
    @ext(0x8f, 0)
    model DiagnoseMode is ReadonlyRegister<UCH>;

    /** EmState_WorkingMode: 0 = Standby1 = CH2 = Cooling */
    @ext(0x90, 0)
    model EmStateWorkingMode is ReadonlyRegister<UCH>;

    /** EmStateCooling: 0=off1=DhwReq2=Dhw3=TankPOverrun4=Heating5=OverpresFDhw6=OverpresFCh7=WaitChDemOverp8=WaitChDemCH9=WaitChDemEndDhw10=CoolingHSOff11=CoolingHSOn12=DhwWhileCool13=CoolingDhw14=StandbyHSOff15=DhwWhileStandby */
    @ext(0x91, 0)
    model EmStateCooling is ReadonlyRegister<UCH>;

    /** EmStateStandby: 0=off1=DhwReq2=Dhw3=TankPOverrun4=Heating5=OverpresFDhw6=OverpresFCh7=WaitChDemOverp8=WaitChDemCH9=WaitChDemEndDhw10=CoolingHSOff11=CoolingHSOn12=DhwWhileCool13=CoolingDhw14=StandbyHSOff15=DhwWhileStandby */
    @ext(0x92, 0)
    model EmStateStandby is ReadonlyRegister<UCH>;

    /** EmStateCH: 0=off1=DhwReq2=Dhw3=TankPOverrun4=Heating5=OverpresFDhw6=OverpresFCh7=WaitChDemOverp8=WaitChDemCH9=WaitChDemEndDhw10=CoolingHSOff11=CoolingHSOn12=DhwWhileCool13=CoolingDhw14=StandbyHSOff15=DhwWhileStandby */
    @ext(0x93, 0)
    model EmStateHc is ReadonlyRegister<UCH>;

    /** DHW_Demand */
    @ext(0x94, 0)
    model HwcDemand is ReadonlyRegister<onoff>;

    /** CH_Demand */
    @ext(0x95, 0)
    model HcDemand is ReadonlyRegister<onoff>;

    /** Cooling_Demand */
    @ext(0x96, 0)
    model CoolingDemand is ReadonlyRegister<onoff>;

    /** EmSystemMode: 0 = Off1 = Heating2 = Cooling3 = Dhw4 = DhwDuringCH5 = DhwDuringCooling */
    @ext(0x97, 0)
    model EmSystemMode is ReadonlyRegister<UCH>;

    /** ParallelCoolingDhwPossible */
    @ext(0x98, 0)
    model ParallelCoolingHwcPossible is ReadonlyRegister<onoff>;

    /** DesiredWorkingMode: 0 = Standby1 = CH2 = Cooling */
    @ext(0x9a, 0)
    model DesiredWorkingMode is ReadonlyRegister<UCH>;

    /** SysWithCoolingSupport */
    @ext(0x9b, 0)
    model SysWithCoolingSupport is ReadonlyRegister<onoff>;
  }
  @condition(Id.Id.sw, ">=362")
  namespace Sw_ge362 {
    /** reserve 1: for future use */
    @ext(0x9d, 0)
    model Reserve1 is ReadonlyRegister<UCH>;
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
