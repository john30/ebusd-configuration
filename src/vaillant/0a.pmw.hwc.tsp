import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
import "./errors_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x0a)
namespace pmw.hwc {
  // ,PMW00,VPM-W Fresh water Station,PMW 244 DHW

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
  // ##### Generell #####

  /** Ntc1Sensor */
  @inherit(r)
  @ext(0, 0)
  model Ntc1Sensor {
    /** T1 Temperature */
    value: tempsensor;
  }

  /** Ntc2Sensor */
  @inherit(r)
  @ext(1, 0)
  model Ntc2Sensor {
    /** T2 Temperature */
    value: tempsensor;
  }

  /** Ntc3Sensor */
  @inherit(r)
  @ext(0x2, 0)
  model Ntc3Sensor {
    /** T3 Temperature */
    value: tempsensor;
  }

  /** Vortex */
  @inherit(r)
  @ext(0x3, 0)
  model Vortex {
    /** Frequency in Hz ( 1: y [l/min] = 0,0835 * x [Hz] - 0,03, 2: y [l/min] = 0,185 * x [Hz] ) */
    value: frequency;
  }

  /** CircoPump */
  @inherit(r)
  @ext(0x4, 0)
  model CircoPump {
    /** Power in % */
    value: percent0;
  }

  /** Pump_ED */
  @inherit(r)
  @ext(0x5, 0)
  model PumpED {
    /** Power in % */
    value: percent0;
  }

  /** CalculatedMixerPosition */
  @inherit(r)
  @ext(0x6, 0)
  model CalculatedMixerPosition {
    /** 0: primary open; 220: primary closed */
    @unit("Steps")
    value: UIN;
  }

  /** ElectricalHeater */
  @inherit(r)
  @ext(0x8, 0)
  model ElectricalHeater {
    value: onoff;
  }

  /** HeatDemand */
  @inherit(r)
  @ext(0x9, 0)
  model HeatDemand {
    value: temp;
  }

  /** OperatingMode */
  @inherit(r, wi)
  @ext(0xa, 0)
  model OperatingMode {
    /** 0=OFF, 1=ON, 2=AUTO, 3=MANUAL */
    value: mcmode;
  }

  /** ManualTappingSetpoint */
  @inherit(r, wi)
  @ext(0xb, 0)
  model ManualTappingTempDesired {
    value: temp;
  }

  /** AutoTappingSetpoint */
  @inherit(r)
  @ext(0xc, 0)
  model AutoTappingTempDesired {
    value: temp;
  }

  /** QuickVetoSetpoint */
  @inherit(r)
  @ext(0xd, 0)
  model QuickVetoTempDesired {
    value: temp;
  }

  /** ActualTappingSetpoint */
  @inherit(r)
  @ext(0xe, 0)
  model ActualTappingTempDesired {
    value: temp;
  }

  /** QuickVetoStart */
  @inherit(r)
  @ext(0xf, 0)
  model QuickVetoStart {
    value: onoff;
  }

  /** LegioStartDay */
  @inherit(r)
  @ext(0x10, 0)
  model LegioStartDay {
    /** 0=Monday, 1=Tue, … 6=Sunday, 7=LegioProtect off, 8=every day */
    @unit("0..8")
    value: UCH;
  }

  /** LegioStartTime */
  @inherit(r)
  @ext(0x11, 0)
  model LegioStartTime {
    /** Time when LegioProtect starts on specific day */
    value: time;
  }

  /** PartyStart */
  @inherit(r)
  @ext(0x12, 0)
  model PartyStart {
    /** Start Party Mode */
    value: onoff;
  }

  /** HolidayStart */
  @inherit(r)
  @ext(0x13, 0)
  model HolidayStart {
    /** Start Holiday Mode */
    value: onoff;
  }

  /** ActorFernsteuerung */
  @inherit(r)
  @ext(0x1b, 0)
  model ActorFernsteuerung {
    /** TRUE -> RemoteControl of actors */
    value: onoff;
  }

  /** time */
  @inherit(r)
  @ext(0x2c, 0)
  model Time {
    /** System Time */
    value: time;
  }

  /** date */
  @inherit(r)
  @ext(0x2d, 0)
  model Date {
    /** System Date */
    value: date;
  }

  /** weekday */
  @inherit(r)
  @ext(0x2e, 0)
  model Weekday {
    /** System Weekday (0=Monday, 5=Saturday, 6=Sunday) */
    value: bday;
  }

  /** TeleSwitch */
  @inherit(r)
  @ext(0x39, 0)
  model TeleSwitch {
    /** TeleSwitch Operating Mode (0=disabled, 1=ON, 2=OFF, 3=AUTO */
    @unit("0..3")
    value: UCH;
  }

  /** TeleSwitchState */
  @inherit(r)
  @ext(0x3a, 0)
  model TeleSwitchState {
    /** Teleswitch port state (On / Off) */
    value: onoff;
  }

  /** EnableDHWOperation */
  @inherit(r)
  @ext(0x43, 0)
  model EnableHwcOperation {
    /** Enable DHW Ooperation */
    value: onoff;
  }

  @condition(id.id.sw, ">=38")
  namespace sw__38 {
    /** SingleTankCharge */
    @inherit(r)
    @ext(0x44, 0)
    model SingleStorageCharge {
      /** Enable SingleTankCharge */
      value: onoff;
    }
  }

  @condition(id.id.sw, ">=39")
  namespace sw__39 {
    /** TDurchfluss */
    @inherit(r)
    @ext(0x46, 0)
    model DurchflussTemp {
      /** flow in l/min */
      value: temp;
    }
  }

  @condition(id.id.sw, ">=112")
  namespace sw__112 {
    /** VPMW_Mode */
    @inherit(r)
    @ext(0x4b, 0)
    model VPMWMode {
      /** 1=VPM 20/25W, 2=VPM 30/35W */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=117")
  namespace sw__117 {
    /** Overheat_timer */
    @inherit(r)
    @ext(0x52, 0)
    model OverheatTimer {
      /** Overheat_timer */
      value: seconds0;
    }
  }
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

  @condition(id.id.sw, ">=40")
  namespace sw__40 {
    /** HexMonitoringCounter */
    @inherit(r)
    @ext(0x47, 0)
    model HexMonitoringCounter {
      /** RO */
      value: SIN;
    }
  }

  @condition(id.id.sw, ">=40")
  namespace sw__40 {
    /** HExThreshold */
    @inherit(r)
    @ext(0x48, 0)
    model HExThreshold {
      /** RO */
      @unit("in 1/100")
      value: SIN;
    }
  }

  @condition(id.id.sw, ">=40")
  namespace sw__40 {
    /** BigHExThreshold */
    @inherit(r)
    @ext(0x49, 0)
    model BigHExThreshold {
      /** RW */
      @unit("in 1/100")
      value: SIN;
    }
  }

  @condition(id.id.sw, ">=40")
  namespace sw__40 {
    /** HExIndex */
    @inherit(r)
    @ext(0x4a, 0)
    model HExIndex {
      /** RO */
      @unit("in 1/100")
      value: SIN;
    }
  }

  @condition(id.id.sw, ">=113")
  namespace sw__113 {
    /** Actual_Krm */
    @inherit(r)
    @ext(0x4c, 0)
    model ActualKrm {
      /** Krm used for calculation (set in DynamicTnm), valid after 1. Tapping */
      @unit("in 1/1000")
      value: SIN;
    }
  }

  @condition(id.id.sw, ">=113")
  namespace sw__113 {
    /** Actual_Tnm */
    @inherit(r)
    @ext(0x4d, 0)
    model ActualTnm {
      /** Tnm used for calculation (set in DynamicTnm), valid after 1. Tapping */
      @unit("in 1/1000")
      value: SIN;
    }
  }

  @condition(id.id.sw, ">=114")
  namespace sw__114 {
    /** Krm_Faktor_Small */
    @inherit(r)
    @ext(0x4e, 0)
    model KrmFaktorSmall {
      /** Krm Verstärkungsfaktor Small (1/1000) */
      @unit("in 1/1000")
      value: SIN;
    }
  }

  @condition(id.id.sw, ">=114")
  namespace sw__114 {
    /** Krm_Faktor_Middl */
    @inherit(r)
    @ext(0x4f, 0)
    model KrmFaktorMiddl {
      /** Krm Verstärkungsfaktor Middl (1/1000) */
      @unit("in 1/1000")
      value: SIN;
    }
  }

  @condition(id.id.sw, ">=114")
  namespace sw__114 {
    /** Tnm_Faktor_Small */
    @inherit(r)
    @ext(0x50, 0)
    model TnmFaktorSmall {
      /** Tnm Verstärkungsfaktor Small (1/1000) */
      @unit("in 1/1000")
      value: SIN;
    }
  }

  @condition(id.id.sw, ">=114")
  namespace sw__114 {
    /** Tnm_Faktor_Middl */
    @inherit(r)
    @ext(0x51, 0)
    model TnmFaktorMiddl {
      /** Tnm Verstärkungsfaktor Middl (1/1000) */
      @unit("in 1/1000")
      value: SIN;
    }
  }
  // ##### Statemachine #####

  /** State_MainControl */
  @inherit(r)
  @ext(0x2f, 0)
  model StateMainControl {
    /** Aktuelle Zustandsnummer MainControl */
    value: UCH;
  }

  /** State_MixerPumpControl */
  @inherit(r)
  @ext(0x30, 0)
  model StateMixerPumpControl {
    /** Aktuelle Zustandsnummer MixerPumpControl */
    value: UCH;
  }

  /** State_CircoKick */
  @inherit(r)
  @ext(0x31, 0)
  model StateCircoKick {
    /** Aktuelle Zustandsnummer CircoKickControl */
    value: UCH;
  }

  /** State_HExMonitoring */
  @inherit(r)
  @ext(0x32, 0)
  model StateHExMonitoring {
    /** Aktuelle Zustandsnummer HExMonitoring */
    value: UCH;
  }

  /** TimeTicker */
  @inherit(r)
  @ext(0x33, 0)
  model TimeTicker {
    /** Sekunden des Tages */
    value: seconds4;
  }
  // ##### Statistik #####

  /** StLegioStopTimeCounter */
  @inherit(r, ws)
  @ext(0x3e, 0)
  model StLegioStopTimeCounter {
    /** End LegioProtect with Stop */
    value: UIN;
  }

  /** StLegioAbortTimeCounter */
  @inherit(r, ws)
  @ext(0x3f, 0)
  model StLegioAbortTimeCounter {
    /** End LegioProtect with Abort */
    value: UIN;
  }

  /** StFrostProtCounter */
  @inherit(r, ws)
  @ext(0x40, 0)
  model StFrostProtCounter {
    /** FrostProtectCounter */
    value: UIN;
  }

  /** StInstallationDate */
  @inherit(r, ws)
  @ext(0x41, 0)
  model StInstallationDate {
    /** Installation Date */
    value: date;
  }

  /** SteBusCheckFailedCounter */
  @inherit(r, ws)
  @ext(0x42, 0)
  model SteBusCheckFailedCounter {
    /** eBus Failed Counter */
    value: UIN;
  }

  @condition(id.id.sw, ">=38")
  namespace sw__38 {
    /** ZaehlerBetriebsStunden */
    @inherit(r)
    @ext(0x45, 0)
    model ZaehlerBetriebsStunden {
      /** Working Hours */
      value: UIN;
    }
  }

  /** included parts */
  union _includes {
    hwcmode_inc,
    timer_inc,
    errors_inc,
    quick_inc,
  }
}
