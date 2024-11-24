import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
import "./errors_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x0a)
namespace Pmw.Hwc {
  // ,PMW00,VPM-W Fresh water Station,PMW 244 DHW
  // ##### Generell #####

  /** Ntc1Sensor: T1 Temperature */
  @ext(0, 0)
  model Ntc1Sensor is ReadonlyRegister<tempsensor>;

  /** Ntc2Sensor: T2 Temperature */
  @ext(1, 0)
  model Ntc2Sensor is ReadonlyRegister<tempsensor>;

  /** Ntc3Sensor: T3 Temperature */
  @ext(0x2, 0)
  model Ntc3Sensor is ReadonlyRegister<tempsensor>;

  /** Vortex: Frequency in Hz ( 1: y [l/min] = 0,0835 * x [Hz] - 0,03, 2: y [l/min] = 0,185 * x [Hz] ) */
  @ext(0x3, 0)
  model Vortex is ReadonlyRegister<frequency>;

  /** CircoPump: Power in % */
  @ext(0x4, 0)
  model CircoPump is ReadonlyRegister<percent0>;

  /** Pump_ED: Power in % */
  @ext(0x5, 0)
  model PumpED is ReadonlyRegister<percent0>;

  /** CalculatedMixerPosition: 0: primary open; 220: primary closed */
  @ext(0x6, 0)
  model CalculatedMixerPosition is ReadonlyRegister<UIN>;

  /** ElectricalHeater */
  @ext(0x8, 0)
  model ElectricalHeater is ReadonlyRegister<onoff>;

  /** HeatDemand */
  @ext(0x9, 0)
  model HeatDemand is ReadonlyRegister<temp>;

  /** OperatingMode */
  @ext(0xa, 0)
  model OperatingMode is InstallRegister<hwcmode2>;

  /** ManualTappingSetpoint */
  @ext(0xb, 0)
  model ManualTappingTempDesired is InstallRegister<temp>;

  /** AutoTappingSetpoint */
  @ext(0xc, 0)
  model AutoTappingTempDesired is ReadonlyRegister<temp>;

  /** QuickVetoSetpoint */
  @ext(0xd, 0)
  model QuickVetoTempDesired is ReadonlyRegister<temp>;

  /** ActualTappingSetpoint */
  @ext(0xe, 0)
  model ActualTappingTempDesired is ReadonlyRegister<temp>;

  /** QuickVetoStart */
  @ext(0xf, 0)
  model QuickVetoStart is ReadonlyRegister<onoff>;

  /** LegioStartDay */
  @inherit(r)
  @ext(0x10, 0)
  model LegioStartDay {
    /** 0=Monday, 1=Tue, … 6=Sunday, 7=LegioProtect off, 8=every day */
    @unit("0..8")
    value: UCH;
  }

  /** LegioStartTime: Time when LegioProtect starts on specific day */
  @ext(0x11, 0)
  model LegioStartTime is ReadonlyRegister<time>;

  /** PartyStart: Start Party Mode */
  @ext(0x12, 0)
  model PartyStart is ReadonlyRegister<onoff>;

  /** HolidayStart: Start Holiday Mode */
  @ext(0x13, 0)
  model HolidayStart is ReadonlyRegister<onoff>;

  /** ActorFernsteuerung: TRUE -> RemoteControl of actors */
  @ext(0x1b, 0)
  model ActorFernsteuerung is ReadonlyRegister<onoff>;

  /** System Time */
  @ext(0x2c, 0)
  model Time is ReadonlyRegister<time>;

  /** System Date */
  @ext(0x2d, 0)
  model Date is ReadonlyRegister<date>;

  /** System Weekday (0=Monday, 5=Saturday, 6=Sunday) */
  @ext(0x2e, 0)
  model Weekday is ReadonlyRegister<bday>;

  /** TeleSwitch */
  @inherit(r)
  @ext(0x39, 0)
  model TeleSwitch {
    /** TeleSwitch Operating Mode (0=disabled, 1=ON, 2=OFF, 3=AUTO */
    @unit("0..3")
    value: UCH;
  }

  /** TeleSwitchState: Teleswitch port state (On / Off) */
  @ext(0x3a, 0)
  model TeleSwitchState is ReadonlyRegister<onoff>;

  /** EnableDHWOperation: Enable DHW Ooperation */
  @ext(0x43, 0)
  model EnableHwcOperation is ReadonlyRegister<onoff>;
  // ##### P-I-Regler #####

  /** Krm */
  @inherit(r)
  @ext(0x14, 0)
  model Krm {
    /** enter value in 1/1000: 25=0.025, 250=0,25, 2500=2,5 */
    @unit("in 1/1000")
    value: SIN;
  }

  /** Tm */
  @inherit(r)
  @ext(0x15, 0)
  model Tm {
    /** enter value in 1/1000: 25=0.025, 250=0,25, 2500=2,5 */
    @unit("in 1/1000")
    value: SIN;
  }

  /** Tnm */
  @inherit(r)
  @ext(0x16, 0)
  model Tnm {
    /** enter value in 1/1000: 25=0.025, 250=0,25, 2500=2,5 */
    @unit("in 1/1000")
    value: SIN;
  }

  /** Tvm */
  @inherit(r)
  @ext(0x17, 0)
  model Tvm {
    /** enter value in 1/1000: 25=0.025, 250=0,25, 2500=2,5 */
    @unit("in 1/1000")
    value: SIN;
  }

  /** Krp */
  @inherit(r)
  @ext(0x18, 0)
  model Krp {
    /** enter value in 1/1000: 25=0.025, 250=0,25, 2500=2,5 */
    @unit("in 1/1000")
    value: SIN;
  }

  /** Tvp */
  @inherit(r)
  @ext(0x19, 0)
  model Tvp {
    /** enter value in 1/1000: 25=0.025, 250=0,25, 2500=2,5 */
    @unit("in 1/1000")
    value: SIN;
  }

  /** Tp */
  @inherit(r)
  @ext(0x1a, 0)
  model Tp {
    /** enter value in 1/1000: 25=0.025, 250=0,25, 2500=2,5 */
    @unit("in 1/1000")
    value: SIN;
  }
  // ##### Statemachine #####

  /** State_MainControl: Aktuelle Zustandsnummer MainControl */
  @ext(0x2f, 0)
  model StateMainControl is ReadonlyRegister<UCH>;

  /** State_MixerPumpControl: Aktuelle Zustandsnummer MixerPumpControl */
  @ext(0x30, 0)
  model StateMixerPumpControl is ReadonlyRegister<UCH>;

  /** State_CircoKick: Aktuelle Zustandsnummer CircoKickControl */
  @ext(0x31, 0)
  model StateCircoKick is ReadonlyRegister<UCH>;

  /** State_HExMonitoring: Aktuelle Zustandsnummer HExMonitoring */
  @ext(0x32, 0)
  model StateHExMonitoring is ReadonlyRegister<UCH>;

  /** TimeTicker: Sekunden des Tages */
  @ext(0x33, 0)
  model TimeTicker is ReadonlyRegister<seconds4>;
  // ##### Statistik #####

  /** StLegioStopTimeCounter: End LegioProtect with Stop */
  @ext(0x3e, 0)
  model StLegioStopTimeCounter is ServiceRegister<UIN>;

  /** StLegioAbortTimeCounter: End LegioProtect with Abort */
  @ext(0x3f, 0)
  model StLegioAbortTimeCounter is ServiceRegister<UIN>;

  /** StFrostProtCounter: FrostProtectCounter */
  @ext(0x40, 0)
  model StFrostProtCounter is ServiceRegister<UIN>;

  /** StInstallationDate: Installation Date */
  @ext(0x41, 0)
  model StInstallationDate is ServiceRegister<date>;

  /** SteBusCheckFailedCounter: eBus Failed Counter */
  @ext(0x42, 0)
  model SteBusCheckFailedCounter is ServiceRegister<UIN>;
  @condition(Id.Id.sw, ">=38")
  namespace Sw_ge38 {
    /** Enable SingleTankCharge */
    @ext(0x44, 0)
    model SingleStorageCharge is ReadonlyRegister<onoff>;

    /** ZaehlerBetriebsStunden: Working Hours */
    @ext(0x45, 0)
    model ZaehlerBetriebsStunden is ReadonlyRegister<UIN>;
  }
  @condition(Id.Id.sw, ">=39")
  namespace Sw_ge39 {
    /** TDurchfluss: flow in l/min */
    @ext(0x46, 0)
    model DurchflussTemp is ReadonlyRegister<temp>;
  }
  @condition(Id.Id.sw, ">=112")
  namespace Sw_ge112 {
    /** VPMW_Mode: 1=VPM 20/25W, 2=VPM 30/35W */
    @ext(0x4b, 0)
    model VPMWMode is ReadonlyRegister<UCH>;
  }
  @condition(Id.Id.sw, ">=117")
  namespace Sw_ge117 {
    /** Overheat_timer */
    @ext(0x52, 0)
    model OverheatTimer is ReadonlyRegister<seconds0>;
  }
  @condition(Id.Id.sw, ">=40")
  namespace Sw_ge40 {
    /** HexMonitoringCounter: RO */
    @ext(0x47, 0)
    model HexMonitoringCounter is ReadonlyRegister<SIN>;

    /** HExThreshold */
    @inherit(r)
    @ext(0x48, 0)
    model HExThreshold {
      /** RO */
      @unit("in 1/100")
      value: SIN;
    }

    /** BigHExThreshold */
    @inherit(r)
    @ext(0x49, 0)
    model BigHExThreshold {
      /** RW */
      @unit("in 1/100")
      value: SIN;
    }

    /** HExIndex */
    @inherit(r)
    @ext(0x4a, 0)
    model HExIndex {
      /** RO */
      @unit("in 1/100")
      value: SIN;
    }
  }
  @condition(Id.Id.sw, ">=113")
  namespace Sw_ge113 {
    /** Actual_Krm */
    @inherit(r)
    @ext(0x4c, 0)
    model ActualKrm {
      /** Krm used for calculation (set in DynamicTnm), valid after 1. Tapping */
      @unit("in 1/1000")
      value: SIN;
    }

    /** Actual_Tnm */
    @inherit(r)
    @ext(0x4d, 0)
    model ActualTnm {
      /** Tnm used for calculation (set in DynamicTnm), valid after 1. Tapping */
      @unit("in 1/1000")
      value: SIN;
    }
  }
  @condition(Id.Id.sw, ">=114")
  namespace Sw_ge114 {
    /** Krm_Faktor_Small */
    @inherit(r)
    @ext(0x4e, 0)
    model KrmFaktorSmall {
      /** Krm Verstärkungsfaktor Small (1/1000) */
      @unit("in 1/1000")
      value: SIN;
    }

    /** Krm_Faktor_Middl */
    @inherit(r)
    @ext(0x4f, 0)
    model KrmFaktorMiddl {
      /** Krm Verstärkungsfaktor Middl (1/1000) */
      @unit("in 1/1000")
      value: SIN;
    }

    /** Tnm_Faktor_Small */
    @inherit(r)
    @ext(0x50, 0)
    model TnmFaktorSmall {
      /** Tnm Verstärkungsfaktor Small (1/1000) */
      @unit("in 1/1000")
      value: SIN;
    }

    /** Tnm_Faktor_Middl */
    @inherit(r)
    @ext(0x51, 0)
    model TnmFaktorMiddl {
      /** Tnm Verstärkungsfaktor Middl (1/1000) */
      @unit("in 1/1000")
      value: SIN;
    }
  }

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
    Errors_inc,
    Quick_inc,
  }
}
