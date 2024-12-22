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
}
