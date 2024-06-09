import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;

namespace broadcast {
  /** default *r */
  model r {}

  /** default *b */
  @passive
  @zz(BROADCAST)
  model b {}

  /** default *w */
  @write
  @zz(BROADCAST)
  model w {}

  /** date/time */
  @inherit(b)
  @ext(0x7, 0)
  model datetime {
    outsidetemp: temp2;
    time: btime;
    date: bdate;
  }

  /** identification */
  @inherit(r, b)
  @ext(0x7, 0x4)
  model id {
    /** device manufacturer */
    @values(values_manufacturer)
    manufacturer: UCH;

    /** device id */
    id: id;

    /** software version */
    software: PIN;

    /** hardware version */
    hardware: PIN;
  }

  /** identification */
  @inherit(w)
  @ext(0x7, 0x4)
  model id {}

  /** Inquiry of existence */
  @inherit(w)
  @ext(0x7, 0xfe)
  model queryexistence {}

  /** sign of life */
  @inherit(b)
  @ext(0x7, 0xff)
  model signoflife {}

  /** error message */
  @inherit(b)
  @ext(0xfe, 1)
  model error {
    @maxLength(10)
    error: STR;
  }

  enum values_manufacturer {
    Dungs: 0x06,
    FH_Ostfalia: 0x0f,
    TEM: 0x10,
    Lamberti: 0x11,
    CEB: 0x14,
    Landis_Staefa: 0x15,
    FERRO: 0x16,
    MONDIAL: 0x17,
    Wikon: 0x18,
    Wolf: 0x19,
    RAWE: 0x20,
    Satronic: 0x30,
    ENCON: 0x40,
    Kromschr_der: 0x50,
    Eberle: 0x60,
    EBV: 0x65,
    Gr_sslin: 0x75,
    ebm_papst: 0x85,
    SIG: 0x95,
    Theben: 0xa5,
    Thermowatt: 0xa7,
    Vaillant: 0xb5,
    Toby: 0xc0,
    Weishaupt: 0xc5,
    ebusd_eu: 0xfd,
  }
}
