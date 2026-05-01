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
  // are actual content (StatusDHWCircPump + DhwActive). The same logical
  // message fires every 10s with whatever current state is. Unifies
  // the two CSV rows into one and exposes 4 net-new fields
  // (StatusDHWCircPump, DhwActive, MultifunctionInput, plus correctly
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

  /** Hydraulikstation DHW state per Hoppur PR #598 review */
  @inherit(u_b512)
  @ext
  model StatusDhw {
    /** circulation pump state */
    @out
    @values(Values_StatusDHWCircPump)
    statusdhwcircpump: UCH;

    /** DHW heating active */
    @out
    @values(Values_DhwActive)
    dhwactive: UCH;

    /** DHW tank temperature */
    hwcstoragetemp: temp;

    /** multifunction input button state */
    @values(Values_OnOff)
    multifunctioninput: UCH;

    /** supply line temperature (HC flow if DhwActive=off / compressor outlet if on) */
    supplytemp: temp;

    /** heating-circuit pressure */
    @unit("bar")
    @divisor(10)
    waterpressure: UCH;

    /** trailing pad always 0xff */
    temp_7: UCH;
  }

  enum Values_StatusDHWCircPump { off: 0, on: 2 }
  enum Values_DhwActive { off: 1, on: 2 }
  enum Values_OnOff { off: 0, on: 1 }

  // ----------------------------------------------------------------------
  // Display state (b511 07) per @chrizzzp's PR #598 review. Active
  // read: ebusd polls the slave when the entity is read. Works on
  // both HMU (0x08) and VWZIO/VWZ00 (0x76); placed here so the VWZ
  // side gets it (HMU has a simpler `State` already defined in
  // 08.hmu.tsp covering the first 5 of these 7 bytes).
  // ----------------------------------------------------------------------

  /** default *r for b511 */
  @base(MF, 0x11)
  model r_b511 {}

  /** Hydraulikstation display state per chrizzzp PR #598 review */
  @inherit(r_b511)
  @ext(0x7)
  model Status07 {
    @unit("%")
    power: UCH;

    @unit("kWh")
    @divisor(10)
    dailyenvyield: UIN;

    display_b0_heaterenabled: BI0;
    display_b1: BI1;
    display_b2_backupheater: BI2;
    display_b3: BI3;
    display_b4: BI4;
    display_b5_noisereduction: BI5;
    display_b6_dhwecomode: BI6;
    display_b7: BI7;

    @values(Values_Status07HeaterMode)
    displayheatermain: UCH;

    @unit("bar")
    @divisor(30)
    displaysystempressure: UCH;

    @values(Values_Status07HeaterMode)
    displayheaterbackup: UCH;
  }

  /** State enum for `Status07.DisplayHeaterMain` and
   * `Status07.DisplayHeaterBackup`. Two adjacent codes per state
   * (e.g. 0/1 standby, 8/9 hc) — the low bit appears to subdivide
   * each mode but isn't documented; preserving both per
   * @chrizzzp's contribution. */
  enum Values_Status07HeaterMode {
    standby_0: 0,
    standby_1: 1,
    hc_8: 8,
    hc_9: 9,
    error_a: 10,
    error_b: 11,
    cool_10: 16,
    cool_11: 17,
    dhw_80: 128,
    dhw_81: 129,
  }

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
