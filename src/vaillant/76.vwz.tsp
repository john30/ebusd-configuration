import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./b516_inc.tsp";
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
  @ext(0x45)
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
  // VWZIO HW=5103 / SW=0901 unit — a VWZ MEH 97/6 hydraulic station
  // sitting between an aroTHERM heat pump (HMU on 0x08) and the
  // building water circuits. See also issue #315 by @cyberthom42 for
  // parallel decode work on the same station, and the PR #598
  // discussion for an independent live-verified confirmation of the
  // Status01 layout on a second VWZ MEH 97/6 (SW=0902) by
  // @meierchen006.
  //
  // The master (0x10) polls b511 01 and b512 0f on slave 0x76 every
  // ~10 s and b504 00 about once per minute, so ebusd receives them
  // passively without issuing active reads.
  //
  // DateTime, Status01, SetMode and PowerConsumptionVwz are defined
  // below with the HMU byte layout. Hcmode_inc is not
  // included as a whole because Status/Status02/Status16 never occur on
  // 0x76. SetMode (b510 00) is byte-identical to the HMU's, verified on
  // CTLV2, CTLV3 and VRC700 installs. Which transitions reach 0x76 is
  // controller-dependent: a VRC700 sends water for compressor DHW, a
  // CTLV2 only for DHW runs using the backup heater, a CTLV3 sends the
  // flow setpoint when the backup heater takes over space heating. It
  // is defined passive only; writing it is left to the controller.
  //
  // Sensor positions for Status01 on this station (Vaillant manual
  // 0020291526, annex A "Funktionsschema" + annex C
  // "Reglerleiterplatte"): the flow temp is the sensor at the outlet
  // of the electric backup heater (annex A item 2, on X22 as
  // "Vorlauftemperaturfühler Heizstab") — it reads ~1 K above the
  // HMU flow sensor, more when the backup heater contributes. The
  // storage temp is the DHW cylinder sensor on X22 ("Temperatursensor
  // Warmwasserspeicher"), matching the lower cylinder sensor per
  // @meierchen006. Polled about every 10 s by the master (~6/min,
  // confirmed on installs with and without a VR921 gateway), Status01
  // is the fastest passive flow/storage temperature source on the bus.
  //
  // StatusDhw (b512 0f, request-content +, slave response) is
  // VWZIO-specific. Replaces what we'd previously split as
  // Stats01/Stats02 (id=0f0001 / id=0f0002) — per @Hoppur's PR #598
  // review (2026-04-30): the bytes after `0f` aren't id-suffix, they
  // are actual content (PumpMode + DhwActive). The same logical
  // message fires every 10s with whatever current state is. Unifies
  // the two CSV rows into one and exposes 4 net-new fields
  // (PumpMode, DhwActive, MultifunctionInput, plus correctly
  // typed HwcStorageTemp / SupplyTemp / WaterPressure / temp_7 pad).
  //
  // PumpMode (byte 1) is a three-valued consumer selector, not an
  // on/off flag, and no single installation exercises all of it. Both
  // it and DhwActive sit in the MASTER part of the request, so this is
  // the controller telling the station what to serve, not the station
  // reporting a pump.
  //
  //   0  no consumer selected
  //   1  cooling      -- measured on a CTLV2 (sensoCOMFORT 720) install
  //   2  circulation  -- measured by @niltrip on a VRC700 install
  //
  // 2 = circulation: on VWZIO HW=5103/SW=0901 with a VRC700, @niltrip
  // correlated the byte with the physical DHW circulation pump across a
  // configured circulation time window, cross-checked against
  // hmu StatusCirPump (b512 00), which the VRC700 writes as 100/0 at the
  // same instants. Reproducible over the window; DhwActive stays off
  // throughout. That install has never emitted 1.
  //
  // 1 = cooling: on the CTLV2 install the byte runs only while the
  // machine cools, and that install has never emitted 2. 15 days of
  // decoded state changes (2026-08-29..09-13, 144 transitions): 12
  // episodes at 1, all inside the cooling period that ended 2026-09-01,
  // none in the twelve days since. Against the HMU's own cooling flag
  // (Status07 heatermain_b4_cooling, sampled 2-minutely) the byte
  // ENVELOPES the compressor cycles rather than following them -- up to
  // 30 min ahead of a cooling block, ~1-3 min after it (overrun),
  // bridging the pauses between cycles: it held 1 continuously
  // 08-30 13:37->19:30 while the cooling flag was false for 58 min
  // inside that span. The last fall, 09-01 00:03:03, trails the last
  // cooling sample (00:00:01) by 3 min. An earlier 18.5 h raw-log
  // timeline against Mc1Operation (b523 0200) on the VR 71 shows the
  // same shape at telegram resolution:
  //
  //   pumpmode  19:28:38 ->1  21:51:08 ->0  22:19:37 ->1  04:03:08 ->0
  //   Mc1 cool  19:28:40 ->2  21:48:10 ->0  22:19:38 ->2  04:00:11 ->0
  //
  // Neither value mirrors hmu StatusCirPump. On the CTLV2 install that
  // message is a constant on, written every 5 min (193/193 telegrams in
  // the container log) while PumpMode sits at 0, and MultiRelaySetting
  // there reads not_connected rather than circulation -- no circulation
  // is configured at all. So 0 means "no consumer selected", not
  // "circulation inactive", and on an install without a circulation
  // pump the 2 simply never occurs.
  //
  // It is specifically NOT the shared heating/underfloor circuit pump,
  // which is the obvious candidate since that pump normally serves both
  // modes. Control test on the 72 h reference capture: Mc1 ran in
  // heating (status=01) with its own pump byte at 01 across all 3451
  // response variants, while this byte held a constant 00 throughout.
  //
  // History, because this field has now been wrong twice the same way:
  // 2=on was first derived by analogy with DhwActive from a capture in
  // which the byte never left 00 (only masters ...0f0001 / ...0f0002
  // appear there), then corrected to 1=on once 1 appeared -- right about
  // 1, wrong to conclude that 2 did not exist, since it had merely never
  // been exercised on that install. An installation exercises its own
  // configuration, not the protocol's alphabet. Each value above is
  // named from a measurement on the install that produced it; 3 and
  // above stay unnamed. The field was called StatusDHWCircPump until
  // 2026-09-13; that name asserted the DHW-circulation reading of 2 for
  // every value and was simply wrong for 1, so it is renamed rather than
  // kept for compatibility.
  //
  // DhwActive additionally emits 0, which is not a duration state: it
  // appears for exactly one 10 s cycle and is always bracketed by off
  // (off -> 0 -> off, 4 valid occurrences in 18.5 h), never adjacent to
  // on. Mapped as `idle` to describe the observation without claiming a
  // meaning for it.
  //
  // The b51a 05ff32xx family carries the electric backup-heater
  // (Heizstab) and 3-way diverter-valve (VUV) counters, matching
  // @cyberthom42's #315 mapping.
  // ----------------------------------------------------------------------

  /** default *r */
  @base(MF, 0x11)
  model r_1 {}

  /** date/time (same layout as HMU b504 00) */
  @inherit(rm)
  @ext(0)
  model DateTime {
    dcfstate: dcfstate;
    btime: btime;
    bdate: bdate;
    temp: temp2;
  }

  /** flow/return/outside/DHW/storage temperature and pump status (same layout as HMU Status01) */
  @inherit(r_1)
  @ext(1)
  model Status01 {
    /** flow temperature (sensor at the backup-heater outlet) */
    temp: temp1;

    /** return temperature */
    temp_1: temp1;

    /** outside temperature */
    temp_2: temp2;

    /** hot water temperature */
    temp_3: temp1;

    /** storage temperature */
    temp_4: temp1;

    /** pump status */
    pumpstate: pumpstate;
  }

  /** default *uw */
  @write
  @passive
  @base(MF, 0x10)
  model uw {}

  /** operation mode sent by the controller (same layout as HMU SetMode) */
  @inherit(uw)
  @ext(0)
  model SetMode {
    hcmode: hcmode;
    flowtempdesired: temp1;
    hwctempdesired: temp1;

    /** 0.5 °C steps like flowtempdesired (0x6a = 53 °C / 0x96 = 75 °C) - the HMU reports the same target as RunDataTargetFlowTemp */
    hwcflowtempdesired: temp1;

    @maxLength(1)
    ign: IGN;

    disablehc: BI0;
    disablehwctapping: BI1;
    disablehwcload: BI2;

    @maxLength(1)
    ign_1: IGN;

    remoteControlHcPump: BI0;
    releaseBackup: BI1;
    releaseCooling: BI2;
  }

  /** electric backup heater runtime in min and starts in Hc mode */
  @inherit(r_1)
  @ext(0x18, 1)
  model RunStatsImmersionHeaterHc {
    @maxLength(1) ign: IGN;
    runtime: minutes4;
    cycles: cntstarts;
  }

  /** electric backup heater runtime in min and starts in Hwc mode */
  @inherit(r_1)
  @ext(0x18, 0x2)
  model RunStatsImmersionHeaterHwc {
    @maxLength(1) ign: IGN;
    runtime: minutes4;
    cycles: cntstarts;
  }

  /** default *u for b512 0f family */
  @passive
  @base(MF, 0x12, 0xf)
  model u_b512 {}

  /** Hydraulikstation DHW state per Hoppur PR #598 review */
  @inherit(u_b512)
  @ext
  model StatusDhw {
    /** selected consumer: off / cooling / DHW circulation */
    @out
    @values(Values_PumpMode)
    pumpmode: UCH;

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

    /** trailing pad always 0xff in capture */
    @maxLength(1)
    ign: IGN;
  }

  enum Values_DhwActive { idle: 0, off: 1, on: 2 }
  enum Values_PumpMode { off: 0, cooling: 1, circulation: 2 }
  enum Values_OnOff { off: 0, on: 1 }

  // ----------------------------------------------------------------------
  // Heizstab (electric backup heater) + 3-way valve telemetry.
  // Mapping per @cyberthom42 issue #315. Defined as *r, not passive:
  // the controller never polls these IDs on 0x76 (CTLV2 and CTLV3
  // captures); only a myVaillant/sensoNET gateway (0xf1) reads them,
  // about once per hour. Without such a gateway, passive definitions
  // would never receive data.
  // ----------------------------------------------------------------------

  /** default *r for b51a 05 ff 32 xx (Heizstab statistics) */
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

  /** default *r for b51a 05 ff 33 xx (Heizstab config) */
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

  // b516 14 is the station's own current power (standby 0.003 kW here,
  // matching myVaillant), same layout as the HMU's PowerConsumptionHmu,
  // which lives in 08.hmu.HW5103.tsp, not in B516_inc. Only a
  // myVaillant/sensoNET gateway (0xf1) reads it, about once per minute,
  // hence r. Firmware-dependent: VWZIO SW=0901 answers, VWZ00 SW=0522
  // answers with an empty response (not implemented), per @chrizzzp.

  /** default *r for b516 */
  @base(MF, 0x16)
  model r_b516 {
    @maxLength(1)
    ign: IGN;
  }

  /** current power consumption of the hydraulic station */
  @inherit(r_b516)
  @ext(0x14)
  model PowerConsumptionVwz {
    @unit("kW")
    @divisor(1000)
    value: EXP;
  }

  // b509 54 02 bb 09 is the station's building-circuit flow, the VWZIO
  // counterpart of the HMU's /ba09 (RunDataBuildingCircuitFlow in
  // 08.hmu.HW5103.tsp). It equals the flow in b512 13 exactly (80 pairs,
  // mean deviation 0.0 l/h), see issue #686. Only a myVaillant/sensoNET
  // gateway (0xf1) reads it, about once per hour, hence r.

  /** default *r for b509 */
  @base(MF, 0x9, 0x54, 0x2, 0)
  model r_b509 {
    @maxLength(4)
    ign: IGN;
  }

  /** building circuit flow */
  @inherit(r_b509)
  @ext(0xbb, 0x09)
  model RunDataBuildingCircuitFlow {
    @unit("L/h")
    value: EXP;
  }

  /** included parts */
  union _includes {
    B516_inc,
  }
}
