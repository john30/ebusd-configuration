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
  // Stats01 / Stats02 (b512 0f 00 0X) are VWZIO-specific — no upstream
  // definition exists. Two D2C water-side temperatures plus an
  // operating-state enum, with reserved/padding bytes.
  //
  // The b51a 05ff32xx slow-poll family (1/h) carries the electric
  // backup-heater (Heizstab) and 3-way diverter-valve (VUV) counters,
  // matching @cyberthom42's #315 mapping.
  // ----------------------------------------------------------------------

  /** default *u for b512 0f00xx family */
  @passive
  @base(MF, 0x12, 0xf, 0)
  model u_b512 {}

  /** Hydraulic-station status — supply temperature + heating-circuit
   * pressure + modulation/state bytes. Layout per @chrizzzp via
   * @cyberthom42 issue #315. */
  @inherit(u_b512)
  @ext(0x1)
  model Stats01 {
    /** UCH off 0 — likely modulation/activity */
    modulation1: UCH;

    /** UCH off 1 — small enum 2..4 (operating mode?) */
    mode1: UCH;

    @maxLength(1)
    ign: IGN;

    /** supply temperature (flow at hydraulic station outlet) */
    supplytemp: temp;

    /** heating-circuit pressure (UCH / 10 bar) */
    @unit("bar")
    @divisor(10)
    waterpressure: UCH;

    @maxLength(1)
    ign_1: IGN;
  }

  /** Alternate poll of the same family — chrizzzp reports it returns
   * the identical layout as 0f0001 on his split system; on this
   * HW=5103 the values track a different circuit (likely HC vs HWC). */
  @inherit(u_b512)
  @ext(0x2)
  model Stats02 {
    /** UCH off 0 */
    modulation2: UCH;

    /** UCH off 1 */
    mode2: UCH;

    @maxLength(1)
    ign: IGN;

    /** supply temperature 2 — r=0.993 with HMU CompressorOutletTemp */
    supplytemp_2: temp;

    /** pressure (UCH / 10 bar) */
    @unit("bar")
    @divisor(10)
    waterpressure_2: UCH;

    @maxLength(1)
    ign_1: IGN;
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
