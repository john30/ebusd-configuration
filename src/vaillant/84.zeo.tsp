import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x84)
namespace Zeo {
  // ,ZEO00,Zeolite AMU,ZEO00 197 Boiler

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x9, 0xe)
  model ws {}
  // ##### ZEO: Zeolite #####

  /** EnergyDemand */
  @inherit(r)
  @ext(0x27, 0)
  model EnergyDemand {
    /** vom UI */
    value: onoff;
  }

  /** BurnerDemand */
  @inherit(r)
  @ext(0x4f, 0)
  model BoilerDemand {
    /** von der BMU */
    value: onoff;
  }

  /** P_B1 */
  @inherit(r)
  @ext(0x5c, 0)
  model B1Press {
    /** Pumpe Kondensatorkreis */
    value: onoff;
  }

  /** PrimaryCircuitPump2Power */
  @inherit(r)
  @ext(0x5f, 0)
  model PrimaryCircuitPump2Power {
    /** aktuelle Leistung in % */
    value: UIN;
  }

  /** P_B2 */
  @inherit(r)
  @ext(0x60, 0)
  model B2Press {
    /** Pumpe Umweltkreis */
    value: UCH;
  }

  /** SM_PrimaryCircuitCycle_OKState */
  @inherit(r)
  @ext(0x62, 0)
  model SMPrimaryCircuitCycleOKState {
    /** Prozesszustand */
    value: UCH;
  }

  /** Pos1 */
  @inherit(r)
  @ext(0x65, 0)
  model Pos1 {
    /** Umschalterposition Direktheizbetrieb */
    value: onoff;
  }

  /** Pos2 */
  @inherit(r)
  @ext(0x66, 0)
  model Pos2 {
    /** Umschalterposition Desorption mit Bypass */
    value: onoff;
  }

  /** PrimaryCircuitCycleState */
  @inherit(r)
  @ext(0x68, 0)
  model PrimaryCircuitCycleState {
    value: UCH;
  }

  /** Ventilatorfreigabe */
  @inherit(r)
  @ext(0x6a, 0)
  model Ventilatorfreigabe {
    /** Kollektorventilator */
    value: onoff;
  }

  /** Volumenstrom_P_P1 */
  @inherit(r)
  @ext(0x6b, 0)
  model VolumenstromPumpP1 {
    /** in % */
    value: UIN;
  }

  /** Volumenstrom_P_P2 */
  @inherit(r)
  @ext(0x6c, 0)
  model VolumenstromPumpP2 {
    /** in % */
    value: UIN;
  }

  /** man_weiter */
  @inherit(r, ws)
  @ext(0x70, 0)
  model ManWeiter {
    value: onoff;
  }

  /** W_Anfo */
  @inherit(r)
  @ext(0x72, 0)
  model WAnfo {
    value: onoff;
  }

  /** Quelle */
  @inherit(r)
  @ext(0x73, 0)
  model Quelle {
    /** 1=DHB 2=Kollektorbetrieb 3=Wärmetauscherbetrieb */
    value: UCH;
  }

  /** PrimaryCircuitPumpsControlState */
  @inherit(r)
  @ext(0x74, 0)
  model PrimaryCircuitPumpsControlState {
    value: UCH;
  }

  /** V_Pl */
  @inherit(r)
  @ext(0x77, 0)
  model PlValve {
    /** Primärkreisumschalter Linkslauf */
    value: onoff;
  }

  /** V_Pr */
  @inherit(r)
  @ext(0x78, 0)
  model PrValve {
    /** Primärkreisumschalter Rechtslauf */
    value: onoff;
  }

  /** testbetrieb */
  @inherit(r)
  @ext(0x7a, 0)
  model Testbetrieb {
    value: onoff;
  }

  /** BW_Anfo */
  @inherit(r)
  @ext(0x7b, 0)
  model HwcAnfo {
    value: onoff;
  }

  /** Br_Anfo */
  @inherit(r)
  @ext(0x82, 0)
  model BrAnfo {
    /** Ansteuerung Gasventil */
    value: onoff;
  }

  /** DesiredPositionReached */
  @inherit(r)
  @ext(0x83, 0)
  model DesiredPositionReached {
    value: onoff;
  }

  /** GFA_Stoerung */
  @inherit(r)
  @ext(0x85, 0)
  model GFAStoerung {
    value: onoff;
  }

  /** Tads_aus */
  @inherit(r)
  @ext(0x86, 0)
  model TadsAus {
    /** °C */
    value: temp;
  }

  /** MSW_max */
  @inherit(r)
  @ext(0x88, 0)
  model MSWMax {
    /** in % */
    value: UCH;
  }

  /** Tdes_ein */
  @inherit(r)
  @ext(0x89, 0)
  model TdesEin {
    /** °C */
    value: temp;
  }

  /** ActualEnvironmentalPower */
  @inherit(r)
  @ext(0x8a, 0)
  model ActualEnvironmentalPower {
    /** in kW (Näherungswert) */
    value: power;
  }

  /** PWT_Soll */
  @inherit(r)
  @ext(0x8b, 0)
  model PWTSoll {
    /** °C */
    value: temp;
  }

  /** Prim_Vol */
  @inherit(r)
  @ext(0x8c, 0)
  model PrimVol {
    /** in % */
    value: UCH;
  }

  /** Tsole_ein */
  @inherit(r)
  @ext(0x8f, 0)
  model TsoleEin {
    /** °C; hinten */
    value: tempsensor;
  }

  /** Tsole_aus */
  @inherit(r)
  @ext(0x90, 0)
  model TsoleAus {
    /** °C; vorne */
    value: tempsensor;
  }

  /** PL_H */
  @inherit(r)
  @ext(0x91, 0)
  model PLH {
    /** Umschalterposition Desorption ohne Bypass */
    value: onoff;
  }

  /** PL_P */
  @inherit(r)
  @ext(0x92, 0)
  model PLPump {
    /** Umschalterposition Adsorption */
    value: onoff;
  }

  /** PrimaryCircuitPump1Power */
  @inherit(r)
  @ext(0xa7, 0)
  model PrimaryCircuitPump1Power {
    /** in % */
    value: UIN;
  }

  /** PrimaryCircuitSwitchControlState */
  @inherit(r)
  @ext(0xa9, 0)
  model PrimaryCircuitSwitchControlState {
    value: UCH;
  }

  /** PrimaryCircuitPump1PowerCorrected */
  @inherit(r)
  @ext(0xb3, 0)
  model PrimaryCircuitPump1PowerCorrected {
    value: UIN;
  }

  /** PrimaryCircuitPump2PowerCorrected */
  @inherit(r)
  @ext(0xb4, 0)
  model PrimaryCircuitPump2PowerCorrected {
    value: UIN;
  }

  /** tdes_um */
  @inherit(r)
  @ext(0xba, 0)
  model TdesUm {
    value: temp;
  }

  /** Q_zeo */
  @inherit(r)
  @ext(0xdd, 0)
  model QZeo {
    /** in kWh */
    value: UIN;
  }

  /** V_P_B1 */
  @inherit(r)
  @ext(0xde, 0)
  model PumpB1Valve {
    /** Durchflussmenge durch Verdampfer */
    value: UIN;
  }

  /** Z_Sp_nach */
  @inherit(r)
  @ext(0xdf, 0)
  model ZSpNach {
    /** Nachlaufzeit Speicherpumpe/min */
    value: UCH;
  }

  /** Partload */
  @inherit(r)
  @ext(0xf8, 0)
  model Teillast {
    /** 0..100% MSW_max in Testbetrieb */
    value: UCH;
  }

  /** PrimaryCircuitMicroSwitchPattern */
  @inherit(r)
  @ext(0xf9, 0)
  model PrimaryCircuitMicroSwitchPattern {
    /** 1=Des.o.B. 2=Adsorption 4=Des.m.B. 8=Direktheizbetrieb */
    value: UCH;
  }
  // ##### ZEO: Global #####

  /** Code1Code2Valid */
  @inherit(r)
  @ext(1, 0)
  model Code1Code2Valid {
    value: onoff;
  }

  /** dcfStatus */
  @inherit(r)
  @ext(0x3a, 0)
  model DcfStatus {
    value: UCH;
  }

  /** MaxStackeBUSTask */
  @inherit(r)
  @ext(0x3b, 0)
  model StackeBUSTaskMax {
    value: UCH;
  }

  /** MaxStackMainTask */
  @inherit(r)
  @ext(0x3c, 0)
  model StackMainTaskMax {
    value: UCH;
  }

  /** MaxStackLifeCheckTask */
  @inherit(r)
  @ext(0x3d, 0)
  model StackLifeCheckTaskMax {
    value: UCH;
  }

  /** Error_Actual */
  @inherit(r)
  @ext(0x46, 0)
  model ErrorActual {
    value: UCH;
  }

  /** Error_Actual */
  @inherit(r)
  @ext(0x46, 0x2)
  model Global_ErrorActual {
    value: UCH;
  }

  /** Error_History */
  @inherit(r)
  @ext(0x47, 0)
  model ErrorHistory {
    value: UCH;
  }

  /** Error_History */
  @inherit(r)
  @ext(0x47, 0x2)
  model Global_ErrorHistory {
    value: UCH;
  }

  /** Reset */
  @inherit(r)
  @ext(0x48, 0)
  model Reset {
    value: onoff;
  }

  /** RebootCounter */
  @inherit(r)
  @ext(0x51, 0)
  model RebootCounter {
    /** incremented each time Firmware boots */
    value: UIN;
  }

  /** Anlegethermostat */
  @inherit(r)
  @ext(0xa1, 0)
  model Anlegethermostat {
    value: onoff;
  }
  // ##### ZEO: BMR #####

  /** Holiday function active */
  @inherit(r)
  @ext(0x2, 0)
  model IsInHoliday {
    value: UCH;
  }

  /** OutsideTempSensorCorrection */
  @inherit(r)
  @ext(0x8, 0)
  model OutsideTempCorrection {
    /** 0,5°C resolution */
    value: temps;
  }

  /** DesiredHolidayTemperature */
  @inherit(r)
  @ext(0xf, 0)
  model HolidayTempDesired {
    /** 1/2 °C resolution */
    value: temp1;
  }

  /** Heating curve */
  @inherit(r)
  @ext(0x10, 0)
  model HeatingCurve {
    /** 1/100 resolution */
    value: curve;
  }

  /** OtShutdownLimit */
  @inherit(r)
  @ext(0x11, 0)
  model OtShutdownLimit {
    /** 1 °C resolution Bedarfsabhängige Heizungsabschaltung */
    value: UCH;
  }

  /** BoilerMaxPreShutdown */
  @inherit(r)
  @ext(0x14, 0)
  model BoilerMaxPreShutdown {
    /** 15..120min */
    value: UCH;
  }

  /** HcFlowIncrease */
  @inherit(r)
  @ext(0x15, 0)
  model HcFlowIncrease {
    value: UCH;
  }

  /** CircuitPeriods */
  @inherit(r)
  @ext(0x19, 0)
  model CircuitPeriods {
    value: UCH;
  }

  /** LegioProtectionEnabled */
  @inherit(r)
  @ext(0x1a, 0)
  model LegioProtectionEnabled {
    /** Global for all DHW circuits */
    value: onoff;
  }

  /** IsInTankFilling */
  @inherit(r)
  @ext(0x20, 0)
  model IsInStorageFilling {
    value: onoff;
  }

  /** FrostProtectDelay */
  @inherit(r)
  @ext(0x22, 0)
  model FrostProtectDelay {
    /** 1h */
    value: UCH;
  }

  /** IsInParty */
  @inherit(r)
  @ext(0x26, 0)
  model IsInParty {
    value: UCH;
  }

  /** HcPreShutdownActive */
  @inherit(r)
  @ext(0x28, 0)
  model HcPreShutdownActive {
    /** One bit for each heating circuit */
    value: UCH;
  }

  /** HcPreHeatingActive */
  @inherit(r)
  @ext(0x29, 0)
  model HcPreHeatingActive {
    /** One bit for each heating circuit */
    value: UCH;
  }

  /** InitCircuit */
  @inherit(r)
  @ext(0x2b, 0)
  model InitCircuit {
    /** One bit for each heating circuit */
    value: UCH;
  }

  /** StartOneOffFilling */
  @inherit(r)
  @ext(0x2e, 0)
  model StartOneOffFilling {
    /** One bit for each heating circuit */
    value: UCH;
  }

  /** TankFlowTemperature */
  @inherit(r)
  @ext(0x2f, 0)
  model StorageFlowTemp {
    /** 1 °C resolution */
    value: temp0;
  }

  /** DhwLoadingRequest */
  @inherit(r)
  @ext(0x30, 0)
  model HwcLoadingRequest {
    /** One bit for each heating circuit */
    value: UCH;
  }

  /** DhwLoadingEnabled */
  @inherit(r)
  @ext(0x31, 0)
  model HwcLoadingEnabled {
    /** One bit for each heating circuit */
    value: onoff;
  }

  /** DhwLaggingTime */
  @inherit(r)
  @ext(0x36, 0)
  model HwcLaggingTime {
    /** 3..9min 1min Auflösung */
    value: UCH;
  }

  /** DhwLoadingDelay */
  @inherit(r)
  @ext(0x37, 0)
  model HwcLoadingDelay {
    /** 0..30min / 1min */
    value: UCH;
  }

  /** RestartBlockingTime */
  @inherit(r)
  @ext(0x38, 0)
  model RestartBlockingTime {
    value: UIN;
  }

  /** Max_Return_Temperature */
  @inherit(r)
  @ext(0x3f, 0)
  model ReturnTempMax {
    value: temp;
  }

  /** OutputTesting */
  @inherit(r)
  @ext(0x42, 0)
  model OutputTesting {
    value: onoff;
  }

  /** OneTimeCirculationSwitch */
  @inherit(r, ws)
  @ext(0x54, 0)
  model OneTimeCirSwitch {
    value: onoff;
  }

  /** Max_DHW_Temperature */
  @inherit(r)
  @ext(0x59, 0)
  model HwcTempMax {
    /** 1 °C resolution */
    value: temp0;
  }
  // ##### ZEO: Reserved #####

  /** dt1_2 */
  @inherit(r, ws)
  @ext(0x1b, 0)
  model Dt12 {
    /** Kalibrierwert T1,T2 */
    value: temp;
  }

  /** dt5_6 */
  @inherit(r, ws)
  @ext(0x1c, 0)
  model Dt56 {
    /** Kalibrierwert T5,T6 */
    value: temp;
  }

  /** TriggerCalibration_t1t2 */
  @inherit(r, ws)
  @ext(0x1d, 0)
  model TriggerCalibrationT1t2 {
    /** löst Kalibriervorgang T1,T2 aus */
    value: onoff;
  }

  /** PrimaryCircuitPumpDemandByBurner */
  @inherit(r)
  @ext(0x21, 0)
  model PrimaryCircuitPumpDemandByBoiler {
    value: onoff;
  }

  /** TriggerCalibration_t5t6 */
  @inherit(r, ws)
  @ext(0x2a, 0)
  model TriggerCalibrationT5t6 {
    /** löst Kalibriervorgang T5,T6 aus */
    value: onoff;
  }

  /** InhibitT1T2T3Counting */
  @inherit(r)
  @ext(0x39, 0)
  model InhibitT1T2T3Counting {
    /** stoppt Zeitglieder t1, t2, t3 */
    value: onoff;
  }

  /** State_Software_Code */
  @inherit(r)
  @ext(0x4e, 0)
  model StateSoftwareCode {
    value: ULG;
  }

  /** appliance code */
  @inherit(r)
  @ext(0x58, 0)
  model ApplianceCode {
    value: UCH;
  }

  /** ForcedParametersatz */
  @inherit(r)
  @ext(0xa8, 0)
  model ForcedParametersatz {
    /** 0=no forcing 1=kleinste Leistung 2=mittlere Leistung 3=max. Leistung */
    value: UCH;
  }

  /** TwoPointRegulatorHysteresis_CH */
  @inherit(r, ws)
  @ext(0xb5, 0)
  model TwoPointRegulatorHysteresisHc {
    value: temp;
  }

  /** TwoPointRegulatorHysteresis_DHW */
  @inherit(r, ws)
  @ext(0xb6, 0)
  model TwoPointRegulatorHysteresisHwc {
    value: temp;
  }

  /** ModuleDisplayedFilling */
  @inherit(r)
  @ext(0xcc, 0)
  model ModuleDisplayedFilling {
    /** Schwärzungsgrad in % */
    value: UCH;
  }

  /** P1_Voltage_38 */
  @inherit(r, ws)
  @ext(0xe4, 0)
  model P1Voltage38 {
    /** gemessene P1 Spannung bei 38% in 1/100V */
    value: UIN;
  }

  /** P2_Voltage_38 */
  @inherit(r, ws)
  @ext(0xe6, 0)
  model P2Voltage38 {
    /** gemessene P2 Spannung bei 38% in 1/100V */
    value: UIN;
  }

  /** FillBrineCircuit */
  @inherit(r)
  @ext(0xf6, 0)
  model FillSourceCircuit {
    value: onoff;
  }

  /** DeaerateBrineCircuit */
  @inherit(r)
  @ext(0xf7, 0)
  model DeaerateSourceCircuit {
    value: onoff;
  }

  /** Ymin */
  @inherit(r)
  @ext(0xfb, 0)
  model Ymin {
    /** PI-Regelung: Ymin */
    value: UCH;
  }

  /** Ymax */
  @inherit(r)
  @ext(0xfc, 0)
  model Ymax {
    /** PI-Regelung: Ymax */
    value: UCH;
  }

  /** P_Band */
  @inherit(r)
  @ext(0xfd, 0)
  model BandPress {
    /** PI-Regelung: Xp */
    value: temp;
  }

  /** FillDearatePrimCircuit */
  @inherit(r)
  @ext(0xfe, 0)
  model FillDearatePrimCircuit {
    value: UCH;
  }
  // ##### ZEO: Timers #####

  /** t1 */
  @inherit(r)
  @ext(0x6d, 0)
  model Timer1 {
    /** verbleibende Zeit mit Kleinstlast in s */
    value: ULG;
  }

  /** t2 */
  @inherit(r)
  @ext(0x6e, 0)
  model Timer2 {
    /** verbleibende Zeit mit mittlerer Leistung in s */
    value: ULG;
  }

  /** t3 */
  @inherit(r)
  @ext(0x6f, 0)
  model Timer3 {
    /** verbleibende Zeit bis Umschaltung in Direktheizbetrieb in s */
    value: ULG;
  }

  /** ZeitgliedAusgleichszeit1 */
  @inherit(r)
  @ext(0x75, 0)
  model ZeitgliedAusgleichszeit1 {
    /** in Sekunden */
    value: ULG;
  }

  /** ZeitgliedAusgleichszeit2 */
  @inherit(r)
  @ext(0x76, 0)
  model ZeitgliedAusgleichszeit2 {
    /** in Sekunden */
    value: ULG;
  }

  /** ZeitgliedMaxLaufzeit */
  @inherit(r, ws)
  @ext(0x7e, 0)
  model ZeitgliedMaxLaufzeit {
    /** des Primärkreisumschalters in Sekunden */
    value: ULG;
  }

  /** PrimPumpPostrunTimer */
  @inherit(r)
  @ext(0xa6, 0)
  model PrimPumpPostrunTimer {
    /** in Sekunden */
    value: UIN;
  }

  /** PrimPumpPostrunTime */
  @inherit(r)
  @ext(0xaa, 0)
  model PrimPumpPostrunTime {
    /** in Sekunden */
    value: UIN;
  }

  /** Ausgleichszeit1Dauer */
  @inherit(r)
  @ext(0xab, 0)
  model Ausgleichszeit1Dauer {
    /** in Sekunden */
    value: UIN;
  }

  /** ParamSatz_1_Ausgleichszeit1Dauer */
  @inherit(r, ws)
  @ext(0xab, 0x2)
  model ParamSatz1Ausgleichszeit1Dauer {
    /** in Sekunden */
    value: UIN;
  }

  /** ParamSatz_2_Ausgleichszeit1Dauer */
  @inherit(r, ws)
  @ext(0xab, 0x4)
  model ParamSatz2Ausgleichszeit1Dauer {
    /** in Sekunden */
    value: UIN;
  }

  /** ParamSatz_3_Ausgleichszeit1Dauer */
  @inherit(r, ws)
  @ext(0xab, 0x6)
  model ParamSatz3Ausgleichszeit1Dauer {
    /** in Sekunden */
    value: UIN;
  }

  /** t1Dauer */
  @inherit(r, ws)
  @ext(0xac, 0)
  model T1Dauer {
    /** in Minuten */
    value: UCH;
  }

  /** t2Dauer */
  @inherit(r, ws)
  @ext(0xad, 0)
  model T2Dauer {
    /** in Minuten */
    value: UCH;
  }

  /** t3Dauer */
  @inherit(r, ws)
  @ext(0xae, 0)
  model T3Dauer {
    /** in Minuten */
    value: UCH;
  }

  /** RestartBlockingTimer */
  @inherit(r)
  @ext(0xb2, 0)
  model RestartBlockingTimer {
    value: UIN;
  }

  /** VUVPumpLockTime */
  @inherit(r, ws)
  @ext(0xe0, 0)
  model VUVPumpLockTime {
    /** time to block pump when VUV moves */
    value: UCH;
  }

  /** Z_Hz_nach */
  @inherit(r)
  @ext(0xe1, 0)
  model ZHzNach {
    /** Nachlaufzeit Heizpumpe/min */
    value: UCH;
  }

  /** ParamSatz_AusglZeit2 */
  @inherit(r)
  @ext(0xe7, 0)
  model ParamSatzAusglZeit2 {
    /** in Sekunden */
    value: UIN;
  }

  /** MaxLaufzeitDauer */
  @inherit(r)
  @ext(0xe8, 0)
  model LaufzeitDauerMax {
    /** des Primärkreisumschalters */
    value: UCH;
  }

  /** ParamSatz_1_Ausgleichszeit2Dauer */
  @inherit(r)
  @ext(0xe7, 0x2)
  model ParamSatz1Ausgleichszeit2Dauer {
    /** in Sekunden */
    value: UIN;
  }

  /** ParamSatz_2_Ausgleichszeit2Dauer */
  @inherit(r)
  @ext(0xe7, 0x4)
  model ParamSatz2Ausgleichszeit2Dauer {
    /** in Sekunden */
    value: UIN;
  }

  /** ParamSatz_3_Ausgleichszeit2Dauer */
  @inherit(r)
  @ext(0xe7, 0x6)
  model ParamSatz3Ausgleichszeit2Dauer {
    /** in Sekunden */
    value: UIN;
  }

  /** P2Peaktime */
  @inherit(r)
  @ext(0xff, 0)
  model P2Peaktime {
    /** Dauer in sec, die P2 beim Einschalten mit 100% gefahren wird */
    value: UCH;
  }
  // ##### ZEO: Statistics #####

  /** P_P1_starts */
  @inherit(r)
  @ext(0xe9, 0)
  model P1PressStarts {
    /** Einschaltungen P1 */
    value: ULG;
  }

  /** P_P1_hours */
  @inherit(r)
  @ext(0xea, 0)
  model P1PressHours {
    /** Laufzeit P1/h */
    value: ULG;
  }

  /** P_P2_starts */
  @inherit(r)
  @ext(0xeb, 0)
  model P2PressStarts {
    /** Einschaltungen P2 */
    value: ULG;
  }

  /** P_P2_hours */
  @inherit(r)
  @ext(0xec, 0)
  model P2PressHours {
    /** Laufzeit P2/h */
    value: ULG;
  }

  /** P_H_starts */
  @inherit(r)
  @ext(0xed, 0)
  model HPressStarts {
    /** Einschaltungen P_H */
    value: ULG;
  }

  /** P_H_hours */
  @inherit(r)
  @ext(0xee, 0)
  model HPressHours {
    /** Laufzeit P_H */
    value: ULG;
  }

  /** P_c_starts */
  @inherit(r)
  @ext(0xef, 0)
  model CPressStarts {
    /** Einschaltungen P_c */
    value: ULG;
  }

  /** P_c_hours */
  @inherit(r)
  @ext(0xf0, 0)
  model CPressHours {
    /** Laufzeit P_c */
    value: ULG;
  }

  /** P_s_starts */
  @inherit(r)
  @ext(0xf1, 0)
  model SPressStarts {
    /** Einschaltungen P_s */
    value: ULG;
  }

  /** P_s_hours */
  @inherit(r)
  @ext(0xf2, 0)
  model SPressHours {
    /** Laufzeit P_s */
    value: ULG;
  }

  /** VDHW_starts */
  @inherit(r)
  @ext(0xf3, 0)
  model VHwcStarts {
    /** Einschaltungen VDHW */
    value: ULG;
  }

  /** VDHW_hours */
  @inherit(r)
  @ext(0xf4, 0)
  model VHwcHours {
    /** Laufzeit VDHW */
    value: ULG;
  }
  // ##### ZEO: Zeolite1 #####

  /** EckpunktDhb */
  @inherit(r, ws)
  @ext(0x45, 0)
  model EckpunktDhb {
    /** Grenze für Direktheizbetrieb */
    value: temp;
  }

  /** FlowTemperatureSetPoint */
  @inherit(r)
  @ext(0x50, 0)
  model FlowTempDesired {
    value: temp;
  }

  /** P_c */
  @inherit(r, ws)
  @ext(0x96, 0)
  model CPress {
    /** circulation pump */
    value: onoff;
  }

  /** F_coll */
  @inherit(r, ws)
  @ext(0x97, 0)
  model FColl {
    /** Ventilator im Luftkollektor */
    value: onoff;
  }

  /** P_s */
  @inherit(r, ws)
  @ext(0x98, 0)
  model SPress {
    /** Solarpumpe */
    value: onoff;
  }

  /** P_H */
  @inherit(r, ws)
  @ext(0x99, 0)
  model HPress {
    /** Heizungspumpe */
    value: onoff;
  }

  /** V_DHW */
  @inherit(r, ws)
  @ext(0x9a, 0)
  model HwcValve {
    /** Vorrangumschaltventil */
    value: onoff;
  }

  /** T_env */
  @inherit(r)
  @ext(0x9b, 0)
  model EnvTemp {
    /** Aussentemperatur */
    value: tempsensor;
  }

  /** T_coll_R */
  @inherit(r)
  @ext(0x9c, 0)
  model CollRTemp {
    /** Kollektorrücklauftemperatur */
    value: tempsensor;
  }

  /** TS_1 */
  @inherit(r)
  @ext(0x9d, 0)
  model S1Temp {
    /** Speicherfühler oben */
    value: tempsensor;
  }

  /** TS_2 */
  @inherit(r)
  @ext(0x9e, 0)
  model S2Temp {
    /** Speicherfühler unten */
    value: tempsensor;
  }

  /** T_coll */
  @inherit(r)
  @ext(0x9f, 0)
  model CollTemp {
    /** Kollektortemperatur */
    value: tempsensor;
  }

  /** TF_1 */
  @inherit(r)
  @ext(0xa2, 0)
  model F1Temp {
    /** Vorlauftemperatur */
    value: tempsensor;
  }

  /** TR */
  @inherit(r)
  @ext(0xa3, 0)
  model RTemp {
    /** CH return temp. */
    value: tempsensor;
  }

  /** T5 */
  @inherit(r)
  @ext(0xa4, 0)
  model T5 {
    /** °C; Desorberausgang (hinten) */
    value: tempsensor;
  }

  /** T6 */
  @inherit(r)
  @ext(0xa5, 0)
  model T6 {
    /** °C; Desorbereingang (vorne) */
    value: tempsensor;
  }

  /** DesiredSwitchPos */
  @inherit(r)
  @ext(0xaf, 0)
  model DesiredSwitchPos {
    /** 1=Des.o.B. 2=Adsorption 3=Des.m.B. 4=Direktheizbetrieb */
    value: UCH;
  }

  /** ZeoStatus */
  @inherit(r)
  @ext(0xb7, 0)
  model ZeoStatus {
    /** Bereitschaft = 0,Heizbetrieb=1,Speicherladung=2,Legionellenschutz=3,Frostschutz=4,Speicherfrostschutz=5 */
    value: UCH;
  }

  /** ActualDevicePower */
  @inherit(r)
  @ext(0xb9, 0)
  model ActualDevicePower {
    /** in kW */
    value: power;
  }

  /** FlameOn */
  @inherit(r)
  @ext(0xbe, 0)
  model FlameOn {
    /** von der BMU */
    value: onoff;
  }

  /** P_l */
  @inherit(r)
  @ext(0xc5, 0)
  model LPress {
    /** Legionellenschutz-Pumpe */
    value: onoff;
  }

  /** Hz_Vol */
  @inherit(r)
  @ext(0xc7, 0)
  model HzVol {
    /** in % */
    value: UCH;
  }

  /** t3 */
  @inherit(r)
  @ext(0xc9, 0)
  model T3 {
    /** °C; rechts */
    value: temp;
  }

  /** T4 */
  @inherit(r)
  @ext(0xca, 0)
  model T4 {
    /** °C; links */
    value: temp;
  }
  // ##### ZEO: Prozessparameter #####

  /** Parameter */
  @inherit(r)
  @ext(0x67, 0)
  model Parameter {
    value: UCH;
  }

  /** ZeitgliedAdsorption1 */
  @inherit(r)
  @ext(0x71, 0)
  model ZeitgliedAdsorption1 {
    value: ULG;
  }

  /** ParamSatz_1_Vol */
  @inherit(r, ws)
  @ext(0x7f, 0x2)
  model ParamSatz1Vol {
    /** Parametersatz 1: Volumenstrom (Ads 2) */
    value: UIN;
  }

  /** ParamSatz_2_Vol */
  @inherit(r, ws)
  @ext(0x7f, 0x4)
  model ParamSatz2Vol {
    /** Parametersatz 2: Volumenstrom (Ads 2) */
    value: UIN;
  }

  /** ParamSatz_3_Vol */
  @inherit(r, ws)
  @ext(0x7f, 0x6)
  model ParamSatz3Vol {
    /** Parametersatz 3: Volumenstrom (Ads 2) */
    value: UIN;
  }

  /** ParamSatz_1_dTads_end */
  @inherit(r, ws)
  @ext(0x80, 0x2)
  model ParamSatz1DTadsEnd {
    /** Parametersatz 1: Dauer (Ads 1) */
    value: temp;
  }

  /** ParamSatz_2_dTads_end */
  @inherit(r, ws)
  @ext(0x80, 0x4)
  model ParamSatz2DTadsEnd {
    /** Parametersatz 2: Dauer (Ads 1) */
    value: temp;
  }

  /** ParamSatz_3_dTads_end */
  @inherit(r, ws)
  @ext(0x80, 0x6)
  model ParamSatz3DTadsEnd {
    /** Parametersatz 3: Dauer (Ads 1) */
    value: temp;
  }

  /** ParamSatz_1_Zeit */
  @inherit(r, ws)
  @ext(0x81, 0x2)
  model ParamSatz1Zeit {
    /** Parametersatz 1: Adsorptionsende (Temp.Differenz) */
    value: UIN;
  }

  /** ParamSatz_2_Zeit */
  @inherit(r, ws)
  @ext(0x81, 0x4)
  model ParamSatz2Zeit {
    /** Parametersatz 2: Adsorptionsende (Temp.Differenz) */
    value: UIN;
  }

  /** ParamSatz_3_Zeit */
  @inherit(r, ws)
  @ext(0x81, 0x6)
  model ParamSatz3Zeit {
    /** Parametersatz 3: Adsorptionsende (Temp.Differenz) */
    value: UIN;
  }

  /** Tdes_soll */
  @inherit(r)
  @ext(0x84, 0)
  model TdesSoll {
    /** °C */
    value: temp;
  }

  /** d_um_3 */
  @inherit(r)
  @ext(0xe5, 0)
  model DUm3 {
    /** Offset Desorptionsendtemperatur */
    value: temp;
  }
  // ##### ZEO: neu #####

  /** InstallAssistantFinished */
  @inherit(r, ws)
  @ext(0x40, 0)
  model InstallAssistantFinished {
    value: onoff;
  }

  /** HeatingPumpOverrunDuration */
  @inherit(r, ws)
  @ext(0, 1)
  model HeatingPumpOverrunDuration {
    value: UIN;
  }

  /** HeatingPumpKickDuration */
  @inherit(r, ws)
  @ext(1, 1)
  model HeatingPumpKickDuration {
    value: UIN;
  }

  /** HeatingPumpKickPause */
  @inherit(r, ws)
  @ext(0x2, 1)
  model HeatingPumpKickPause {
    value: UIN;
  }

  /** HeatingPumpMaxPwm */
  @inherit(r, ws)
  @ext(0x3, 1)
  model HeatingPumpMaxPwm {
    /** in % */
    value: UCH;
  }

  /** HeatingPumpMinPwm */
  @inherit(r, ws)
  @ext(0x4, 1)
  model HeatingPumpMinPwm {
    /** in % */
    value: UCH;
  }

  /** HeatingPumpFaktor */
  @inherit(r, ws)
  @ext(0x5, 1)
  model HeatingPumpFaktor {
    /** % pro Kelvin Regelabweichung */
    value: UCH;
  }

  /** SHU */
  @inherit(r)
  @ext(0x6, 1)
  model SHU {
    /** aktiviert/deaktiviert die SHU-Funktionalität */
    value: onoff;
  }

  /** SVUV1 */
  @inherit(r)
  @ext(0x7, 1)
  model SVUV1 {
    /** Sole-Vuv1 */
    value: onoff;
  }

  /** SVUV2 */
  @inherit(r)
  @ext(0x8, 1)
  model SVUV2 {
    /** Sole-Vuv2 */
    value: onoff;
  }

  /** Solepumpenleistung_SHU */
  @inherit(r, ws)
  @ext(0x9, 1)
  model SolepumpenleistungSHU {
    /** Solepumpenleistung während SHU */
    value: UCH;
  }

  /** Solepumpenleistung_Desorption */
  @inherit(r, ws)
  @ext(0xa, 1)
  model SolepumpenleistungDesorption {
    /** Solepumpenleistung während Desorption */
    value: UCH;
  }

  /** Solepumpenleistung_Adsorption */
  @inherit(r, ws)
  @ext(0xb, 1)
  model SolepumpenleistungAdsorption {
    /** Solepumpenleistung während Adsorption */
    value: UCH;
  }

  /** dHR_aus */
  @inherit(r, ws)
  @ext(0xc, 1)
  model DHRAus {
    /** delta-Rücklauftemp für SHU */
    value: temp;
  }

  /** Tvmax */
  @inherit(r)
  @ext(0xd, 1)
  model Tvmax {
    value: temp;
  }

  /** not_tested_yet */
  @inherit(r, ws)
  @ext(0xe, 1)
  model NotTestedYet {
    /** Merker für erfolgreichen Selbsttest */
    value: onoff;
  }

  /** startup_test */
  @inherit(r)
  @ext(0xf, 1)
  model StartupTest {
    /** löst den selbsttest aus */
    value: onoff;
  }

  /** ZeitgliedStartupTest */
  @inherit(r)
  @ext(0x10, 1)
  model ZeitgliedStartupTest {
    /** aktuelle Selbsttestzeit */
    value: UCH;
  }

  /** ZeitgliedTestDesDauer */
  @inherit(r)
  @ext(0x11, 1)
  model ZeitgliedTestDesDauer {
    /** in sec */
    value: UIN;
  }

  /** ZeitgliedTestAdsDauer */
  @inherit(r)
  @ext(0x12, 1)
  model ZeitgliedTestAdsDauer {
    /** in sec */
    value: UIN;
  }

  /** startup_test_fehler */
  @inherit(r, ws)
  @ext(0x13, 1)
  model StartupTestFehler {
    /** zeigt Fehler im selbsttest an */
    value: onoff;
  }

  /** ExtChPump */
  @inherit(r)
  @ext(0x14, 1)
  model ExtChPump {
    /** s. Mantis 7915 */
    value: onoff;
  }

  /** Max_dT */
  @inherit(r, ws)
  @ext(0x15, 1)
  model DTMax {
    /** für die berechnung von Tvmax */
    value: temp;
  }

  /** Max_dVT */
  @inherit(r)
  @ext(0x16, 1)
  model DVTMax {
    /** für die berechnung von Tvmax */
    value: temp;
  }

  /** StartupTestTempDelta */
  @inherit(r, ws)
  @ext(0x17, 1)
  model StartupTestTempDelta {
    /** Nötige Temp.differenz für selbsttest (Mantis 8022) in Kelvin */
    value: temp0;
  }

  /** SM_startup_test_state */
  @inherit(r)
  @ext(0x18, 1)
  model SMStartupTestState {
    /** mantis 8021 */
    value: UCH;
  }

  /** dHR_ein */
  @inherit(r, ws)
  @ext(0x19, 1)
  model DHREin {
    /** delta-Rücklauftemp für SHU */
    value: temp;
  }

  /** dT_schnell */
  @inherit(r, ws)
  @ext(0x1a, 1)
  model DTSchnell {
    /** Nötige Temp.differenz für sofortigen DHB (Mantis 8305) */
    value: UCH;
  }
}
