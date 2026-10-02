import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Str;
namespace Vaillant;

/** B531 external load power-consumption limitation */
namespace B531_inc {
  /** active B531 read */
  @base(MF, 0x31)
  model r {}

  /** passive gateway-observed B531 message */
  @passive
  @base(MF, 0x31)
  model u {}

  /** passive B531 write/update */
  @write
  @passive
  @base(MF, 0x31)
  model uw {}

  /** device-local LPC power limit */
  @inherit(uw)
  @ext(0x01)
  model LpcPowerLimit {
    @unit("W")
    @factor(10)
    value: UIN;

    /** one-byte slave acknowledgement; semantic value intentionally ignored */
    @in
    @maxLength(1)
    ign: IGN;
  }

  /**
   * fallback power-limit metadata, available both as an active read and in
   * natural gateway traffic with the same correctly framed request.
   */
  @inherit(r, u)
  @ext(0x02)
  model LpcFallbackPowerLimit {
    /** first response U16 is intentionally unnamed */
    @in
    @maxLength(2)
    ign: IGN;

    /** second response U16, confirmed as 10 W/unit */
    @in
    @unit("W")
    @factor(10)
    value: UIN;
  }
}
