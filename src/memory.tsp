import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;

namespace memory {
  /** default *r */
  model r {}

  /** default *wi */
  @write
  model wi {}

  /** read RAM data */
  @inherit(r)
  @ext(0x9, 0)
  model ram {
    /** start address */
    @out
    address: UIN;

    /** number of bytes */
    @out
    count: UCH;

    /** data bytes */
    data: HEX;
  }

  /** write RAM data */
  @inherit(wi)
  @ext(0x9, 1)
  model ram {
    /** start address */
    address: UIN;

    /** data bytes */
    data: HEX;
  }

  /** read EEPROM data */
  @inherit(r)
  @ext(0x9, 0x2)
  model eeprom {
    /** start address */
    @out
    address: UIN;

    /** number of bytes */
    @out
    count: UCH;

    /** data bytes */
    data: HEX;
  }

  /** write EEPROM data */
  @inherit(wi)
  @ext(0x9, 0x3)
  model eeprom {
    /** start address */
    address: UIN;

    /** data bytes */
    data: HEX;
  }
}
