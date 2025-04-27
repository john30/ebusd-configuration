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
  // ##### ZEO: Zeolite #####

  /** EnergyDemand: vom UI */
  @ext(0x27, 0)
  model EnergyDemand is ReadonlyRegister<onoff>;

  /** BurnerDemand: von der BMU */
  @ext(0x4f, 0)
  model BoilerDemand is ReadonlyRegister<onoff>;

  /** P_B1: Pumpe Kondensatorkreis */
  @ext(0x5c, 0)
  model B1Press is ReadonlyRegister<onoff>;

  /** PrimaryCircuitPump2Power: aktuelle Leistung in % */
  @ext(0x5f, 0)
  model PrimaryCircuitPump2Power is ReadonlyRegister<UIN>;

  /** P_B2: Pumpe Umweltkreis */
  @ext(0x60, 0)
  model B2Press is ReadonlyRegister<UCH>;

  /** SM_PrimaryCircuitCycle_OKState: Prozesszustand */
  @ext(0x62, 0)
  model SMPrimaryCircuitCycleOKState is ReadonlyRegister<UCH>;

  /** Pos1: Umschalterposition Direktheizbetrieb */
  @ext(0x65, 0)
  model Pos1 is ReadonlyRegister<onoff>;

  /** Pos2: Umschalterposition Desorption mit Bypass */
  @ext(0x66, 0)
  model Pos2 is ReadonlyRegister<onoff>;

  /** PrimaryCircuitCycleState */
  @ext(0x68, 0)
  model PrimaryCircuitCycleState is ReadonlyRegister<UCH>;

  /** Ventilatorfreigabe: Kollektorventilator */
  @ext(0x6a, 0)
  model Ventilatorfreigabe is ReadonlyRegister<onoff>;

  /** Volumenstrom_P_P1: in % */
  @ext(0x6b, 0)
  model VolumenstromPumpP1 is ReadonlyRegister<UIN>;

  /** Volumenstrom_P_P2: in % */
  @ext(0x6c, 0)
  model VolumenstromPumpP2 is ReadonlyRegister<UIN>;

  /** man_weiter */
  @ext(0x70, 0)
  model ManWeiter is ServiceRegister<onoff>;

  /** W_Anfo */
  @ext(0x72, 0)
  model WAnfo is ReadonlyRegister<onoff>;

  /** Quelle: 1=DHB 2=Kollektorbetrieb 3=Wärmetauscherbetrieb */
  @ext(0x73, 0)
  model Quelle is ReadonlyRegister<UCH>;

  /** PrimaryCircuitPumpsControlState */
  @ext(0x74, 0)
  model PrimaryCircuitPumpsControlState is ReadonlyRegister<UCH>;

  /** V_Pl: Primärkreisumschalter Linkslauf */
  @ext(0x77, 0)
  model PlValve is ReadonlyRegister<onoff>;

  /** V_Pr: Primärkreisumschalter Rechtslauf */
  @ext(0x78, 0)
  model PrValve is ReadonlyRegister<onoff>;

  /** testbetrieb */
  @ext(0x7a, 0)
  model Testbetrieb is ReadonlyRegister<onoff>;

  /** BW_Anfo */
  @ext(0x7b, 0)
  model HwcAnfo is ReadonlyRegister<onoff>;

  /** Br_Anfo: Ansteuerung Gasventil */
  @ext(0x82, 0)
  model BrAnfo is ReadonlyRegister<onoff>;

  /** DesiredPositionReached */
  @ext(0x83, 0)
  model DesiredPositionReached is ReadonlyRegister<onoff>;

  /** GFA_Stoerung */
  @ext(0x85, 0)
  model GFAStoerung is ReadonlyRegister<onoff>;

  /** Tads_aus: °C */
  @ext(0x86, 0)
  model TadsAus is ReadonlyRegister<temp>;

  /** MSW_max: in % */
  @ext(0x88, 0)
  model MSWMax is ReadonlyRegister<UCH>;

  /** Tdes_ein: °C */
  @ext(0x89, 0)
  model TdesEin is ReadonlyRegister<temp>;

  /** ActualEnvironmentalPower: in kW (Näherungswert) */
  @ext(0x8a, 0)
  model ActualEnvironmentalPower is ReadonlyRegister<power>;

  /** PWT_Soll: °C */
  @ext(0x8b, 0)
  model PWTSoll is ReadonlyRegister<temp>;

  /** Prim_Vol: in % */
  @ext(0x8c, 0)
  model PrimVol is ReadonlyRegister<UCH>;

  /** Tsole_ein: °C; hinten */
  @ext(0x8f, 0)
  model TsoleEin is ReadonlyRegister<tempsensor>;

  /** Tsole_aus: °C; vorne */
  @ext(0x90, 0)
  model TsoleAus is ReadonlyRegister<tempsensor>;

  /** PL_H: Umschalterposition Desorption ohne Bypass */
  @ext(0x91, 0)
  model PLH is ReadonlyRegister<onoff>;

  /** PL_P: Umschalterposition Adsorption */
  @ext(0x92, 0)
  model PLPump is ReadonlyRegister<onoff>;

  /** PrimaryCircuitPump1Power: in % */
  @ext(0xa7, 0)
  model PrimaryCircuitPump1Power is ReadonlyRegister<UIN>;

  /** PrimaryCircuitSwitchControlState */
  @ext(0xa9, 0)
  model PrimaryCircuitSwitchControlState is ReadonlyRegister<UCH>;

  /** PrimaryCircuitPump1PowerCorrected */
  @ext(0xb3, 0)
  model PrimaryCircuitPump1PowerCorrected is ReadonlyRegister<UIN>;

  /** PrimaryCircuitPump2PowerCorrected */
  @ext(0xb4, 0)
  model PrimaryCircuitPump2PowerCorrected is ReadonlyRegister<UIN>;

  /** tdes_um */
  @ext(0xba, 0)
  model TdesUm is ReadonlyRegister<temp>;

  /** Q_zeo: in kWh */
  @ext(0xdd, 0)
  model QZeo is ReadonlyRegister<UIN>;

  /** V_P_B1: Durchflussmenge durch Verdampfer */
  @ext(0xde, 0)
  model PumpB1Valve is ReadonlyRegister<UIN>;

  /** Z_Sp_nach: Nachlaufzeit Speicherpumpe/min */
  @ext(0xdf, 0)
  model ZSpNach is ReadonlyRegister<UCH>;

  /** Partload: 0..100% MSW_max in Testbetrieb */
  @ext(0xf8, 0)
  model Teillast is ReadonlyRegister<UCH>;

  /** PrimaryCircuitMicroSwitchPattern: 1=Des.o.B. 2=Adsorption 4=Des.m.B. 8=Direktheizbetrieb */
  @ext(0xf9, 0)
  model PrimaryCircuitMicroSwitchPattern is ReadonlyRegister<UCH>;
  // ##### ZEO: Global #####

  /** Code1Code2Valid */
  @ext(1, 0)
  model Code1Code2Valid is ReadonlyRegister<onoff>;

  /** DCF status */
  @ext(0x3a, 0)
  model DcfStatus is ReadonlyRegister<UCH>;

  /** MaxStackeBUSTask */
  @ext(0x3b, 0)
  model StackeBUSTaskMax is ReadonlyRegister<UCH>;

  /** MaxStackMainTask */
  @ext(0x3c, 0)
  model StackMainTaskMax is ReadonlyRegister<UCH>;

  /** MaxStackLifeCheckTask */
  @ext(0x3d, 0)
  model StackLifeCheckTaskMax is ReadonlyRegister<UCH>;

  /** Error_Actual */
  @ext(0x46, 0)
  model ErrorActual is ReadonlyRegister<UCH>;

  /** Error_Actual */
  @ext(0x46, 0x2)
  model Global_ErrorActual is ReadonlyRegister<UCH>;

  /** Error_History */
  @ext(0x47, 0)
  model ErrorHistory is ReadonlyRegister<UCH>;

  /** Error_History */
  @ext(0x47, 0x2)
  model Global_ErrorHistory is ReadonlyRegister<UCH>;

  /** Reset */
  @ext(0x48, 0)
  model Reset is ReadonlyRegister<onoff>;

  /** RebootCounter: incremented each time Firmware boots */
  @ext(0x51, 0)
  model RebootCounter is ReadonlyRegister<UIN>;

  /** Anlegethermostat */
  @ext(0xa1, 0)
  model Anlegethermostat is ReadonlyRegister<onoff>;
  // ##### ZEO: BMR #####

  /** Holiday function active */
  @ext(0x2, 0)
  model IsInHoliday is ReadonlyRegister<UCH>;

  /** OutsideTempSensorCorrection: 0,5°C resolution */
  @ext(0x8, 0)
  model OutsideTempCorrection is ReadonlyRegister<temps>;

  /** DesiredHolidayTemperature: 1/2 °C resolution */
  @ext(0xf, 0)
  model HolidayTempDesired is ReadonlyRegister<temp1>;

  /** Heating curve: 1/100 resolution */
  @ext(0x10, 0)
  model HeatingCurve is ReadonlyRegister<curve>;

  /** OtShutdownLimit: 1 °C resolution Bedarfsabhängige Heizungsabschaltung */
  @ext(0x11, 0)
  model OtShutdownLimit is ReadonlyRegister<UCH>;

  /** BoilerMaxPreShutdown: 15..120min */
  @ext(0x14, 0)
  model BoilerMaxPreShutdown is ReadonlyRegister<UCH>;

  /** HcFlowIncrease */
  @ext(0x15, 0)
  model HcFlowIncrease is ReadonlyRegister<UCH>;

  /** CircuitPeriods */
  @ext(0x19, 0)
  model CircuitPeriods is ReadonlyRegister<UCH>;

  /** LegioProtectionEnabled: Global for all DHW circuits */
  @ext(0x1a, 0)
  model LegioProtectionEnabled is ReadonlyRegister<onoff>;

  /** IsInTankFilling */
  @ext(0x20, 0)
  model IsInStorageFilling is ReadonlyRegister<onoff>;

  /** FrostProtectDelay: 1h */
  @ext(0x22, 0)
  model FrostProtectDelay is ReadonlyRegister<UCH>;

  /** IsInParty */
  @ext(0x26, 0)
  model IsInParty is ReadonlyRegister<UCH>;

  /** HcPreShutdownActive: One bit for each heating circuit */
  @ext(0x28, 0)
  model HcPreShutdownActive is ReadonlyRegister<UCH>;

  /** HcPreHeatingActive: One bit for each heating circuit */
  @ext(0x29, 0)
  model HcPreHeatingActive is ReadonlyRegister<UCH>;

  /** InitCircuit: One bit for each heating circuit */
  @ext(0x2b, 0)
  model InitCircuit is ReadonlyRegister<UCH>;

  /** StartOneOffFilling: One bit for each heating circuit */
  @ext(0x2e, 0)
  model StartOneOffFilling is ReadonlyRegister<UCH>;

  /** TankFlowTemperature: 1°C resolution */
  @ext(0x2f, 0)
  model StorageFlowTemp is ReadonlyRegister<temp0>;

  /** DhwLoadingRequest: One bit for each heating circuit */
  @ext(0x30, 0)
  model HwcLoadingRequest is ReadonlyRegister<UCH>;

  /** DhwLoadingEnabled: One bit for each heating circuit */
  @ext(0x31, 0)
  model HwcLoadingEnabled is ReadonlyRegister<onoff>;

  /** DhwLaggingTime: 3..9min 1min Auflösung */
  @ext(0x36, 0)
  model HwcLaggingTime is ReadonlyRegister<UCH>;

  /** DhwLoadingDelay: 0..30min / 1min */
  @ext(0x37, 0)
  model HwcLoadingDelay is ReadonlyRegister<UCH>;

  /** RestartBlockingTime */
  @ext(0x38, 0)
  model RestartBlockingTime is ReadonlyRegister<UIN>;

  /** Max_Return_Temperature */
  @ext(0x3f, 0)
  model ReturnTempMax is ReadonlyRegister<temp>;

  /** OutputTesting */
  @ext(0x42, 0)
  model OutputTesting is ReadonlyRegister<onoff>;

  /** OneTimeCirculationSwitch */
  @ext(0x54, 0)
  model OneTimeCirSwitch is ServiceRegister<onoff>;

  /** Max_DHW_Temperature: 1°C resolution */
  @ext(0x59, 0)
  model HwcTempMax is ReadonlyRegister<temp0>;
  // ##### ZEO: Reserved #####

  /** dt1_2: Kalibrierwert T1,T2 */
  @ext(0x1b, 0)
  model Dt12 is ServiceRegister<temp>;

  /** dt5_6: Kalibrierwert T5,T6 */
  @ext(0x1c, 0)
  model Dt56 is ServiceRegister<temp>;

  /** TriggerCalibration_t1t2: löst Kalibriervorgang T1,T2 aus */
  @ext(0x1d, 0)
  model TriggerCalibrationT1t2 is ServiceRegister<onoff>;

  /** PrimaryCircuitPumpDemandByBurner */
  @ext(0x21, 0)
  model PrimaryCircuitPumpDemandByBoiler is ReadonlyRegister<onoff>;

  /** TriggerCalibration_t5t6: löst Kalibriervorgang T5,T6 aus */
  @ext(0x2a, 0)
  model TriggerCalibrationT5t6 is ServiceRegister<onoff>;

  /** InhibitT1T2T3Counting: stoppt Zeitglieder t1, t2, t3 */
  @ext(0x39, 0)
  model InhibitT1T2T3Counting is ReadonlyRegister<onoff>;

  /** State_Software_Code */
  @ext(0x4e, 0)
  model StateSoftwareCode is ReadonlyRegister<ULG>;

  /** Appliance_Code */
  @ext(0x58, 0)
  model ApplianceCode is ReadonlyRegister<UCH>;

  /** ForcedParametersatz: 0=no forcing 1=kleinste Leistung 2=mittlere Leistung 3=max. Leistung */
  @ext(0xa8, 0)
  model ForcedParametersatz is ReadonlyRegister<UCH>;

  /** TwoPointRegulatorHysteresis_CH */
  @ext(0xb5, 0)
  model TwoPointRegulatorHysteresisHc is ServiceRegister<temp>;

  /** TwoPointRegulatorHysteresis_DHW */
  @ext(0xb6, 0)
  model TwoPointRegulatorHysteresisHwc is ServiceRegister<temp>;

  /** ModuleDisplayedFilling: Schwärzungsgrad in % */
  @ext(0xcc, 0)
  model ModuleDisplayedFilling is ReadonlyRegister<UCH>;

  /** P1_Voltage_38: gemessene P1 Spannung bei 38% in 1/100V */
  @ext(0xe4, 0)
  model P1Voltage38 is ServiceRegister<UIN>;

  /** P2_Voltage_38: gemessene P2 Spannung bei 38% in 1/100V */
  @ext(0xe6, 0)
  model P2Voltage38 is ServiceRegister<UIN>;

  /** FillBrineCircuit */
  @ext(0xf6, 0)
  model FillSourceCircuit is ReadonlyRegister<onoff>;

  /** DeaerateBrineCircuit */
  @ext(0xf7, 0)
  model DeaerateSourceCircuit is ReadonlyRegister<onoff>;

  /** PI-Regelung: Ymin */
  @ext(0xfb, 0)
  model Ymin is ReadonlyRegister<UCH>;

  /** PI-Regelung: Ymax */
  @ext(0xfc, 0)
  model Ymax is ReadonlyRegister<UCH>;

  /** P_Band: PI-Regelung: Xp */
  @ext(0xfd, 0)
  model BandPress is ReadonlyRegister<temp>;

  /** FillDearatePrimCircuit */
  @ext(0xfe, 0)
  model FillDearatePrimCircuit is ReadonlyRegister<UCH>;
  // ##### ZEO: Timers #####

  /** t1: verbleibende Zeit mit Kleinstlast in s */
  @ext(0x6d, 0)
  model Timer1 is ReadonlyRegister<ULG>;

  /** t2: verbleibende Zeit mit mittlerer Leistung in s */
  @ext(0x6e, 0)
  model Timer2 is ReadonlyRegister<ULG>;

  /** t3: verbleibende Zeit bis Umschaltung in Direktheizbetrieb in s */
  @ext(0x6f, 0)
  model Timer3 is ReadonlyRegister<ULG>;

  /** ZeitgliedAusgleichszeit1: in Sekunden */
  @ext(0x75, 0)
  model ZeitgliedAusgleichszeit1 is ReadonlyRegister<ULG>;

  /** ZeitgliedAusgleichszeit2: in Sekunden */
  @ext(0x76, 0)
  model ZeitgliedAusgleichszeit2 is ReadonlyRegister<ULG>;

  /** ZeitgliedMaxLaufzeit: des Primärkreisumschalters in Sekunden */
  @ext(0x7e, 0)
  model ZeitgliedMaxLaufzeit is ServiceRegister<ULG>;

  /** PrimPumpPostrunTimer: in Sekunden */
  @ext(0xa6, 0)
  model PrimPumpPostrunTimer is ReadonlyRegister<UIN>;

  /** PrimPumpPostrunTime: in Sekunden */
  @ext(0xaa, 0)
  model PrimPumpPostrunTime is ReadonlyRegister<UIN>;

  /** Ausgleichszeit1Dauer: in Sekunden */
  @ext(0xab, 0)
  model Ausgleichszeit1Dauer is ReadonlyRegister<UIN>;

  /** ParamSatz_1_Ausgleichszeit1Dauer: in Sekunden */
  @ext(0xab, 0x2)
  model ParamSatz1Ausgleichszeit1Dauer is ServiceRegister<UIN>;

  /** ParamSatz_2_Ausgleichszeit1Dauer: in Sekunden */
  @ext(0xab, 0x4)
  model ParamSatz2Ausgleichszeit1Dauer is ServiceRegister<UIN>;

  /** ParamSatz_3_Ausgleichszeit1Dauer: in Sekunden */
  @ext(0xab, 0x6)
  model ParamSatz3Ausgleichszeit1Dauer is ServiceRegister<UIN>;

  /** t1Dauer: in Minuten */
  @ext(0xac, 0)
  model T1Dauer is ServiceRegister<UCH>;

  /** t2Dauer: in Minuten */
  @ext(0xad, 0)
  model T2Dauer is ServiceRegister<UCH>;

  /** t3Dauer: in Minuten */
  @ext(0xae, 0)
  model T3Dauer is ServiceRegister<UCH>;

  /** RestartBlockingTimer */
  @ext(0xb2, 0)
  model RestartBlockingTimer is ReadonlyRegister<UIN>;

  /** VUVPumpLockTime: time to block pump when VUV moves */
  @ext(0xe0, 0)
  model VUVPumpLockTime is ServiceRegister<UCH>;

  /** Z_Hz_nach: Nachlaufzeit Heizpumpe/min */
  @ext(0xe1, 0)
  model ZHzNach is ReadonlyRegister<UCH>;

  /** ParamSatz_AusglZeit2: in Sekunden */
  @ext(0xe7, 0)
  model ParamSatzAusglZeit2 is ReadonlyRegister<UIN>;

  /** MaxLaufzeitDauer: des Primärkreisumschalters */
  @ext(0xe8, 0)
  model LaufzeitDauerMax is ReadonlyRegister<UCH>;

  /** ParamSatz_1_Ausgleichszeit2Dauer: in Sekunden */
  @ext(0xe7, 0x2)
  model ParamSatz1Ausgleichszeit2Dauer is ReadonlyRegister<UIN>;

  /** ParamSatz_2_Ausgleichszeit2Dauer: in Sekunden */
  @ext(0xe7, 0x4)
  model ParamSatz2Ausgleichszeit2Dauer is ReadonlyRegister<UIN>;

  /** ParamSatz_3_Ausgleichszeit2Dauer: in Sekunden */
  @ext(0xe7, 0x6)
  model ParamSatz3Ausgleichszeit2Dauer is ReadonlyRegister<UIN>;

  /** P2Peaktime: Dauer in sec, die P2 beim Einschalten mit 100% gefahren wird */
  @ext(0xff, 0)
  model P2Peaktime is ReadonlyRegister<UCH>;
  // ##### ZEO: Statistics #####

  /** P_P1_starts: Einschaltungen P1 */
  @ext(0xe9, 0)
  model P1PressStarts is ReadonlyRegister<ULG>;

  /** P_P1_hours: Laufzeit P1/h */
  @ext(0xea, 0)
  model P1PressHours is ReadonlyRegister<ULG>;

  /** P_P2_starts: Einschaltungen P2 */
  @ext(0xeb, 0)
  model P2PressStarts is ReadonlyRegister<ULG>;

  /** P_P2_hours: Laufzeit P2/h */
  @ext(0xec, 0)
  model P2PressHours is ReadonlyRegister<ULG>;

  /** P_H_starts: Einschaltungen P_H */
  @ext(0xed, 0)
  model HPressStarts is ReadonlyRegister<ULG>;

  /** P_H_hours: Laufzeit P_H */
  @ext(0xee, 0)
  model HPressHours is ReadonlyRegister<ULG>;

  /** P_c_starts: Einschaltungen P_c */
  @ext(0xef, 0)
  model CPressStarts is ReadonlyRegister<ULG>;

  /** P_c_hours: Laufzeit P_c */
  @ext(0xf0, 0)
  model CPressHours is ReadonlyRegister<ULG>;

  /** P_s_starts: Einschaltungen P_s */
  @ext(0xf1, 0)
  model SPressStarts is ReadonlyRegister<ULG>;

  /** P_s_hours: Laufzeit P_s */
  @ext(0xf2, 0)
  model SPressHours is ReadonlyRegister<ULG>;

  /** VDHW_starts: Einschaltungen VDHW */
  @ext(0xf3, 0)
  model VHwcStarts is ReadonlyRegister<ULG>;

  /** VDHW_hours: Laufzeit VDHW */
  @ext(0xf4, 0)
  model VHwcHours is ReadonlyRegister<ULG>;
  // ##### ZEO: Zeolite1 #####

  /** EckpunktDhb: Grenze für Direktheizbetrieb */
  @ext(0x45, 0)
  model EckpunktDhb is ServiceRegister<temp>;

  /** FlowTemperatureSetPoint */
  @ext(0x50, 0)
  model FlowTempDesired is ReadonlyRegister<temp>;

  /** P_c: Circulation pump */
  @ext(0x96, 0)
  model CPress is ServiceRegister<onoff>;

  /** F_coll: Ventilator im Luftkollektor */
  @ext(0x97, 0)
  model FColl is ServiceRegister<onoff>;

  /** P_s: Solarpumpe */
  @ext(0x98, 0)
  model SPress is ServiceRegister<onoff>;

  /** P_H: Heizungspumpe */
  @ext(0x99, 0)
  model HPress is ServiceRegister<onoff>;

  /** V_DHW: Vorrangumschaltventil */
  @ext(0x9a, 0)
  model HwcValve is ServiceRegister<onoff>;

  /** T_env: Aussentemperatur */
  @ext(0x9b, 0)
  model EnvTemp is ReadonlyRegister<tempsensor>;

  /** T_coll_R: Kollektorrücklauftemperatur */
  @ext(0x9c, 0)
  model CollRTemp is ReadonlyRegister<tempsensor>;

  /** TS_1: Speicherfühler oben */
  @ext(0x9d, 0)
  model S1Temp is ReadonlyRegister<tempsensor>;

  /** TS_2: Speicherfühler unten */
  @ext(0x9e, 0)
  model S2Temp is ReadonlyRegister<tempsensor>;

  /** T_coll: Kollektortemperatur */
  @ext(0x9f, 0)
  model CollTemp is ReadonlyRegister<tempsensor>;

  /** TF_1: Vorlauftemperatur */
  @ext(0xa2, 0)
  model F1Temp is ReadonlyRegister<tempsensor>;

  /** TR: CH return temp. */
  @ext(0xa3, 0)
  model RTemp is ReadonlyRegister<tempsensor>;

  /** T5: °C; Desorberausgang (hinten) */
  @ext(0xa4, 0)
  model T5 is ReadonlyRegister<tempsensor>;

  /** T6: °C; Desorbereingang (vorne) */
  @ext(0xa5, 0)
  model T6 is ReadonlyRegister<tempsensor>;

  /** DesiredSwitchPos: 1=Des.o.B. 2=Adsorption 3=Des.m.B. 4=Direktheizbetrieb */
  @ext(0xaf, 0)
  model DesiredSwitchPos is ReadonlyRegister<UCH>;

  /** ZeoStatus: Bereitschaft = 0,Heizbetrieb=1,Speicherladung=2,Legionellenschutz=3,Frostschutz=4,Speicherfrostschutz=5 */
  @ext(0xb7, 0)
  model ZeoStatus is ReadonlyRegister<UCH>;

  /** ActualDevicePower: in kW */
  @ext(0xb9, 0)
  model ActualDevicePower is ReadonlyRegister<power>;

  /** FlameOn: von der BMU */
  @ext(0xbe, 0)
  model FlameOn is ReadonlyRegister<onoff>;

  /** P_l: Legionellenschutz-Pumpe */
  @ext(0xc5, 0)
  model LPress is ReadonlyRegister<onoff>;

  /** Hz_Vol: in % */
  @ext(0xc7, 0)
  model HzVol is ReadonlyRegister<UCH>;

  /** T3: °C; rechts */
  @ext(0xc9, 0)
  model T3 is ReadonlyRegister<temp>;

  /** T4: °C; links */
  @ext(0xca, 0)
  model T4 is ReadonlyRegister<temp>;
  // ##### ZEO: Prozessparameter #####

  /** Parameter */
  @ext(0x67, 0)
  model Parameter is ReadonlyRegister<UCH>;

  /** ZeitgliedAdsorption1 */
  @ext(0x71, 0)
  model ZeitgliedAdsorption1 is ReadonlyRegister<ULG>;

  /** ParamSatz_1_Vol: Parametersatz 1: Volumenstrom (Ads 2) */
  @ext(0x7f, 0x2)
  model ParamSatz1Vol is ServiceRegister<UIN>;

  /** ParamSatz_2_Vol: Parametersatz 2: Volumenstrom (Ads 2) */
  @ext(0x7f, 0x4)
  model ParamSatz2Vol is ServiceRegister<UIN>;

  /** ParamSatz_3_Vol: Parametersatz 3: Volumenstrom (Ads 2) */
  @ext(0x7f, 0x6)
  model ParamSatz3Vol is ServiceRegister<UIN>;

  /** ParamSatz_1_dTads_end: Parametersatz 1: Dauer (Ads 1) */
  @ext(0x80, 0x2)
  model ParamSatz1DTadsEnd is ServiceRegister<temp>;

  /** ParamSatz_2_dTads_end: Parametersatz 2: Dauer (Ads 1) */
  @ext(0x80, 0x4)
  model ParamSatz2DTadsEnd is ServiceRegister<temp>;

  /** ParamSatz_3_dTads_end: Parametersatz 3: Dauer (Ads 1) */
  @ext(0x80, 0x6)
  model ParamSatz3DTadsEnd is ServiceRegister<temp>;

  /** ParamSatz_1_Zeit: Parametersatz 1: Adsorptionsende (Temp.Differenz) */
  @ext(0x81, 0x2)
  model ParamSatz1Zeit is ServiceRegister<UIN>;

  /** ParamSatz_2_Zeit: Parametersatz 2: Adsorptionsende (Temp.Differenz) */
  @ext(0x81, 0x4)
  model ParamSatz2Zeit is ServiceRegister<UIN>;

  /** ParamSatz_3_Zeit: Parametersatz 3: Adsorptionsende (Temp.Differenz) */
  @ext(0x81, 0x6)
  model ParamSatz3Zeit is ServiceRegister<UIN>;

  /** Tdes_soll: °C */
  @ext(0x84, 0)
  model TdesSoll is ReadonlyRegister<temp>;

  /** d_um_3: Offset Desorptionsendtemperatur */
  @ext(0xe5, 0)
  model DUm3 is ReadonlyRegister<temp>;
  // ##### ZEO: neu #####

  /** InstallAssistantFinished */
  @ext(0x40, 0)
  model InstallAssistantFinished is ServiceRegister<onoff>;

  /** HeatingPumpOverrunDuration */
  @ext(0, 1)
  model HeatingPumpOverrunDuration is ServiceRegister<UIN>;

  /** HeatingPumpKickDuration */
  @ext(1, 1)
  model HeatingPumpKickDuration is ServiceRegister<UIN>;

  /** HeatingPumpKickPause */
  @ext(0x2, 1)
  model HeatingPumpKickPause is ServiceRegister<UIN>;

  /** HeatingPumpMaxPwm: in % */
  @ext(0x3, 1)
  model HeatingPumpMaxPwm is ServiceRegister<UCH>;

  /** HeatingPumpMinPwm: in % */
  @ext(0x4, 1)
  model HeatingPumpMinPwm is ServiceRegister<UCH>;

  /** HeatingPumpFaktor: % pro Kelvin Regelabweichung */
  @ext(0x5, 1)
  model HeatingPumpFaktor is ServiceRegister<UCH>;

  /** aktiviert/deaktiviert die SHU-Funktionalität */
  @ext(0x6, 1)
  model SHU is ReadonlyRegister<onoff>;

  /** SVUV1: Sole-Vuv1 */
  @ext(0x7, 1)
  model SVUV1 is ReadonlyRegister<onoff>;

  /** SVUV2: Sole-Vuv2 */
  @ext(0x8, 1)
  model SVUV2 is ReadonlyRegister<onoff>;

  /** Solepumpenleistung_SHU: Solepumpenleistung während SHU */
  @ext(0x9, 1)
  model SolepumpenleistungSHU is ServiceRegister<UCH>;

  /** Solepumpenleistung_Desorption: Solepumpenleistung während Desorption */
  @ext(0xa, 1)
  model SolepumpenleistungDesorption is ServiceRegister<UCH>;

  /** Solepumpenleistung_Adsorption: Solepumpenleistung während Adsorption */
  @ext(0xb, 1)
  model SolepumpenleistungAdsorption is ServiceRegister<UCH>;

  /** dHR_aus: delta-Rücklauftemp für SHU */
  @ext(0xc, 1)
  model DHRAus is ServiceRegister<temp>;

  /** Tvmax */
  @ext(0xd, 1)
  model Tvmax is ReadonlyRegister<temp>;

  /** not_tested_yet: Merker für erfolgreichen Selbsttest */
  @ext(0xe, 1)
  model NotTestedYet is ServiceRegister<onoff>;

  /** startup_test: löst den selbsttest aus */
  @ext(0xf, 1)
  model StartupTest is ReadonlyRegister<onoff>;

  /** ZeitgliedStartupTest: aktuelle Selbsttestzeit */
  @ext(0x10, 1)
  model ZeitgliedStartupTest is ReadonlyRegister<UCH>;

  /** ZeitgliedTestDesDauer: in sec */
  @ext(0x11, 1)
  model ZeitgliedTestDesDauer is ReadonlyRegister<UIN>;

  /** ZeitgliedTestAdsDauer: in sec */
  @ext(0x12, 1)
  model ZeitgliedTestAdsDauer is ReadonlyRegister<UIN>;

  /** startup_test_fehler: zeigt Fehler im selbsttest an */
  @ext(0x13, 1)
  model StartupTestFehler is ServiceRegister<onoff>;

  /** ExtChPump: s. Mantis 7915 */
  @ext(0x14, 1)
  model ExtChPump is ReadonlyRegister<onoff>;

  /** Max_dT: für die berechnung von Tvmax */
  @ext(0x15, 1)
  model DTMax is ServiceRegister<temp>;

  /** Max_dVT: für die berechnung von Tvmax */
  @ext(0x16, 1)
  model DVTMax is ReadonlyRegister<temp>;

  /** StartupTestTempDelta: Nötige Temp.differenz für selbsttest (Mantis 8022) in Kelvin */
  @ext(0x17, 1)
  model StartupTestTempDelta is ServiceRegister<temp0>;

  /** SM_startup_test_state: mantis 8021 */
  @ext(0x18, 1)
  model SMStartupTestState is ReadonlyRegister<UCH>;

  /** dHR_ein: delta-Rücklauftemp für SHU */
  @ext(0x19, 1)
  model DHREin is ServiceRegister<temp>;

  /** dT_schnell: Nötige Temp.differenz für sofortigen DHB (Mantis 8305) */
  @ext(0x1a, 1)
  model DTSchnell is ServiceRegister<UCH>;
}
