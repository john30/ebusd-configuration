import "@ebusd/ebus-typespec";
import "../opdata_inc.tsp";
import "../net_inc.tsp";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Str;

namespace Wolf;

namespace Broadcast {
  /** default *b */
  @passive
  @zz(BROADCAST)
  model b {}

  @inherit(b)
  model RcTarget is Opdata_inc.RcTarget;

  @inherit(b)
  model RcOperation is Opdata_inc.RcOperation;

  @inherit(b)
  model ControlCmd is Opdata_inc.ControlCmd;

  /** Burner status broadcast, sent by the burner controller master */
  @inherit(b)
  @qq(0x03)
  @id(0x05, 0x03, 0x01)
  model BurnerStatus {
    @values(Values_burnermode)
    mode: UCH;

    /** bit field: 01 always / 04 hot water / 08 flame / 30 gas valves / 40 pump / 80 fault */
    statusbits: UCH;

    /** burner power relative to the allowed maximum */
    @unit("%")
    power: UCH;

    /** flow temperature */
    @divisor(2)
    @unit("°C")
    flowtemp: UCH;

    /** constant trailing bytes (80 ff 04 on CGG-2, 80 ff d8 on CGU-2) */
    @maxLength(3)
    trail: HEX;
  }

  /** BM parameter broadcast, sent by the Bedienmodul BM master with NN=09 */
  @inherit(b)
  @qq(0x30)
  @id(0x50, 0x23)
  model BmParam {
    /** CRC8 prefix byte plus telegram number little endian, e.g. 28000a=2560 frost limit / 3cbd02=701 summer-winter switch / 440f01=271 room influence / 6c8101=385 hot water max (A14) / 08be02=702 setback stop */
    @maxLength(3)
    telegram: HEX;

    /** raw value, interpretation depends on telegram number (temperatures divided by 10) */
    value: UIN;

    /** constant trailing bytes */
    @maxLength(4)
    trail: HEX;
  }

  union _includes {
    Net_inc,
  }
}
