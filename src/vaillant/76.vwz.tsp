import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./b516_inc.tsp";
import "./hcmode_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x76)
namespace Vwz {
  // ----------------------------------------------------------------------
  // Service tests (existing, unchanged from PR 330)
  // VWZIO exposes the same 3 service tests as the VWZ; reachable only
  // after the matching EnableTest* write.
  // ----------------------------------------------------------------------

  /** default *rs for user level "service" */
  @auth("service")
  @base(MF, 0x14, 0x5)
  model rs {
    @maxLength(2)
    ign: IGN;
  }

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x14, 0x5)
  model ws_1 {
    @maxLength(3)
    @constValue("03FFFF")
    ignore: HEX;
  }

  /** enable test 3 way valve */
  @inherit(ws_1)
  @ext(0x2)
  model EnableTestThreeWayValve {}

  /** 3 way valve */
  @inherit(rs)
  @ext(0x2)
  model TestThreeWayValve {
    @values(Values_TestThreeWayValve)
    value: UCH;
  }

  /** enable test hwc temperature */
  @inherit(ws_1)
  @ext(0x2c)
  model EnableTestHwcTemp {}

  /** hwc temperature */
  @inherit(rs)
  @ext(0x2c)
  model TestHwcTemp {
    @unit("°C")
    @divisor(10)
    value: temps2;
  }

  /** enable test outdoor temperature */
  @inherit(ws_1)
  @ext
  model EnableTestOutdoorTemp {}

  /** outdoor temperature */
  @inherit(rs)
  @ext(0x45)
  model TestOutdoorTemp {
    @unit("°C")
    @divisor(10)
    value: temps2;
  }

  enum Values_TestThreeWayValve {
    heating: 0,
    dhw: 1,
  }

  // ----------------------------------------------------------------------
  // Process telemetry (new)
  //
  // Reverse-engineered from a 72-h passive grab capture against a
  // VWZIO HW=5103 / SW=0901 unit acting as the Vaillant
  // Hydraulikstation between an aroTHERM heat pump (HMU on 0x08) and
  // the building water circuits. See also issue #315 by @cyberthom42
  // for parallel decode work on the VWZ MEH 97/6 variant of the same
  // hydraulic station family.
  //
  // The master (0x10) polls these families on slave 0x76; ebusd
  // subscribes via *u — no active reads are issued.
  //
  // DateTime, Status01/02, Status16 and the common SetMode arrive via
  // the existing Hcmode_inc union below; PowerConsumptionHmu arrives
  // via B516_inc. Their byte layouts on 0x76 are identical to those
  // used by the HMU on 0x08.
  //
  // StatusDhw (b512 0f, request-content +, slave response) is
  // VWZIO-specific. Replaces what we'd previously split as
  // Stats01/Stats02 (id=0f0001 / id=0f0002) — per @Hoppur's PR #598
  // review (2026-04-30): the bytes after `0f` aren't id-suffix, they
  // are actual content (StatusCircPump + DhwActive). The same logical
  // message fires every 10s with whatever current state is. Unifies
  // the two CSV rows into one and exposes 4 net-new fields
  // (StatusCircPump, DhwActive, MultifunctionInput, plus correctly
  // typed HwcStorageTemp / SupplyTemp / WaterPressure / temp_7 pad).
  //
  // The b51a 05ff32xx slow-poll family (1/h) carries the electric
  // backup-heater (Heizstab) and 3-way diverter-valve (VUV) counters,
  // matching @cyberthom42's #315 mapping.
  // ----------------------------------------------------------------------

  /** default *u for b512 0f family */
  @passive
  @base(MF, 0x12, 0xf)
  model u_b512 {}

  /** Hydraulikstation DHW state. Layout per @Hoppur's PR #598 review
   * (2026-04-30). Master sends `b5 12 03 0f <pump-state> <dhw-state>`
   * every 10 s; slave responds with HWC tank temp + multifunction
   * input state + supply temp + heating-circuit pressure + 0xff pad.
   * Verified against this install's 72 h capture: only (pump=0,dhw=1)
   * and (pump=0,dhw=2) ever seen; MultifunctionInput always 0;
   * temp_7 always 0xff; HwcStorageTemp range 42-71 °C. */
  @inherit(u_b512)
  model StatusDhw {
    /** master byte 1: circulation pump state */
    @master
    @values(Values_StatusCircPump)
    statuscircpump: UCH;

    /** master byte 2: DHW heating active */
    @master
    @values(Values_DhwActive)
    dhwactive: UCH;

    /** slave bytes 0+1: DHW tank temperature, D2C 1/16 °C */
    hwcstoragetemp: temp;

    /** slave byte 2: multifunction input button state */
    @values(Values_OnOff)
    multifunctioninput: UCH;

    /** slave bytes 3+4: supply line temperature D2C 1/16 °C
     * (sensor reads HC flow when DhwActive=off, compressor outlet
     * when DhwActive=on — the supply line is physically routed
     * through the 3-way valve) */
    supplytemp: temp;

    /** slave byte 5: heating-circuit pressure UCH/10 bar */
    @unit("bar")
    @divisor(10)
    waterpressure: UCH;

    /** slave byte 6: trailing pad, always 0xff in our capture */
    temp_7: UCH;
  }

  enum Values_StatusCircPump { off: 0, on: 2 }
  enum Values_DhwActive { off: 1, on: 2 }
  enum Values_OnOff { off: 0, on: 1 }

  // ----------------------------------------------------------------------
  // Heizstab (electric backup heater) + 3-way valve telemetry.
  // Slow-polled (1/h). Mapping per @cyberthom42 issue #315.
  // ----------------------------------------------------------------------

  /** default *u for b51a 05 ff 32 xx (Heizstab statistics) */
  @passive
  @base(MF, 0x1a, 0x5, 0xff, 0x32)
  model u_b51a32 {
    @maxLength(3)
    ign: IGN;
  }

  /** electric backup heater operating hours */
  @inherit(u_b51a32)
  @ext(0x46)
  model ImmersionHeaterHours {
    @unit("h")
    value: UIN;
  }

  /** electric backup heater on/off switch counter */
  @inherit(u_b51a32)
  @ext(0x4a)
  model ImmersionHeaterStarts {
    value: UIN;
  }

  /** 3-way diverter-valve heating↔DHW switch counter */
  @inherit(u_b51a32)
  @ext(0x4b)
  model PrioritySwitchingValveOps {
    value: UIN;
  }

  /** default *u for b51a 05 ff 33 xx (Heizstab config) */
  @passive
  @base(MF, 0x1a, 0x5, 0xff, 0x33)
  model u_b51a33 {
    @maxLength(3)
    ign: IGN;
  }

  /** configured electric backup heater power cap */
  @inherit(u_b51a33)
  @ext(0x1a)
  model ImmersionHeaterPowerLimit {
    @unit("kW")
    value: UIN;
  }

  /** included parts */
  union _includes {
    Hcmode_inc,
    B516_inc,
  }
}
