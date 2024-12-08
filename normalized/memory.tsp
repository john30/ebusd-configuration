import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Memory {
  /** default *r */
  @base(0x9, 0)
  model r {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(0x9, 1)
  model wi {}

  /** RAM data */
  @inherit(r, wi)
  @ext
  model Ram {
    /** start address */
    @out
    address: UIN;

    /** number of bytes */
    @out
    count?: UCH;

    /** data bytes */
    data: HEX;
  }

  /** default *r */
  @base(0x9, 2)
  model r_1 {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(0x9, 3)
  model wi_1 {}

  /** EEPROM data */
  @inherit(r_1, wi_1)
  @ext
  model Eeprom {
    /** start address */
    @out
    address: UIN;

    /** number of bytes */
    @out
    count?: UCH;

    /** data bytes */
    data: HEX;
  }
}
