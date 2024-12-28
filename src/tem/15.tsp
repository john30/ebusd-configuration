import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Tem;

namespace _15 {
  // Bartl WP Eco 6S-HG from PR 129
  // Globalfunktionen Menü Einstellungen MasterFB (Fachmann)
  // Passwort etc.
  // Wärmepumpe Ping für MasterFB Display
  // Wärmepumpe Menü Soll-Ist MasterFB
  // Wärmepumpe Einstellungen MasterFB
  // Wärmepumpe Menü Einstellungen MasterFB (Fachmann)
  // [expertlevel]r,verzoegerung_nd_stoerung1,Verzögerung Niederdruckstörung? 15-037,990002,parameters,parameter1,time,UIN,2,min
  // Wärmepumpe Relaisausgänge
  // Wärmepumpe Relaisausgänge (Fachmann)
  // Warmwasser Ping für MasterFB Display
  // Warmwasser Zeitprogramme
  // Warmwasser Menü Soll-Ist MasterFB
  // Warmwasser Menü Einstellungen MasterFB
  // Warmwasser Menü Einstellungen MasterFB (Fachmann)
  // Warmwasser Relaisausgänge
  // Heizkreis Ping für MasterFB Display
  // Heizkreis Zeitprogramme
  // Heizkreis Menü Soll-Ist MasterFB
  // Heizkreis Einstellungen MasterFB
  // Heizkreis Menü Einstellungen MasterFB (Fachmann)
  // Heizkreis Relaisausgänge
  // Wärmemanager Ping für MasterFB Display
  // Wärmemanager Menü Soll-Ist MasterFB
  // Wärmemanager Menü Einstellungen MasterFB
  // Wärmemanager Menü Einstellungen MasterFB (Fachmann)
  // Wärmemanager Relaisausgänge (Fachmann)
  // Globalfunktionen Ping für MasterFB Display
  // Globalfunktionen Menü Soll-Ist MasterFB
  // Globalfunktionen Menü Einstellungen MasterFB
  // Globalfunktionen Menü Einstellungen MasterFB (Fachmann)
  // Globalfunktionen Relaisausgänge
  // Globalfunktionen Relaisausgänge (Fachmann)

  enum Values_status {
    User_Level: 0,
    Expert_Level: 2,
  }

  enum Values_status_1 {
    Abgeschaltet: 0,
    Heizbetrieb: 1,
    Vorlauf_Heizbetrieb: 2,
    Extern_gesperrt: 3,
    Kuehlbetrieb: 4,
    Vorlaufzeit_Kuehlbetrieb: 5,
    Vorlaufzeit_Abtaubetrieb: 6,
    Abtaubetrieb: 7,
    Stoerung: 8,
    Abtropfen: 9,
    DT_UEberwachung: 10,
    Abtau_Vorheizung: 11,
    Abtauen_1: 12,
  }

  enum Values_status_2 {
    Aus: 0,
    Automatik: 1,
    Handbetrieb_Heizen: 2,
    Handbetrieb_Kuehlen: 3,
    Waermequellenpumpe: 6,
  }

  enum Values_status_3 {
    Abgeschaltet: 0,
    Heizbetrieb: 1,
    Vorlauf_Heizbetrieb: 2,
    Extern_gesperrt: 3,
    Kuehlbetrieb: 4,
    Vorlaufzeit_Kuehlbetrieb: 5,
    Vorlaufzeit_Abtaubetrieb: 6,
    Abtaubetrieb: 7,
    Stoerung: 8,
    Abtropfen: 9,
    DT_UEberwachung: 10,
    Abtau_Vorheizung: 11,
    Abtauen_1: 12,
  }

  enum Values_status_4 {
    kein_Waermeerzeuger_aktiv: 0,
    Steuerbarer_Waermeerzeuger_ohne_Schutzfunktion: 1,
  }

  enum Values_status_5 {
    Aus: 0,
    Automatik: 1,
    Handbetrieb_Heizen: 2,
    Handbetrieb_Kuehlen: 3,
    Waermequellenpumpe: 6,
  }

  enum Values_status_6 {
    nicht_aktiv: 0,
    Sole_oder_Wasser_WP: 1,
    Sole_oder_Wasser_WP_Hochtemperatur: 2,
    Sole_oder_Wasser_WP_Tandem: 3,
    Sole_oder_Wasser_WP_Tandem_mit_modulierender_zweiter_Stufe: 4,
    Sole_oder_Wasser_WP_Reversible: 5,
    Sole_oder_Wasser_WP_Reversible_Tandem: 6,
    Sole_oder_Wasser_WP_Reversible_Tandem_mit_modulierender_zweiter_Stufe: 7,
    Luft_WP: 8,
    Luft_WP_Hochtemperatur: 9,
    Luft_WP_Tandem: 10,
    Luft_WP_Tandem_mit_modulierender_zweiter_Stufe: 11,
    Luft_WP_Reversible: 12,
    Luft_WP_Reversible_Tandem: 13,
    Luft_WP_Reversible_Tandem_mit_modulierender_zweiter_Stufe: 14,
  }

  enum Values_status_7 {
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

  enum Values_status_8 {
    kein_Waermeerzeuger_aktiv: 0,
    Steuerbarer_Waermeerzeuger_ohne_Schutzfunktion: 1,
  }

  enum Values_status_9 {
    Frei: 0,
    Gesperrt: 1,
    TA_BiP: 2,
    TA_BiP_1: 3,
  }

  enum Values_status_10 {
    nicht_gesperrt: 0,
    gesperrt: 1,
  }

  enum Values_status_11 {
    Aus: 0,
    Automatik: 1,
    Handbetrieb_Heizen: 2,
    Handbetrieb_Kuehlen: 3,
    Waermequellenpumpe: 6,
  }

  enum Values_status_12 {
    Ein_mit_Anforderung: 0,
    Ein_mit_Waermeerzeuger: 1,
  }

  enum Values_status_13 {
    nicht_aktiv: 0,
    Sole_oder_Wasser_WP: 1,
    Sole_oder_Wasser_WP_Hochtemperatur: 2,
    Sole_oder_Wasser_WP_Tandem: 3,
    Sole_oder_Wasser_WP_Tandem_mit_modulierender_zweiter_Stufe: 4,
    Sole_oder_Wasser_WP_Reversible: 5,
    Sole_oder_Wasser_WP_Reversible_Tandem: 6,
    Sole_oder_Wasser_WP_Reversible_Tandem_mit_modulierender_zweiter_Stufe: 7,
    Luft_WP: 8,
    Luft_WP_Hochtemperatur: 9,
    Luft_WP_Tandem: 10,
    Luft_WP_Tandem_mit_modulierender_zweiter_Stufe: 11,
    Luft_WP_Reversible: 12,
    Luft_WP_Reversible_Tandem: 13,
    Luft_WP_Reversible_Tandem_mit_modulierender_zweiter_Stufe: 14,
  }

  enum Values_temp {
    Abgeschaltet: 0,
    Normal_Ladebetrieb: 1,
    Komfort_Ladebetrieb: 2,
    Zwangsdrosselung: 3,
    Zwangsladung: 4,
    Stoerung: 5,
  }

  enum Values_status_14 {
    keine_Ladung: 0,
    Automatik: 1,
    Normaltemperatur: 2,
    Gemae_Fuehlerkreis: 5,
  }

  enum Values_status_15 {
    nicht_aktiv: 0,
    mit_Ladepumpe: 1,
    mit_Umlenkventil: 2,
    mit_Ladepumpe_und_Zirkulationspumpe: 3,
    mit_Umlenkventil_und_Zirkulationspumpe: 4,
  }

  enum Values_status_16 {
    Zeitabhaengig: 0,
    Temperaturabhaengig: 1,
    Waermeerzeugerabhaengig: 2,
  }

  enum Values_status_17 {
    inaktiv: 0,
    nach_Zeitprogramm: 1,
  }

  enum Values_status_18 {
    inaktiv: 0,
    Heizkreispumpe_aktiv: 1,
  }

  enum Values_status_19 {
    Aus: 0,
    Standard: 1,
    WW_Sollwert: 3,
    Thermostat: 4,
    Ladung_lokal: 5,
    Nachheizung: 6,
  }

  enum Values_status_20 {
    kein: 0,
    negativ: 1,
    positiv: 2,
    beide: 3,
  }

  enum Values_status_21 {
    keine_Ladung: 0,
    Automatik: 1,
    Normaltemperatur: 2,
    Gemae_Fuehlerkreis: 5,
  }

  enum Values_status_22 {
    nicht_aktiv: 0,
    mit_Ladepumpe: 1,
    mit_Umlenkventil: 2,
    mit_Ladepumpe_und_Zirkulationspumpe: 3,
    mit_Umlenkventil_und_Zirkulationspumpe: 4,
  }

  enum Values_status_23 {
    Abgeschaltet: 0,
    Normal_Heizbetrieb: 1,
    Spar_Heizbetrieb: 3,
    Frostschutzbetrieb: 4,
    Zwangsabnahme: 5,
    Zwangsdrosselung: 6,
    Ferienbetrieb: 7,
    Partybetrieb: 8,
    Normal_Kuehlbetrieb: 9,
    Spar_Kuehlbetrieb: 11,
    Stoerung: 12,
    Handbetrieb: 13,
    Schutz_Kuehlbetrieb: 14,
    Partybetrieb_Kuehlen: 15,
    Austrocknung_Aufheizphase: 16,
    Austrocknung_Stationaerphase: 17,
    Austrocknung_Abkuehlphase: 18,
    Austrocknung_Endphase: 19,
  }

  enum Values_status_24 {
    Abgeschaltet: 0,
    Normal_Heizbetrieb: 1,
    Spar_Heizbetrieb: 3,
    Frostschutzbetrieb: 4,
    Zwangsabnahme: 5,
    Zwangsdrosselung: 6,
    Ferienbetrieb: 7,
    Partybetrieb: 8,
    Normal_Kuehlbetrieb: 9,
    Spar_Kuehlbetrieb: 11,
    Stoerung: 12,
    Handbetrieb: 13,
    Schutz_Kuehlbetrieb: 14,
    Partybetrieb_Kuehlen: 15,
    Austrocknung_Aufheizphase: 16,
    Austrocknung_Stationaerphase: 17,
    Austrocknung_Abkuehlphase: 18,
    Austrocknung_Endphase: 19,
  }

  enum Values_status_25 {
    Automatikbetrieb_1: 1,
    Automatikbetrieb_2: 2,
    Automatikbetrieb_3: 3,
    Normalbetrieb: 4,
    Sparbetrieb: 5,
    Standbybetrieb_WW_frei: 6,
    Handbetrieb_Heizen: 7,
  }

  enum Values_status_26 {
    nicht_aktiv1: 0,
    Pumpenkreis_mit_Kuehlung: 2,
    Mischerkreis_ohne_Kuehlung: 3,
    Mischerkreis_mit_Kuehlung: 4,
  }

  enum Values_status_27 {
    Automatikbetrieb_1: 1,
    Automatikbetrieb_2: 2,
    Automatikbetrieb_3: 3,
    Normalbetrieb: 4,
    Sparbetrieb: 5,
    Standbybetrieb_WW_frei: 6,
    Handbetrieb_Heizen: 7,
  }

  enum Values_status_28 {
    _3_Punkt_Mischer: 0,
    _2_Punkt_Mischer: 1,
    Pumpkreis: 2,
    kein_Heizkreis: 3,
  }

  enum Values_status_29 {
    kein: 0,
    negativ: 1,
    positiv: 2,
    beide: 3,
  }

  enum Values_status_30 {
    nicht_aktiv1: 0,
    Pumpenkreis_mit_Kuehlung: 2,
    Mischerkreis_ohne_Kuehlung: 3,
    Mischerkreis_mit_Kuehlung: 4,
  }

  enum Values_status_31 {
    Abgeschaltet: 0,
    Heizen: 1,
    Kuehlen: 2,
    Stoerung: 16,
  }

  enum Values_status_32 {
    Abgeschaltet: 0,
    Heizen: 1,
    Kuehlen: 2,
    Stoerung: 16,
  }

  enum Values_status_33 {
    Automatik: 1,
    Handbetrieb_Heizen: 4,
    Handbetrieb_Kuehlen: 5,
  }

  enum Values_status_34 {
    kein_Pufferspeicher: 0,
    Puffer_ohne_WW: 1,
    Puffer_mit_WW: 2,
    Reversibler_Puffer: 3,
    Puffer_mit_WW_Kuehlpuffer: 4,
  }

  enum Values_status_35 {
    kein_Puffer: 0,
    Heizungspuffer: 1,
    Kombipuffer: 2,
  }

  enum Values_status_36 {
    Automatik: 1,
    Handbetrieb_Heizen: 4,
    Handbetrieb_Kuehlen: 5,
  }

  enum Values_status_37 {
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

  enum Values_status_38 {
    kein_Pufferspeicher: 0,
    Puffer_ohne_WW: 1,
    Puffer_mit_WW: 2,
    Reversibler_Puffer: 3,
    Puffer_mit_WW_Kuehlpuffer: 4,
  }
  namespace Globals {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21)
    model r {}

    /** Ebene Einsteller 04-043 */
    @inherit(r)
    @ext(0x4, 0xab, 0, 0x4a)
    model Parameter_level {
      parameters: parameter1;

      /** Abfrage des aktuellen Zugangslevels für die Einsteller */
      @values(Values_status)
      status: status;
    }

    /** default *w */
    @write
    @zz(0x10)
    @base(0x6, 0x23)
    model w {}

    /** Globales Passwort setzen 256 04-042 */
    @inherit(w)
    @ext(0x4, 0xaa, 0, 0x40)
    model Global_passwort {
      /** 256 */
      password: UIN;
    }
  }
  namespace Wp_ping {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21)
    model r {}

    /** Vorlauftemperatur Wärmeerzeuger 00-007 */
    @inherit(r)
    @ext(0, 0x87, 0, 0x42)
    model Vl_temp_ist {
      parameters: parameter_temp10;

      /** Wärmeerzeuger Vorlauftemperatur */
      temp: temp10;
    }

    /** Rücklauftemperatur Wärmeerzeuger 00-008 */
    @inherit(r)
    @ext(0, 0x88, 0, 0x42)
    model Rl_temp_ist {
      parameters: parameter_temp10;

      /** Wärmeerzeuger Rücklauftemperatur */
      temp: temp10;
    }

    /** Wärmequelle Austrittstemperatur 00-070 */
    @inherit(r)
    @ext(0, 0xc6, 0, 0x42)
    model Wq_temp_out {
      parameters: parameter_temp10;

      /** Wärmequellen Austrittstemperatur vom Verdampfer */
      temp: temp10;
    }

    /** Wärmequelle Eintrittstemperatur 00-071 */
    @inherit(r)
    @ext(0, 0xc7, 0, 0x42)
    model Wq_temp_in {
      parameters: parameter_temp10;

      /** Wärmequellen Eintrittstemperatur zum Verdampfer */
      temp: temp10;
    }

    /** Status 02-053 */
    @inherit(r)
    @ext(0x2, 0xb5, 0, 0x42)
    model Status {
      parameters: parameter1;

      /** WP Status */
      @values(Values_status_1)
      status: status;
    }

    /** Betriebswahl Wärmeerzeuger 09-075 */
    @inherit(r)
    @ext(0x9, 0xcb, 0, 0x42)
    model Betriebswahl {
      parameters: parameter1;

      /** Betriebswahl Wärmeerzeuger */
      @values(Values_status_2)
      status: status;
    }

    /** Uhrzeit 02-072 */
    @inherit(r)
    @ext(0x2, 0xc8, 0, 0x42)
    model Time {
      parameters: parameter_time;

      /** Uhrzeit */
      time: MIN;
    }

    /** Aussentemperatur 00-000 */
    @inherit(r)
    @ext(0, 0x80, 0, 0x42)
    model At {
      parameters: parameter_temp10;

      /** Aussentemperatur */
      temp: temp10;
    }

    /** Wochentag 02-073 */
    @inherit(r)
    @ext(0x2, 0xc9, 0, 0x42)
    model Wd {
      parameters: parameter_wd;

      /** Wochentag */
      day: BDY;
    }
  }
  namespace Wp_stat {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x7d)
    model r {}

    /** Vorlauftemperatur Wärmeerzeuger 00-007 */
    @inherit(r)
    @ext(0x80, 0, 0x2)
    model Vl_temp_ist {
      parameters: parameter_temp10;

      /** Wärmeerzeuger Vorlauftemperatur */
      temp: temp10;
    }

    /** Vorlauftemperatur Sollwert Anforderung Wärmeerzeuger 01-007 */
    @inherit(r)
    @ext(0x81, 0, 0x2)
    model Vl_temp_soll {
      parameters: parameter_temp10;

      /** Berechneter Sollwert für die Wärmeerzeuger Vorlauftemperatur */
      temp: temp10;
    }

    /** Rücklauftemperatur Wärmeerzeuger 00-008 */
    @inherit(r)
    @ext(0x82, 0, 0x2)
    model Rl_temp_ist {
      parameters: parameter_temp10;

      /** Wärmeerzeuger Rücklauftemperatur */
      temp: temp10;
    }

    /** Wärmequelle Austrittstemperatur 00-070 */
    @inherit(r)
    @ext(0x83, 0, 0x2)
    model Wq_temp_out {
      parameters: parameter_temp10;

      /** Wärmequellen Austrittstemperatur vom Verdampfer */
      temp: temp10;
    }

    /** Wärmequelle Eintrittstemperatur 00-071 */
    @inherit(r)
    @ext(0x84, 0, 0x2)
    model Wq_temp_in {
      parameters: parameter_temp10;

      /** Wärmequellen Eintrittstemperatur zum Verdampfer */
      temp: temp10;
    }

    /** Heissgastemperatur 00-072 */
    @inherit(r)
    @ext(0x85, 0, 0x2)
    model Temp_hg {
      parameters: parameter_temp10;

      /** Heissgastemperatur im Kältekreis */
      temp: temp10;
    }

    /** Status 02-053 */
    @inherit(r)
    @ext(0x86, 0, 0x2)
    model Status {
      parameters: parameter1;

      /** WP Status */
      @values(Values_status_3)
      status: status;
    }

    /** Schaltzyklen 02-080 */
    @inherit(r)
    @ext(0x87, 0, 0x2)
    model Sz_1 {
      parameters: parameter2;

      /** Einschaltzyklen des Kompressors */
      count: HCD;
    }

    /** Betriebsstunden 02-081 */
    @inherit(r)
    @ext(0x88, 0, 0x2)
    model Bs_1 {
      parameters: parameter2;

      /** Betriebsstunden des Kompressors */
      hours: hcd100;
    }

    /** Betriebsstunden 2. Stufe 02-082 */
    @inherit(r)
    @ext(0x89, 0, 0x2)
    model Bs_2 {
      parameters: parameter2;

      /** Betriebsstunden des Kompressors 2te Stufe */
      hours: hcd100;
    }

    /** Schaltzyklen 2. Stufe 02-083 */
    @inherit(r)
    @ext(0x8a, 0, 0x2)
    model Sz_2 {
      parameters: parameter2;

      /** Einschaltzyklen des Kompressors 2te Stufe */
      count: HCD;
    }

    /** Vorlauftemperatur separate WW Energiemessung 21-004 */
    @inherit(r)
    @ext(0x8b, 0, 0x2)
    model Vl_temp_ww {
      parameters: parameter_temp10;

      /** Vorlauftemperatur für die separate Warmwasser Ladeenergiemessung */
      temp: temp10;
    }
  }
  namespace Wp_param1 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x69)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'User Level'")
  namespace Wp_param1.userlevel {
    /** Wärmeerzeuger Typ 09-007 */
    @inherit(r)
    @ext(0x80, 0, 0x2)
    model Typ {
      parameters: parameter1;

      /** Wärmeerzeuger Typ */
      @values(Values_status_4)
      status: status;
    }

    /** Betriebswahl Wärmeerzeuger 09-075 */
    @inherit(r)
    @ext(0x81, 0, 0x2)
    model Betriebswahl {
      parameters: parameter1;

      /** Betriebswahl Wärmeerzeuger */
      @values(Values_status_5)
      status: status;
    }

    /** Applikationstyp Wärmepumpe 15-006 */
    @inherit(r)
    @ext(0x82, 0, 0x2)
    model Applikationstyp {
      parameters: parameter1;

      /** Damit kann ein vordefinierter Parametersatz für die Wärmepumpenfunktion geladen werden */
      @values(Values_status_6)
      status: status;
    }
  }
  namespace Wp_param2 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x69)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'Expert Level'")
  namespace Wp_param2.expertlevel {
    /** eBUS Wärmeerzeuger Adresse 04-027 */
    @inherit(r)
    @ext(0x80, 0, 0x2)
    model Ebus_adresse {
      parameters: parameter1;

      /** Mit diesem Einsteller kann eine Feuerungsautomat in die Wäremerzeugerfunktion eingebunden werden. */
      @values(Values_status_7)
      status: status;
    }

    /** Nachlaufzeit Wärmeerzeuger Pumpe 09-000 */
    @inherit(r)
    @ext(0x81, 0, 0x2)
    model Nachlauf_pumpe {
      parameters: parameter1;

      /** Die Wärmeerzeugerpumpe lbiebt nach Abschalten der Wärmeerzeugeranforderung für die hier eingestellte Nachlaufzeit in Betrieb. */
      @unit("min")
      @divisor(10)
      value: SIN;
    }

    /** Einschaltverzögerung Wärmeerzeuger 09-004 */
    @inherit(r)
    @ext(0x82, 0, 0x2)
    model Einschaltverzoegerung {
      parameters: parameter1;

      /** Einschaltverzögerung des Wärmeerzeugers nach einer Wärmeanforderung. */
      @unit("min")
      @divisor(10)
      value: SIN;
    }

    /** Wärmeerzeuger Typ 09-007 */
    @inherit(r)
    @ext(0x83, 0, 0x2)
    model Typ {
      parameters: parameter1;

      /** Wärmeerzeuger Typ */
      @values(Values_status_8)
      status: status;
    }

    /** Bedingte Freigabe Wärmeerzeuger 09-011 */
    @inherit(r)
    @ext(0x84, 0, 0x2)
    model Bedingte_freigabe {
      parameters: parameter1;

      /** Mit dieser Einstellung kann eine bedingte Freigabe für den Wärmeerzeuger eingestellt werden. */
      @values(Values_status_9)
      status: status;
    }

    /** Aussentemperatur Freigabe 09-012 */
    @inherit(r)
    @ext(0x85, 0, 0x2)
    model Atemp_freigabe {
      parameters: parameter_temp2;

      /** Mit der Einstellung wird die Aussentemperatur bei der die bedingte Freigabe des Wärmeerzeugers erfolgt bestimmt. */
      temp: temp2;
    }

    /** Solltemperatur Handbetrieb 09-020 */
    @inherit(r)
    @ext(0x86, 0, 0x2)
    model Hand_temp_soll {
      parameters: parameter1;

      /** Sollwert für die Wärmeerzeuger Vorlauftemperatur im Handbetrieb. */
      temp: temp10;
    }

    /** Abschaltdifferenz Wärmeerzeuger Regelung 09-021 */
    @inherit(r)
    @ext(0x87, 0, 0x2)
    model Abschaltdifferenz {
      parameters: parameter_temp10K;

      /** Wird am WE Vorlauffühler die Temperatur TWVSoll+Einstellwert überschritten schaltet der WE aus. */
      temp: temp10K;
    }

    /** Stillstandszeit minimal Wärmeerzeuger 09-023 */
    @inherit(r)
    @ext(0x88, 0, 0x2)
    model Stillstand_min {
      parameters: parameter1;

      /** Mit dem Einsteller wird die minimale Stillstandszeit nach einer Abschaltung des Wärmeerzeugers eingestellt. */
      @unit("min")
      @divisor(10)
      time: SIN;
    }

    /** Laufzeit minimal Wärmeerzeuger 09-031 */
    @inherit(r)
    @ext(0x89, 0, 0x2)
    model Laufzeit_min {
      parameters: parameter1;

      /** Minimale Laufzeit für den Wärmeerzeuger nach dem Einschalten. */
      @unit("min")
      @divisor(10)
      time: SIN;
    }

    /** Externe Wärmeerzeuger Sperre 09-074 */
    @inherit(r)
    @ext(0x8a, 0, 0x2)
    model Externe_we_sperre {
      parameters: parameter1;

      /** todo 0xffff=Funktion invers is out of possible value range */
      @values(Values_status_10)
      status: status;
    }

    /** Betriebswahl Wärmeerzeuger 09-075 */
    @inherit(r)
    @ext(0x8b, 0, 0x2)
    model Betriebswahl {
      parameters: parameter1;

      /** Betriebswahl Wärmeerzeuger */
      @values(Values_status_11)
      status: status;
    }

    /** Messwertanpassung WE Rücklauftemperatur 09-079 */
    @inherit(r)
    @ext(0x8c, 0, 0x2)
    model Messwertanpassung_rl {
      parameters: parameter_temp10K;

      /** Mit der Einstellung kann der Messwert der Wärmeerzeuger Rücklauftemperatur angeglichen werden. */
      temp: temp10K;
    }

    /** Betriebsart Wärmeerzeugerpumpe 09-099 */
    @inherit(r)
    @ext(0x8d, 0, 0x2)
    model Betriebsart_pumpe {
      parameters: parameter1;

      /** Freigabe Wärmeerzeugerpumpe mit */
      @values(Values_status_12)
      status: status;
    }

    /** Maximaltemperatur Wärmeerzeuger Vorlauf 10-031 */
    @inherit(r)
    @ext(0x8e, 0, 0x2)
    model We_vl_temp_max {
      parameters: parameter_temp10;

      /** Wird die maximale WE Temperatur überschritten wird der WE unbedingt abgeschaltet. */
      temp: temp10;
    }

    /** Einschaltdifferenz Maximaltemperaturabschaltung 10-037 */
    @inherit(r)
    @ext(0x8f, 0, 0x2)
    model Einschaltdiff_maxab {
      parameters: parameter_temp10;

      /** Bei einer TWVmax Abschaltung ist immer diese eingesteltte Hysterese für die Wiedereinschaltung wirksam. */
      temp: temp10;
    }

    /** Applikationstyp Wärmepumpe 15-006 */
    @inherit(r)
    @ext(0x90, 0, 0x2)
    model Applikationstyp {
      parameters: parameter1;

      /** Damit kann ein vordefinierter Parametersatz für die Wärmepumpenfunktion geladen werden */
      @values(Values_status_13)
      status: status;
    }

    /** Heissgas Maximaltemperatur 15-010 */
    @inherit(r)
    @ext(0x91, 0, 0x2)
    model Heissgas_temp_max {
      parameters: parameter_temp10;

      /** Übersteigt die Heissgastemperatur den Einstellwert wird der Verdichter sofort abgeschaltet und eine Heissgasstörung ausgelöst. */
      temp: temp10;
    }

    /** Minimaler Kondensator Durchfluss 15-011 */
    @inherit(r)
    @ext(0x92, 0, 0x2)
    model Kondensator_fluss_min {
      parameters: parameter1;

      @divisor(10)
      value: SIN;
    }

    /** Stillstandszeit Quellenpumpe bei Passivkühlbetrieb 15-020 */
    @inherit(r)
    @ext(0x93, 0, 0x2)
    model Stillstand_quelle {
      parameters: parameter1;

      @unit("min")
      time: UIN;
    }

    /** Nachlaufzeit Quellenpumpe 15-021 */
    @inherit(r)
    @ext(0x94, 0, 0x2)
    model Nachlauf_quelle {
      parameters: parameter1;

      @unit("min")
      @divisor(10)
      time: UIN;
    }

    /** Frostschutztemperatur Wärmequelle Austritt 15-022 */
    @inherit(r)
    @ext(0x95, 0, 0x2)
    model Frostschutz_wq_out {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Zykluszeit Taktbetrieb Wärmequellenpumpe 15-023 */
    @inherit(r)
    @ext(0x96, 0, 0x2)
    model Zyklus_taktbetrieb_quelle {
      parameters: parameter1;

      @unit("min")
      time: UIN;
    }

    /** Abschaltoffset Quellenfrostschutz 15-025 */
    @inherit(r)
    @ext(0x97, 0, 0x2)
    model Offset_ab_quellenfs {
      parameters: parameter1;

      @unit("K")
      @divisor(10)
      temp: UIN;
    }

    /** Frostschutztemperatur Wärmequellen Eintritt 15-031 */
    @inherit(r)
    @ext(0x98, 0, 0x2)
    model Frostschutz_wq_in {
      parameters: parameter1;
      temp: temp10;
    }

    /** Verzögerung Niederdruckstörung 15-046 */
    @inherit(r)
    @ext(0x9a, 0, 0x2)
    model Verzoegerung_nd_stoerung1 {
      parameters: parameter1;

      @unit("min")
      @divisor(2)
      time: UIN;
    }

    /** Frosttemperaturschwelle Wärmeerzeugerpumpe 15-048 */
    @inherit(r)
    @ext(0x9b, 0, 0x2)
    model Frostschwelle_pumpe {
      parameters: parameter1;

      @unit("°C")
      @divisor(2)
      temp: SIN;
    }

    /** Messwertanpassung Quellenaustrittstemperatur 15-060 */
    @inherit(r)
    @ext(0x9c, 0, 0x2)
    model Messwertanpassung_wq_out {
      parameters: parameter_temp10;

      @unit("K")
      @divisor(10)
      temp: SIN;
    }

    /** Konfiguration Quellendruck Störung 15-070 */
    @inherit(r)
    @ext(0x9d, 0, 0x2)
    model Konfig_wqdruck_stoerung {
      parameters: parameter1;
      status: SIN;
    }

    /** Konfiguration Motorschutz Quellenpumpe Störung 15-071 */
    @inherit(r)
    @ext(0x9e, 0, 0x2)
    model Konfig_wqmotor_stoerung {
      parameters: parameter1;
      status: SIN;
    }

    /** Konfiguration Motorschutz Verdichter Störung 15-072 */
    @inherit(r)
    @ext(0x9f, 0, 0x2)
    model Konfig_verdmotor_stoerung {
      parameters: parameter1;
      status: SIN;
    }

    /** Konfiguration Hochdruck Störung 15-075 */
    @inherit(r)
    @ext(0xa0, 0, 0x2)
    model Konfig_hd_stoerung {
      parameters: parameter1;
      status: SIN;
    }

    /** Konfiguration Niederdruck Störung 15-076 */
    @inherit(r)
    @ext(0xa1, 0, 0x2)
    model Konfig_nd_stoerung {
      parameters: parameter1;
      status: SIN;
    }

    /** Konfiguration Wärmequellen Frostschutz Störung 15-077 */
    @inherit(r)
    @ext(0xa2, 0, 0x2)
    model Konfig_wq_frostschutz_stoerung {
      parameters: parameter1;
      status: UIN;
    }

    /** Konfiguration Kondensator Frostschutz Störung 15-079 */
    @inherit(r)
    @ext(0xa3, 0, 0x2)
    model Konfig_kondens_frostschutz_stoerung {
      parameters: parameter1;
      status: UIN;
    }

    /** Konfiguration Heissgasabschaltung 15-083 */
    @inherit(r)
    @ext(0xa4, 0, 0x2)
    model Konfig_heissgas_abschaltung {
      parameters: parameter1;
      status: UIN;
    }

    /** Konfiguration Kondensator Durchfluss Störung 15-085 */
    @inherit(r)
    @ext(0xa5, 0, 0x2)
    model Konfig_kondens_durchfluss_stoerung {
      parameters: parameter1;
      status: UIN;
    }

    /** Frostschutztemperatur Passiv Kühlbetrieb 15-090 */
    @inherit(r)
    @ext(0xa6, 0, 0x2)
    model Temp_frostschutz_passivkuehl {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Konfiguration Durchflusssensor 17-007 */
    @inherit(r)
    @ext(0xa7, 0, 0x2)
    model Konfig_durchflusssensor {
      parameters: parameter1;
      status: status;
    }

    /** Durchfluss Heizbetrieb 17-008 */
    @inherit(r)
    @ext(0xa8, 0, 0x2)
    model Durchfluss_heizbetrieb {
      parameters: parameter1;

      @unit("l/min")
      @divisor(10)
      value: UIN;
    }

    /** Durchfluss Warmwasser Ladung 17-009 */
    @inherit(r)
    @ext(0xa9, 0, 0x2)
    model Durchfluss_ww {
      parameters: parameter1;

      @unit("l/min")
      @divisor(10)
      value: UIN;
    }

    /** Korrekturfaktor Leistung 17-012 */
    @inherit(r)
    @ext(0xaa, 0, 0x2)
    model Korr_faktor_leistung {
      parameters: parameter1;

      @unit("%")
      value: UIN;
    }

    /** Konfiguration Durchflusssensor Warmwasserbetrieb 17-014 */
    @inherit(r)
    @ext(0xab, 0, 0x2)
    model Konfig_durchlusssensor_ww {
      parameters: parameter1;
      status: status;
    }

    /** Korrekturfaktor Leistung Warmwasserbetrieb 17-015 */
    @inherit(r)
    @ext(0xac, 0, 0x2)
    model Korr_faktor_ww {
      parameters: parameter1;

      @unit("%")
      value: UIN;
    }

    /** Durchfluss separate Warmwasser Ladung 17-016 */
    @inherit(r)
    @ext(0xad, 0, 0x2)
    model Druchfluss_sep_ww {
      parameters: parameter1;

      @unit("l/min")
      @divisor(10)
      value: UIN;
    }

    /** WEP Leistungsanteil für COP Bestimmung 17-017 */
    @inherit(r)
    @ext(0xae, 0, 0x2)
    model Wep_anteil_cop {
      parameters: parameter1;

      @unit("kW")
      @divisor(100)
      value: SIN;
    }

    /** WQP Leistungsanteil für COP Bestimmung 17-018 */
    @inherit(r)
    @ext(0xaf, 0, 0x2)
    model Wqp_anteil_cop {
      parameters: parameter1;

      @unit("kW")
      @divisor(100)
      value: SIN;
    }
  }
  namespace Wp_relais1 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x7b)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'User Level'")
  namespace Wp_relais1.userlevel {
    /** Verdichter 01-076 */
    @inherit(r)
    @ext(0x80, 0, 0x2)
    model Verdichter {
      parameters: parameter1;

      /** Stellgröße für eine Warmwasser Zirkulationspumpe */
      status: status;
    }

    /** Umlenkventil Passiv Kühlung 01-086 */
    @inherit(r)
    @ext(0x81, 0, 0x2)
    model Umlenkventil_passivkuehl {
      parameters: parameter1;

      /** Stellgröße für eine Warmwasser Ladepumpe oder Umlenkventil */
      status: status;
    }
  }
  namespace Wp_relais2 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x7b)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'Expert Level'")
  namespace Wp_relais2.expertlevel {
    /** Pumpe Wärmeerzeuger 01-022 */
    @inherit(r)
    @ext(0x80, 0, 0x2)
    model We_pumpe {
      parameters: parameter1;

      /** Stellgröße für eine Warmwasser-Zusatzheizung */
      status: status;
    }

    /** Verdichter 01-076 */
    @inherit(r)
    @ext(0x81, 0, 0x2)
    model Verdichter {
      parameters: parameter1;

      /** Stellgröße für eine Warmwasser Zirkulationspumpe */
      status: status;
    }

    /** Pumpe Wärmequelle 01-077 */
    @inherit(r)
    @ext(0x82, 0, 0x2)
    model Wq_pumpe {
      parameters: parameter1;
      status: status;
    }

    /** Umlenkventil Passiv Kühlung 01-086 */
    @inherit(r)
    @ext(0x83, 0, 0x2)
    model Umlenkventil_passivkuehl {
      parameters: parameter1;

      /** Stellgröße für eine Warmwasser Ladepumpe oder Umlenkventil */
      status: status;
    }
  }
  namespace Ww_ping {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21)
    model r {}

    /** Warmwassertemperatur 00-004 */
    @inherit(r)
    @ext(0, 0x84, 0, 0x4e)
    model Temp_ist {
      parameters: parameter1;

      /** Obere Warmwasserspeichertemperatur */
      temp: temp10;
    }
  }
  namespace Ww_timeprogramm {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x22, 0x5)
    model r {}

    /** Zeitprogramm Warmwasser Teil 1 */
    @inherit(r)
    @ext(0xbd, 0, 0x4e)
    model Tp0_ww {
      mode: tp_mode;
    }

    /** Zeitprogramm Warmwasser Teil 2 */
    @inherit(r)
    @ext(0xbd, 1, 0x4e)
    model Tp1_ww {
      schedule: tp_20h;
    }

    /** Zeitprogramm Warmwasser Teil 3 */
    @inherit(r)
    @ext(0xbd, 0x2, 0x4e)
    model Tp2_ww {
      schedule: tp_20h;
    }

    /** Zeitprogramm Warmwasser Teil 4 */
    @inherit(r)
    @ext(0xbd, 0x3, 0x4e)
    model Tp3_ww {
      schedule: tp_20h;
    }

    /** Zeitprogramm Warmwasser Teil 5 */
    @inherit(r)
    @ext(0xbd, 0x4, 0x4e)
    model Tp4_ww {
      schedule: tp_20h;
    }

    /** Zeitprogramm Warmwasser Teil 6 */
    @inherit(r)
    @ext(0xbd, 0x5, 0x4e)
    model Tp5_ww {
      schedule: tp_20h;
    }

    /** Zeitprogramm Warmwasser Teil 7 */
    @inherit(r)
    @ext(0xbd, 0x6, 0x4e)
    model Tp6_ww {
      schedule: tp_20h;
    }

    /** Zeitprogramm Warmwasser Teil 8 */
    @inherit(r)
    @ext(0xbd, 0x7, 0x4e)
    model Tp7_ww {
      schedule: tp_20h;
    }

    /** Zeitprogramm Warmwasser Teil 9 */
    @inherit(r)
    @ext(0xbd, 0x8, 0x4e)
    model Tp8_ww {
      schedule: tp_20h;
    }

    /** Zeitprogramm Warmwasser Teil 10 */
    @inherit(r)
    @ext(0xbd, 0x9, 0x4e)
    model Tp9_ww {
      schedule: tp_8h;
    }

    /** Zeitprogramm Zirkulation Teil 1 */
    @inherit(r)
    @ext(0xc0, 0, 0x4e)
    model Tp0_zirk {
      mode: tp_mode;
    }

    /** Zeitprogramm Zirkulation Teil 2 */
    @inherit(r)
    @ext(0xc0, 1, 0x4e)
    model Tp1_zirk {
      schedule: tp_20h;
    }

    /** Zeitprogramm Zirkulation Teil 3 */
    @inherit(r)
    @ext(0xc0, 0x2, 0x4e)
    model Tp2_zirk {
      schedule: tp_20h;
    }

    /** Zeitprogramm Zirkulation Teil 4 */
    @inherit(r)
    @ext(0xc0, 0x3, 0x4e)
    model Tp3_zirk {
      schedule: tp_20h;
    }

    /** Zeitprogramm Zirkulation Teil 5 */
    @inherit(r)
    @ext(0xc0, 0x4, 0x4e)
    model Tp4_zirk {
      schedule: tp_20h;
    }

    /** Zeitprogramm Zirkulation Teil 6 */
    @inherit(r)
    @ext(0xc0, 0x5, 0x4e)
    model Tp5_zirk {
      schedule: tp_20h;
    }

    /** Zeitprogramm Zirkulation Teil 7 */
    @inherit(r)
    @ext(0xc0, 0x6, 0x4e)
    model Tp6_zirk {
      schedule: tp_20h;
    }

    /** Zeitprogramm Zirkulation Teil 8 */
    @inherit(r)
    @ext(0xc0, 0x7, 0x4e)
    model Tp7_zirk {
      schedule: tp_20h;
    }

    /** Zeitprogramm Zirkulation Teil 9 */
    @inherit(r)
    @ext(0xc0, 0x8, 0x4e)
    model Tp8_zirk {
      schedule: tp_20h;
    }

    /** Zeitprogramm Zirkulation Teil 10 */
    @inherit(r)
    @ext(0xc0, 0x9, 0x4e)
    model Tp9_zirk {
      schedule: tp_8h;
    }

    /** Zeitprogramm Legionellen Teil 1 */
    @inherit(r)
    @ext(0xbe, 0, 0x4e)
    model Tp0_legio {
      mode: tp_mode;
    }

    /** Zeitprogramm Legionellen Teil 2 */
    @inherit(r)
    @ext(0xbe, 1, 0x4e)
    model Tp1_legio {
      schedule: tp_20h;
    }

    /** Zeitprogramm Legionellen Teil 3 */
    @inherit(r)
    @ext(0xbe, 0x2, 0x4e)
    model Tp2_legio {
      schedule: tp_20h;
    }

    /** Zeitprogramm Legionellen Teil 4 */
    @inherit(r)
    @ext(0xbe, 0x3, 0x4e)
    model Tp3_legio {
      schedule: tp_20h;
    }

    /** Zeitprogramm Legionellen Teil 5 */
    @inherit(r)
    @ext(0xbe, 0x4, 0x4e)
    model Tp4_legio {
      schedule: tp_20h;
    }

    /** Zeitprogramm Legionellen Teil 6 */
    @inherit(r)
    @ext(0xbe, 0x5, 0x4e)
    model Tp5_legio {
      schedule: tp_20h;
    }

    /** Zeitprogramm Legionellen Teil 7 */
    @inherit(r)
    @ext(0xbe, 0x6, 0x4e)
    model Tp6_legio {
      schedule: tp_20h;
    }

    /** Zeitprogramm Legionellen Teil 8 */
    @inherit(r)
    @ext(0xbe, 0x7, 0x4e)
    model Tp7_legio {
      schedule: tp_20h;
    }

    /** Zeitprogramm Legionellen Teil 9 */
    @inherit(r)
    @ext(0xbe, 0x8, 0x4e)
    model Tp8_legio {
      schedule: tp_20h;
    }

    /** Zeitprogramm Legionellen Teil 10 */
    @inherit(r)
    @ext(0xbe, 0x9, 0x4e)
    model Tp9_legio {
      schedule: tp_8h;
    }

    /** Zeitprogramm Warmwasser */
    @inherit(r)
    @ext(0xbd, 0, 0x4e)
    @chain(
      0,
      #[0xbd, 1, 0x4e],
      #[0xbd, 0x2, 0x4e],
      #[0xbd, 0x3, 0x4e],
      #[0xbd, 0x4, 0x4e],
      #[0xbd, 0x5, 0x4e],
      #[0xbd, 0x6, 0x4e],
      #[0xbd, 0x7, 0x4e],
      #[0xbd, 0x8, 0x4e],
      #[0xbd, 0x9, 0x4e]
    )
    model Tp_ww {
      all: tp_all;
    }

    /** Zeitprogramm Zirkulation */
    @inherit(r)
    @ext(0xc0, 0, 0x4e)
    @chain(
      0,
      #[0xc0, 1, 0x4e],
      #[0xc0, 0x2, 0x4e],
      #[0xc0, 0x3, 0x4e],
      #[0xc0, 0x4, 0x4e],
      #[0xc0, 0x5, 0x4e],
      #[0xc0, 0x6, 0x4e],
      #[0xc0, 0x7, 0x4e],
      #[0xc0, 0x8, 0x4e],
      #[0xc0, 0x9, 0x4e]
    )
    model Tp_zirk {
      all: tp_all;
    }

    /** Zeitprogramm Legionellen */
    @inherit(r)
    @ext(0xbe, 0, 0x4e)
    @chain(
      0,
      #[0xbe, 1, 0x4e],
      #[0xbe, 0x2, 0x4e],
      #[0xbe, 0x3, 0x4e],
      #[0xbe, 0x4, 0x4e],
      #[0xbe, 0x5, 0x4e],
      #[0xbe, 0x6, 0x4e],
      #[0xbe, 0x7, 0x4e],
      #[0xbe, 0x8, 0x4e],
      #[0xbe, 0x9, 0x4e]
    )
    model Tp_legio {
      all: tp_all;
    }
  }
  namespace Ww_stat {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x79)
    model r {}

    /** Warmwassertemperatur 00-004 */
    @inherit(r)
    @ext(0x80, 0, 0xe)
    model Temp_ist {
      parameters: parameter_temp10;

      /** Obere Warmwasserspeichertemperatur */
      temp: temp10;
    }

    /** Warmwassertemperatur Sollwert 01-004 */
    @inherit(r)
    @ext(0x81, 0, 0xe)
    model Temp_soll_calc {
      parameters: parameter_temp10;

      /** Berechneter Sollwert für die Warmwassertemperatur */
      temp: temp10;
    }

    /** Status Warmwasserregelung 02-052 */
    @inherit(r)
    @ext(0x82, 0, 0xe)
    model Status {
      parameters: parameter1;

      /** Zustand Warmwasserregelung */
      @values(Values_temp)
      temp: status;
    }
  }
  namespace Ww_param1 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x65)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'User Level'")
  namespace Ww_param1.userlevel {
    /** Betriebswahl Warmwasser 05-050 */
    @inherit(r)
    @ext(0x80, 0, 0xe)
    model Betriebswahl {
      parameters: parameter1;

      /** Betriebswahl Warmwasserfunktion */
      @values(Values_status_14)
      status: status;
    }

    /** Normal Warmwassertemperatur 05-051 */
    @inherit(r)
    @ext(0x81, 0, 0xe)
    model Temp_soll {
      parameters: parameter_temp10;

      /** Mit dieser Einstellung wird der Warmwasser Sollwert eingestellt */
      temp: temp10;
    }

    /** Applikationstyp Warmwasserbereitung 05-076 */
    @inherit(r)
    @ext(0x82, 0, 0xe)
    model Applikationstyp {
      parameters: parameter1;

      /** Mit dieser Einstellung kann ein entsprechend definierter Applikationstyp vorgewählt werden */
      @values(Values_status_15)
      status: status;
    }
  }
  namespace Ww_param2 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x65)
    model r {}

    /** default *w */
    @write
    @zz(0x10)
    @base(0x6, 0x23, 0x65)
    model w {}
  }
  @condition(Globals.Parameter_level.status, "'Expert Level'")
  namespace Ww_param2.expertlevel {
    /** Ferien Zonenzuordnung 03-092 */
    @inherit(r)
    @ext(0x80, 0, 0xe)
    model Zone_ferien {
      parameters: parameter1;

      /** Nutzung des lokalen Ferienprogramms oder das eines bestehenden Heizkreises */
      status: status;
    }

    /** Timer Zonenzuordnung 03-093 */
    @inherit(r)
    @ext(0x81, 0, 0xe)
    model Zone_timer {
      parameters: parameter1;

      /** Nutzung der lokalen Timerfunktionen oder die eines bestehenden Heizkreises */
      status: status;
    }

    /** Betriebswahl Zonenzuordnung 03-094 */
    @inherit(r)
    @ext(0x82, 0, 0xe)
    model Zone_betriebswahl {
      parameters: parameter1;

      /** Nutzung der lokalen Betriebswahl oder die eines bestehenden Heizkreises */
      status: status;
    }

    /** Zeitprogramm Zonenzuordnung 03-095 */
    @inherit(r)
    @ext(0x83, 0, 0xe)
    model Zone_zeitprogramm {
      parameters: parameter1;

      /** Nutzung des lokalen Zeitprogramms oder das eines bestehenden Heizkreises */
      status: status;
    }

    /** Einschaltdifferenz Warmwasserbereitung 05-000 */
    @inherit(r)
    @ext(0x84, 0, 0xe)
    model Einschaltdifferenz {
      parameters: parameter_temp10K;

      /** Unterschreitet die Warmwassertemperatur ihren Sollwert um den hier eingestellten Wert wird eine Warmwasserladung gestartet */
      @unit("K")
      @divisor(10)
      temp: SIN;
    }

    /** Überhöhung Ladesollwert 05-001 */
    @inherit(r)
    @ext(0x85, 0, 0xe)
    model Ueberhoehung {
      parameters: parameter_temp10K;

      /** Mit diesem Einsteller kann eine Überhöhung für den Ladesollwert eingestellt werden */
      @unit("K")
      @divisor(10)
      temp: SIN;
    }

    /** Warmwasser Ladevorrang 05-002 */
    @inherit(r)
    @ext(0x86, 0, 0xe)
    model Ladevorrang {
      parameters: parameter1;

      /** Mit dieser Einstellung kann der Ladevorrang eingestellt werden */
      @unit("h")
      @divisor(10)
      time: SIN;
    }

    /** Nachlaufzeit Warmwasserladepumpe 05-003 */
    @inherit(r)
    @ext(0x87, 0, 0xe)
    model Nachlauf_ladepumpe {
      parameters: parameter1;

      /** Nach erfolgter Warmwasserladung läuft die Ladepumpe um die hier eingestellte Zeit nach */
      @unit("min")
      @divisor(10)
      time: SIN;
    }

    /** Legionellenschutztemperatur 05-004 */
    @inherit(r)
    @ext(0x88, 0, 0xe)
    model Legio {
      parameters: parameter_temp10;

      /** Mit dem Einsteller wird die Legionellenschutz- bzw. die Komfort Warmwassertemperatur gewählt */
      temp: temp10;
    }

    /** Modus Ladepumpennachlauf 05-005 */
    @inherit(r)
    @ext(0x89, 0, 0xe)
    model Modus_ladepumpennachlauf {
      parameters: parameter1;

      /** Wahl des Modus für die Ladepumpensteuerung */
      @values(Values_status_16)
      status: status;
    }

    /** Zirkulationspumpe 05-006 */
    @inherit(r)
    @ext(0x8a, 0, 0xe)
    model Zirkulationspumpe {
      parameters: parameter1;

      /** Mit der Einstellung kann die Zirkulationspumpenfunktion aktiviert werden */
      @values(Values_status_17)
      status: status;
    }

    /** Zirkulationspumpe 05-006 */
    @inherit(w)
    @ext(0x8a, 0, 0xe)
    model Setzirkulationspumpe {
      zirkstatus: status;
    }

    /** Pumpenanforderung Warmwasserladung 05-007 */
    @inherit(r)
    @ext(0x8b, 0, 0xe)
    model Pumpenanforderung {
      parameters: parameter1;

      /** Mit dem Einsteller kann die Heizkreispumpe für die Warmwasserladung aktiviert werden */
      @values(Values_status_18)
      status: status;
    }

    /** Freigabetemperatur Nachladung 05-010 */
    @inherit(r)
    @ext(0x8c, 0, 0xe)
    model Temp_freigabe_nachladung {
      parameters: parameter_temp10;

      /** Ist die WW-Temperatur höher als die eingestelllte Nachladetemperatur wird die Ladeanforderung an die zentrale WE-Anlage abgeschaltet und eine WW-interne Ladung eingeschaltet */
      temp: temp10;
    }

    /** Modus Warmwasserladung 05-011 */
    @inherit(r)
    @ext(0x8d, 0, 0xe)
    model Modus_wwladung {
      parameters: parameter1;

      /** Einstellung Warmwassermodus */
      @values(Values_status_19)
      status: status;
    }

    /** Reduktion Warmwassersollwert im Störfall 05-013 */
    @inherit(r)
    @ext(0x8e, 0, 0xe)
    model Reduktion_temp_error {
      parameters: parameter1;

      /** Bei einer Wärmeerzeugerstörung wird der Warmwassersollwert um den hier eingestellten Wert reduziert */
      @unit("K")
      @divisor(2)
      temp: SIN;
    }

    /** Energiezwangzahl 05-039 */
    @inherit(r)
    @ext(0x8f, 0, 0xe)
    model Energiezwangzahl {
      parameters: parameter1;

      /** Mit der Einstellung kann die Reaktion des Warmwasserkreises auf Energiezwang eingestellt werden */
      @values(Values_status_20)
      status: status;
    }

    /** Fehlerdauer Warmwasser Störung 05-040 */
    @inherit(r)
    @ext(0x90, 0, 0xe)
    model Fehlerdauer {
      parameters: parameter1;

      /** Unterschreitet die Warmwassertemperatur den Sollwert länger als die hier eingestellte Zeit um mehr als 5K wird eine Störmeldung generiert. 0=keine Störmeldung */
      @unit("h")
      @divisor(10)
      hours: SIN;
    }

    /** Betriebswahl Warmwasser 05-050 */
    @inherit(r)
    @ext(0x91, 0, 0xe)
    model Betriebswahl {
      parameters: parameter1;

      /** Betriebswahl Warmwasserfunktion */
      @values(Values_status_21)
      status: status;
    }

    /** Normal Warmwassertemperatur 05-051 */
    @inherit(r)
    @ext(0x92, 0, 0xe)
    model Temp_soll {
      parameters: parameter_temp10;

      /** Mit dieser Einstellung wird der Warmwasser Sollwert eingestellt */
      temp: temp10;
    }

    /** Normal Warmwassertemperatur 05-051 */
    @inherit(w)
    @ext(0x92, 0, 0xe)
    model Settemp_soll {
      ww_temp: temp10;
    }

    /** Maximale Warmwasser Sollwertbegrenzung 05-057 */
    @inherit(r)
    @ext(0x93, 0, 0xe)
    model Temp_maxgrenze {
      parameters: parameter1;

      /** Mit diesem Einsteller kann der Einstellbereich der Warmwasser Solltemperatur (05-051) begrenzt werden. */
      @unit("°C")
      temp: UIN;
    }

    /** Applikationstyp Warmwasserbereitung 05-076 */
    @inherit(r)
    @ext(0x94, 0, 0xe)
    model Applikationstyp {
      parameters: parameter1;

      /** Mit dieser Einstellung kann ein entsprechend definierter Applikationstyp vorgewählt werden */
      @values(Values_status_22)
      status: status;
    }

    /** Maximale Warmwasser Ladedauer 05-081 (Prüfen!) */
    @inherit(r)
    @ext(0x95, 0, 0xe)
    model Ladedauer_max {
      parameters: parameter1;

      /** Wird die eingestellte Maximalladedauer überschritten wird der Ladevorgang unterbrochen und erst wieder gestartet wenn die Einschaltdifferenz (05-000) zur aktuellen Warmwassertemperatur überschritten wird. */
      @unit("h")
      @divisor(2)
      hours: SIN;
    }

    /** Maximale Nachladedauer bei Ladungsabbruch 05-082 (Prüfen!) */
    @inherit(r)
    @ext(0x96, 0, 0xe)
    model Nachladedauer_max {
      parameters: parameter1;

      /** Wird bei Warmwassermode (05-011) 6 oder 7 die Nachladung aktiviert kann diese mit der maximalen Nachladezeit nach der hier eingestellten Zeit beendet werden. Bei Einstellung 0 wird die Nachladung gar nicht aktiviert. */
      @unit("h")
      @divisor(2)
      hours: SIN;
    }
  }
  namespace Ww_relais {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x76)
    model r {}

    /** Warmwasser Ladungsanforderung 01-054 */
    @inherit(r)
    @ext(0x80, 0, 0xe)
    model Ladungsanforderung {
      parameters: parameter1;

      /** Stellgröße für eine Warmwasser-Zusatzheizung */
      status: status;
    }

    /** Warmwasser Zirkulationspumpe 01-065 */
    @inherit(r)
    @ext(0x81, 0, 0xe)
    model Zirkulationspumpe {
      parameters: parameter1;

      /** Stellgröße für eine Warmwasser Zirkulationspumpe */
      status: status;
    }

    /** Warmwasser Ladepumpe 01-066 */
    @inherit(r)
    @ext(0x82, 0, 0xe)
    model Ladungspumpe {
      parameters: parameter1;

      /** Stellgröße für eine Warmwasser Ladepumpe oder Umlenkventil */
      status: status;
    }
  }
  namespace Hk_ping {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21)
    model r {}

    /** Aussentemperatur 00-000 */
    @inherit(r)
    @ext(0, 0x80, 0, 0x4a)
    model At {
      parameters: parameter_temp10;

      /** Aussentemperatur */
      temp: temp10;
    }

    /** Raumtemperatur 00-001 */
    @inherit(r)
    @ext(0, 0x81, 0, 0x4a)
    model Raumtemp {
      parameters: parameter_temp10;

      /** Raumtemperatur eines Heizkreises */
      temp: temp10;
    }

    /** Heizkreis Vorlauftemperatur 00-002 */
    @inherit(r)
    @ext(0, 0x82, 0, 0x4a)
    model Vl_temp_ist {
      parameters: parameter_temp10;

      /** Vorlauftemperatur eines Heizkreises */
      temp: temp10;
    }

    /** Uhrzeit 02-072 */
    @inherit(r)
    @ext(0x2, 0xc8, 0, 0x4a)
    model Time {
      parameters: parameter1;

      /** Uhrzeit */
      time: MIN;
    }

    /** Wochentag 02-073 */
    @inherit(r)
    @ext(0x2, 0xc9, 0, 0x4a)
    model Wd {
      parameters: parameter_wd;

      /** Wochentag */
      day: BDY;
    }

    /** HK Staus Heizkreisregelung 02-051 */
    @inherit(r)
    @ext(0x2, 0xb3, 0, 0x4a)
    model Status {
      parameters: parameter1;

      /** Zustand Heizkreisregelung */
      @values(Values_status_23)
      status: status;
    }
  }
  namespace Hk_timeprogramm {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x22, 0x3)
    model r {}

    /** Zeitprogramm Heizung 1 Teil 1 */
    @inherit(r)
    @ext(0xbd, 0, 0x4a)
    model Tp0_hzg1 {
      mode: tp_mode;
    }

    /** Zeitprogramm Heizung 1 Teil 2 */
    @inherit(r)
    @ext(0xbd, 1, 0x4a)
    model Tp1_hzg1 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 1 Teil 3 */
    @inherit(r)
    @ext(0xbd, 0x2, 0x4a)
    model Tp2_hzg1 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 1 Teil 4 */
    @inherit(r)
    @ext(0xbd, 0x3, 0x4a)
    model Tp3_hzg1 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 1 Teil 5 */
    @inherit(r)
    @ext(0xbd, 0x4, 0x4a)
    model Tp4_hzg1 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 1 Teil 6 */
    @inherit(r)
    @ext(0xbd, 0x5, 0x4a)
    model Tp5_hzg1 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 1 Teil 7 */
    @inherit(r)
    @ext(0xbd, 0x6, 0x4a)
    model Tp6_hzg1 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 1 Teil 8 */
    @inherit(r)
    @ext(0xbd, 0x7, 0x4a)
    model Tp7_hzg1 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 1 Teil 9 */
    @inherit(r)
    @ext(0xbd, 0x8, 0x4a)
    model Tp8_hzg1 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 1 Teil 10 */
    @inherit(r)
    @ext(0xbd, 0x9, 0x4a)
    model Tp9_hzg1 {
      schedule: tp_8h;
    }

    /** Zeitprogramm Heizung 2 Teil 1 */
    @inherit(r)
    @ext(0xbe, 0, 0x4a)
    model Tp0_hzg2 {
      mode: tp_mode;
    }

    /** Zeitprogramm Heizung 2 Teil 2 */
    @inherit(r)
    @ext(0xbe, 1, 0x4a)
    model Tp1_hzg2 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 2 Teil 3 */
    @inherit(r)
    @ext(0xbe, 0x2, 0x4a)
    model Tp2_hzg2 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 2 Teil 4 */
    @inherit(r)
    @ext(0xbe, 0x3, 0x4a)
    model Tp3_hzg2 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 2 Teil 5 */
    @inherit(r)
    @ext(0xbe, 0x4, 0x4a)
    model Tp4_hzg2 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 2 Teil 6 */
    @inherit(r)
    @ext(0xbe, 0x5, 0x4a)
    model Tp5_hzg2 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 2 Teil 7 */
    @inherit(r)
    @ext(0xbe, 0x6, 0x4a)
    model Tp6_hzg2 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 2 Teil 8 */
    @inherit(r)
    @ext(0xbe, 0x7, 0x4a)
    model Tp7_hzg2 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 2 Teil 9 */
    @inherit(r)
    @ext(0xbe, 0x8, 0x4a)
    model Tp8_hzg2 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 2 Teil 10 */
    @inherit(r)
    @ext(0xbe, 0x9, 0x4a)
    model Tp9_hzg2 {
      schedule: tp_8h;
    }

    /** Zeitprogramm Heizung 3 Teil 1 */
    @inherit(r)
    @ext(0xbf, 0, 0x4a)
    model Tp0_hzg3 {
      mode: tp_mode;
    }

    /** Zeitprogramm Heizung 3 Teil 2 */
    @inherit(r)
    @ext(0xbf, 1, 0x4a)
    model Tp1_hzg3 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 3 Teil 3 */
    @inherit(r)
    @ext(0xbf, 0x2, 0x4a)
    model Tp2_hzg3 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 3 Teil 4 */
    @inherit(r)
    @ext(0xbf, 0x3, 0x4a)
    model Tp3_hzg3 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 3 Teil 5 */
    @inherit(r)
    @ext(0xbf, 0x4, 0x4a)
    model Tp4_hzg3 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 3 Teil 6 */
    @inherit(r)
    @ext(0xbf, 0x5, 0x4a)
    model Tp5_hzg3 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 3 Teil 7 */
    @inherit(r)
    @ext(0xbf, 0x6, 0x4a)
    model Tp6_hzg3 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 3 Teil 8 */
    @inherit(r)
    @ext(0xbf, 0x7, 0x4a)
    model Tp7_hzg3 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 3 Teil 9 */
    @inherit(r)
    @ext(0xbf, 0x8, 0x4a)
    model Tp8_hzg3 {
      schedule: tp_20h;
    }

    /** Zeitprogramm Heizung 3 Teil 10 */
    @inherit(r)
    @ext(0xbf, 0x9, 0x4a)
    model Tp9_hzg3 {
      schedule: tp_8h;
    }

    /** Zeitprogramm Heizung 1 */
    @inherit(r)
    @ext(0xbd, 0, 0x4a)
    @chain(
      0,
      #[0xbd, 1, 0x4a],
      #[0xbd, 0x2, 0x4a],
      #[0xbd, 0x3, 0x4a],
      #[0xbd, 0x4, 0x4a],
      #[0xbd, 0x5, 0x4a],
      #[0xbd, 0x6, 0x4a],
      #[0xbd, 0x7, 0x4a],
      #[0xbd, 0x8, 0x4a],
      #[0xbd, 0x9, 0x4a]
    )
    model Tp_hzg1 {
      all: tp_all;
    }

    /** Zeitprogramm Heizung 2 */
    @inherit(r)
    @ext(0xbe, 0, 0x4a)
    @chain(
      0,
      #[0xbe, 1, 0x4a],
      #[0xbe, 0x2, 0x4a],
      #[0xbe, 0x3, 0x4a],
      #[0xbe, 0x4, 0x4a],
      #[0xbe, 0x5, 0x4a],
      #[0xbe, 0x6, 0x4a],
      #[0xbe, 0x7, 0x4a],
      #[0xbe, 0x8, 0x4a],
      #[0xbe, 0x9, 0x4a]
    )
    model Tp_hzg2 {
      all: tp_all;
    }

    /** Zeitprogramm Heizung 3 */
    @inherit(r)
    @ext(0xbf, 0, 0x4a)
    @chain(
      0,
      #[0xbf, 1, 0x4a],
      #[0xbf, 0x2, 0x4a],
      #[0xbf, 0x3, 0x4a],
      #[0xbf, 0x4, 0x4a],
      #[0xbf, 0x5, 0x4a],
      #[0xbf, 0x6, 0x4a],
      #[0xbf, 0x7, 0x4a],
      #[0xbf, 0x8, 0x4a],
      #[0xbf, 0x9, 0x4a]
    )
    model Tp_hzg3 {
      all: tp_all;
    }
  }
  namespace Hk_stat {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x77)
    model r {}

    /** Aussentemperatur 00-000 */
    @inherit(r)
    @ext(0x80, 0, 0xa)
    model At {
      parameters: parameter_temp10;

      /** HK Aussentemperatur */
      temp: temp10;
    }

    /** Raumtemperatur Sollwert 01-001 */
    @inherit(r)
    @ext(0x81, 0, 0xa)
    model Raumtemp_soll {
      parameters: parameter_temp10;

      /** Berechneter Sollwert für die Raumtemperatur */
      temp: temp10;
    }

    /** Heizkreis Vorlauftemperatur Ist 00-002 */
    @inherit(r)
    @ext(0x82, 0, 0xa)
    model Vl_temp_ist {
      parameters: parameter_temp10;

      /** Vorlauftemperatur eines Heizkreises */
      temp: temp10;
    }

    /** Heizkreis Vorlauftemperatur Sollwert 01-002 */
    @inherit(r)
    @ext(0x83, 0, 0xa)
    model Vl_temp_soll {
      parameters: parameter_temp10;

      /** Berechneter Sollwert für die Heizkreis Vorlauftemperatur */
      temp: temp10;
    }

    /** Aussentemperatur Mittelwert 02-020 */
    @inherit(r)
    @ext(0x84, 0, 0xa)
    model At_mittel {
      parameters: parameter_temp10;

      /** Berechneter Aussentemperatur Mittelwert */
      temp: temp10;
    }

    /** Status Heizkreisregelung 02-051 */
    @inherit(r)
    @ext(0x85, 0, 0xa)
    model Status {
      parameters: parameter1;

      /** Zustand Heizkreisregelung */
      @values(Values_status_24)
      status: status;
    }
  }
  namespace Hk_param1 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x63)
    model r {}

    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x67)
    model r_1 {}
  }
  @condition(Globals.Parameter_level.status, "'User Level'")
  namespace Hk_param1.userlevel {
    /** Raumschutztemperatur 03-000 */
    @inherit(r)
    @ext(0x80, 0, 0xa)
    model Temp_raumschutz {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Auslegungs Vorlauftemperatur 03-013 */
    @inherit(r)
    @ext(0x81, 0, 0xa)
    model Temp_vl_auslegung {
      parameters: parameter_temp2;
      temp: temp2;
    }

    /** Heizgrenze Normalbetrieb 03-021 */
    @inherit(r)
    @ext(0x82, 0, 0xa)
    model Temp_heizgrenze_normal {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Betriebswahl Heizung 03-050 */
    @inherit(r)
    @ext(0x83, 0, 0xa)
    model Betriebswahl {
      parameters: parameter1;

      @values(Values_status_25)
      status: status;
    }

    /** Normal Raumtemperatur Heizbetrieb 03-051 */
    @inherit(r)
    @ext(0x84, 0, 0xa)
    model Temp_raum_normal {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Spar Raumtemperatur Heizbetrieb 03-053 */
    @inherit(r)
    @ext(0x85, 0, 0xa)
    model Temp_raum_spar {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Behaglichkeit 03-058 */
    @inherit(r)
    @ext(0x86, 0, 0xa)
    model Temp_behaglichkeit {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Solltemperatur Handbetrieb 07-009 */
    @inherit(r_1)
    @ext(0x80, 0, 0xa)
    model Temp_soll_handbetrieb {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Applikationstyp Heizkreis 07-076 */
    @inherit(r_1)
    @ext(0x81, 0, 0xa)
    model Applikationstyp {
      parameters: parameter1;

      @values(Values_status_26)
      status: status;
    }
  }
  namespace Hk_param2 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x63)
    model r {}

    /** default *w */
    @write
    @zz(0x10)
    @base(0x6, 0x23, 0x63)
    model w {}

    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x67)
    model r_1 {}
  }
  @condition(Globals.Parameter_level.status, "'Expert Level'")
  namespace Hk_param2.expertlevel {
    /** Raumschutztemperatur 03-000 */
    @inherit(r)
    @ext(0x80, 0, 0xa)
    model Temp_raumschutz {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Fusspunkt Vorlauftemperatur Heizbetrieb 03-001 */
    @inherit(r)
    @ext(0x81, 0, 0xa)
    model Temp_vl_fusspunkt {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Heizgrenze Sparbetrieb 03-002 */
    @inherit(r)
    @ext(0x82, 0, 0xa)
    model Heizgrenze_spar {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Startoptimierung Vorhaltezeit 03-006 */
    @inherit(r)
    @ext(0x83, 0, 0xa)
    model Startopt_vorhaltezeit {
      parameters: parameter1;

      @unit("min")
      @divisor(10)
      time: UIN;
    }

    /** Raumtemperatur Kompensation 03-007 */
    @inherit(r)
    @ext(0x84, 0, 0xa)
    model Temp_raum_kompensation {
      parameters: parameter1;

      @divisor(10)
      status: UIN;
    }

    /** Auslegungs Aussentemperatur Heizbetrieb 03-012 */
    @inherit(r)
    @ext(0x85, 0, 0xa)
    model Temp_aussen_auslegung {
      parameters: parameter_temp1_1b;
      temp: temp1_1b;
    }

    /** Auslegungs Vorlauftemperatur 03-013 */
    @inherit(r)
    @ext(0x86, 0, 0xa)
    model Temp_vl_auslegung {
      parameters: parameter_temp2;
      temp: temp2;
    }

    /** Zeitkonstante für Aussentemperatur Mittelwertberechnung 03-020 */
    @inherit(r)
    @ext(0x87, 0, 0xa)
    model Konst_at_mittelwert {
      parameters: parameter1;

      @unit("h")
      time: UIN;
    }

    /** Heizgrenze Normalbetrieb 03-021 */
    @inherit(r)
    @ext(0x88, 0, 0xa)
    model Temp_heizgrenze_normal {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Frostgrenze Aussentemperatur 03-023 */
    @inherit(r)
    @ext(0x89, 0, 0xa)
    model Temp_aussen_frostgrenze {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Zeitkonstante für R 03-024 */
    @inherit(r)
    @ext(0x8a, 0, 0xa)
    model Zeitkonstante {
      parameters: parameter1;
      time: UIN;
    }

    /** Abweichung forciert Heizen 03-025 */
    @inherit(r)
    @ext(0x8b, 0, 0xa)
    model Abweichung_heizen_ein {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Abweichung Heizen aus 03-026 */
    @inherit(r)
    @ext(0x8c, 0, 0xa)
    model Abweichung_heizen_aus {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Nachstellzeit Raumregler 03-030 */
    @inherit(r)
    @ext(0x8d, 0, 0xa)
    model Nachstellzeit_raumregler {
      parameters: parameter1;

      @divisor(10)
      time: UIN;
    }

    /** Betriebswahl Heizung 03-050 */
    @inherit(r)
    @ext(0x8e, 0, 0xa)
    model Betriebswahl {
      parameters: parameter1;

      @values(Values_status_27)
      status: status;
    }

    /** Normal Raumtemperatur Heizbetrieb 03-051 */
    @inherit(r)
    @ext(0x8f, 0, 0xa)
    model Temp_raum_normal {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Spar Raumtemperatur Heizbetrieb 03-053 */
    @inherit(r)
    @ext(0x90, 0, 0xa)
    model Temp_raum_spar {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Behaglichkeit 03-058 */
    @inherit(r)
    @ext(0x91, 0, 0xa)
    model Temp_behaglichkeit {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Behaglichkeit 03-058 */
    @inherit(w)
    @ext(0x91, 0, 0xa)
    model Settemp_behaglichkeit {
      temp: temp10;
    }

    /** Fernbedienung vorh 03-091 */
    @inherit(r)
    @ext(0x92, 0, 0xa)
    model Fernbedienung {
      parameters: parameter1;
      status: status;
    }

    /** Ferien Zonenzuordnung 03-092 */
    @inherit(r)
    @ext(0x93, 0, 0xa)
    model Zone_ferien {
      parameters: parameter1;

      /** Nutzung des lokalen Ferienprogramms oder das eines bestehenden Heizkreises */
      status: status;
    }

    /** Timer Zonenzuordnung 03-093 */
    @inherit(r)
    @ext(0x94, 0, 0xa)
    model Zone_timer {
      parameters: parameter1;

      /** Nutzung der lokalen Timerfunktionen oder die eines bestehenden Heizkreises */
      status: status;
    }

    /** Betriebswahl Zonenzuordnung 03-094 */
    @inherit(r)
    @ext(0x95, 0, 0xa)
    model Zone_betriebswahl {
      parameters: parameter1;

      /** Nutzung der lokalen Betriebswahl oder die eines bestehenden Heizkreises */
      status: status;
    }

    /** Zeitprogramm Zonenzuordnung 03-095 */
    @inherit(r)
    @ext(0x96, 0, 0xa)
    model Zone_zeitprogramm {
      parameters: parameter1;

      /** Nutzung des lokalen Zeitprogramms oder das eines bestehenden Heizkreises */
      status: status;
    }

    /** Temperatur Zonenzuordnung 03-096 */
    @inherit(r)
    @ext(0x97, 0, 0xa)
    model Zone_temperatur {
      parameters: parameter1;
      status: status;
    }

    /** Minimale Anlagetemperatur 03-110 */
    @inherit(r)
    @ext(0x98, 0, 0xa)
    model Temp_anlage_min {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Abschaltdifferenz Anlagetemperatur 03-111 */
    @inherit(r)
    @ext(0x99, 0, 0xa)
    model Abschaltdifferenz {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Proportionalbereich Mischerregelung 07-000 */
    @inherit(r_1)
    @ext(0x80, 0, 0xa)
    model Proportionalbereich_mischer {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Wärmeerzeuger Überhöhung Vorlaufsollwert 07-001 */
    @inherit(r_1)
    @ext(0x81, 0, 0xa)
    model We_vl_soll_ueberhoehung {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Minimale Vorlauftemperatur 07-002 */
    @inherit(r_1)
    @ext(0x82, 0, 0xa)
    model Temp_vl_min {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Pumpennachlauf Heizkreis 07-003 */
    @inherit(r_1)
    @ext(0x83, 0, 0xa)
    model Nachlauf_pumpe {
      parameters: parameter_temp10;

      @unit("min")
      @divisor(10)
      time: UIN;
    }

    /** Heizkreistyp 07-005 */
    @inherit(r_1)
    @ext(0x84, 0, 0xa)
    model Heizkreistyp {
      parameters: parameter1;

      @values(Values_status_28)
      status: status;
    }

    /** Vorlauf Maximaltemperatur 07-008 */
    @inherit(r_1)
    @ext(0x85, 0, 0xa)
    model Temp_vl_max {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Solltemperatur Handbetrieb 07-009 */
    @inherit(r_1)
    @ext(0x86, 0, 0xa)
    model Temp_soll_handbetrieb {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Heizkreisüberhöhung Niedertarif 07-031 */
    @inherit(r_1)
    @ext(0x87, 0, 0xa)
    model Ueberhoehung_hk_niedertarif {
      parameters: parameter_temp2;
      temp: temp2;
    }

    /** Energiezwangzahl 07-034 */
    @inherit(r_1)
    @ext(0x88, 0, 0xa)
    model Energiezwangzahl {
      parameters: parameter1;

      @values(Values_status_29)
      status: status;
    }

    /** Mischer Neutralzone 07-041 */
    @inherit(r_1)
    @ext(0x89, 0, 0xa)
    model Mischer_neutralzone {
      parameters: parameter_temp10;

      @unit("K")
      @divisor(10)
      temp: UIN;
    }

    /** Applikationstyp Heizkreis 07-076 */
    @inherit(r_1)
    @ext(0x8a, 0, 0xa)
    model Applikationstyp {
      parameters: parameter1;

      @values(Values_status_30)
      status: status;
    }
  }
  namespace Hk_relais {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x75)
    model r {}

    /** Heizkreispumpe 01-020 */
    @inherit(r)
    @ext(0x80, 0, 0xa)
    model Hk_pumpe {
      parameters: parameter1;

      /** Stellgröße für eine Heizkreispumpe */
      status: status;
    }

    /** Mischer 01-021 */
    @inherit(r)
    @ext(0x81, 0, 0xa)
    model Hk_mischer {
      parameters: parameter_range;

      /** Stellgröße für ein Heizkreis Mischventil */
      @unit("%")
      status: range;
    }
  }
  namespace Wm_ping {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21)
    model r {}

    /** Heizleistung Heizbetrieb 02-040 */
    @inherit(r)
    @ext(0x2, 0xa8, 0, 0x50)
    model Leistung_heizung {
      parameters: parameter1_10;

      /** Berechnete Gesamtheizleistung */
      @unit("kW")
      @divisor(10)
      temp: SIN;
    }

    /** Heizleistung Warmwasser 02-041 */
    @inherit(r)
    @ext(0x2, 0xa9, 0, 0x50)
    model Leistung_ww {
      parameters: parameter1_10;

      /** Berechnete Gesamt Warmwasser Ladeleistung */
      @unit("kW")
      @divisor(10)
      temp: SIN;
    }

    /** Status Wärmemanager 02-054 */
    @inherit(r)
    @ext(0x2, 0xb6, 0, 0x50)
    model Status {
      parameters: parameter1;

      /** Zustand Wärmemanagerfunktion */
      @values(Values_status_31)
      status: status;
    }

    /** Uhrzeit 02-072 */
    @inherit(r)
    @ext(0x2, 0xc8, 0, 0x50)
    model Time {
      parameters: parameter_time;

      /** Uhrzeit */
      time: MIN;
    }

    /** Wochentag 02-073 */
    @inherit(r)
    @ext(0x2, 0xc9, 0, 0x50)
    model Wd {
      parameters: parameter_wd;

      /** Wochentag */
      day: BDY;
    }

    /** Anlagetemperatur 00-107 (00-096) */
    @inherit(r)
    @ext(0, 0xe, 0, 0x50)
    model Anlage_temp {
      parameters: parameter_temp10;

      /** Anlagen Vorlauftemperatur für Heizbetrieb (Verteiler) */
      temp: temp10;
    }
  }
  namespace Wm_stat {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x7a)
    model r {}

    /** Puffertemperatur oben 00-015 */
    @inherit(r)
    @ext(0x80, 0, 0x10)
    model Puffer_temp_oben {
      parameters: parameter_temp10;

      /** Obere Heizungspuffer Temperatur (Einschalttemperatur) */
      temp: temp10;
    }

    /** Anlage Sollwert Warmwasserbetrieb 01-097 */
    @inherit(r)
    @ext(0x81, 0, 0x10)
    model Anlage_solltemp_ww {
      parameters: parameter_temp1;

      /** Berechneter Sollwert für die Anlagenvorlauftemperatur Warmwasser Ladebetrieb */
      temp: temp1;
    }

    /** Anlagetemperatur 00-107 */
    @inherit(r)
    @ext(0x82, 0, 0x10)
    model Anlage_temp {
      parameters: parameter_temp10;

      /** Anlagen Vorlauftemperatur für Heizbetrieb (Verteiler) */
      temp: temp10;
    }

    /** Anlagetemperatur Sollwert 01-107 */
    @inherit(r)
    @ext(0x83, 0, 0x10)
    model Anlage_solltemp_heizung {
      parameters: parameter_temp10;

      /** Berechneter Sollwert für die Anlagenvorlauftemperatur Heizbetrieb */
      temp: temp10;
    }

    /** Heizleistung Heizbetrieb 02-040 */
    @inherit(r)
    @ext(0x84, 0, 0x10)
    model Leistung_heizung {
      parameters: parameter1_10;

      /** Berechnete Gesamtheizleistung */
      @unit("kW")
      @divisor(10)
      temp: SIN;
    }

    /** Heizleistung Warmwasser 02-041 */
    @inherit(r)
    @ext(0x85, 0, 0x10)
    model Leistung_ww {
      parameters: parameter1_10;

      /** Berechnete Gesamt Warmwasser Ladeleistung */
      @unit("kW")
      @divisor(10)
      temp: SIN;
    }

    /** Status Wärmemanager 02-054 */
    @inherit(r)
    @ext(0x86, 0, 0x10)
    model Status {
      parameters: parameter1;

      /** Zustand Wärmemanagerfunktion */
      @values(Values_status_32)
      status: status;
    }
  }
  namespace Wm_param1 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x66)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'User Level'")
  namespace Wm_param1.userlevel {
    /** Betriebswahl Wärmemanager 06-015 */
    @inherit(r)
    @ext(0x80, 0, 0)
    model Betriebswahl {
      parameters: parameter1;

      @values(Values_status_33)
      status: status;
    }

    /** Solltemperatur Handbetrieb 06-016 */
    @inherit(r)
    @ext(0x80, 0, 0x10)
    model Hand_temp_soll {
      parameters: parameter1;

      /** Sollwert für die Wärmeerzeuger Vorlauftemperatur im Handbetrieb. */
      temp: temp10;
    }

    /** Applikationstyp Wärmemanager 06-076 */
    @inherit(r)
    @ext(0x80, 0, 0x20)
    model Applikationstyp {
      parameters: parameter1;

      /** Damit kann ein vordefinierter Parametersatz für die Wärmepumpenfunktion geladen werden */
      @values(Values_status_34)
      status: status;
    }
  }
  namespace Wm_param2 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x66)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'Expert Level'")
  namespace Wm_param2.expertlevel {
    /** Maximale Warmwasser Ladeleistung System 06-000 */
    @inherit(r)
    @ext(0x80, 0, 0x10)
    model Max_ww_ladeleistung {
      parameters: parameter1_10;

      @unit("kW")
      @divisor(10)
      temp: SIN;
    }

    /** Maximale Heizleistung System 06-001 */
    @inherit(r)
    @ext(0x81, 0, 0x10)
    model Max_heizleistung {
      parameters: parameter1_10;

      @unit("kW")
      @divisor(10)
      temp: SIN;
    }

    /** Maximale Kühlleistung System 06-002 */
    @inherit(r)
    @ext(0x82, 0, 0x10)
    model Max_kuehlleistung {
      parameters: parameter1_10;

      @unit("kW")
      @divisor(10)
      temp: SIN;
    }

    /** Pufferfunktion 06-003 */
    @inherit(r)
    @ext(0x83, 0, 0x10)
    model Pufferfunktion {
      parameters: parameter1;

      @values(Values_status_35)
      status: status;
    }

    /** Überhöhung Wärmeerzeuger Sollwert 06-004 */
    @inherit(r)
    @ext(0x84, 0, 0x10)
    model Ueberhoehung_we_sollwert {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Sollwertoffset Anschaltfühler Puffer mitte 06-005 */
    @inherit(r)
    @ext(0x85, 0, 0x10)
    model Sollwertoffset_fuehler_puffer_mitte {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Puffer Minimaltemperatur 06-006 */
    @inherit(r)
    @ext(0x86, 0, 0x10)
    model Temp_puffer_min {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Proportionalbereich Wärmemanager 06-010 */
    @inherit(r)
    @ext(0x87, 0, 0x10)
    model Proportionalbereich_wm {
      parameters: parameter1_10;

      @unit("K")
      @divisor(10)
      temp: SIN;
    }

    /** Nachstellzeit Wärmemanager 06-011 */
    @inherit(r)
    @ext(0x88, 0, 0x10)
    model Nachstellzeit_wm {
      parameters: parameter1_10;

      @unit("min")
      @divisor(10)
      time: SIN;
    }

    /** Vorhaltezeit Wärmemanager 06-012 */
    @inherit(r)
    @ext(0x89, 0, 0x10)
    model Vorhaltezeit_wm {
      parameters: parameter1_10;

      @unit("min")
      @divisor(10)
      time: SIN;
    }

    /** Reduktion Anlagevorlauf Sollwert bei Störung 06-013 */
    @inherit(r)
    @ext(0x8a, 0, 0x10)
    model Reduktion_anlagevl_sollwert_stoerung {
      parameters: parameter1_10;

      @unit("K")
      @divisor(10)
      temp: SIN;
    }

    /** Betriebswahl Wärmemanager 06-015 */
    @inherit(r)
    @ext(0x8b, 0, 0x10)
    model Betriebswahl {
      parameters: parameter1;

      @values(Values_status_36)
      status: status;
    }

    /** Solltemperatur Handbetrieb 06-016 */
    @inherit(r)
    @ext(0x8c, 0, 0x10)
    model Hand_temp_soll {
      parameters: parameter1;
      temp: temp10;
    }

    /** Maximale Sollwertsteigung Heizbetrieb 06-017 */
    @inherit(r)
    @ext(0x8d, 0, 0x10)
    model Max_sollwertsteigung_hz {
      parameters: parameter1_10;

      @unit("K/min")
      @divisor(10)
      value: SIN;
    }

    /** Maximale Sollwertsteigung Warmwasserbetrieb 06-018 */
    @inherit(r)
    @ext(0x8e, 0, 0x10)
    model Max_sollwertsteigung_ww {
      parameters: parameter1_10;

      @unit("K/min")
      @divisor(10)
      value: SIN;
    }

    /** Sequenzwechselzeit 06-020 */
    @inherit(r)
    @ext(0x8f, 0, 0x10)
    model Sequenzwechselzeit {
      parameters: parameter1;

      @values(Values_status_37)
      status: status;
    }

    /** Puffer Solltemperatur für Energiezwang 06-025 */
    @inherit(r)
    @ext(0x90, 0, 0x10)
    model Temp_puffer_soll_ez {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Puffer Maximaltemperatur 06-026 */
    @inherit(r)
    @ext(0x91, 0, 0x10)
    model Temp_puffer_max {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Puffer Solltemperatur bei Sonderfreigabe 06-027 */
    @inherit(r)
    @ext(0x92, 0, 0x10)
    model Temp_puffer_soll_sonder {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Nachlaufzeit Sonderfreigabe 06-028 */
    @inherit(r)
    @ext(0x93, 0, 0x10)
    model Nachlaufzeit_sonder {
      parameters: parameter1;

      @unit("h")
      time: SIN;
    }

    /** Applikationstyp Wärmemanager 06-076 */
    @inherit(r)
    @ext(0x94, 0, 0x10)
    model Applikationstyp {
      parameters: parameter1;

      @values(Values_status_38)
      status: status;
    }

    /** Warmwasser Maximaltemperatur Solarladung 08-059 */
    @inherit(r)
    @ext(0x95, 0, 0x10)
    model Temp_max_ww_solar {
      parameters: parameter_temp10;
      temp: temp10;
    }

    /** Sollwertreduktion bei Solar aktiv 08-072 */
    @inherit(r)
    @ext(0x96, 0, 0x10)
    model Sollwertreduktion_solar {
      parameters: parameter1;

      @unit("K")
      temp: SIN;
    }

    /** Solarleistung Sollwertreduktion 08-073 */
    @inherit(r)
    @ext(0x97, 0, 0x10)
    model Solarleistung_sollwertreduktion {
      parameters: parameter1_10;

      @unit("kW")
      @divisor(10)
      value: SIN;
    }

    /** Warmwasser Minimaltemperatur bei Solar aktiv 08-079 */
    @inherit(r)
    @ext(0x98, 0, 0x10)
    model Temp_min_ww_solar {
      parameters: parameter_temp10;
      temp: temp10;
    }
  }
  namespace Wm_relais2 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x7b)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'Expert Level'")
  namespace Wm_relais2.expertlevel {
    /** Umlenkventil Puffer 22-065 */
    @inherit(r)
    @ext(0x80, 0, 0x10)
    model Umlenkventil_puffer {
      parameters: parameter1;

      /** Stellgröße für eine Heizkreispumpe */
      status: status;
    }
  }
  namespace Gf_ping {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21)
    model r {}

    /** Datum 02-070 */
    @inherit(r)
    @ext(0x2, 0xc6, 0, 0x40)
    model Date {
      parameters: parameter1;

      /** Zustand Wärmemanagerfunktion */
      date: DAY;
    }

    /** Uhrzeit 02-072 */
    @inherit(r)
    @ext(0x2, 0xc8, 0, 0x40)
    model Time {
      parameters: parameter_time;

      /** Uhrzeit */
      time: MIN;
    }

    /** Wochentag 02-073 */
    @inherit(r)
    @ext(0x2, 0xc9, 0, 0x40)
    model Wd {
      parameters: parameter_wd;

      /** Wochentag */
      day: BDY;
    }
  }
  namespace Gf_stat {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x78)
    model r {}

    /** Aussentemperatur 00-000 */
    @inherit(r)
    @ext(0x80, 0, 0)
    model At {
      parameters: parameter_temp10;

      /** Aussentemperatur */
      temp: temp10;
    }

    /** Warmwassertemperatur 00-004 */
    @inherit(r)
    @ext(0x81, 0, 0)
    model Ww_temp_ist {
      parameters: parameter1;

      /** Obere Warmwasserspeichertemperatur */
      temp: temp10;
    }

    /** Vorlauftemperatur Wärmeerzeuger 00-007 */
    @inherit(r)
    @ext(0x82, 0, 0)
    model Vl_temp_ist {
      parameters: parameter_temp10;

      /** Wärmeerzeuger Vorlauftemperatur */
      temp: temp10;
    }

    /** Rücklauftemperatur Wärmeerzeuger 00-008 */
    @inherit(r)
    @ext(0x83, 0, 0)
    model Rl_temp_ist {
      parameters: parameter_temp10;

      /** Wärmeerzeuger Rücklauftemperatur */
      temp: temp10;
    }

    /** Wärmequelle Austrittstemperatur 00-070 */
    @inherit(r)
    @ext(0x84, 0, 0)
    model Wq_temp_out {
      parameters: parameter_temp10;

      /** Wärmequellen Austrittstemperatur vom Verdampfer */
      temp: temp10;
    }

    /** Wärmequelle Eintrittstemperatur 00-071 */
    @inherit(r)
    @ext(0x85, 0, 0)
    model Wq_temp_in {
      parameters: parameter_temp10;

      /** Wärmequellen Eintrittstemperatur zum Verdampfer */
      temp: temp10;
    }

    /** Heissgastemperatur 00-072 */
    @inherit(r)
    @ext(0x86, 0, 0)
    model Temp_hg {
      parameters: parameter_temp10;

      /** Heissgastemperatur im Kältekreis */
      temp: temp10;
    }

    /** Anlagetemperatur 00-107 */
    @inherit(r)
    @ext(0x87, 0, 0)
    model Anlage_temp {
      parameters: parameter_temp10;

      /** Anlagen Vorlauftemperatur für Heizbetrieb (Verteiler) */
      temp: temp10;
    }

    /** Anlagetemperatur Sollwert 01-107 */
    @inherit(r)
    @ext(0x88, 0, 0)
    model Anlage_solltemp_heizung {
      parameters: parameter_temp10;

      /** Berechneter Sollwert für die Anlagenvorlauftemperatur Heizbetrieb */
      temp: temp10;
    }
  }
  namespace Gf_param1 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x64)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'User Level'")
  namespace Gf_param1.userlevel {
    /** Fühlerkonfiguration speichern 04-000 */
    @inherit(r)
    @ext(0x80, 0, 0)
    model Fuehler_speichern {
      parameters: parameter1;
      status: status;
    }

    /** Kommandos 04-045 */
    @inherit(r)
    @ext(0x81, 0, 0)
    model Kommandos {
      parameters: parameter1;
      status: status;
    }

    /** Austrocknungsprogramm Modus 04-060 */
    @inherit(r)
    @ext(0x82, 0, 0)
    model Modus_austrocknung {
      parameters: parameter1;
      status: status;
    }

    /** Applikationstyp Globalfunktion 04-076 */
    @inherit(r)
    @ext(0x83, 0, 0)
    model Applikationstyp {
      parameters: parameter1;
      status: status;
    }

    /** Hydraulikapplikation 04-077 */
    @inherit(r)
    @ext(0x84, 0, 0)
    model Hydraulikapplikation {
      parameters: parameter1;
      status: status;
    }

    /** SW Version 04-092 */
    @inherit(r)
    @ext(0x85, 0, 0)
    model Version_sw {
      parameters: parameter1;

      @divisor(100)
      value: UIN;
    }

    /** HW Version 04-093 */
    @inherit(r)
    @ext(0x86, 0, 0)
    model Version_hw {
      parameters: parameter1;

      @divisor(100)
      value: UIN;
    }

    /** SW ID Nr. 04-094 */
    @inherit(r)
    @ext(0x87, 0, 0)
    model Idnr_sw {
      parameters: parameter1;
      value: UIN;
    }
  }
  namespace Gf_param2 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x64)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'Expert Level'")
  namespace Gf_param2.expertlevel {
    /** Fühlerkonfiguration speichern 04-000 */
    @inherit(r)
    @ext(0x80, 0, 0)
    model Fuehler_speichern {
      parameters: parameter1;
      status: status;
    }

    /** Sollwerteingang Funktionszuordnung 04-002 */
    @inherit(r)
    @ext(0x81, 0, 0)
    model Zuordn_sollwert_in {}

    /** eBus Unit Nummer 04-020 */
    @inherit(r)
    @ext(0x82, 0, 0)
    model Unit_nr {}

    /** Multifunktionsausgang MFA 1 04-030 */
    @inherit(r)
    @ext(0x83, 0, 0)
    model Mfa1 {}

    /** Multifunktionsausgang MFA 2 04-031 */
    @inherit(r)
    @ext(0x84, 0, 0)
    model Mfa2 {}

    /** Sollwertausgang Funktionszuordnung 04-037 */
    @inherit(r)
    @ext(0x85, 0, 0)
    model Zuordn_sollwert_out {}

    /** Minimalwert DC Ausgang 1 04-038 */
    @inherit(r)
    @ext(0x86, 0, 0)
    model Min_dc1 {}

    /** Maximalwert DC Ausgang 1 04-039 */
    @inherit(r)
    @ext(0x87, 0, 0)
    model Max_dc1 {}

    /** Service Passwort 04-040 */
    @inherit(r)
    @ext(0x88, 0, 0)
    model Service_passwort {}

    /** Kommandos 04-045 */
    @inherit(r)
    @ext(0x89, 0, 0)
    model Kommandos {
      parameters: parameter1;
      status: status;
    }

    /** Austrocknungsprogramm Modus 04-060 */
    @inherit(r)
    @ext(0x8a, 0, 0)
    model Modus_austrocknung {
      parameters: parameter1;
      status: status;
    }

    /** Vorlaufsollwertsteigung Aufheizphase 04-061 */
    @inherit(r)
    @ext(0x8b, 0, 0)
    model Vl_sw_steigung_aufheizen {}

    /** Vorlaufsollwertabfall Abkühlphase 04-062 */
    @inherit(r)
    @ext(0x8c, 0, 0)
    model Vl_sw_abfall_kuehlen {}

    /** Vorlaufsollwert Beharrungsphase 04-063 */
    @inherit(r)
    @ext(0x8d, 0, 0)
    model Vl_sw_beharrung {}

    /** Dauer Beharrungsphase 04-064 */
    @inherit(r)
    @ext(0x8e, 0, 0)
    model Dauer_beharrung {}

    /** Applikationstyp Globalfunktion 04-076 */
    @inherit(r)
    @ext(0x8f, 0, 0)
    model Applikationstyp {
      parameters: parameter1;
      status: status;
    }

    /** Hydraulikapplikation 04-077 */
    @inherit(r)
    @ext(0x90, 0, 0)
    model Hydraulikapplikation {
      parameters: parameter1;
      status: status;
    }

    /** SW Version 04-092 */
    @inherit(r)
    @ext(0x91, 0, 0)
    model Version_sw {
      parameters: parameter1;

      @divisor(100)
      value: UIN;
    }

    /** HW Version 04-093 */
    @inherit(r)
    @ext(0x92, 0, 0)
    model Version_hw {
      parameters: parameter1;

      @divisor(100)
      value: UIN;
    }

    /** SW ID Nr. 04-094 */
    @inherit(r)
    @ext(0x93, 0, 0)
    model Idnr_sw {
      parameters: parameter1;
      value: UIN;
    }

    /** Sollwertausgang Funktionszuordnung 2 04-107 */
    @inherit(r)
    @ext(0x94, 0, 0)
    model Zuordn_sollwert_out2 {}

    /** Minimalwert DC Ausgang 2 04-108 */
    @inherit(r)
    @ext(0x95, 0, 0)
    model Min_dc2 {}

    /** Maximalwert DC Ausgang 2 04-109 */
    @inherit(r)
    @ext(0x96, 0, 0)
    model Max_dc2 {}

    /** Einheit Impulseingang 17-000 */
    @inherit(r)
    @ext(0x97, 0, 0)
    model Einheit_impuls {}

    /** Impulsrate 17-001 */
    @inherit(r)
    @ext(0x98, 0, 0)
    model Impulsrate {}
  }
  namespace Gf_relais1 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x74)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'User Level'")
  namespace Gf_relais1.userlevel {
    /** Sammelstörung 01-099 */
    @inherit(r)
    @ext(0x80, 0, 0)
    model Sammelstoerung {
      parameters: parameter1;

      /** Stellgröße für eine Heizkreispumpe */
      status: status;
    }
  }
  namespace Gf_relais2 {
    /** default *r */
    @zz(0x15)
    @base(0x6, 0x21, 0x74)
    model r {}
  }
  @condition(Globals.Parameter_level.status, "'Expert Level'")
  namespace Gf_relais2.expertlevel {
    /** Fernleitungspumpe 01-063 */
    @inherit(r)
    @ext(0x80, 0, 0)
    model Fernleitungspumpe {
      parameters: parameter1;

      /** Stellgröße für eine Heizkreispumpe */
      status: status;
    }

    /** Sammelstörung 01-099 */
    @inherit(r)
    @ext(0x81, 0, 0)
    model Sammelstoerung {
      parameters: parameter1;

      /** Stellgröße für eine Heizkreispumpe */
      status: status;
    }
  }
}
