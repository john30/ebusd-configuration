import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "../opdata_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Wolf;

@zz(0x08) // needed here for write to source address calculation
namespace hc {
  /** Betriebsdaten des Reglers an den Feuerungsautomaten */
  @write(true)
  model Operation is Opdata_inc.HcOperation;

  /** Sollwertübertragung des Reglers an andere Regler */
  @write(true)
  model RcTarget is Opdata_inc.RcTarget;

  /** HG 01 - Hysterese Vorlauftemperatur (5-30) */
  @ext(0x22, 0)
  model Hg01 is Register<temp10>;

  /** HG 02 - Untere Geblaesedrehzahl (25-100) */
  @ext(0x5a, 1)
  model Hg02 is ReadonlyRegister<percent>;

  /** HG 03 - Obere Geblaesedrehzahl Warmwasser */
  @ext(0x59, 1)
  model Hg03 is ReadonlyRegister<percent>;

  /** HG 04 - Obere Geblaesedrehzahl Heizung (1-100) */
  @id(0x3f, 1)
  model Hg04 is ReadonlyRegister<percent>;

  /** HG 06 - Heizkreispumpenbetriebsart (0-2) */
  @id(0x41, 1)
  model Hg06 is Register<UIN>;

  /** HG 07 - Heizkreispumpennachlauf (0-30) */
  @id(0x42, 1)
  model Hg07 is Register<minutes>;

  /** HG 08 - Maximale Vorlaufsolltemperatur (40-90) */
  @id(0x84, 0x2)
  model Hg08 is Register<temp10>;

  /** HG 09 - Taktsperre (1-30) */
  @id(0x43, 1)
  model Hg09 is Register<minutes>;

  /** HG 10 - eBus-Adresse */
  @id(0x78, 1)
  model Hg10 is ReadonlyRegister<UIN>;

  /** HG 11 - Warmwasserschnellstart */
  @id(0x6a, 1)
  model Hg11 is ReadonlyRegister<temp10>;

  /** HG 12 - Gasart */
  @id(0x6b, 1)
  model Hg12 is ReadonlyRegister<UIN>;

  /** HG 15 - Speicherhysterese (1-30) */
  @id(0x40, 1)
  model Hg15 is Register<temp10>;

  /** HG 16 - Pumpenleistung HK minimal (20-100) */
  @id(0x55, 1)
  model Hg16 is Register<minutes>;

  /** HG 17 - Pumpenleistung HK maximal (20-100) */
  @id(0x56, 1)
  model Hg17 is Register<minutes>;

  /** HG 21 - Kesselminimaltemperatur */
  @id(0x1f, 0)
  model Hg21 is Register<temp10>;

  /** HG 22 - Kesselmaximaltemperatur */
  @id(0x27, 0)
  model Hg22 is Register<temp10>;

  /** HG 73 - Io-Istwert */
  @id(0x70, 1)
  model Hg73 is ReadonlyRegister<minutes>;

  /** HG 74 - Geblaesedrehzahl */
  @id(0xf6, 1)
  model Hg74 is ReadonlyRegister<speed>;

  /** HG 75 - Warmwasserdurchsatz */
  @id(0x6c, 1)
  model Hg75 is ReadonlyRegister<minutes>;

  /** HG 9x - Netzbetriebsstunden */
  @id(0x28, 0x2)
  model Hg9x is ReadonlyRegister<hours>;

  /** HG 90 - Brennerbetriebsstunden */
  @id(0x2a, 0x2)
  model Hg90 is ReadonlyRegister<hours>;

  /** HG 91 - Brennerstarts */
  @id(0x26, 0x2)
  model Hg91 is ReadonlyRegister<UIN>;

  /** Vorlauf Sollwert */
  @id(0x2, 0)
  model Flowtempdesired is ReadonlyRegister<temp10>;

  /** Vorlauf Istwert */
  @id(0xd, 0)
  model Flowtemp is ReadonlyRegister<temp10>;

  /** Ruecklauf Ist-Temperatur */
  @id(0x16, 0)
  model Returntemp is ReadonlyRegister<temp10>;

  /** Warmwasser Solltemperatur */
  @id(0x3, 0)
  model Hwctempdesired is ReadonlyRegister<temp10>;

  /** Warmwasser Ist-Temperatur */
  @id(0xe, 0)
  model Hwctemp is ReadonlyRegister<temp10>;

  /** PWM Pumpe */
  @id(0x6d, 1)
  model Pump is ReadonlyRegister<percent>;

  /** Flow temperature 2 near the heat exchanger, 1-2 K warmer at standstill */
  @id(0x58, 0x3)
  model Flowtemp2 is ReadonlyRegister<stemp10>;

  /** Hot water temperature at the storage sensor */
  @id(0x59, 0x3)
  model Hwctemp2 is ReadonlyRegister<stemp10>;

  /** Outside temperature, -40 = no sensor connected */
  @id(0xc, 0)
  model Outsidetemp is ReadonlyRegister<stemp10>;

  /** Water pressure, 0x8000 = invalid (no sensor fitted) */
  @id(0x1a, 0x27)
  model Press is ReadonlyRegister<press100>;

  /** Ionisation */
  @id(0x4f, 0x27)
  model Ionisation is ReadonlyRegister<UCH>;

  /** Burner performance in % of the allowed maximum */
  @id(0x6f, 0x1)
  model Performance is ReadonlyRegister<percent>;

  /** Pump speed, 0x8000 = invalid (sensor not available) */
  @id(0x57, 0x27)
  model PumpSpeed is ReadonlyRegister<percent>;

  /** Burner software version */
  @id(0x9a, 0x1)
  model Version is ReadonlyRegister<UIN>;

  /** Modulation status, 179 assumed to mean burner off */
  @id(0x93, 0x3)
  model Modulation is ReadonlyRegister<UIN>;

  /** Current error code, 0 = no error */
  @inherit(regr)
  @id(0x1, 0)
  model Error {
    @values(Values_errorcode)
    value: UCH;
  }

  /** HG 80 - most recent error: code plus operating hours since occurrence */
  @inherit(regr)
  @id(0x29, 0x2)
  model Hg80 {
    @values(Values_errorcode)
    code: UCH;

    /** operating hours since the error occurred */
    hours: UCH;
  }

  /** HG 81 - error 2 */
  @inherit(regr)
  @id(0x2b, 0x2)
  model Hg81 {
    @values(Values_errorcode)
    code: UCH;

    /** operating hours since the error occurred */
    hours: UCH;
  }

  /** HG 82 - error 3 */
  @inherit(regr)
  @id(0x2c, 0x2)
  model Hg82 {
    @values(Values_errorcode)
    code: UCH;

    /** operating hours since the error occurred */
    hours: UCH;
  }

  /** HG 83 - error 4 */
  @inherit(regr)
  @id(0x2d, 0x2)
  model Hg83 {
    @values(Values_errorcode)
    code: UCH;

    /** operating hours since the error occurred */
    hours: UCH;
  }

  /** HG 84 - error 5 */
  @inherit(regr)
  @id(0x2e, 0x2)
  model Hg84 {
    @values(Values_errorcode)
    code: UCH;

    /** operating hours since the error occurred */
    hours: UCH;
  }

  /** HG 85 - error 6 */
  @inherit(regr)
  @id(0x2f, 0x2)
  model Hg85 {
    @values(Values_errorcode)
    code: UCH;

    /** operating hours since the error occurred */
    hours: UCH;
  }

  /** HG 86 - error 7 */
  @inherit(regr)
  @id(0x30, 0x2)
  model Hg86 {
    @values(Values_errorcode)
    code: UCH;

    /** operating hours since the error occurred */
    hours: UCH;
  }

  /** HG 87 - error 8 */
  @inherit(regr)
  @id(0x31, 0x2)
  model Hg87 {
    @values(Values_errorcode)
    code: UCH;

    /** operating hours since the error occurred */
    hours: UCH;
  }

  /** HG 88 - error 9 */
  @inherit(regr)
  @id(0x32, 0x2)
  model Hg88 {
    @values(Values_errorcode)
    code: UCH;

    /** operating hours since the error occurred */
    hours: UCH;
  }

  /** HG 89 - oldest error */
  @inherit(regr)
  @id(0x33, 0x2)
  model Hg89 {
    @values(Values_errorcode)
    code: UCH;

    /** operating hours since the error occurred */
    hours: UCH;
  }

  /** Last error history entry via alternative register pair: code plus second byte */
  @inherit(regr)
  @id(0x3d, 0x2)
  model ErrorLastStatus {
    @values(Values_errorcode)
    code: UCH;

    /** second byte, likely operating hours since the error */
    extra: UCH;
  }

  /** Operating hour of the most recent error, compare with Hg9x */
  @id(0x3e, 0x2)
  model ErrorLastHours is ReadonlyRegister<hours>;
}
