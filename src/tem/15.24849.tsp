import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Tem;

// Ochsner TERRA DX 5 HCUA (TEM controller), eBUS slave 15, MF=TEM ID=24849, SW 6.05 HW 3.03.
// Reverse engineered via the direct-id scheme (GG,0x80+param,00,0x40+block); the menu-list
// ids are unreliable on this unit. Settings marked with the Fachpartner condition are only
// read while access level 04-043 is Fachpartner/OEM. Writes (0623, to master 0x10) and
// the error history (0622 chained) are included. Other Ochsner/TEM units may differ.
namespace _24849 {
  /** 6-byte parameter prefix for counters (group,value,type,unit,max) */
  model paramc {
    command: command;
    max: maxs;
  }

  enum Values_p02_053_status_waermeerzeuger {
    Abgeschaltet: 0,
    Heizbetrieb: 1,
    Vorlaufzeit_Heizbetrieb: 2,
    Extern_gesperrt_EVU: 3,
    Kuehlbetrieb: 4,
    Vorlaufzeit_Kuehlbetrieb: 5,
    Vorlaufzeit_Abtaubetrieb: 6,
    Abtaubetrieb: 7,
    Stoerung: 8,
    Abtropfen: 9,
    Abtausperrzeit: 10,
    Abtau_Vorheizung: 11,
    Abtauen_1: 12,
    Abtauen_2: 13,
    Abtauen_3: 14,
    Alarm: 15,
    Stoerung_2: 16,
    Blockiert: 17,
    TWVmax_Abschaltung: 21,
    TWVsoll_Abschaltung: 22,
    TQEmax_Abschaltung: 23,
    TQAmin_Abschaltung: 24,
    Bivalentabschaltung: 26,
    Warmwasser_Ladesperre: 27,
    Minimale_AUS_Zeit: 28,
    Minimale_EIN_Zeit: 29,
    Passivkuehlung: 36,
    Heizbetrieb_angefordert: 37,
    Kuehlbetrieb_angefordert: 38,
  }

  enum Values_p04_027_ebus_waermeerzeuger_adresse {
    kein: 0,
    WE1: 11,
    WE2: 12,
    WE3: 13,
    WE4: 14,
    WE5: 15,
    WE6: 22,
    WE7: 23,
    WE8: 24,
  }

  enum Values_p09_007_waermeerzeuger_typ {
    Kein_Waermeerzeuger_aktiv: 0,
    Waermepumpe_ohne_Kuehlfunktion: 5,
    Waermepumpe_mit_Kuehlfunktion: 6,
  }

  enum Values_p09_011_bedingte_freigabe_waermeerzeuger {
    Frei: 0,
    Gesperrt: 1,
    TA_BiP: 2,
    TA_BiP_2: 3,
  }

  enum Values_p09_074_externe_waermeerzeuger_sperre {
    nicht_gesperrt: 0,
    gesperrt: 1,
  }

  enum Values_p09_075_betriebswahl_waermeerzeuger {
    Aus: 0,
    Automatik: 1,
    Handbetrieb_Heizen: 2,
    Handbetrieb_Kuehlen: 3,
    Waermequellenpumpe: 6,
  }

  enum Values_p15_006_applikationstyp_waermepumpe {
    GMDWplus: 8,
  }

  enum Values_p02_053_status_waermeerzeuger_2 {
    Abgeschaltet: 0,
    Heizbetrieb: 1,
    Vorlaufzeit_Heizbetrieb: 2,
    Spar_Heizbetrieb: 3,
    Vorlauftemperatur_zu_hoch_niedrig: 21,
    Schaltdifferenz_Handbetrieb_ueberschritten: 22,
    Bivalentabschaltung: 26,
    Minimale_AUS_Zeit: 28,
    Minimale_EIN_Zeit: 29,
  }

  enum Values_p09_007_waermeerzeuger_typ_2 {
    Kein_Waermeerzeuger_aktiv: 0,
    Waermepumpe_ohne_Kuehlfunktion: 5,
    Waermepumpe_mit_Kuehlfunktion: 6,
    Wert_1: 1,
  }

  enum Values_p09_011_bedingte_freigabe_waermeerzeuger_2 {
    Frei: 0,
    Gesperrt: 1,
    TA_BiP: 2,
    TA_BiP_2: 3,
    WW_Mod_1: 4,
    WW_Mod_2: 5,
    WW_Mod_3: 6,
    WW_Mod_4: 7,
    TA_BiP_oder_WW_Mod_1: 8,
    TA_BiP_oder_WW_Mod_2: 9,
    TA_BiP_oder_WW_Mod_3: 10,
    TA_BiP_oder_WW_Mod_4: 11,
  }

  enum Values_p09_071_freigabe_bivalenzsperre_bei_smartgrid_zw {
    Sperre_aktiv: 0,
    Sperre_deaktiviert: 1,
  }

  enum Values_p10_076_applikationstyp_e_zusatzheizung {
    Kein_WEZ: 0,
    WEZ_im_Puffer: 1,
    WEZ_im_Vorlauf_WP: 2,
  }

  enum Values_p01_020_heizkreispumpe {
    off: 0,
    on: 1,
  }

  enum Values_p02_051_status_heizkreis {
    Abgeschaltet: 0,
    Normal_Heizbetrieb: 1,
    Spar_Heizbetrieb: 3,
    Frostschutzbetrieb: 4,
    Zwangsabnahme: 5,
    Zwangsdrosselung: 6,
    Ferienbetrieb: 7,
    Partybetrieb_Heizen: 8,
    Normal_Kuehlbetrieb: 9,
    Spar_Kuehlbetrieb: 11,
    Stoerung: 12,
    Handbetrieb: 13,
    Schutz_Kuehlbetrieb: 14,
    Partybetrieb_Kuehlen: 15,
    Austrocknung_Aufheizen: 16,
    Austrocknung_Stationaer: 17,
    Austrocknung_Auskuehlen: 18,
    Austrocknung_Endphase: 19,
    Kuehlbetrieb_extern: 22,
    Heizbetrieb_extern: 23,
  }

  enum Values_p03_050_betriebswahl_heizung {
    Standbybetrieb: 0,
    Automatik: 1,
    Normalbetrieb: 4,
    Sparbetrieb: 5,
    Handbetrieb_Heizen: 7,
  }

  enum Values_p07_005_heizkreistyp {
    _3_Punkt_Mischer: 0,
    _2_Punkt_Mischer: 1,
    Pumpkreis: 2,
    kein_Heizkreis: 3,
  }

  enum Values_p07_034_energiezwangzahl {
    kein: 0,
    negativ: 1,
    positiv: 2,
    beide: 3,
  }

  enum Values_p07_076_applikationstyp_heizkreis {
    Heizkreis_nicht_aktiv: 0,
    Pumpenkreis_ohne_Kuehlung: 1,
    Pumpenkreis_mit_Kuehlung: 2,
    Mischerkreis_ohne_Kuehlung: 3,
    Mischerkreis_mit_Kuehlung: 4,
    Mischerkreis_Heizen_Monoeinheit: 5,
    Mischerkreis_Heizen_und_Kuehlen_Monoeinheit: 6,
    Mischerkreis_Bivalent: 7,
    Mischerkreis_Bivalent_mit_Kuehlen: 8,
    Pumpenkreis_mit_Kuehlung_GLT_0_10V: 9,
  }

  enum Values_p02_052_status_warmwasserregelung {
    Abgeschaltet: 0,
    Normal_Ladebetrieb: 1,
    Komfort_Ladebetrieb: 2,
    Zwangsdrosselung: 3,
    Zwangsladung: 4,
    Stoerung: 5,
    Spar_Ladebetrieb: 8,
    Elektro_Nachladung: 10,
    Ladungsabbruch: 11,
  }

  enum Values_p05_011_modus_warmwasserladung {
    Aus: 0,
    Standard: 1,
    WW_Sollwert: 3,
    Thermostat: 4,
    Ladung_lokal: 5,
    Nachheizung: 6,
  }

  enum Values_p05_050_betriebswahl_warmwasser {
    keine_Ladung: 0,
    Automatik: 1,
    Normaltemperatur: 2,
    Gemae_Fuehlerkreis: 5,
  }

  enum Values_p05_076_applikationstyp_warmwasserbereitung {
    nicht_aktiv: 0,
    HWBW_K_mit_TVD_Ueberwachung_mit_WEP_Klemme_6: 1,
    HWBW_K_mit_TVD_Ueberwachung_mit_HKP_2_Klemme_8: 2,
    HBUV_mit_ULV_und_WEP: 3,
    HBUS_mit_LP_und_WEP_Sperre: 4,
    HBUV_Monoeinheit: 5,
    Pool_mit_ULV_und_WEP_und_HWBWK_ueber_HBER: 6,
    Pool_mit_LP_und_WEP_Sperre_und_HWBWK_ueber_HBER: 7,
    Pool_2x_ULV_mit_WEP_ELIWELL: 8,
    Pool_2x_LP_mit_WEP_Sperre_ELIWELL: 9,
    Doppel_WP_Master_1x_HBUV: 10,
    WW_Applikation_11_OEM_ueber_dokumentierte_0_10_hinaus: 11,
  }

  enum Values_p02_054_status_waermemanager {
    Abgeschaltet: 0,
    Heizen: 1,
    Kuehlen: 2,
    Stoerung: 16,
  }

  enum Values_p06_015_betriebswahl_waermemanager {
    Automatik: 1,
  }

  enum Values_p06_020_sequenzwechselzeit {
    kein_Wechsel: 0,
    Nach_1_Woche: 1,
    Nach_2_Wochen: 2,
    Nach_3_Wochen: 3,
    Nach_4_Wochen: 4,
    Nach_5_Wochen: 5,
    Nach_6_Wochen: 6,
    Nach_7_Wochen: 7,
    sonstiger_Sequenzwechsel: 8,
  }

  enum Values_p06_076_applikationstyp_waermemanager {
    kein_Puffer: 0,
    Puffer_Weiche: 1,
    Puffer_2_Fuehler_TPO_TPM: 2,
    Puffer_Kuehlung: 3,
    kein_Puffer_Weiche_2_F: 4,
  }

  enum Values_p04_022_ebus_zieladresse_waermeerzeuger {
    kein: 0,
    Waermeerzeuger_1: 11,
    Waermeerzeuger_2: 12,
    Waermeerzeuger_3: 13,
    Waermeerzeuger_4: 14,
    Waermeerzeuger_5: 15,
    Waermeerzeuger_6: 22,
    Waermeerzeuger_7: 23,
    Waermeerzeuger_8: 24,
  }

  enum Values_p11_001_steuerbefehl_waermeerzeuger {
    Temperatursteuerung_mit_WW: 1,
    Leistungssteuerung_mit_WW: 2,
    Temperatursteuerung_ohne_WW: 3,
    Leistungssteuerung_ohne_WW: 4,
  }

  enum Values_p11_005_folgewechsel {
    Keine_Umschaltung_bei_Sequenzwechsel: 0,
    Umschaltung_bei_Sequenzwechsel: 1,
    Leistungsausgleich: 2,
    Leistungsausgleich_und_Umschaltung: 3,
  }

  enum Values_p11_076_applikationstyp_kaskadenmanager {
    Keine_WEZ: 0,
    WEZ_im_Puffer: 1,
    WEZ_im_Vorlauf_WP: 2,
  }

  enum Values_p04_043_ebene_einsteller {
    Benutzer: 0,
    Fachpartner: 1,
    OEM: 2,
  }

  enum Values_p04_076_applikationstyp_globalfunktion {
    Externes_Sperrsignal_EVU: 0,
    Smart_Grid_PV_Pin_21: 1,
    SG_nach_BWP_Pin_21_und_43: 2,
  }

  enum Values_p06_014_betriebsart_notbetrieb {
    Notbetrieb_reduziert: 1,
    Notbetrieb_normal: 2,
  }

  enum Values_eintrag1_quelle {
    Waermepumpe: 1,
  }

  enum Values_eintrag1_code {
    Er_56_Durchfluss_Waermequelle: 1,
    Er_57_Frostschutz_Waermequelle: 2,
    Er_58_Motorschutz_Waermequelle: 3,
    Er_36_Hochdruck: 5,
    Er_42_Frostschutz_Waermenutzung: 8,
    Er_47_Abtaustoerung: 9,
    Er_39_Motorschutz_Verdichter: 10,
    Er_30_Phasenueberwachung: 11,
    Er_50_Expansionsventil: 12,
    Er_38_Heissgas: 16,
    Er_37_Niederdruck: 18,
    Er_91_Durchfluss_Waermenutzung: 20,
    Er_90_Ueberhitzung: 21,
    Er_80_Adresse_WEZ_1: 30,
    Er_81_Adresse_WEZ_2: 31,
    Er_82_Adresse_WEZ_3: 32,
    Er_83_Adresse_WEZ_4: 33,
    Er_84_Adresse_WEZ_5: 34,
    Er_85_Adresse_WEZ_6: 35,
    Er_86_Adresse_WEZ_7: 36,
    Er_87_Adresse_WEZ_8: 37,
    Er_71_Busstoerung_Raumbedienteil: 42,
    Er_98_Elektro_Heizstab_laeuft_als_alleiniger_Waermeerzeuger: 98,
    Er_200_Kondensationstemperatur_zu_tief: 100,
    Er_202_Verdampfungstemp_zu_tief: 102,
    Er_203_Verdampfungstemp_zu_hoch: 103,
    Er_104_Summenstoerung_Waermepumpe: 104,
    Er_108_Aussenteil_Allgemein: 108,
    Er_109_Verdichter_ueberhitzt: 109,
    Er_48_TQE_Fuehler_Verdampfer_1_defekt: 129,
    Er_49_TQA_Fuehler_Verdampfer_2_defekt: 130,
    Er_59_Fuehlerbruch_TWV_TWR: 143,
    Er_60_Fuehlerbruch_TQA_TQE: 144,
    Er_240_OTE_erkennt_keine_Modbus_Platine: 240,
    Er_241_Modbus_Kommunikationsfehler: 241,
    Er_242_Kommunikationsstoerung_CAN_Bus: 242,
  }

  enum Values_anforderung_betriebsart {
    Heizen: 0,
    Warmwasser: 1,
  }

  enum Values_modulstatus_zustand {
    Aus: 0,
    Verdichter_ein: 1,
    Anlauf: 2,
  }

  enum Values_modulstatus_verdichter {
    aus: 0,
    ein: 1,
  }

  @zz(0x15)
  namespace Waermepumpe {
    /** IST Temp. TB Warmwasser (00-004) */
    @id(0x6, 0x21, 0x0, 0x84, 0x0, 0x42)
    model P00004IstTempTbWarmwasser {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** IST Temp. TWV (00-007) */
    @id(0x6, 0x21, 0x0, 0x87, 0x0, 0x42)
    model P00007IstTempTwv {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** IST Temp. TWR (00-008) */
    @id(0x6, 0x21, 0x0, 0x88, 0x0, 0x42)
    model P00008IstTempTwr {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Wärmequelle Austrittstemperatur (00-070) */
    @id(0x6, 0x21, 0x0, 0xc6, 0x0, 0x42)
    model P00070WaermequelleAustrittstemperatur {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Wärmequelle Eintrittstemperatur (00-071) */
    @id(0x6, 0x21, 0x0, 0xc7, 0x0, 0x42)
    model P00071WaermequelleEintrittstemperatur {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Anlage Vorlauftemperatur (00-096) */
    @id(0x6, 0x21, 0x0, 0xe0, 0x0, 0x42)
    model P00096AnlageVorlauftemperatur {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Wärmeerzeugerpumpe (01-022) */
    @id(0x6, 0x21, 0x1, 0x96, 0x0, 0x42)
    model P01022Waermeerzeugerpumpe {
    parameter1: parameter1;
    @unit("%")
    value: UCH;
    }

    /** SOLL Verdichter (01-076) */
    @id(0x6, 0x21, 0x1, 0xcc, 0x0, 0x42)
    model P01076SollVerdichter {
    parameter1: parameter1;
    @unit("%")
    value: UCH;
    }

    /** Wärmequellenpumpe (01-077) */
    @id(0x6, 0x21, 0x1, 0xcd, 0x0, 0x42)
    model P01077Waermequellenpumpe {
    parameter1: parameter1;
    @unit("%")
    value: UCH;
    }

    /** Status Wärmeerzeuger (02-053) */
    @id(0x6, 0x21, 0x2, 0xb5, 0x0, 0x42)
    model P02053StatusWaermeerzeugerWaermepumpe {
    parameter1: parameter1;
    @values(Values_p02_053_status_waermeerzeuger)
    value: UCH;
    }

    /** Schaltzyklen (02-080) */
    @id(0x6, 0x21, 0x2, 0xd0, 0x0, 0x42)
    model P02080SchaltzyklenWaermepumpe {
    paramc: paramc;
    value: HCD4;
    }

    /** Betriebsstunden (02-081) */
    @id(0x6, 0x21, 0x2, 0xd1, 0x0, 0x42)
    model P02081BetriebsstundenWaermepumpe {
    paramc: paramc;
    @unit("min")
    minutes: UCH;
    @unit("h")
    hours: HCD3;
    }

    /** Betriebsstunden 2. Stufe (02-082) */
    @id(0x6, 0x21, 0x2, 0xd2, 0x0, 0x42)
    model P02082Betriebsstunden2Stufe {
    paramc: paramc;
    @unit("min")
    minutes: UCH;
    @unit("h")
    hours: HCD3;
    }

    /** Schaltzyklen 2. Stufe (02-083) */
    @id(0x6, 0x21, 0x2, 0xd3, 0x0, 0x42)
    model P02083Schaltzyklen2Stufe {
    paramc: paramc;
    value: HCD4;
    }

    /** EBUS Wärmeerzeuger Adresse (04-027) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0x9b, 0x0, 0x42)
    model P04027EbusWaermeerzeugerAdresse {
    parameter1: parameter1;
    @values(Values_p04_027_ebus_waermeerzeuger_adresse)
    value: UIN;
    }

    /** EBUS Wärmeerzeuger Adresse (04-027) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0x9b, 0x0, 0x42)
    model P04027EbusWaermeerzeugerAdresseSet {
    @values(Values_p04_027_ebus_waermeerzeuger_adresse)
    value: UIN;
    }

    /** Wärmeerzeuger Typ (09-007) */
    @id(0x6, 0x21, 0x9, 0x87, 0x0, 0x42)
    model P09007WaermeerzeugerTypWaermepumpe {
    parameter1: parameter1;
    @values(Values_p09_007_waermeerzeuger_typ)
    value: UIN;
    }

    /** Wärmeerzeuger Typ (09-007) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0x87, 0x0, 0x42)
    model P09007WaermeerzeugerTypSetWaermepumpe {
    @values(Values_p09_007_waermeerzeuger_typ)
    value: UIN;
    }

    /** Bedingte Freigabe Wärmeerzeuger (09-011) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x9, 0x8b, 0x0, 0x42)
    model P09011BedingteFreigabeWaermeerzeugerWaermepumpe {
    parameter1: parameter1;
    @values(Values_p09_011_bedingte_freigabe_waermeerzeuger)
    value: UCH;
    }

    /** Bedingte Freigabe Wärmeerzeuger (09-011) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0x8b, 0x0, 0x42)
    model P09011BedingteFreigabeWaermeerzeugerSetWaermepumpe {
    @values(Values_p09_011_bedingte_freigabe_waermeerzeuger)
    value: UIN;
    }

    /** Außentemperatur Freigabe (Bivalenzpunkt) (09-012) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x9, 0x8c, 0x0, 0x42)
    model P09012AussentemperaturFreigabeBivalenzpunkt {
    parameter1: parameter1;
    @divisor(2)
    @unit("°C")
    value: SCH;
    }

    /** Außentemperatur Freigabe (Bivalenzpunkt) (09-012) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0x8c, 0x0, 0x42)
    model P09012AussentemperaturFreigabeBivalenzpunktSet {
    @divisor(2)
    @unit("°C")
    value: SIN;
    }

    /** Solltemperatur Handbetrieb (09-020) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x9, 0x94, 0x0, 0x42)
    model P09020SolltemperaturHandbetrieb {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Solltemperatur Handbetrieb (09-020) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0x94, 0x0, 0x42)
    model P09020SolltemperaturHandbetriebSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Externe Wärmeerzeuger Sperre (09-074) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x9, 0xca, 0x0, 0x42)
    model P09074ExterneWaermeerzeugerSperre {
    parameter1: parameter1;
    @values(Values_p09_074_externe_waermeerzeuger_sperre)
    value: UCH;
    }

    /** Externe Wärmeerzeuger Sperre (09-074) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0xca, 0x0, 0x42)
    model P09074ExterneWaermeerzeugerSperreSet {
    @values(Values_p09_074_externe_waermeerzeuger_sperre)
    value: UIN;
    }

    /** Betriebswahl Wärmeerzeuger (09-075) */
    @id(0x6, 0x21, 0x9, 0xcb, 0x0, 0x42)
    model P09075BetriebswahlWaermeerzeugerWaermepumpe {
    parameter1: parameter1;
    @values(Values_p09_075_betriebswahl_waermeerzeuger)
    value: UIN;
    }

    /** Betriebswahl Wärmeerzeuger (09-075) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0xcb, 0x0, 0x42)
    model P09075BetriebswahlWaermeerzeugerSetWaermepumpe {
    @values(Values_p09_075_betriebswahl_waermeerzeuger)
    value: UIN;
    }

    /** Unbekannt (10-051) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0xa, 0xb3, 0x0, 0x42)
    model P10051Unbekannt {
    parameter1: parameter1;
    value: SCH;
    }

    /** Unbekannt (10-051) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0xa, 0xb3, 0x0, 0x42)
    model P10051UnbekanntSet {
    value: SIN;
    }

    /** Applikationstyp Wärmepumpe (15-006) */
    @id(0x6, 0x21, 0xf, 0x86, 0x0, 0x42)
    model P15006ApplikationstypWaermepumpe {
    parameter1: parameter1;
    @values(Values_p15_006_applikationstyp_waermepumpe)
    value: UIN;
    }

    /** Applikationstyp Wärmepumpe (15-006) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0xf, 0x86, 0x0, 0x42)
    model P15006ApplikationstypWaermepumpeSet {
    @values(Values_p15_006_applikationstyp_waermepumpe)
    value: UIN;
    }

    /** Volumenstrom Wärmepumpe (21-002) */
    @id(0x6, 0x21, 0x15, 0x82, 0x0, 0x42)
    model P21002VolumenstromWaermepumpe {
    parameter1: parameter1;
    @divisor(10)
    @unit("L/min")
    value: SIN;
    }

    /** Stromverbrauch kWh (23-000) */
    @id(0x6, 0x21, 0x17, 0x80, 0x0, 0x42)
    model P23000StromverbrauchKwh {
    parameter1: parameter1;
    @divisor(10)
    @unit("kWh")
    value: SIN;
    }

    /** Heizenergie kWh (23-001) */
    @id(0x6, 0x21, 0x17, 0x81, 0x0, 0x42)
    model P23001HeizenergieKwhWaermepumpe {
    parameter1: parameter1;
    @divisor(10)
    @unit("kWh")
    value: SIN;
    }

    /** Heizleistung aktuell (23-003) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x17, 0x83, 0x0, 0x42)
    model P23003HeizleistungAktuell {
    parameter1: parameter1;
    @divisor(100)
    @unit("kW")
    value: SIN;
    }

    /** Kühlenergie kWh (23-005) */
    @id(0x6, 0x21, 0x17, 0x85, 0x0, 0x42)
    model P23005KuehlenergieKwh {
    parameter1: parameter1;
    @divisor(10)
    @unit("kWh")
    value: SIN;
    }

    /** Warmwasserenergie kWh (23-006) */
    @id(0x6, 0x21, 0x17, 0x86, 0x0, 0x42)
    model P23006WarmwasserenergieKwhWaermepumpe {
    parameter1: parameter1;
    @divisor(10)
    @unit("kWh")
    value: SIN;
    }

    /** Stromverbrauch MWh (23-009) */
    @id(0x6, 0x21, 0x17, 0x89, 0x0, 0x42)
    model P23009StromverbrauchMwh {
    parameter1: parameter1;
    @unit("MWh")
    value: UIN;
    }

    /** Heizenergie MWh (23-010) */
    @id(0x6, 0x21, 0x17, 0x8a, 0x0, 0x42)
    model P23010HeizenergieMwhWaermepumpe {
    parameter1: parameter1;
    @unit("MWh")
    value: UIN;
    }

    /** Kühlenergie MWh (23-012) */
    @id(0x6, 0x21, 0x17, 0x8c, 0x0, 0x42)
    model P23012KuehlenergieMwh {
    parameter1: parameter1;
    @unit("MWh")
    value: UIN;
    }

    /** Warmwasserenergie MWh (23-013) */
    @id(0x6, 0x21, 0x17, 0x8d, 0x0, 0x42)
    model P23013WarmwasserenergieMwh {
    parameter1: parameter1;
    @unit("MWh")
    value: UIN;
    }

    /** Kühlleistung aktuell (23-014) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x17, 0x8e, 0x0, 0x42)
    model P23014KuehlleistungAktuell {
    parameter1: parameter1;
    @divisor(100)
    @unit("kW")
    value: SIN;
    }

    /** Anforderung an Wärmeerzeuger */
    @passive
    @qq(0x10)
    @zz(0x03)
    @id(0x05, 0x01)
    model AnforderungWaermepumpe {
    /** Vorlauf-Soll */
    @unit("°C")
    vorlaufsoll: D2B;
    @maxLength(2) _ign0: IGN;
    /** Leistungsanforderung */
    @unit("%")
    leistung: UCH;
    @maxLength(1) _ign1: IGN;
    freigabe: UCH;
    @maxLength(2) _ign2: IGN;
    /** Betriebsart / Stellung Umschaltventil */
    @values(Values_anforderung_betriebsart)
    betriebsart: UCH;
    }

    /** Status Wärmeerzeuger-Modul */
    @passive
    @qq(0x03)
    @zz(0x10)
    @id(0x05, 0x03, 0x1)
    model ModulstatusWaermepumpe {
    /** Zustand Modul */
    @values(Values_modulstatus_zustand)
    zustand: UCH;
    /** Verdichter */
    @values(Values_modulstatus_verdichter)
    verdichter: BI3;
    /** Pumpe */
    @values(Values_modulstatus_verdichter)
    pumpe: BI6;
    /** Verdichterleistung */
    @unit("%")
    leistung: UCH;
    /** Vorlauf */
    @unit("°C")
    vorlauf: D1C;
    /** Rücklauf */
    @unit("°C")
    ruecklauf: UCH;
    }

  }

  @zz(0x15)
  namespace Zusatzheizung {
    /** Zusatzheizung Stellgrad (01-040) */
    @id(0x6, 0x21, 0x1, 0xa8, 0x0, 0x44)
    model P01040ZusatzheizungStellgrad {
    parameter1: parameter1;
    @unit("%")
    value: UCH;
    }

    /** Status Wärmeerzeuger (02-053) */
    @id(0x6, 0x21, 0x2, 0xb5, 0x0, 0x44)
    model P02053StatusWaermeerzeugerZusatzheizung {
    parameter1: parameter1;
    @values(Values_p02_053_status_waermeerzeuger_2)
    value: UCH;
    }

    /** Schaltzyklen (02-080) */
    @id(0x6, 0x21, 0x2, 0xd0, 0x0, 0x44)
    model P02080SchaltzyklenZusatzheizung {
    paramc: paramc;
    value: HCD4;
    }

    /** Betriebsstunden (02-081) */
    @id(0x6, 0x21, 0x2, 0xd1, 0x0, 0x44)
    model P02081BetriebsstundenZusatzheizung {
    paramc: paramc;
    @unit("min")
    minutes: UCH;
    @unit("h")
    hours: HCD3;
    }

    /** Nachlaufzeit Wärmeerzeuger Pumpe (09-000) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x9, 0x80, 0x0, 0x44)
    model P09000NachlaufzeitWaermeerzeugerPumpe {
    parameter1: parameter1;
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Nachlaufzeit Wärmeerzeuger Pumpe (09-000) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0x80, 0x0, 0x44)
    model P09000NachlaufzeitWaermeerzeugerPumpeSet {
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Einschaltverzögerung Wärmeerzeuger (09-004) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x9, 0x84, 0x0, 0x44)
    model P09004EinschaltverzoegerungWaermeerzeuger {
    parameter1: parameter1;
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Einschaltverzögerung Wärmeerzeuger (09-004) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0x84, 0x0, 0x44)
    model P09004EinschaltverzoegerungWaermeerzeugerSet {
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Wärmeerzeuger Typ (09-007) */
    @id(0x6, 0x21, 0x9, 0x87, 0x0, 0x44)
    model P09007WaermeerzeugerTypZusatzheizung {
    parameter1: parameter1;
    @values(Values_p09_007_waermeerzeuger_typ_2)
    value: UIN;
    }

    /** Wärmeerzeuger Typ (09-007) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0x87, 0x0, 0x44)
    model P09007WaermeerzeugerTypSetZusatzheizung {
    @values(Values_p09_007_waermeerzeuger_typ_2)
    value: UIN;
    }

    /** Bedingte Freigabe Wärmeerzeuger (09-011) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x9, 0x8b, 0x0, 0x44)
    model P09011BedingteFreigabeWaermeerzeugerZusatzheizung {
    parameter1: parameter1;
    @values(Values_p09_011_bedingte_freigabe_waermeerzeuger_2)
    value: UCH;
    }

    /** Bedingte Freigabe Wärmeerzeuger (09-011) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0x8b, 0x0, 0x44)
    model P09011BedingteFreigabeWaermeerzeugerSetZusatzheizung {
    @values(Values_p09_011_bedingte_freigabe_waermeerzeuger_2)
    value: UIN;
    }

    /** Abschaltdifferenz Wärmeerzeuger Regelung (09-021) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x9, 0x95, 0x0, 0x44)
    model P09021AbschaltdifferenzWaermeerzeugerRegelun {
    parameter1: parameter1;
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Abschaltdifferenz Wärmeerzeuger Regelung (09-021) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0x95, 0x0, 0x44)
    model P09021AbschaltdifferenzWaermeerzeugerRegelunSet {
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Stillstandszeit minimal Wärmeerzeuger (09-023) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x9, 0x97, 0x0, 0x44)
    model P09023StillstandszeitMinimalWaermeerzeuger {
    parameter1: parameter1;
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Stillstandszeit minimal Wärmeerzeuger (09-023) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0x97, 0x0, 0x44)
    model P09023StillstandszeitMinimalWaermeerzeugerSet {
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Laufzeit minimal Wärmeerzeuger (09-031) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x9, 0x9f, 0x0, 0x44)
    model P09031LaufzeitMinimalWaermeerzeuger {
    parameter1: parameter1;
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Laufzeit minimal Wärmeerzeuger (09-031) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0x9f, 0x0, 0x44)
    model P09031LaufzeitMinimalWaermeerzeugerSet {
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Freigabe Bivalenzsperre bei SmartGrid Zwangsladung (09-071) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x9, 0xc7, 0x0, 0x44)
    model P09071FreigabeBivalenzsperreBeiSmartgridZw {
    parameter1: parameter1;
    @values(Values_p09_071_freigabe_bivalenzsperre_bei_smartgrid_zw)
    value: UIN;
    }

    /** Freigabe Bivalenzsperre bei SmartGrid Zwangsladung (09-071) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0xc7, 0x0, 0x44)
    model P09071FreigabeBivalenzsperreBeiSmartgridZwSet {
    @values(Values_p09_071_freigabe_bivalenzsperre_bei_smartgrid_zw)
    value: UIN;
    }

    /** Betriebswahl Wärmeerzeuger (09-075) */
    @id(0x6, 0x21, 0x9, 0xcb, 0x0, 0x44)
    model P09075BetriebswahlWaermeerzeugerZusatzheizung {
    parameter1: parameter1;
    @values(Values_p09_075_betriebswahl_waermeerzeuger)
    value: UIN;
    }

    /** Betriebswahl Wärmeerzeuger (09-075) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x9, 0xcb, 0x0, 0x44)
    model P09075BetriebswahlWaermeerzeugerSetZusatzheizung {
    @values(Values_p09_075_betriebswahl_waermeerzeuger)
    value: UIN;
    }

    /** Maximaltemperatur Wärmeerzeuger Vorlauf (10-031) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0xa, 0x9f, 0x0, 0x44)
    model P10031MaximaltemperaturWaermeerzeugerVorlauf {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Maximaltemperatur Wärmeerzeuger Vorlauf (10-031) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0xa, 0x9f, 0x0, 0x44)
    model P10031MaximaltemperaturWaermeerzeugerVorlaufSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Einschaltdifferenz Maximaltemperaturabschaltung (10-037) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0xa, 0xa5, 0x0, 0x44)
    model P10037EinschaltdifferenzMaximaltemperaturabsc {
    parameter1: parameter1;
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Einschaltdifferenz Maximaltemperaturabschaltung (10-037) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0xa, 0xa5, 0x0, 0x44)
    model P10037EinschaltdifferenzMaximaltemperaturabscSet {
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Applikationstyp E-Zusatzheizung (10-076) */
    @id(0x6, 0x21, 0xa, 0xcc, 0x0, 0x44)
    model P10076ApplikationstypEZusatzheizung {
    parameter1: parameter1;
    @values(Values_p10_076_applikationstyp_e_zusatzheizung)
    value: UIN;
    }

    /** Applikationstyp E-Zusatzheizung (10-076) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0xa, 0xcc, 0x0, 0x44)
    model P10076ApplikationstypEZusatzheizungSet {
    @values(Values_p10_076_applikationstyp_e_zusatzheizung)
    value: UIN;
    }

    /** Leistung Heizstab (17-010) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x11, 0x8a, 0x0, 0x44)
    model P17010LeistungHeizstab {
    parameter1: parameter1;
    @divisor(100)
    @unit("kW")
    value: SIN;
    }

    /** Heizenergie kWh (23-001) */
    @id(0x6, 0x21, 0x17, 0x81, 0x0, 0x44)
    model P23001HeizenergieKwhZusatzheizung {
    parameter1: parameter1;
    @divisor(10)
    @unit("kWh")
    value: SIN;
    }

    /** Warmwasserenergie kWh (23-006) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x17, 0x86, 0x0, 0x44)
    model P23006WarmwasserenergieKwhZusatzheizung {
    parameter1: parameter1;
    @divisor(10)
    @unit("kWh")
    value: SIN;
    }

    /** Heizenergie MWh (23-010) */
    @id(0x6, 0x21, 0x17, 0x8a, 0x0, 0x44)
    model P23010HeizenergieMwhZusatzheizung {
    parameter1: parameter1;
    @unit("MWh")
    value: UIN;
    }

    /** Anforderung an Wärmeerzeuger */
    @passive
    @qq(0x10)
    @zz(0x13)
    @id(0x05, 0x01)
    model AnforderungZusatzheizung {
    /** Vorlauf-Soll */
    @unit("°C")
    vorlaufsoll: D2B;
    @maxLength(2) _ign0: IGN;
    /** Leistungsanforderung */
    @unit("%")
    leistung: UCH;
    @maxLength(1) _ign1: IGN;
    freigabe: UCH;
    @maxLength(2) _ign2: IGN;
    /** Betriebsart / Stellung Umschaltventil */
    @values(Values_anforderung_betriebsart)
    betriebsart: UCH;
    }

    /** Status Wärmeerzeuger-Modul */
    @passive
    @qq(0x13)
    @zz(0x10)
    @id(0x05, 0x03, 0x1)
    model ModulstatusZusatzheizung {
    /** Zustand Modul */
    zustand: UCH;
    /** Verdichter */
    @values(Values_modulstatus_verdichter)
    verdichter: BI3;
    /** Pumpe */
    @values(Values_modulstatus_verdichter)
    pumpe: BI6;
    /** Verdichterleistung */
    @unit("%")
    leistung: UCH;
    /** Vorlauf */
    @unit("°C")
    vorlauf: D1C;
    /** Rücklauf */
    @unit("°C")
    ruecklauf: UCH;
    }

  }

  @zz(0x15)
  namespace Heizkreis {
    /** Raumtemperatur (00-001) */
    @id(0x6, 0x21, 0x0, 0x81, 0x0, 0x4a)
    model P00001Raumtemperatur {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Heizkreis Vorlauftemperatur (00-002) */
    @id(0x6, 0x21, 0x0, 0x82, 0x0, 0x4a)
    model P00002HeizkreisVorlauftemperatur {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Humidity (00-058) */
    @id(0x6, 0x21, 0x0, 0xba, 0x0, 0x4a)
    model P00058Humidity {
    parameter1: parameter1;
    @divisor(10)
    @unit("%")
    value: SIN;
    }

    /** Raumtemperatur Sollwert (01-001) */
    @id(0x6, 0x21, 0x1, 0x81, 0x0, 0x4a)
    model P01001RaumtemperaturSollwert {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Heizkreis Vorlauftemperatur Sollwert (01-002) */
    @id(0x6, 0x21, 0x1, 0x82, 0x0, 0x4a)
    model P01002HeizkreisVorlauftemperaturSollwert {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Heizkreispumpe (01-020) */
    @id(0x6, 0x21, 0x1, 0x94, 0x0, 0x4a)
    model P01020Heizkreispumpe {
    parameter1: parameter1;
    @values(Values_p01_020_heizkreispumpe)
    value: UIN;
    }

    /** Mischer (01-021) */
    @id(0x6, 0x21, 0x1, 0x95, 0x0, 0x4a)
    model P01021Mischer {
    parameter1: parameter1;
    @unit("%")
    value: SCH;
    }

    /** Partytimer Heizbetrieb (02-010) */
    @id(0x6, 0x21, 0x2, 0x8a, 0x0, 0x4a)
    model P02010PartytimerHeizbetrieb {
    parameter1: parameter1;
    @divisor(10)
    @unit("h")
    value: SIN;
    }

    /** Abwesenheit Heizbetrieb (02-018) */
    @id(0x6, 0x21, 0x2, 0x92, 0x0, 0x4a)
    model P02018AbwesenheitHeizbetrieb {
    parameter1: parameter1;
    @divisor(10)
    @unit("h")
    value: SIN;
    }

    /** Aussentemperatur Mittelwert (02-020) */
    @id(0x6, 0x21, 0x2, 0x94, 0x0, 0x4a)
    model P02020AussentemperaturMittelwert {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Unbekannt (02-048) */
    @id(0x6, 0x21, 0x2, 0xb0, 0x0, 0x4a)
    model P02048Unbekannt {
    paramc: paramc;
    value: HCD4;
    }

    /** Status Heizkreis (02-051) */
    @id(0x6, 0x21, 0x2, 0xb3, 0x0, 0x4a)
    model P02051StatusHeizkreis {
    parameter1: parameter1;
    @values(Values_p02_051_status_heizkreis)
    value: UCH;
    }

    /** Raumschutztemperatur (03-000) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0x80, 0x0, 0x4a)
    model P03000Raumschutztemperatur {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Raumschutztemperatur (03-000) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x80, 0x0, 0x4a)
    model P03000RaumschutztemperaturSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Fußpunkt Vorlauftemperatur Heizkurve (03-001) */
    @id(0x6, 0x21, 0x3, 0x81, 0x0, 0x4a)
    model P03001FusspunktVorlauftemperaturHeizkurve {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Fußpunkt Vorlauftemperatur Heizkurve (03-001) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x81, 0x0, 0x4a)
    model P03001FusspunktVorlauftemperaturHeizkurveSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Heizgrenze Sparbetrieb (03-002) */
    @id(0x6, 0x21, 0x3, 0x82, 0x0, 0x4a)
    model P03002HeizgrenzeSparbetrieb {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Heizgrenze Sparbetrieb (03-002) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x82, 0x0, 0x4a)
    model P03002HeizgrenzeSparbetriebSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Startoptimierung Vorhaltezeit (03-006) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0x86, 0x0, 0x4a)
    model P03006StartoptimierungVorhaltezeit {
    parameter1: parameter1;
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Startoptimierung Vorhaltezeit (03-006) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x86, 0x0, 0x4a)
    model P03006StartoptimierungVorhaltezeitSet {
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Raumtemperatur Kompensation (03-007) */
    @id(0x6, 0x21, 0x3, 0x87, 0x0, 0x4a)
    model P03007RaumtemperaturKompensation {
    parameter1: parameter1;
    @divisor(10)
    value: SIN;
    }

    /** Raumtemperatur Kompensation (03-007) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x87, 0x0, 0x4a)
    model P03007RaumtemperaturKompensationSet {
    @divisor(10)
    value: SIN;
    }

    /** Fußpunkt Außentemperatur Heizkurve (03-011) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0x8b, 0x0, 0x4a)
    model P03011FusspunktAussentemperaturHeizkurve {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Fußpunkt Außentemperatur Heizkurve (03-011) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x8b, 0x0, 0x4a)
    model P03011FusspunktAussentemperaturHeizkurveSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Norm-Außentemperatur Heizkurve (03-012) */
    @id(0x6, 0x21, 0x3, 0x8c, 0x0, 0x4a)
    model P03012NormAussentemperaturHeizkurve {
    parameter1: parameter1;
    @unit("°C")
    value: SCH;
    }

    /** Norm-Außentemperatur Heizkurve (03-012) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x8c, 0x0, 0x4a)
    model P03012NormAussentemperaturHeizkurveSet {
    @unit("°C")
    value: SIN;
    }

    /** VLT bei Norm-Außentemperatur Heizkurve (03-013) */
    @id(0x6, 0x21, 0x3, 0x8d, 0x0, 0x4a)
    model P03013VltBeiNormAussentemperaturHeizkurve {
    parameter1: parameter1;
    @divisor(2)
    @unit("°C")
    value: UCH;
    }

    /** VLT bei Norm-Außentemperatur Heizkurve (03-013) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x8d, 0x0, 0x4a)
    model P03013VltBeiNormAussentemperaturHeizkurveSet {
    @divisor(2)
    @unit("°C")
    value: UIN;
    }

    /** Zeitkonstante für Aussentemperatur Mittelwertberechnung (03-020) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0x94, 0x0, 0x4a)
    model P03020ZeitkonstanteFuerAussentemperaturMitt {
    parameter1: parameter1;
    @unit("h")
    value: UCH;
    }

    /** Zeitkonstante für Aussentemperatur Mittelwertberechnung (03-020) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x94, 0x0, 0x4a)
    model P03020ZeitkonstanteFuerAussentemperaturMittSet {
    @unit("h")
    value: UIN;
    }

    /** Heizgrenze Normalbetrieb (03-021) */
    @id(0x6, 0x21, 0x3, 0x95, 0x0, 0x4a)
    model P03021HeizgrenzeNormalbetrieb {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Heizgrenze Normalbetrieb (03-021) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x95, 0x0, 0x4a)
    model P03021HeizgrenzeNormalbetriebSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Frostgrenze Aussentemperatur (03-023) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0x97, 0x0, 0x4a)
    model P03023FrostgrenzeAussentemperatur {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Frostgrenze Aussentemperatur (03-023) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x97, 0x0, 0x4a)
    model P03023FrostgrenzeAussentemperaturSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Zeitkonstante für R (03-024) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0x98, 0x0, 0x4a)
    model P03024ZeitkonstanteFuerR {
    parameter1: parameter1;
    @unit("min")
    value: UCH;
    }

    /** Zeitkonstante für R (03-024) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x98, 0x0, 0x4a)
    model P03024ZeitkonstanteFuerRSet {
    @unit("min")
    value: UIN;
    }

    /** Abweichung forciert Heizen (03-025) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0x99, 0x0, 0x4a)
    model P03025AbweichungForciertHeizen {
    parameter1: parameter1;
    @divisor(10)
    @unit("K")
    value: SCH;
    }

    /** Abweichung forciert Heizen (03-025) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x99, 0x0, 0x4a)
    model P03025AbweichungForciertHeizenSet {
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Abweichung Heizen aus (03-026) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0x9a, 0x0, 0x4a)
    model P03026AbweichungHeizenAus {
    parameter1: parameter1;
    @divisor(10)
    @unit("K")
    value: SCH;
    }

    /** Abweichung Heizen aus (03-026) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x9a, 0x0, 0x4a)
    model P03026AbweichungHeizenAusSet {
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Nachstellzeit Raumregler (03-030) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0x9e, 0x0, 0x4a)
    model P03030NachstellzeitRaumregler {
    parameter1: parameter1;
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Nachstellzeit Raumregler (03-030) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0x9e, 0x0, 0x4a)
    model P03030NachstellzeitRaumreglerSet {
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Betriebswahl Heizung (03-050) */
    @id(0x6, 0x21, 0x3, 0xb2, 0x0, 0x4a)
    model P03050BetriebswahlHeizungHeizkreis {
    parameter1: parameter1;
    @values(Values_p03_050_betriebswahl_heizung)
    value: UIN;
    }

    /** Betriebswahl Heizung (03-050) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xb2, 0x0, 0x4a)
    model P03050BetriebswahlHeizungSetHeizkreis {
    @values(Values_p03_050_betriebswahl_heizung)
    value: UIN;
    }

    /** Normal Raumtemperatur Heizbetrieb (03-051) */
    @id(0x6, 0x21, 0x3, 0xb3, 0x0, 0x4a)
    model P03051NormalRaumtemperaturHeizbetrieb {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Normal Raumtemperatur Heizbetrieb (03-051) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xb3, 0x0, 0x4a)
    model P03051NormalRaumtemperaturHeizbetriebSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Spar Raumtemperatur Heizbetrieb (03-053) */
    @id(0x6, 0x21, 0x3, 0xb5, 0x0, 0x4a)
    model P03053SparRaumtemperaturHeizbetrieb {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Spar Raumtemperatur Heizbetrieb (03-053) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xb5, 0x0, 0x4a)
    model P03053SparRaumtemperaturHeizbetriebSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Behaglichkeit (03-058) */
    @id(0x6, 0x21, 0x3, 0xba, 0x0, 0x4a)
    model P03058Behaglichkeit {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Behaglichkeit (03-058) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xba, 0x0, 0x4a)
    model P03058BehaglichkeitSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Ferien (03-078) */
    @id(0x6, 0x21, 0x3, 0xce, 0x0, 0x4a)
    model P03078Ferien {
    parameter1: parameter1;
    value: UIN;
    }

    /** Fernbedienung vorh (03-091) */
    @id(0x6, 0x21, 0x3, 0xdb, 0x0, 0x4a)
    model P03091FernbedienungVorh {
    parameter1: parameter1;
    value: UCH;
    }

    /** Ferien Zonenzuordnung (03-092) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0xdc, 0x0, 0x4a)
    model P03092FerienZonenzuordnungHeizkreis {
    parameter1: parameter1;
    value: UIN;
    }

    /** Ferien Zonenzuordnung (03-092) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xdc, 0x0, 0x4a)
    model P03092FerienZonenzuordnungSetHeizkreis {
    value: UIN;
    }

    /** Timer Zonenzuordnung (03-093) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0xdd, 0x0, 0x4a)
    model P03093TimerZonenzuordnungHeizkreis {
    parameter1: parameter1;
    value: UIN;
    }

    /** Timer Zonenzuordnung (03-093) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xdd, 0x0, 0x4a)
    model P03093TimerZonenzuordnungSetHeizkreis {
    value: UIN;
    }

    /** Betriebswahl Zonenzuordnung (03-094) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0xde, 0x0, 0x4a)
    model P03094BetriebswahlZonenzuordnungHeizkreis {
    parameter1: parameter1;
    value: UIN;
    }

    /** Betriebswahl Zonenzuordnung (03-094) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xde, 0x0, 0x4a)
    model P03094BetriebswahlZonenzuordnungSetHeizkreis {
    value: UIN;
    }

    /** Zeitprogramm Zonenzuordnung (03-095) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0xdf, 0x0, 0x4a)
    model P03095ZeitprogrammZonenzuordnungHeizkreis {
    parameter1: parameter1;
    value: UIN;
    }

    /** Zeitprogramm Zonenzuordnung (03-095) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xdf, 0x0, 0x4a)
    model P03095ZeitprogrammZonenzuordnungSetHeizkreis {
    value: UIN;
    }

    /** Temperatur Zonenzuordnung (03-096) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0xe0, 0x0, 0x4a)
    model P03096TemperaturZonenzuordnung {
    parameter1: parameter1;
    value: UIN;
    }

    /** Temperatur Zonenzuordnung (03-096) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xe0, 0x0, 0x4a)
    model P03096TemperaturZonenzuordnungSet {
    value: UIN;
    }

    /** Unbekannt (03-101) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0xe5, 0x0, 0x4a)
    model P03101Unbekannt {
    parameter1: parameter1;
    @unit("h")
    value: UCH;
    }

    /** Unbekannt (03-101) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xe5, 0x0, 0x4a)
    model P03101UnbekanntSet {
    @unit("h")
    value: UIN;
    }

    /** Proportionalbereich Mischerregelung (07-000) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x7, 0x80, 0x0, 0x4a)
    model P07000ProportionalbereichMischerregelung {
    parameter1: parameter1;
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Proportionalbereich Mischerregelung (07-000) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0x80, 0x0, 0x4a)
    model P07000ProportionalbereichMischerregelungSet {
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Wärmeerzeuger Überhöhung Vorlaufsollwert (07-001) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x7, 0x81, 0x0, 0x4a)
    model P07001WaermeerzeugerUeberhoehungVorlaufsollw {
    parameter1: parameter1;
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Wärmeerzeuger Überhöhung Vorlaufsollwert (07-001) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0x81, 0x0, 0x4a)
    model P07001WaermeerzeugerUeberhoehungVorlaufsollwSet {
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Minimale Vorlauftemperatur (07-002) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x7, 0x82, 0x0, 0x4a)
    model P07002MinimaleVorlauftemperatur {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Minimale Vorlauftemperatur (07-002) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0x82, 0x0, 0x4a)
    model P07002MinimaleVorlauftemperaturSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Pumpennachlauf Heizkreis (07-003) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x7, 0x83, 0x0, 0x4a)
    model P07003PumpennachlaufHeizkreis {
    parameter1: parameter1;
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Pumpennachlauf Heizkreis (07-003) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0x83, 0x0, 0x4a)
    model P07003PumpennachlaufHeizkreisSet {
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Heizkreistyp (07-005) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x7, 0x85, 0x0, 0x4a)
    model P07005Heizkreistyp {
    parameter1: parameter1;
    @values(Values_p07_005_heizkreistyp)
    value: UCH;
    }

    /** Heizkreistyp (07-005) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0x85, 0x0, 0x4a)
    model P07005HeizkreistypSet {
    @values(Values_p07_005_heizkreistyp)
    value: UIN;
    }

    /** Fehlerdauer Vorlauf (07-006) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x7, 0x86, 0x0, 0x4a)
    model P07006FehlerdauerVorlauf {
    parameter1: parameter1;
    @divisor(10)
    @unit("h")
    value: UCH;
    }

    /** Fehlerdauer Vorlauf (07-006) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0x86, 0x0, 0x4a)
    model P07006FehlerdauerVorlaufSet {
    @divisor(10)
    @unit("h")
    value: UIN;
    }

    /** Vorlauf Maximaltemperatur (07-008) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x7, 0x88, 0x0, 0x4a)
    model P07008VorlaufMaximaltemperatur {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Vorlauf Maximaltemperatur (07-008) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0x88, 0x0, 0x4a)
    model P07008VorlaufMaximaltemperaturSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Solltemperatur Handbetrieb (07-009) */
    @id(0x6, 0x21, 0x7, 0x89, 0x0, 0x4a)
    model P07009SolltemperaturHandbetrieb {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Solltemperatur Handbetrieb (07-009) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0x89, 0x0, 0x4a)
    model P07009SolltemperaturHandbetriebSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Heizkreisüberhöhung Niedertarif (07-031) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x7, 0x9f, 0x0, 0x4a)
    model P07031HeizkreisueberhoehungNiedertarif {
    parameter1: parameter1;
    @divisor(2)
    @unit("K")
    value: UCH;
    }

    /** Heizkreisüberhöhung Niedertarif (07-031) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0x9f, 0x0, 0x4a)
    model P07031HeizkreisueberhoehungNiedertarifSet {
    @divisor(2)
    @unit("K")
    value: UIN;
    }

    /** Energiezwangzahl (07-034) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x7, 0xa2, 0x0, 0x4a)
    model P07034Energiezwangzahl {
    parameter1: parameter1;
    @values(Values_p07_034_energiezwangzahl)
    value: UCH;
    }

    /** Energiezwangzahl (07-034) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0xa2, 0x0, 0x4a)
    model P07034EnergiezwangzahlSet {
    @values(Values_p07_034_energiezwangzahl)
    value: UIN;
    }

    /** Mischer Neutralzone (07-041) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x7, 0xa9, 0x0, 0x4a)
    model P07041MischerNeutralzone {
    parameter1: parameter1;
    @divisor(10)
    @unit("K")
    value: UCH;
    }

    /** Mischer Neutralzone (07-041) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0xa9, 0x0, 0x4a)
    model P07041MischerNeutralzoneSet {
    @divisor(10)
    @unit("K")
    value: UIN;
    }

    /** Applikationstyp Heizkreis (07-076) */
    @id(0x6, 0x21, 0x7, 0xcc, 0x0, 0x4a)
    model P07076ApplikationstypHeizkreisHeizkreis {
    parameter1: parameter1;
    @values(Values_p07_076_applikationstyp_heizkreis)
    value: UIN;
    }

    /** Applikationstyp Heizkreis (07-076) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0xcc, 0x0, 0x4a)
    model P07076ApplikationstypHeizkreisSetHeizkreis {
    @values(Values_p07_076_applikationstyp_heizkreis)
    value: UIN;
    }

  }

  @zz(0x15)
  namespace Warmwasserkreis {
    /** Warmwassertemperatur Sollwert (01-004) */
    @id(0x6, 0x21, 0x1, 0x84, 0x0, 0x4e)
    model P01004WarmwassertemperaturSollwert {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Ladung Elektro/WP (01-054) */
    @id(0x6, 0x21, 0x1, 0xb6, 0x0, 0x4e)
    model P01054LadungElektroWp {
    parameter1: parameter1;
    @values(Values_p01_020_heizkreispumpe)
    value: UIN;
    }

    /** Umlenkventil/Ladepumpe (01-066) */
    @id(0x6, 0x21, 0x1, 0xc2, 0x0, 0x4e)
    model P01066UmlenkventilLadepumpe {
    parameter1: parameter1;
    @values(Values_p01_020_heizkreispumpe)
    value: UIN;
    }

    /** Partytimer Warmwasserbetrieb (02-011) */
    @id(0x6, 0x21, 0x2, 0x8b, 0x0, 0x4e)
    model P02011PartytimerWarmwasserbetrieb {
    parameter1: parameter1;
    @unit("min")
    value: UCH;
    }

    /** Status Warmwasserregelung (02-052) */
    @id(0x6, 0x21, 0x2, 0xb4, 0x0, 0x4e)
    model P02052StatusWarmwasserregelung {
    parameter1: parameter1;
    @values(Values_p02_052_status_warmwasserregelung)
    value: UCH;
    }

    /** Ferien Zonenzuordnung (03-092) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0xdc, 0x0, 0x4e)
    model P03092FerienZonenzuordnungWarmwasserkreis {
    parameter1: parameter1;
    value: UIN;
    }

    /** Ferien Zonenzuordnung (03-092) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xdc, 0x0, 0x4e)
    model P03092FerienZonenzuordnungSetWarmwasserkreis {
    value: UIN;
    }

    /** Timer Zonenzuordnung (03-093) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0xdd, 0x0, 0x4e)
    model P03093TimerZonenzuordnungWarmwasserkreis {
    parameter1: parameter1;
    value: UIN;
    }

    /** Timer Zonenzuordnung (03-093) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xdd, 0x0, 0x4e)
    model P03093TimerZonenzuordnungSetWarmwasserkreis {
    value: UIN;
    }

    /** Betriebswahl Zonenzuordnung (03-094) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0xde, 0x0, 0x4e)
    model P03094BetriebswahlZonenzuordnungWarmwasserkreis {
    parameter1: parameter1;
    value: UIN;
    }

    /** Betriebswahl Zonenzuordnung (03-094) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xde, 0x0, 0x4e)
    model P03094BetriebswahlZonenzuordnungSetWarmwasserkreis {
    value: UIN;
    }

    /** Zeitprogramm Zonenzuordnung (03-095) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x3, 0xdf, 0x0, 0x4e)
    model P03095ZeitprogrammZonenzuordnungWarmwasserkreis {
    parameter1: parameter1;
    value: UIN;
    }

    /** Zeitprogramm Zonenzuordnung (03-095) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xdf, 0x0, 0x4e)
    model P03095ZeitprogrammZonenzuordnungSetWarmwasserkreis {
    value: UIN;
    }

    /** Einschaltdifferenz Warmwasserbereitung (05-000) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x5, 0x80, 0x0, 0x4e)
    model P05000EinschaltdifferenzWarmwasserbereitung {
    parameter1: parameter1;
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Einschaltdifferenz Warmwasserbereitung (05-000) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x5, 0x80, 0x0, 0x4e)
    model P05000EinschaltdifferenzWarmwasserbereitungSet {
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Warmwasser Ladevorrang (05-002) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x5, 0x82, 0x0, 0x4e)
    model P05002WarmwasserLadevorrang {
    parameter1: parameter1;
    @divisor(10)
    @unit("h")
    value: SIN;
    }

    /** Warmwasser Ladevorrang (05-002) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x5, 0x82, 0x0, 0x4e)
    model P05002WarmwasserLadevorrangSet {
    @divisor(10)
    @unit("h")
    value: SIN;
    }

    /** Legionellenschutztemperatur (05-004) */
    @id(0x6, 0x21, 0x5, 0x84, 0x0, 0x4e)
    model P05004Legionellenschutztemperatur {
    parameter1: parameter1;
    @unit("°C")
    value: UCH;
    }

    /** Legionellenschutztemperatur (05-004) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x5, 0x84, 0x0, 0x4e)
    model P05004LegionellenschutztemperaturSet {
    @unit("°C")
    value: UIN;
    }

    /** Modus Warmwasserladung (05-011) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x5, 0x8b, 0x0, 0x4e)
    model P05011ModusWarmwasserladung {
    parameter1: parameter1;
    @values(Values_p05_011_modus_warmwasserladung)
    value: UIN;
    }

    /** Modus Warmwasserladung (05-011) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x5, 0x8b, 0x0, 0x4e)
    model P05011ModusWarmwasserladungSet {
    @values(Values_p05_011_modus_warmwasserladung)
    value: UIN;
    }

    /** Betriebswahl Warmwasser (05-050) */
    @id(0x6, 0x21, 0x5, 0xb2, 0x0, 0x4e)
    model P05050BetriebswahlWarmwasser {
    parameter1: parameter1;
    @values(Values_p05_050_betriebswahl_warmwasser)
    value: UIN;
    }

    /** Betriebswahl Warmwasser (05-050) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x5, 0xb2, 0x0, 0x4e)
    model P05050BetriebswahlWarmwasserSet {
    @values(Values_p05_050_betriebswahl_warmwasser)
    value: UIN;
    }

    /** Normal Warmwassertemperatur (05-051) */
    @id(0x6, 0x21, 0x5, 0xb3, 0x0, 0x4e)
    model P05051NormalWarmwassertemperatur {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Normal Warmwassertemperatur (05-051) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x5, 0xb3, 0x0, 0x4e)
    model P05051NormalWarmwassertemperaturSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Unbekannt (05-066) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x5, 0xc2, 0x0, 0x4e)
    model P05066Unbekannt {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Unbekannt (05-066) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x5, 0xc2, 0x0, 0x4e)
    model P05066UnbekanntSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Warmwassertemperatur Vorzugsbetrieb (05-069) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x5, 0xc5, 0x0, 0x4e)
    model P05069WarmwassertemperaturVorzugsbetrieb {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Warmwassertemperatur Vorzugsbetrieb (05-069) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x5, 0xc5, 0x0, 0x4e)
    model P05069WarmwassertemperaturVorzugsbetriebSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Applikationstyp Warmwasserbereitung (05-076) */
    @id(0x6, 0x21, 0x5, 0xcc, 0x0, 0x4e)
    model P05076ApplikationstypWarmwasserbereitung {
    parameter1: parameter1;
    @values(Values_p05_076_applikationstyp_warmwasserbereitung)
    value: UIN;
    }

    /** Applikationstyp Warmwasserbereitung (05-076) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x5, 0xcc, 0x0, 0x4e)
    model P05076ApplikationstypWarmwasserbereitungSet {
    @values(Values_p05_076_applikationstyp_warmwasserbereitung)
    value: UIN;
    }

    /** Spar Warmwassertemperatur (05-086) */
    @id(0x6, 0x21, 0x5, 0xd6, 0x0, 0x4e)
    model P05086SparWarmwassertemperatur {
    parameter1: parameter1;
    @unit("°C")
    value: UCH;
    }

    /** Spar Warmwassertemperatur (05-086) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x5, 0xd6, 0x0, 0x4e)
    model P05086SparWarmwassertemperaturSet {
    @unit("°C")
    value: UIN;
    }

    /** Stellgröße Umlenkventil (22-066) */
    @id(0x6, 0x21, 0x16, 0xc2, 0x0, 0x4e)
    model P22066StellgroesseUmlenkventil {
    parameter1: parameter1;
    @unit("%")
    value: SCH;
    }

    /** Heizenergie kWh (23-001) */
    @id(0x6, 0x21, 0x17, 0x81, 0x0, 0x4e)
    model P23001HeizenergieKwhWarmwasserkreis {
    parameter1: parameter1;
    @divisor(10)
    @unit("kWh")
    value: SIN;
    }

  }

  @zz(0x15)
  namespace Waermemanager {
    /** TPO Puffertemperatur oben (00-015) */
    @id(0x6, 0x21, 0x0, 0x8f, 0x0, 0x50)
    model P00015TpoPuffertemperaturOben {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** TPM Puffertemperatur Mitte (00-017) */
    @id(0x6, 0x21, 0x0, 0x91, 0x0, 0x50)
    model P00017TpmPuffertemperaturMitte {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Unbekannt (01-015) */
    @id(0x6, 0x21, 0x1, 0x8f, 0x0, 0x50)
    model P01015Unbekannt {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Sollwert Anlage (01-096) */
    @id(0x6, 0x21, 0x1, 0xe0, 0x0, 0x50)
    model P01096SollwertAnlage {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Heizleistung Heizbetrieb (02-040) */
    @id(0x6, 0x21, 0x2, 0xa8, 0x0, 0x50)
    model P02040HeizleistungHeizbetrieb {
    parameter1: parameter1;
    @divisor(10)
    @unit("kW")
    value: SIN;
    }

    /** Heizleistung Warmwasserbetrieb (02-041) */
    @id(0x6, 0x21, 0x2, 0xa9, 0x0, 0x50)
    model P02041HeizleistungWarmwasserbetrieb {
    parameter1: parameter1;
    @divisor(10)
    @unit("kW")
    value: SIN;
    }

    /** Status Wärmemanager (02-054) */
    @id(0x6, 0x21, 0x2, 0xb6, 0x0, 0x50)
    model P02054StatusWaermemanager {
    parameter1: parameter1;
    @values(Values_p02_054_status_waermemanager)
    value: UCH;
    }

    /** Maximale Warmwasser Ladeleistung System (06-000) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x80, 0x0, 0x50)
    model P06000MaximaleWarmwasserLadeleistungSystem {
    parameter1: parameter1;
    @divisor(10)
    @unit("kW")
    value: SIN;
    }

    /** Maximale Warmwasser Ladeleistung System (06-000) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x80, 0x0, 0x50)
    model P06000MaximaleWarmwasserLadeleistungSystemSet {
    @divisor(10)
    @unit("kW")
    value: SIN;
    }

    /** Maximale Heizleistung System (06-001) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x81, 0x0, 0x50)
    model P06001MaximaleHeizleistungSystem {
    parameter1: parameter1;
    @divisor(10)
    @unit("kW")
    value: SIN;
    }

    /** Maximale Heizleistung System (06-001) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x81, 0x0, 0x50)
    model P06001MaximaleHeizleistungSystemSet {
    @divisor(10)
    @unit("kW")
    value: SIN;
    }

    /** Maximale Kühlleistung System (06-002) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x82, 0x0, 0x50)
    model P06002MaximaleKuehlleistungSystem {
    parameter1: parameter1;
    @divisor(10)
    @unit("kW")
    value: SIN;
    }

    /** Maximale Kühlleistung System (06-002) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x82, 0x0, 0x50)
    model P06002MaximaleKuehlleistungSystemSet {
    @divisor(10)
    @unit("kW")
    value: SIN;
    }

    /** Sollwertoffset Anschaltfühler Puffer mitte (06-005) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x85, 0x0, 0x50)
    model P06005SollwertoffsetAnschaltfuehlerPufferMi {
    parameter1: parameter1;
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Sollwertoffset Anschaltfühler Puffer mitte (06-005) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x85, 0x0, 0x50)
    model P06005SollwertoffsetAnschaltfuehlerPufferMiSet {
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Proportionalbereich Wärmemanager (06-010) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x8a, 0x0, 0x50)
    model P06010ProportionalbereichWaermemanager {
    parameter1: parameter1;
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Proportionalbereich Wärmemanager (06-010) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x8a, 0x0, 0x50)
    model P06010ProportionalbereichWaermemanagerSet {
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Nachstellzeit Wärmemanager (06-011) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x8b, 0x0, 0x50)
    model P06011NachstellzeitWaermemanager {
    parameter1: parameter1;
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Nachstellzeit Wärmemanager (06-011) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x8b, 0x0, 0x50)
    model P06011NachstellzeitWaermemanagerSet {
    @divisor(10)
    @unit("min")
    value: SIN;
    }

    /** Reduktion Anlagevorlauf Sollwert bei Störung (06-013) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x8d, 0x0, 0x50)
    model P06013ReduktionAnlagevorlaufSollwertBeiSto {
    parameter1: parameter1;
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Reduktion Anlagevorlauf Sollwert bei Störung (06-013) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x8d, 0x0, 0x50)
    model P06013ReduktionAnlagevorlaufSollwertBeiStoSet {
    @divisor(10)
    @unit("K")
    value: SIN;
    }

    /** Betriebswahl Wärmemanager (06-015) */
    @id(0x6, 0x21, 0x6, 0x8f, 0x0, 0x50)
    model P06015BetriebswahlWaermemanager {
    parameter1: parameter1;
    @values(Values_p06_015_betriebswahl_waermemanager)
    value: UIN;
    }

    /** Betriebswahl Wärmemanager (06-015) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x8f, 0x0, 0x50)
    model P06015BetriebswahlWaermemanagerSet {
    @values(Values_p06_015_betriebswahl_waermemanager)
    value: UIN;
    }

    /** Solltemperatur Handbetrieb (06-016) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x90, 0x0, 0x50)
    model P06016SolltemperaturHandbetrieb {
    parameter1: parameter1;
    @unit("°C")
    value: SCH;
    }

    /** Solltemperatur Handbetrieb (06-016) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x90, 0x0, 0x50)
    model P06016SolltemperaturHandbetriebSet {
    @unit("°C")
    value: SIN;
    }

    /** Maximale Sollwertsteigung Heizbetrieb (06-017) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x91, 0x0, 0x50)
    model P06017MaximaleSollwertsteigungHeizbetrieb {
    parameter1: parameter1;
    @divisor(10)
    value: UCH;
    }

    /** Maximale Sollwertsteigung Heizbetrieb (06-017) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x91, 0x0, 0x50)
    model P06017MaximaleSollwertsteigungHeizbetriebSet {
    @divisor(10)
    value: UIN;
    }

    /** Maximale Sollwertsteigung Warmwasserbetrieb (06-018) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x92, 0x0, 0x50)
    model P06018MaximaleSollwertsteigungWarmwasserbetr {
    parameter1: parameter1;
    @divisor(10)
    value: UCH;
    }

    /** Maximale Sollwertsteigung Warmwasserbetrieb (06-018) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x92, 0x0, 0x50)
    model P06018MaximaleSollwertsteigungWarmwasserbetrSet {
    @divisor(10)
    value: UIN;
    }

    /** Sequenzwechselzeit (06-020) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x94, 0x0, 0x50)
    model P06020Sequenzwechselzeit {
    parameter1: parameter1;
    @values(Values_p06_020_sequenzwechselzeit)
    value: UCH;
    }

    /** Sequenzwechselzeit (06-020) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x94, 0x0, 0x50)
    model P06020SequenzwechselzeitSet {
    @values(Values_p06_020_sequenzwechselzeit)
    value: UIN;
    }

    /** Puffer Solltemperatur bei Sonderfreigabe (06-027) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x9b, 0x0, 0x50)
    model P06027PufferSolltemperaturBeiSonderfreigabe {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Puffer Solltemperatur bei Sonderfreigabe (06-027) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x9b, 0x0, 0x50)
    model P06027PufferSolltemperaturBeiSonderfreigabeSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Nachlaufzeit Sonderfreigabe (06-028) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x9c, 0x0, 0x50)
    model P06028NachlaufzeitSonderfreigabe {
    parameter1: parameter1;
    @unit("h")
    value: UCH;
    }

    /** Nachlaufzeit Sonderfreigabe (06-028) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x9c, 0x0, 0x50)
    model P06028NachlaufzeitSonderfreigabeSet {
    @unit("h")
    value: UIN;
    }

    /** Puffer Solltemperatur Sonderzeitfreigabe (06-030) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x6, 0x9e, 0x0, 0x50)
    model P06030PufferSolltemperaturSonderzeitfreigabe {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Puffer Solltemperatur Sonderzeitfreigabe (06-030) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x9e, 0x0, 0x50)
    model P06030PufferSolltemperaturSonderzeitfreigabeSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Applikationstyp Wärmemanager (06-076) */
    @id(0x6, 0x21, 0x6, 0xcc, 0x0, 0x50)
    model P06076ApplikationstypWaermemanager {
    parameter1: parameter1;
    @values(Values_p06_076_applikationstyp_waermemanager)
    value: UIN;
    }

    /** Applikationstyp Wärmemanager (06-076) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0xcc, 0x0, 0x50)
    model P06076ApplikationstypWaermemanagerSet {
    @values(Values_p06_076_applikationstyp_waermemanager)
    value: UIN;
    }

    /** Heizenergie kWh (23-001) */
    @id(0x6, 0x21, 0x17, 0x81, 0x0, 0x50)
    model P23001HeizenergieKwhWaermemanager {
    parameter1: parameter1;
    @divisor(10)
    @unit("kWh")
    value: SIN;
    }

  }

  @zz(0x15)
  namespace Kaskadenmanager {
    /** Leistung Wärmeerzeuger (00-009) */
    @id(0x6, 0x21, 0x0, 0x89, 0x0, 0x52)
    model P00009LeistungWaermeerzeuger {
    parameter1: parameter1;
    @unit("%")
    value: SCH;
    }

    /** Leistung Sollwert (01-009) */
    @id(0x6, 0x21, 0x1, 0x89, 0x0, 0x52)
    model P01009LeistungSollwert {
    parameter1: parameter1;
    @divisor(10)
    @unit("%")
    value: SIN;
    }

    /** Status Kaskaden (02-055) */
    @id(0x6, 0x21, 0x2, 0xb7, 0x0, 0x52)
    model P02055StatusKaskaden {
    parameter1: parameter1;
    value: UCH;
    }

    /** EBUS Zieladresse Wärmeerzeuger (04-022) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0x96, 0x0, 0x52)
    model P04022EbusZieladresseWaermeerzeuger {
    parameter1: parameter1;
    @values(Values_p04_022_ebus_zieladresse_waermeerzeuger)
    value: UIN;
    }

    /** EBUS Zieladresse Wärmeerzeuger (04-022) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0x96, 0x0, 0x52)
    model P04022EbusZieladresseWaermeerzeugerSet {
    @values(Values_p04_022_ebus_zieladresse_waermeerzeuger)
    value: UIN;
    }

    /** Steuerbefehl Wärmeerzeuger (11-001) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0xb, 0x81, 0x0, 0x52)
    model P11001SteuerbefehlWaermeerzeuger {
    parameter1: parameter1;
    @values(Values_p11_001_steuerbefehl_waermeerzeuger)
    value: UCH;
    }

    /** Steuerbefehl Wärmeerzeuger (11-001) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0xb, 0x81, 0x0, 0x52)
    model P11001SteuerbefehlWaermeerzeugerSet {
    @values(Values_p11_001_steuerbefehl_waermeerzeuger)
    value: UIN;
    }

    /** Nennleistung Wärmeerzeuger (11-002) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0xb, 0x82, 0x0, 0x52)
    model P11002NennleistungWaermeerzeuger {
    parameter1: parameter1;
    @divisor(10)
    @unit("kW")
    value: SIN;
    }

    /** Nennleistung Wärmeerzeuger (11-002) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0xb, 0x82, 0x0, 0x52)
    model P11002NennleistungWaermeerzeugerSet {
    @divisor(10)
    @unit("kW")
    value: SIN;
    }

    /** Folgewechsel (11-005) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0xb, 0x85, 0x0, 0x52)
    model P11005Folgewechsel {
    parameter1: parameter1;
    @values(Values_p11_005_folgewechsel)
    value: UCH;
    }

    /** Folgewechsel (11-005) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0xb, 0x85, 0x0, 0x52)
    model P11005FolgewechselSet {
    @values(Values_p11_005_folgewechsel)
    value: UIN;
    }

    /** Unbekannt (11-070) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0xb, 0xc6, 0x0, 0x52)
    model P11070Unbekannt {
    parameter1: parameter1;
    value: UCH;
    }

    /** Applikationstyp Kaskadenmanager (11-076) */
    @id(0x6, 0x21, 0xb, 0xcc, 0x0, 0x52)
    model P11076ApplikationstypKaskadenmanager {
    parameter1: parameter1;
    @values(Values_p11_076_applikationstyp_kaskadenmanager)
    value: UIN;
    }

    /** Heizenergie kWh (23-001) */
    @id(0x6, 0x21, 0x17, 0x81, 0x0, 0x52)
    model P23001HeizenergieKwhKaskadenmanager {
    parameter1: parameter1;
    @divisor(10)
    @unit("kWh")
    value: SIN;
    }

  }

  @zz(0x15)
  namespace Anlage {
    /** Aussentemperatur (00-000) */
    @id(0x6, 0x21, 0x0, 0x80, 0x0, 0x40)
    model P00000Aussentemperatur {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Unbekannt (01-094) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x1, 0xde, 0x0, 0x40)
    model P01094Unbekannt {
    parameter1: parameter1;
    @values(Values_p01_020_heizkreispumpe)
    value: UIN;
    }

    /** Sammelstörung (01-099) */
    @id(0x6, 0x21, 0x1, 0xe3, 0x0, 0x40)
    model P01099Sammelstoerung {
    parameter1: parameter1;
    @values(Values_p01_020_heizkreispumpe)
    value: UIN;
    }

    /** Unbekannt (02-050) */
    @id(0x6, 0x21, 0x2, 0xb2, 0x0, 0x40)
    model P02050Unbekannt {
    paramc: paramc;
    value: HCD4;
    }

    /** Letzter Zugriff OEM (02-068) */
    @id(0x6, 0x21, 0x2, 0xc4, 0x0, 0x40)
    model P02068LetzterZugriffOem {
    parameter1: parameter1;
    value: UIN;
    }

    /** Letzter Zugriff Fachpartner (02-069) */
    @id(0x6, 0x21, 0x2, 0xc5, 0x0, 0x40)
    model P02069LetzterZugriffFachpartner {
    parameter1: parameter1;
    value: UIN;
    }

    /** Datum (02-070) */
    @id(0x6, 0x21, 0x2, 0xc6, 0x0, 0x40)
    model P02070Datum {
    parameter1: parameter1;
    value: UIN;
    }

    /** Datum (02-070) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x2, 0xc6, 0x0, 0x40)
    model P02070DatumSet {
    value: UIN;
    }

    /** Wochenzeit (02-071) */
    @id(0x6, 0x21, 0x2, 0xc7, 0x0, 0x40)
    model P02071Wochenzeit {
    parameter1: parameter1;
    value: UIN;
    }

    /** Wochenzeit (02-071) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x2, 0xc7, 0x0, 0x40)
    model P02071WochenzeitSet {
    value: UIN;
    }

    /** Uhrzeit (02-072) */
    @id(0x6, 0x21, 0x2, 0xc8, 0x0, 0x40)
    model P02072Uhrzeit {
    parameter1: parameter1;
    value: MIN;
    }

    /** Uhrzeit (02-072) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x2, 0xc8, 0x0, 0x40)
    model P02072UhrzeitSet {
    value: MIN;
    }

    /** Wochentag (02-073) */
    @id(0x6, 0x21, 0x2, 0xc9, 0x0, 0x40)
    model P02073Wochentag {
    parameter1: parameter1;
    value: UCH;
    }

    /** Wochentag (02-073) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x2, 0xc9, 0x0, 0x40)
    model P02073WochentagSet {
    value: UIN;
    }

    /** Unbekannt (02-096) */
    @id(0x6, 0x21, 0x2, 0xe0, 0x0, 0x40)
    model P02096Unbekannt {
    parameter1: parameter1;
    value: UCH;
    }

    /** Fühlerkonfiguration speichern (04-000) */
    @id(0x6, 0x21, 0x4, 0x80, 0x0, 0x40)
    model P04000FuehlerkonfigurationSpeichern {
    parameter1: parameter1;
    @values(Values_p01_020_heizkreispumpe)
    value: UIN;
    }

    /** Unbekannt (04-009) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0x89, 0x0, 0x40)
    model P04009Unbekannt {
    parameter1: parameter1;
    value: UCH;
    }

    /** Unbekannt (04-009) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0x89, 0x0, 0x40)
    model P04009UnbekanntSet {
    value: UIN;
    }

    /** EBus Unit Nummer (04-020) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0x94, 0x0, 0x40)
    model P04020EbusUnitNummer {
    parameter1: parameter1;
    value: UIN;
    }

    /** EBus Unit Nummer (04-020) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0x94, 0x0, 0x40)
    model P04020EbusUnitNummerSet {
    value: UIN;
    }

    /** Multifunktionsausgang MFA 1 (04-030) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0x9e, 0x0, 0x40)
    model P04030MultifunktionsausgangMfa1 {
    parameter1: parameter1;
    value: UCH;
    }

    /** Multifunktionsausgang MFA 1 (04-030) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0x9e, 0x0, 0x40)
    model P04030MultifunktionsausgangMfa1Set {
    value: UIN;
    }

    /** Multifunktionsausgang MFA 2 (04-031) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0x9f, 0x0, 0x40)
    model P04031MultifunktionsausgangMfa2 {
    parameter1: parameter1;
    value: UCH;
    }

    /** Multifunktionsausgang MFA 2 (04-031) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0x9f, 0x0, 0x40)
    model P04031MultifunktionsausgangMfa2Set {
    value: UIN;
    }

    /** Passworteingabe (04-042) */
    @id(0x6, 0x21, 0x4, 0xaa, 0x0, 0x40)
    model P04042Passworteingabe {
    parameter1: parameter1;
    value: UIN;
    }

    /** Ebene Einsteller (04-043) */
    @id(0x6, 0x21, 0x4, 0xab, 0x0, 0x40)
    model P04043EbeneEinsteller {
    parameter1: parameter1;
    @values(Values_p04_043_ebene_einsteller)
    value: UCH;
    }

    /** Kommandos (04-045) */
    @id(0x6, 0x21, 0x4, 0xad, 0x0, 0x40)
    model P04045Kommandos {
    parameter1: parameter1;
    value: UIN;
    }

    /** Austrocknungsprogramm Modus (04-060) */
    @id(0x6, 0x21, 0x4, 0xbc, 0x0, 0x40)
    model P04060AustrocknungsprogrammModus {
    parameter1: parameter1;
    value: UCH;
    }

    /** Austrocknungsprogramm Modus (04-060) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0xbc, 0x0, 0x40)
    model P04060AustrocknungsprogrammModusSet {
    value: UIN;
    }

    /** Vorlaufsollwertsteigung Aufheizphase (04-061) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0xbd, 0x0, 0x40)
    model P04061VorlaufsollwertsteigungAufheizphase {
    parameter1: parameter1;
    @divisor(10)
    value: SIN;
    }

    /** Vorlaufsollwertsteigung Aufheizphase (04-061) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0xbd, 0x0, 0x40)
    model P04061VorlaufsollwertsteigungAufheizphaseSet {
    @divisor(10)
    value: SIN;
    }

    /** Vorlaufsollwertabfall Abkühlphase (04-062) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0xbe, 0x0, 0x40)
    model P04062VorlaufsollwertabfallAbkuehlphase {
    parameter1: parameter1;
    @divisor(10)
    value: SIN;
    }

    /** Vorlaufsollwertabfall Abkühlphase (04-062) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0xbe, 0x0, 0x40)
    model P04062VorlaufsollwertabfallAbkuehlphaseSet {
    @divisor(10)
    value: SIN;
    }

    /** Vorlaufsollwert Beharrungsphase (04-063) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0xbf, 0x0, 0x40)
    model P04063VorlaufsollwertBeharrungsphase {
    parameter1: parameter1;
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Vorlaufsollwert Beharrungsphase (04-063) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0xbf, 0x0, 0x40)
    model P04063VorlaufsollwertBeharrungsphaseSet {
    @divisor(10)
    @unit("°C")
    value: SIN;
    }

    /** Dauer Beharrungsphase (04-064) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0xc0, 0x0, 0x40)
    model P04064DauerBeharrungsphase {
    parameter1: parameter1;
    @divisor(10)
    value: UCH;
    }

    /** Dauer Beharrungsphase (04-064) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0xc0, 0x0, 0x40)
    model P04064DauerBeharrungsphaseSet {
    @divisor(10)
    value: UIN;
    }

    /** Unbekannt (04-068) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0xc4, 0x0, 0x40)
    model P04068Unbekannt {
    parameter1: parameter1;
    value: UCH;
    }

    /** Unbekannt (04-068) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0xc4, 0x0, 0x40)
    model P04068UnbekanntSet {
    value: UIN;
    }

    /** Applikationstyp Globalfunktion (04-076) */
    @id(0x6, 0x21, 0x4, 0xcc, 0x0, 0x40)
    model P04076ApplikationstypGlobalfunktion {
    parameter1: parameter1;
    @values(Values_p04_076_applikationstyp_globalfunktion)
    value: UIN;
    }

    /** Applikationstyp Globalfunktion (04-076) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0xcc, 0x0, 0x40)
    model P04076ApplikationstypGlobalfunktionSet {
    @values(Values_p04_076_applikationstyp_globalfunktion)
    value: UIN;
    }

    /** Unbekannt (04-081) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @id(0x6, 0x21, 0x4, 0xd1, 0x0, 0x40)
    model P04081Unbekannt {
    parameter1: parameter1;
    @values(Values_p01_020_heizkreispumpe)
    value: UIN;
    }

    /** Unbekannt (04-081) */
    @condition(Anlage.P04043EbeneEinsteller.value, "Fachpartner", "OEM")
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0xd1, 0x0, 0x40)
    model P04081UnbekanntSet {
    @values(Values_p01_020_heizkreispumpe)
    value: UIN;
    }

    /** Unbekannt (04-086) */
    @id(0x6, 0x21, 0x4, 0xd6, 0x0, 0x40)
    model P04086Unbekannt {
    parameter1: parameter1;
    value: UCH;
    }

    /** Datum (04-089) */
    @id(0x6, 0x21, 0x4, 0xd9, 0x0, 0x40)
    model P04089Datum {
    parameter1: parameter1;
    value: UIN;
    }

    /** Datum (04-089) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0xd9, 0x0, 0x40)
    model P04089DatumSet {
    value: UIN;
    }

    /** SW Version (04-092) */
    @id(0x6, 0x21, 0x4, 0xdc, 0x0, 0x40)
    model P04092SwVersion {
    parameter1: parameter1;
    @divisor(100)
    value: SIN;
    }

    /** HW Version (04-093) */
    @id(0x6, 0x21, 0x4, 0xdd, 0x0, 0x40)
    model P04093HwVersion {
    parameter1: parameter1;
    @divisor(100)
    value: SIN;
    }

    /** Betriebsart Notbetrieb (06-014) */
    @id(0x6, 0x21, 0x6, 0x8e, 0x0, 0x40)
    model P06014BetriebsartNotbetrieb {
    parameter1: parameter1;
    @values(Values_p06_014_betriebsart_notbetrieb)
    value: UCH;
    }

    /** Betriebsart Notbetrieb (06-014) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x6, 0x8e, 0x0, 0x40)
    model P06014BetriebsartNotbetriebSet {
    @values(Values_p06_014_betriebsart_notbetrieb)
    value: UIN;
    }

    /** Passworteingabe (04-042) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x4, 0xaa, 0x0, 0x40)
    model PasswortSet {
    value: UIN;
    }

    /** Seriennummer (04-090) */
    @id(0x6, 0x22, 0x4, 0xda, 0x0, 0x40)
    @chain(0, #[0x4, 0xda, 0x1, 0x40])
    model Seriennummer {
    @maxLength(20)
    value: STR;
    }

    /** Anlagenbetreiber (04-095) */
    @id(0x6, 0x22, 0x4, 0xdf, 0x0, 0x40)
    @chain(0, #[0x4, 0xdf, 0x1, 0x40])
    model Anlagenbetreiber {
    @maxLength(20)
    value: STR;
    }

    /** Installateur (04-096) */
    @id(0x6, 0x22, 0x4, 0xe0, 0x0, 0x40)
    @chain(0, #[0x4, 0xe0, 0x1, 0x40])
    model Installateur {
    @maxLength(20)
    value: STR;
    }

    /** Planer (04-097) */
    @id(0x6, 0x22, 0x4, 0xe1, 0x0, 0x40)
    @chain(0, #[0x4, 0xe1, 0x1, 0x40])
    model Planer {
    @maxLength(20)
    value: STR;
    }

  }

  @zz(0x15)
  namespace HeizkreisA {
    /** Betriebswahl Heizung (03-050) */
    @id(0x6, 0x21, 0x3, 0xb2, 0x0, 0x48)
    model P03050BetriebswahlHeizungHeizkreisA {
    parameter1: parameter1;
    @values(Values_p03_050_betriebswahl_heizung)
    value: UIN;
    }

    /** Betriebswahl Heizung (03-050) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x3, 0xb2, 0x0, 0x48)
    model P03050BetriebswahlHeizungSetHeizkreisA {
    @values(Values_p03_050_betriebswahl_heizung)
    value: UIN;
    }

    /** Applikationstyp Heizkreis (07-076) */
    @id(0x6, 0x21, 0x7, 0xcc, 0x0, 0x48)
    model P07076ApplikationstypHeizkreisHeizkreisA {
    parameter1: parameter1;
    @values(Values_p07_076_applikationstyp_heizkreis)
    value: UIN;
    }

    /** Applikationstyp Heizkreis (07-076) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0xcc, 0x0, 0x48)
    model P07076ApplikationstypHeizkreisSetHeizkreisA {
    @values(Values_p07_076_applikationstyp_heizkreis)
    value: UIN;
    }

    /** Heizenergie kWh (23-001) */
    @id(0x6, 0x21, 0x17, 0x81, 0x0, 0x48)
    model P23001HeizenergieKwhHeizkreisA {
    parameter1: parameter1;
    @divisor(10)
    @unit("kWh")
    value: SIN;
    }

  }

  @zz(0x15)
  namespace HeizkreisC {
    /** Applikationstyp Heizkreis (07-076) */
    @id(0x6, 0x21, 0x7, 0xcc, 0x0, 0x4c)
    model P07076ApplikationstypHeizkreisHeizkreisC {
    parameter1: parameter1;
    @values(Values_p07_076_applikationstyp_heizkreis)
    value: UIN;
    }

    /** Applikationstyp Heizkreis (07-076) */
    @write
    @zz(0x10)
    @id(0x6, 0x23, 0x7, 0xcc, 0x0, 0x4c)
    model P07076ApplikationstypHeizkreisSetHeizkreisC {
    @values(Values_p07_076_applikationstyp_heizkreis)
    value: UIN;
    }

  }

  @zz(0x15)
  namespace Stoerungen {
    /** Störung 1 */
    @id(0x6, 0x22, 0x2, 0xda, 0x0, 0x40)
    @chain(0, #[0x2, 0xda, 0x1, 0x40], #[0x2, 0xda, 0x2, 0x40], #[0x2, 0xda, 0x3, 0x40])
    model Eintrag1 {
    @values(Values_eintrag1_quelle)
    quelle: UCH;
    /** Störcode OTE */
    @values(Values_eintrag1_code)
    code: UCH;
    /** Tage seit 31.12.1899 */
    datum: UIN;
    /** Minuten seit Montag 0:00 */
    zeit: UIN;
    /** WP Status */
    status: UCH;
    @divisor(10)
    @unit("°C")
    ta: SIN;
    @divisor(10)
    @unit("°C")
    tmk: SIN;
    @divisor(10)
    @unit("°C")
    tpo: SIN;
    @divisor(10)
    @unit("°C")
    tb: SIN;
    @divisor(10)
    @unit("°C")
    twv: SIN;
    @divisor(10)
    @unit("°C")
    twr: SIN;
    @divisor(10)
    @unit("°C")
    tqe: SIN;
    @divisor(10)
    @unit("°C")
    tqa: SIN;
    @divisor(10)
    @unit("°C")
    tpv: SIN;
    @divisor(10)
    @unit("°C")
    tsg_verdampfer: SIN;
    @divisor(10)
    @unit("°C")
    tsg_kompressor: SIN;
    @divisor(10)
    @unit("°C")
    thg: SIN;
    @divisor(10)
    @unit("°C")
    sw: SIN;
    @divisor(10)
    @unit("bar")
    pnd: SIN;
    @divisor(10)
    @unit("bar")
    phd: SIN;
    }

    /** Störung 2 */
    @id(0x6, 0x22, 0x2, 0xda, 0x10, 0x40)
    @chain(0, #[0x2, 0xda, 0x11, 0x40], #[0x2, 0xda, 0x12, 0x40], #[0x2, 0xda, 0x13, 0x40])
    model Eintrag2 {
    @values(Values_eintrag1_quelle)
    quelle: UCH;
    /** Störcode OTE */
    @values(Values_eintrag1_code)
    code: UCH;
    /** Tage seit 31.12.1899 */
    datum: UIN;
    /** Minuten seit Montag 0:00 */
    zeit: UIN;
    /** WP Status */
    status: UCH;
    @divisor(10)
    @unit("°C")
    ta: SIN;
    @divisor(10)
    @unit("°C")
    tmk: SIN;
    @divisor(10)
    @unit("°C")
    tpo: SIN;
    @divisor(10)
    @unit("°C")
    tb: SIN;
    @divisor(10)
    @unit("°C")
    twv: SIN;
    @divisor(10)
    @unit("°C")
    twr: SIN;
    @divisor(10)
    @unit("°C")
    tqe: SIN;
    @divisor(10)
    @unit("°C")
    tqa: SIN;
    @divisor(10)
    @unit("°C")
    tpv: SIN;
    @divisor(10)
    @unit("°C")
    tsg_verdampfer: SIN;
    @divisor(10)
    @unit("°C")
    tsg_kompressor: SIN;
    @divisor(10)
    @unit("°C")
    thg: SIN;
    @divisor(10)
    @unit("°C")
    sw: SIN;
    @divisor(10)
    @unit("bar")
    pnd: SIN;
    @divisor(10)
    @unit("bar")
    phd: SIN;
    }

    /** Störung 3 */
    @id(0x6, 0x22, 0x2, 0xda, 0x20, 0x40)
    @chain(0, #[0x2, 0xda, 0x21, 0x40], #[0x2, 0xda, 0x22, 0x40], #[0x2, 0xda, 0x23, 0x40])
    model Eintrag3 {
    @values(Values_eintrag1_quelle)
    quelle: UCH;
    /** Störcode OTE */
    @values(Values_eintrag1_code)
    code: UCH;
    /** Tage seit 31.12.1899 */
    datum: UIN;
    /** Minuten seit Montag 0:00 */
    zeit: UIN;
    /** WP Status */
    status: UCH;
    @divisor(10)
    @unit("°C")
    ta: SIN;
    @divisor(10)
    @unit("°C")
    tmk: SIN;
    @divisor(10)
    @unit("°C")
    tpo: SIN;
    @divisor(10)
    @unit("°C")
    tb: SIN;
    @divisor(10)
    @unit("°C")
    twv: SIN;
    @divisor(10)
    @unit("°C")
    twr: SIN;
    @divisor(10)
    @unit("°C")
    tqe: SIN;
    @divisor(10)
    @unit("°C")
    tqa: SIN;
    @divisor(10)
    @unit("°C")
    tpv: SIN;
    @divisor(10)
    @unit("°C")
    tsg_verdampfer: SIN;
    @divisor(10)
    @unit("°C")
    tsg_kompressor: SIN;
    @divisor(10)
    @unit("°C")
    thg: SIN;
    @divisor(10)
    @unit("°C")
    sw: SIN;
    @divisor(10)
    @unit("bar")
    pnd: SIN;
    @divisor(10)
    @unit("bar")
    phd: SIN;
    }

    /** Störung 4 */
    @id(0x6, 0x22, 0x2, 0xda, 0x30, 0x40)
    @chain(0, #[0x2, 0xda, 0x31, 0x40], #[0x2, 0xda, 0x32, 0x40], #[0x2, 0xda, 0x33, 0x40])
    model Eintrag4 {
    @values(Values_eintrag1_quelle)
    quelle: UCH;
    /** Störcode OTE */
    @values(Values_eintrag1_code)
    code: UCH;
    /** Tage seit 31.12.1899 */
    datum: UIN;
    /** Minuten seit Montag 0:00 */
    zeit: UIN;
    /** WP Status */
    status: UCH;
    @divisor(10)
    @unit("°C")
    ta: SIN;
    @divisor(10)
    @unit("°C")
    tmk: SIN;
    @divisor(10)
    @unit("°C")
    tpo: SIN;
    @divisor(10)
    @unit("°C")
    tb: SIN;
    @divisor(10)
    @unit("°C")
    twv: SIN;
    @divisor(10)
    @unit("°C")
    twr: SIN;
    @divisor(10)
    @unit("°C")
    tqe: SIN;
    @divisor(10)
    @unit("°C")
    tqa: SIN;
    @divisor(10)
    @unit("°C")
    tpv: SIN;
    @divisor(10)
    @unit("°C")
    tsg_verdampfer: SIN;
    @divisor(10)
    @unit("°C")
    tsg_kompressor: SIN;
    @divisor(10)
    @unit("°C")
    thg: SIN;
    @divisor(10)
    @unit("°C")
    sw: SIN;
    @divisor(10)
    @unit("bar")
    pnd: SIN;
    @divisor(10)
    @unit("bar")
    phd: SIN;
    }

    /** Störung 5 */
    @id(0x6, 0x22, 0x2, 0xda, 0x40, 0x40)
    @chain(0, #[0x2, 0xda, 0x41, 0x40], #[0x2, 0xda, 0x42, 0x40], #[0x2, 0xda, 0x43, 0x40])
    model Eintrag5 {
    @values(Values_eintrag1_quelle)
    quelle: UCH;
    /** Störcode OTE */
    @values(Values_eintrag1_code)
    code: UCH;
    /** Tage seit 31.12.1899 */
    datum: UIN;
    /** Minuten seit Montag 0:00 */
    zeit: UIN;
    /** WP Status */
    status: UCH;
    @divisor(10)
    @unit("°C")
    ta: SIN;
    @divisor(10)
    @unit("°C")
    tmk: SIN;
    @divisor(10)
    @unit("°C")
    tpo: SIN;
    @divisor(10)
    @unit("°C")
    tb: SIN;
    @divisor(10)
    @unit("°C")
    twv: SIN;
    @divisor(10)
    @unit("°C")
    twr: SIN;
    @divisor(10)
    @unit("°C")
    tqe: SIN;
    @divisor(10)
    @unit("°C")
    tqa: SIN;
    @divisor(10)
    @unit("°C")
    tpv: SIN;
    @divisor(10)
    @unit("°C")
    tsg_verdampfer: SIN;
    @divisor(10)
    @unit("°C")
    tsg_kompressor: SIN;
    @divisor(10)
    @unit("°C")
    thg: SIN;
    @divisor(10)
    @unit("°C")
    sw: SIN;
    @divisor(10)
    @unit("bar")
    pnd: SIN;
    @divisor(10)
    @unit("bar")
    phd: SIN;
    }

    /** Störung 6 */
    @id(0x6, 0x22, 0x2, 0xda, 0x50, 0x40)
    @chain(0, #[0x2, 0xda, 0x51, 0x40], #[0x2, 0xda, 0x52, 0x40], #[0x2, 0xda, 0x53, 0x40])
    model Eintrag6 {
    @values(Values_eintrag1_quelle)
    quelle: UCH;
    /** Störcode OTE */
    @values(Values_eintrag1_code)
    code: UCH;
    /** Tage seit 31.12.1899 */
    datum: UIN;
    /** Minuten seit Montag 0:00 */
    zeit: UIN;
    /** WP Status */
    status: UCH;
    @divisor(10)
    @unit("°C")
    ta: SIN;
    @divisor(10)
    @unit("°C")
    tmk: SIN;
    @divisor(10)
    @unit("°C")
    tpo: SIN;
    @divisor(10)
    @unit("°C")
    tb: SIN;
    @divisor(10)
    @unit("°C")
    twv: SIN;
    @divisor(10)
    @unit("°C")
    twr: SIN;
    @divisor(10)
    @unit("°C")
    tqe: SIN;
    @divisor(10)
    @unit("°C")
    tqa: SIN;
    @divisor(10)
    @unit("°C")
    tpv: SIN;
    @divisor(10)
    @unit("°C")
    tsg_verdampfer: SIN;
    @divisor(10)
    @unit("°C")
    tsg_kompressor: SIN;
    @divisor(10)
    @unit("°C")
    thg: SIN;
    @divisor(10)
    @unit("°C")
    sw: SIN;
    @divisor(10)
    @unit("bar")
    pnd: SIN;
    @divisor(10)
    @unit("bar")
    phd: SIN;
    }

  }

}
