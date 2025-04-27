import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Wolf;

namespace mc {
  /** default *uw */
  @write
  @passive
  model uw {}

  /** Ertrag */
  @inherit(uw)
  @ext(MF, 0x18)
  model Yields {
    /** Solarleistung */
    power: D2B;

    /** Ertrag Tag */
    yieldday: UIN;

    /** Summe Ertrag */
    yieldsum: UIN;

    /** Summe Ertrag M */
    yieldm: UCH;
  }

  /** Status */
  @inherit(uw)
  @ext(MF, 0x17)
  model Status {
    /** Solar Pumpe */
    @values(Values_onoff)
    pump: UCH;

    @maxLength(1)
    ign: IGN;

    /** Kollektortemperatur */
    collectortemp: temp;

    /** Solartemperatur Warmwasser */
    hwcsolartemp: temp;
  }

  /** Operation */
  @inherit(uw)
  @ext(MF, 0x14)
  model Operation {
    /** Status Solar */
    status: HEX;

    @maxLength(1)
    ign: IGN;

    /** Mischer Solltemperatur */
    hctempdesired: temp2;

    /** Raumtemperatur */
    roomtemp: temp1;

    /** Warmwasser Solltemperatur */
    hwctempdesired: temp1;
  }

  enum Values_onoff {
    off: 0xbc,
    on: 0xbd,
  }
}
