import "@ebusd/ebus-typespec";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Vaillant;

// @zz(0x15)
namespace Bass3 {
  // ==============================================================================
  // BASE TEMPLATES FOR CIRCUITS 0..3 AND EXTENSIONS
  // ==============================================================================

  /** default *u for circuit 0 */
  @passive
  @base(MF, 0x24, 0x02, 0x00, 0x00, 0x00)
  model u_c0 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *u for raw data in circuit 0 (uninstalled probes) */
  @passive
  @base(MF, 0x24, 0x02, 0x00, 0x00, 0x00)
  model u_raw_c0 {}

  /** default *r for raw data in circuit 0 (uninstalled probes) */
  @base(MF, 0x24, 0x02, 0x00, 0x00, 0x00)
  model r_raw_c0 {}

  /** default *r for circuit 0 */
  @base(MF, 0x24, 0x02, 0x00, 0x00, 0x00)
  model r_c0 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w for circuit 0 */
  @write
  @base(MF, 0x24, 0x02, 0x01, 0x00, 0x00)
  model w_c0 {}

  /** default *wi for circuit 0 level install */
  @write
  @auth("install")
  @base(MF, 0x24, 0x02, 0x01, 0x00, 0x00)
  model wi_c0 {}

  /** default *u for circuit 1 */
  @passive
  @base(MF, 0x24, 0x02, 0x00, 0x01, 0x00)
  model u_c1 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *r for circuit 1 */
  @base(MF, 0x24, 0x02, 0x00, 0x01, 0x00)
  model r_c1 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w for circuit 1 */
  @write
  @base(MF, 0x24, 0x02, 0x01, 0x01, 0x00)
  model w_c1 {}

  /** default *u for circuit 2 */
  @passive
  @base(MF, 0x24, 0x02, 0x00, 0x02, 0x00)
  model u_c2 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *r for circuit 2 */
  @base(MF, 0x24, 0x02, 0x00, 0x02, 0x00)
  model r_c2 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w for circuit 2 */
  @write
  @base(MF, 0x24, 0x02, 0x01, 0x02, 0x00)
  model w_c2 {}

  /** default *u for circuit 3 */
  @passive
  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00)
  model u_c3 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *r for circuit 3 */
  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00)
  model r_c3 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w for circuit 3 */
  @write
  @base(MF, 0x24, 0x02, 0x01, 0x03, 0x00)
  model w_c3 {}

  /** default *u for solar energy counter (b516 1000ffff) */
  @passive
  @base(MF, 0x16, 0x10, 0x00, 0xff, 0xff)
  model u_16_solar {
    @maxLength(7)
    ign: IGN;
  }

  /** default *r for solar energy counter (b516 1000ffff) */
  @base(MF, 0x16, 0x10, 0x00, 0xff, 0xff)
  model r_16_solar {
    @maxLength(7)
    ign: IGN;
  }

  // Split read (circuit 3) / write (circuit 0) base templates for Holiday mode
  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00, 0x05, 0x00)
  model r_hol_temp {
    @maxLength(4)
    ign: IGN;
  }
  @passive
  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00, 0x05, 0x00)
  model u_hol_temp {
    @maxLength(4)
    ign: IGN;
  }
  @write
  @base(MF, 0x24, 0x02, 0x01, 0x00, 0x00, 0xf6, 0x00)
  model w_hol_temp {}

  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00)
  model r_hol_sdate {
    @maxLength(4)
    ign: IGN;
  }
  @passive
  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00)
  model u_hol_sdate {
    @maxLength(4)
    ign: IGN;
  }
  @write
  @base(MF, 0x24, 0x02, 0x01, 0x00, 0x00, 0xf2, 0x00)
  model w_hol_sdate {}

  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00, 0x21, 0x00)
  model r_hol_stime {
    @maxLength(4)
    ign: IGN;
  }
  @passive
  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00, 0x21, 0x00)
  model u_hol_stime {
    @maxLength(4)
    ign: IGN;
  }
  @write
  @base(MF, 0x24, 0x02, 0x01, 0x00, 0x00, 0xf4, 0x00)
  model w_hol_stime {}

  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00)
  model r_hol_edate {
    @maxLength(4)
    ign: IGN;
  }
  @passive
  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00)
  model u_hol_edate {
    @maxLength(4)
    ign: IGN;
  }
  @write
  @base(MF, 0x24, 0x02, 0x01, 0x00, 0x00, 0xf3, 0x00)
  model w_hol_edate {}

  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00, 0x20, 0x00)
  model r_hol_etime {
    @maxLength(4)
    ign: IGN;
  }
  @passive
  @base(MF, 0x24, 0x02, 0x00, 0x03, 0x00, 0x20, 0x00)
  model u_hol_etime {
    @maxLength(4)
    ign: IGN;
  }
  @write
  @base(MF, 0x24, 0x02, 0x01, 0x00, 0x00, 0xf5, 0x00)
  model w_hol_etime {}

  /** default *u for diagnostics */
  @passive
  @base(MF, 0x03)
  model u_err {}

  /** default *r for diagnostics */
  @base(MF, 0x03)
  model r_err {}

  /** default *w for diagnostics */
  @write
  @auth("install")
  @base(MF, 0x03)
  model wi_err {}

  /** default *u for app */
  @passive
  @base(MF, 0x31)
  model u_app {}

  /** default *r for app */
  @base(MF, 0x31)
  model r_app {}

  // Weekly timer base templates per circuit (b5 55 a5/a6 00 <circuit> <day> <slot>)
  // Circuit 00 (Heating Zone 1)
  @base(MF, 0x55, 0xa5, 0x00, 0x00)
  model r_t0 {
    @maxLength(1)
    ign: IGN;
  }
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x00)
  model u_t0 {
    @maxLength(1)
    ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0x00, 0x00)
  model w_t0 {
    total_slots: UCH;
  }
  @passive
  @base(MF, 0x55, 0xa6, 0x00, 0x00)
  model u_t0_passive {}

  // Circuit 01 (Cooling)
  @base(MF, 0x55, 0xa5, 0x00, 0x01)
  model r_t1 {
    @maxLength(1)
    ign: IGN;
  }
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x01)
  model u_t1 {
    @maxLength(1)
    ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0x00, 0x01)
  model w_t1 {
    total_slots: UCH;
  }

  // Circuit 02 (DHW)
  @base(MF, 0x55, 0xa5, 0x00, 0x02)
  model r_t2 {
    @maxLength(1)
    ign: IGN;
  }
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x02)
  model u_t2 {
    @maxLength(1)
    ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0x00, 0x02)
  model w_t2 {
    total_slots: UCH;
  }

  // Circuit 03 (Circulation Pump)
  @base(MF, 0x55, 0xa5, 0x00, 0x03)
  model r_t3 {
    @maxLength(1)
    ign: IGN;
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;
    @maxLength(2)
    ign_end: IGN;
  }
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x03)
  model u_t3 {
    @maxLength(1)
    ign: IGN;
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;
    @maxLength(2)
    ign_end: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0x00, 0x03)
  model w_t3 {
    total_slots: UCH;
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;
    @maxLength(2)
    @constValue("ffff")
    ign_end: HEX;
  }

  // Circuit 04 (Silent Mode)
  @base(MF, 0x55, 0xa5, 0x00, 0x04)
  model r_t4 {
    @maxLength(1)
    ign: IGN;
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;
    @maxLength(2)
    ign_end: IGN;
  }
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x04)
  model u_t4 {
    @maxLength(1)
    ign: IGN;
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;
    @maxLength(2)
    ign_end: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0x00, 0x04)
  model w_t4 {
    total_slots: UCH;
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;
    @maxLength(2)
    @constValue("ffff")
    ign_end: HEX;
  }

  /** default *r for timer slots */
  @base(MF, 0x55, 0xa4, 0x00)
  model r_tslots {
    @maxLength(1)
    ign: IGN;
  }

  /** default *u for timer slots */
  @passive
  @base(MF, 0x55, 0xa4, 0x00)
  model u_tslots {
    @maxLength(1)
    ign: IGN;
  }

  // ==============================================================================
  // 1. GENERAL PARAMETERS, HYDRAULICS, AND ENERGY TELEMETRY (BASS3)
  // ==============================================================================

  /** water pressure */
  @inherit(r_c0, u_c0)
  @ext(0x39, 0x00)
  model WaterPressure {
    /** water pressure */
    @unit("bar")
    press: EXP;
  }

  /** system flow temp */
  @inherit(r_c0, u_c0)
  @ext(0x4b, 0x00)
  model SystemFlowTemp {
    /** system flow temperature */
    @unit("°C")
    value: EXP;
  }

  /** continuos heating */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x02, 0x00)
  model ContinuosHeating {
    /** -26=off, when the outside temperature falls below this threshold temperature the continuous heating function is started (off <=> function is disabled) */
    @unit("°C")
    value: EXP;
  }

  /** frost delay time */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x03, 0x00)
  model FrostOverRideTime {
    /** delay before frost protection is activated */
    @unit("h")
    value: UIN;
  }

  /** Global System OFF */
  @inherit(r_c0, u_c0, wi_c0)
  @ext(0x07, 0x00)
  model GlobalSystemOff {
    /** For switching system off */
    @values(Values_GlobalSystemOff_value)
    value: UCH;
  }

  /** max room humidity */
  @poll(9)
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x0e, 0x00)
  model MaxRoomHumidity {
    /** maximum room humidity */
    value: UIN;
  }

  /** adaptive heat curve */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x14, 0x00)
  model AdaptHeatCurve {
    /** automatic correction of configured heat curve */
    @values(Values_AdaptHeatCurve_value)
    value: UCH;
  }

  /** date */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x34, 0x00)
  model Date {
    /** current date */
    value: HDA3;
  }

  /** time */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x35, 0x00)
  model Time {
    /** current time */
    value: HTI;
  }

  /** system diagram */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x36, 0x00)
  model HydraulicScheme {
    /** system diagram */
    value: UIN;
  }

  /** multifunction relay setting */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x4d, 0x00)
  model MultiRelaySetting {
    @values(Values_MultiRelaySetting_value)
    value: UIN;
  }

  /** outside temperature */
  @inherit(r_c0, u_c0)
  @ext(0x73, 0x00)
  model DisplayedOutsideTemp {
    /** outside temperature */
    @unit("°C")
    value: EXP;
  }

  /** average outside temperature */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x95, 0x00)
  model OutsideTempAvg {
    /** 24h rolling average outside temperature (updated every 3h) */
    @unit("°C")
    value: EXP;
  }

  // Disabled active polling of non-existent solar registers to prevent bus saturation and read timeouts

  /** total environmental yield */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x3e, 0x00)
  model YieldTotal {
    /** total environmental yield */
    @unit("kWh")
    value: ULG;
  }

  /** total solar yield */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x3d, 0x00)
  model SolarYieldTotal {
    /** total solar yield */
    @unit("kWh")
    value: ULG;
  }

  /** total energy consumption heating */
  @poll(9)
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x57, 0x00)
  model PrEnergySumHc {
    /** total heating electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** this months energy consumption heating */
  @poll(9)
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x4f, 0x00)
  model PrEnergySumHcThisMonth {
    /** current month heating electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** last months energy consumption heating */
  @poll(9)
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x53, 0x00)
  model PrEnergySumHcLastMonth {
    /** last month heating electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** total energy consumption hot water */
  @poll(9)
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x58, 0x00)
  model PrEnergySumHwc {
    /** total hot water electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** this months energy consumption hot water */
  @poll(9)
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x50, 0x00)
  model PrEnergySumHwcThisMonth {
    /** current month hot water electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** last months energy consumption hot water */
  @poll(9)
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x54, 0x00)
  model PrEnergySumHwcLastMonth {
    /** last month hot water electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** code for installer menu */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x76, 0x00)
  model KeyCodeforConfigMenu {
    /** 000-999; code for the installer's menues */
    value: UIN;
  }

  /** next maintenance */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x2c, 0x00)
  model MaintenanceDate {
    /** next maintenance date */
    value: HDA3;
  }

  /** maintenance due */
  @inherit(r_c0, u_c0)
  @ext(0x96, 0x00)
  model MaintenanceDue {
    /** indicates whether maintenance is due */
    @values(Values_MaintenanceDue_value)
    value: UCH;
  }

  /** system operating state */
  @inherit(r_c0, u_c0)
  @ext(0x48, 0x00)
  model SystemOperatingState {
    /** current active system operating state */
    @values(Values_SystemOperatingState_value)
    value: UIN;
  }

  /** bivalence point heating */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x23, 0x00)
  model BivalencePointHc {
    /** bivalence point for heat pump heating */
    @unit("°C")
    value: EXP;
  }

  /** bivalence point hot water */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x01, 0x00)
  model BivalencePointHwc {
    /** bivalence point for hot water */
    @unit("°C")
    value: EXP;
  }

  /** alternative point heating */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x22, 0x00)
  model AlternativePoint {
    /** alternative point threshold temperature */
    @unit("°C")
    value: EXP;
  }

  /** unknown register 04 (uninstalled) */
  @inherit(r_raw_c0, u_raw_c0)
  @ext(0x04, 0x00)
  model Unknown04 {
    @maxLength(4)
    data: HEX;
  }

  /** solar storage temperature bottom */
  @inherit(r_c0, u_c0)
  @ext(0x67, 0x00)
  model SolarStorageTempBottom {
    /** solar temperature sensor, bottom */
    @unit("°C")
    value: EXP;
  }

  /** solar storage temperature top */
  @inherit(r_c0, u_c0)
  @ext(0x68, 0x00)
  model SolarStorageTempTop {
    /** solar temperature sensor, top */
    @unit("°C")
    value: EXP;
  }

  /** unknown setting b6 (uninstalled) */
  @inherit(r_raw_c0, u_raw_c0)
  @ext(0xb6, 0x00)
  model UnknownSettingB6 {
    @maxLength(4)
    data: HEX;
  }

  /** total solar energy sum */
  @inherit(r_16_solar, u_16_solar)
  @ext(0x01, 0x00, 0x00, 0x00)
  model PrEnergySolarTotal {
    @unit("Wh")
    energy: EXP;
  }

  /** multifunction input setting */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x6a, 0x00)
  model MultiInputSetting {
    /** multifunction input setting */
    @values(Values_MultiInputSetting_value)
    value: UCH;
  }

  /** outside temperature calibration offset */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x2d, 0x00)
  model OffsetOutsideTemp {
    /** outside temperature calibration offset */
    @unit("K")
    value: EXP;
  }

  // ==============================================================================
  // 2. DOMESTIC HOT WATER (DHW)
  // ==============================================================================

  /** hwc storage temperature */
  @inherit(r_c1, u_c1)
  @ext(0x05, 0x00)
  model HwcStorageTemp {
    /** actual storage temperature */
    @unit("°C")
    value: EXP;
  }

  /** hwc temperature desired */
  @inherit(r_c1, u_c1, w_c1)
  @ext(0x04, 0x00)
  model HwcTempDesired {
    /** setpoint of domestic hot water circuit */
    @unit("°C")
    value: EXP;
  }

  /** hwc operation mode */
  @inherit(r_c1, u_c1, w_c1)
  @ext(0x03, 0x00)
  model HwcOpMode {
    /** operation mode of Hwc */
    @values(Values_HwcOpMode_value)
    value: UIN;
  }

  /** hwc SF mode */
  @poll(9)
  @inherit(r_c1, u_c1, w_c1)
  @ext(0x0d, 0x00)
  model HwcSFMode {
    @values(Values_HwcSFMode_value)
    value: UCH;
  }

  /** hwc flow temperature */
  @poll(9)
  @inherit(r_c1, u_c1)
  @ext(0x08, 0x00)
  model HwcFlowTemp {
    /** desired flow temp for Hwc */
    @unit("°C")
    value: EXP;
  }

  /** hwc max flow temp desired */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x46, 0x00)
  model HwcMaxFlowTempDesired {
    /** maximum flow temperature setpoint of Hwc */
    @unit("°C")
    value: EXP;
  }

  /** hwc parallel loading */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x0a, 0x00)
  model HwcParallelLoading {
    /** heating and hot water parallel */
    @values(Values_HwcParallelLoading_value)
    value: UCH;
  }

  /** hwc lock time */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x18, 0x00)
  model HwcLockTime {
    /** DHW lock time */
    @unit("min")
    value: UIN;
  }

  /** maximale Speicherladezeit */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x17, 0x00)
  model MaxCylinderChargeTime {
    /** maximum cylinder charging time */
    @unit("min")
    value: UIN;
  }

  /** pump additional time */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x1b, 0x00)
  model PumpAdditionalTime {
    /** charging pump overrun time */
    @unit("min")
    value: UIN;
  }

  /** hysteresis cylinder charge */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x27, 0x00)
  model CylinderChargeHyst {
    /** cylinder charging hysteresis */
    @unit("K")
    value: EXP;
  }

  /** offset cylinder charge */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x29, 0x00)
  model CylinderChargeOffset {
    /** cylinder charging offset */
    @unit("K")
    value: EXP;
  }

  /** hwc storage temperature top */
  @inherit(r_c0, u_c0)
  @ext(0x9d, 0x00)
  model HwcStorageTempTop {
    /** DHW temperature sensor, top */
    @unit("°C")
    value: EXP;
  }

  /** storage temperature bottom */
  @inherit(r_c0, u_c0)
  @ext(0x9e, 0x00)
  model HwcStorageTempBottom {
    /** DHW temperature sensor, bottom */
    @unit("°C")
    value: EXP;
  }

  /** legionella protection day */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x2b, 0x00)
  model HwcLegionellaDay {
    /** legionella protection day */
    @values(Values_HwcLegionellaDay_day)
    day: UIN;
  }

  /** legionella protection time */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x2a, 0x00)
  model HwcLegionellaTime {
    /** legionella protection time */
    time: HTM;
  }

  /** hwc status */
  @inherit(r_c1, u_c1)
  @ext(0x0f, 0x00)
  model HwcStatus {
    @values(Values_HwcStatus_value)
    value: UIN;
  }

  /** offset buffer charge */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0xa2, 0x00)
  model BufferChargeOffset {
    @unit("K")
    value: EXP;
  }

  // ==============================================================================
  // 3. CLIMATE CONTROL / HEATING (CIRCUIT 1 - SINGLE ZONE)
  // ==============================================================================

  /** room temperature zone 1 */
  @inherit(r_c3, u_c3)
  @ext(0x0f, 0x00)
  model Z1RoomTemp {
    /** current room temperature in zone 1 */
    @unit("°C")
    value: EXP;
  }

  /** room temperature desired zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x14, 0x00)
  model Z1ActualRoomTempDesired {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    @unit("°C")
    value: EXP;
  }

  /** operation mode zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x06, 0x00)
  model Z1OpMode {
    /** operation mode of zone 1 */
    @values(Values_Z1OpMode_value)
    value: UIN;
  }

  /** SF mode zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x0e, 0x00)
  model Z1SFMode {
    @values(Values_Z1SFMode_value)
    value: UCH;
  }

  /** quick veto temperature zone 1 */
  @poll(9)
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x08, 0x00)
  model Z1QuickVetoTemp {
    /** manual override setpoint for zone 1 */
    @unit("°C")
    value: EXP;
  }

  /** quick veto duration zone 1 */
  @poll(9)
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x26, 0x00)
  model Z1QuickVetoDuration {
    /** quick veto duration for zone 1 */
    @unit("h")
    value: EXP;
  }

  /** quick veto end time zone 1 */
  @inherit(r_c3, u_c3)
  @ext(0x1e, 0x00)
  model Z1QuickVetoEndTime {
    /** quick veto end time for zone 1 */
    value: HTI;
  }

  /** quick veto end date zone 1 */
  @inherit(r_c3, u_c3)
  @ext(0x24, 0x00)
  model Z1QuickVetoEndDate {
    /** quick veto end date for zone 1 */
    value: HDA3;
  }

  /** heating time slot active zone 1 */
  @inherit(r_c3, u_c3)
  @ext(0x19, 0x00)
  model Z1TimeSlotActive {
    /** heating time slot active for zone 1 */
    @values(Values_Z1TimeSlotActive_value)
    value: UCH;
  }

  /** night temperature zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x09, 0x00)
  model Z1NightTemp {
    /** night setpoint for zone 1 */
    @unit("°C")
    value: EXP;
  }

  /** FlowTemp heating circuit 1 */
  @inherit(r_c2, u_c2)
  @ext(0x08, 0x00)
  model Hc1FlowTemp {
    /** current flow temperature of Hc1 */
    @unit("°C")
    value: EXP;
  }

  /** ActualFlowTempDesired heating circuit 1 */
  @inherit(r_c2, u_c2)
  @ext(0x07, 0x00)
  model Hc1ActualFlowTempDesired {
    /** current flow temperature setpoint of Hc1 */
    @unit("°C")
    value: EXP;
  }

  /** HeatCurve heating circuit 1 */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x0f, 0x00)
  model Hc1HeatCurve {
    /** heating curve of Hc1 */
    value: EXP;
  }

  /** summer outside switchoff temperature heating circuit 1 */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x14, 0x00)
  model Hc1SummerTempLimit {
    /** if outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    @unit("°C")
    value: EXP;
  }

  /** MaxFlowTempDesired heating circuit 1 */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x10, 0x00)
  model Hc1MaxFlowTempDesired {
    /** maximum flow temperature setpoint (end emphasis) of Hc1 */
    @unit("°C")
    value: EXP;
  }

  /** MinFlowTempDesired heating circuit 1 */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x12, 0x00)
  model Hc1MinFlowTempDesired {
    /** minimum flow temperature setpoint (end emphasis) of Hc1 */
    @unit("°C")
    value: EXP;
  }

  /** RoomTempSwitchOn heating circuit 1 */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x15, 0x00)
  model Hc1RoomTempSwitchOn {
    /** room temperature modulation of Hc1 */
    @values(Values_Hc1RoomTempSwitchOn_value)
    value: UIN;
  }

  /** Status heating circuit 1 */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x1b, 0x00)
  model Hc1Status {
    /** status of zone 1 */
    value: UCH;
  }

  /** PumpStatus heating circuit 1 */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x1e, 0x00)
  model Hc1PumpStatus {
    /** pump status of zone 1 */
    value: UIN;
  }

  /** AutoOffMode heating circuit 1 */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x0e, 0x00)
  model Hc1AutoOffMode {
    /** operation of Hc1 during the lowering time; no influence if room temperature modulation is set to thermostat */
    @values(Values_Hc1AutoOffMode_value)
    value: UIN;
  }

  /** CircuitType heating circuit 1 */
  @inherit(r_c2, u_c2)
  @ext(0x02, 0x00)
  model Hc1CircuitType {
    /** mixer type */
    @values(Values_Hc1CircuitType_mctype)
    mctype: UCH;

    @maxLength(1)
    ign_2: IGN;
  }

  // Disabled active polling of non-existent mixer circuit and adaptive curve (prevents collisions and timeouts)

  /** ExcessTemp heating circuit 1 */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x0b, 0x00)
  model Hc1ExcessTemp {
    /** excess temperature of Hc1 */
    @unit("K")
    value: EXP;
  }

  /** MixerMovement heating circuit 1 */
  @inherit(r_c2, u_c2)
  @ext(0x1a, 0x00)
  model Hc1MixerMovement {
    /** status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** HeatCurveAdaption heating circuit 1 */
  @inherit(r_c2, u_c2)
  @ext(0x1c, 0x00)
  model Hc1HeatCurveAdaption {
    /** adaption applied to heating curve of Hc1 */
    value: EXP;
  }

  /** hc storage temperature top */
  @inherit(r_c0, u_c0)
  @ext(0x9f, 0x00)
  model HcStorageTempTop {
    /** heating storage temperature sensor, top */
    @unit("°C")
    value: EXP;
  }

  /** hc storage temperature bottom */
  @inherit(r_c0, u_c0)
  @ext(0xa0, 0x00)
  model HcStorageTempBottom {
    /** heating storage temperature sensor, bottom */
    @unit("°C")
    value: EXP;
  }

  /** valve status zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x12, 0x00)
  model Z1ValveStatus {
    /** valve status of zone 1 */
    value: UCH;
  }

  /** room zone mapping zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x13, 0x00)
  model Z1RoomZoneMapping {
    /** configures which room temperature is assigned to zone 1 */
    @values(Values_Z1RoomZoneMapping_value)
    value: UIN;
  }

  /** short name zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x16, 0x00)
  model Z1Shortname {
    /** short name of zone 1 */
    @maxLength(6)
    value: STR;
  }

  /** zone 1 label (first part) */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x17, 0x00)
  model Z1Name1 {
    /** name of zone 1 */
    @maxLength(5)
    value: STR;
  }

  /** zone 1 status */
  @inherit(r_c3, u_c3)
  @ext(0x1b, 0x00)
  model Z1Status {
    @values(Values_Z1Status_value)
    value: UIN;
  }

  /** zone 1 heating demand state */
  @inherit(r_c3, u_c3)
  @ext(0x2c, 0x00)
  model Z1HeatingState {
    /** heating demand status */
    @values(Values_Z1HeatingState_value)
    value: UCH;
  }

  /** manual heating setpoint zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x22, 0x00)
  model Z1ManualTemp {
    /** temperature */
    @unit("°C")
    value: EXP;
  }

  /** manual cooling setpoint zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x23, 0x00)
  model Z1CoolingManualTemp {
    /** desired cooling manual setpoint for zone 1 */
    @unit("°C")
    value: EXP;
  }

  /** room relative humidity zone 1 */
  @inherit(r_c3, u_c3)
  @ext(0x28, 0x00)
  model Z1RoomHumidity {
    /** current relative room humidity in zone 1 */
    @unit("%")
    value: EXP;
  }

  // ==============================================================================
  // 4. COOLING LOGIC (SEASON WINDOW AND SETPOINTS)
  // ==============================================================================

  /** cooling operation mode zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x01, 0x00)
  model Z1OpModeCooling {
    /** operation mode for cooling of zone 1 */
    @values(Values_Z1OpModeCooling_value)
    value: UIN;
  }

  /** cooling setpoint zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x02, 0x00)
  model Z1CoolingTemp {
    /** desired cooling setpoint for zone 1 */
    @unit("°C")
    value: EXP;
  }

  /** cooling start date */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0xda, 0x00)
  model CoolingStartDate {
    day: UCH;
    month: UCH;

    /** Start date for active cooling (day, month, year) */
    year: UCH;
  }

  /** cooling end date */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0xdb, 0x00)
  model CoolingEndDate {
    day: UCH;
    month: UCH;

    /** End date for active cooling (day, month, year) */
    year: UCH;
  }

  /** cooling room temperature desired zone 1 */
  @inherit(r_c3, u_c3, w_c3)
  @ext(0x15, 0x00)
  model Z1CoolingTempDesired {
    /** temperature */
    @unit("°C")
    value: EXP;
  }

  /** cooling release status */
  @inherit(r_c0, u_c0)
  @ext(0x09, 0x00)
  model CoolingReleaseStatus {
    /** cooling release status */
    @values(Values_CoolingReleaseStatus_value)
    value: UCH;
  }

  /** cooling min flow temp desired */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x11, 0x00)
  model CoolingFlowTempDesiredMin {
    /** min flow temperature setpoint for cooling (Circuit 1: 10.0 °C on MiPro Sense) */
    @unit("°C")
    value: EXP;
  }

  /** emergency operation flow temperature setpoint */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x26, 0x00)
  model HcEmergencyTemp {
    /** emergency mode flow temperature setpoint (20..80 °C, display-verified on BASS3) */
    @minValue(20)
    @maxValue(80)
    @step(1)
    @unit("°C")
    value: EXP;
  }

  /** cooling outside temperature threshold */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x38, 0x00)
  model CoolingOutsideTempThreshold {
    /** cooling outside temperature threshold */
    @unit("°C")
    value: EXP;
  }

  /** dew point offset */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0x3a, 0x00)
  model DewPointOffset {
    /** dew point offset */
    @unit("K")
    value: EXP;
  }

  /** dew point monitoring */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x05, 0x00)
  model DewPointMonitoring {
    /** dew point monitoring */
    @values(Values_DewPointMonitoring_value)
    value: UCH;
  }

  /** cooling time slot active zone 1 */
  @inherit(r_c3, u_c3)
  @ext(0x1a, 0x00)
  model Z1CoolingTimeSlotActive {
    /** cooling time slot active for zone 1 */
    @values(Values_Z1CoolingTimeSlotActive_value)
    value: UCH;
  }

  /** cooling enabled heating circuit 1 */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x06, 0x00)
  model Hc1CoolingEnabled {
    /** cooling enabled for Hc1 */
    @values(Values_Hc1CoolingEnabled_value)
    value: UCH;
  }

  /** dew point offset heating circuit 1 */
  @inherit(r_c2, u_c2, w_c2)
  @ext(0x0a, 0x00)
  model Hc1DewPointOffset {
    /** dew point offset for Hc1 */
    @unit("K")
    value: EXP;
  }

  // ==============================================================================
  // 4b. HOLIDAY / AWAY MODE LOGIC (READ ZONE 1 03 00 / WRITE GLOBAL 00 00)
  // ==============================================================================

  /** holiday room temperature setpoint */
  @inherit(r_hol_temp, u_hol_temp, w_hol_temp)
  @ext
  model HolidayTemp {
    /** holiday setpoint */
    @unit("°C")
    value: EXP;
  }

  /** holiday start date */
  @inherit(r_hol_sdate, u_hol_sdate, w_hol_sdate)
  @ext
  model HolidayStartDate {
    day: UCH;
    month: UCH;

    /** Start date for holiday mode (day, month, year) */
    year: UCH;
  }

  /** holiday start time */
  @inherit(r_hol_stime, u_hol_stime, w_hol_stime)
  @ext
  model HolidayStartTime {
    hours: UCH;
    minutes: UCH;

    /** Start time for holiday mode (hours, minutes, seconds) */
    seconds: UCH;
  }

  /** holiday end date */
  @inherit(r_hol_edate, u_hol_edate, w_hol_edate)
  @ext
  model HolidayEndDate {
    day: UCH;
    month: UCH;

    /** End date for holiday mode (day, month, year) */
    year: UCH;
  }

  /** holiday end time */
  @inherit(r_hol_etime, u_hol_etime, w_hol_etime)
  @ext
  model HolidayEndTime {
    hours: UCH;
    minutes: UCH;

    /** End time for holiday mode (hours, minutes, seconds) */
    seconds: UCH;
  }

  /** holiday cancel trigger */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0xf7, 0x00)
  model HolidayCancel {
    /** holiday cancel trigger */
    value: UCH;
  }

  // ==============================================================================
  // 4c. INTENSIVE VENTILATION BOOST (GLOBAL 00 00)
  // ==============================================================================

  /** intensive ventilation boost */
  @inherit(r_c0, u_c0, w_c0)
  @ext(0xf9, 0x00)
  model VentilationBoost {
    /** Intensive ventilation boost (30 min heating pause) */
    @values(Values_VentilationBoost_value)
    value: UCH;
  }

  // ==============================================================================
  // 5. DIAGNOSTICS AND ERROR LOGGING
  // ==============================================================================

  /** Current errors */
  @inherit(r_err, u_err)
  @ext(0x00, 0x01)
  model Currenterror {
    /** error number */
    error: UIN;

    /** error number */
    error_1: UIN;

    /** error number */
    error_2: UIN;

    /** error number */
    error_3: UIN;

    /** error number */
    error_4: UIN;
  }

  /** Error_History */
  @inherit(r_err, u_err)
  @ext(0x01, 0x01)
  model Errorhistory {
    @out
    index: UCH;

    /** Status */
    status: UCH;

    /** time */
    time: VTM;

    /** date */
    date: HDA3;

    /** error number */
    error: UIN;
  }

  /** error memory slot */
  @inherit(r_err, u_err)
  @ext(0x00)
  model ErrorMemorySlot {
    @out
    slot: UCH;

    /** error number */
    error: UIN;

    @maxLength(8)
    data: HEX;
  }

  /** Clear error history */
  @inherit(wi_err)
  @ext(0x02, 0x01)
  model Clearerrorhistory {
    @values(Values_Clearerrorhistory_cleared)
    @in
    cleared: UCH;
  }

  /** app session status */
  @inherit(r_app, u_app)
  @ext(0x03, 0x01)
  model AppSessionStatus {
    /** app session status */
    @values(Values_AppSessionStatus_status)
    status: UCH;
  }

  // ==============================================================================
  // 6. WEEKLY TIME SCHEDULE (b5 55: READ r;u / WRITE w)
  // ==============================================================================
  // Read command structure (a5):  a5 00 [circuit] [day 00-06] [slot 00-02]
  // Write command structure (a6): a6 00 [circuit] [day 00-06] [slot 00-02] [total_slots 01-03] [from_h] [from_m] [to_h] [to_m] [temp 2B UIN:10 or IGN:2]
  // Circuits: 00=Heating Zone 1, 01=Cooling, 02=DHW, 03=Circulation, 04=Silent Mode
  // Days: 00=Monday .. 06=Sunday | Slots: 00=Slot 1 .. 02=Slot 3

  // 6.1 Heating Zone 1 (Circuit 00)
  /** Timer Heating Monday */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x00, 0x00)
  model Z1Timer_Monday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Monday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Monday Slot 2 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x00, 0x01)
  model Z1Timer_Monday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Monday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Monday Slot 3 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x00, 0x02)
  model Z1Timer_Monday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Monday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Tuesday */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x01, 0x00)
  model Z1Timer_Tuesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Tuesday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Tuesday Slot 2 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x01, 0x01)
  model Z1Timer_Tuesday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Tuesday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Tuesday Slot 3 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x01, 0x02)
  model Z1Timer_Tuesday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Tuesday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Wednesday */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x02, 0x00)
  model Z1Timer_Wednesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Wednesday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Wednesday Slot 2 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x02, 0x01)
  model Z1Timer_Wednesday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Wednesday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Wednesday Slot 3 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x02, 0x02)
  model Z1Timer_Wednesday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Wednesday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Thursday */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x03, 0x00)
  model Z1Timer_Thursday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Thursday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Thursday Slot 2 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x03, 0x01)
  model Z1Timer_Thursday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Thursday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Thursday Slot 3 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x03, 0x02)
  model Z1Timer_Thursday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Thursday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Friday */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x04, 0x00)
  model Z1Timer_Friday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Friday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Friday Slot 2 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x04, 0x01)
  model Z1Timer_Friday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Friday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Friday Slot 3 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x04, 0x02)
  model Z1Timer_Friday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Friday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Saturday */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x05, 0x00)
  model Z1Timer_Saturday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Saturday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Saturday Slot 2 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x05, 0x01)
  model Z1Timer_Saturday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Saturday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Saturday Slot 3 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x05, 0x02)
  model Z1Timer_Saturday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Saturday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Sunday */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x06, 0x00)
  model Z1Timer_Sunday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Sunday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Sunday Slot 2 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x06, 0x01)
  model Z1Timer_Sunday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Sunday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Sunday Slot 3 */
  @inherit(r_t0, u_t0, w_t0)
  @ext(0x06, 0x02)
  model Z1Timer_Sunday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Sunday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  // 6.1b Passive MiGo Link / Gateway Schedule Writes (a6 00 00)
  /** Timer Heating Monday Passive */
  @inherit(u_t0_passive)
  @ext(0x00, 0x00)
  model Z1Timer_Monday_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Monday Slot 2 Passive */
  @inherit(u_t0_passive)
  @ext(0x00, 0x01)
  model Z1Timer_Monday_Slot2_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Monday Slot 3 Passive */
  @inherit(u_t0_passive)
  @ext(0x00, 0x02)
  model Z1Timer_Monday_Slot3_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Tuesday Passive */
  @inherit(u_t0_passive)
  @ext(0x01, 0x00)
  model Z1Timer_Tuesday_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Tuesday Slot 2 Passive */
  @inherit(u_t0_passive)
  @ext(0x01, 0x01)
  model Z1Timer_Tuesday_Slot2_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Tuesday Slot 3 Passive */
  @inherit(u_t0_passive)
  @ext(0x01, 0x02)
  model Z1Timer_Tuesday_Slot3_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Wednesday Passive */
  @inherit(u_t0_passive)
  @ext(0x02, 0x00)
  model Z1Timer_Wednesday_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Wednesday Slot 2 Passive */
  @inherit(u_t0_passive)
  @ext(0x02, 0x01)
  model Z1Timer_Wednesday_Slot2_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Wednesday Slot 3 Passive */
  @inherit(u_t0_passive)
  @ext(0x02, 0x02)
  model Z1Timer_Wednesday_Slot3_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Thursday Passive */
  @inherit(u_t0_passive)
  @ext(0x03, 0x00)
  model Z1Timer_Thursday_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Thursday Slot 2 Passive */
  @inherit(u_t0_passive)
  @ext(0x03, 0x01)
  model Z1Timer_Thursday_Slot2_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Thursday Slot 3 Passive */
  @inherit(u_t0_passive)
  @ext(0x03, 0x02)
  model Z1Timer_Thursday_Slot3_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Friday Passive */
  @inherit(u_t0_passive)
  @ext(0x04, 0x00)
  model Z1Timer_Friday_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Friday Slot 2 Passive */
  @inherit(u_t0_passive)
  @ext(0x04, 0x01)
  model Z1Timer_Friday_Slot2_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Friday Slot 3 Passive */
  @inherit(u_t0_passive)
  @ext(0x04, 0x02)
  model Z1Timer_Friday_Slot3_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Saturday Passive */
  @inherit(u_t0_passive)
  @ext(0x05, 0x00)
  model Z1Timer_Saturday_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Saturday Slot 2 Passive */
  @inherit(u_t0_passive)
  @ext(0x05, 0x01)
  model Z1Timer_Saturday_Slot2_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Saturday Slot 3 Passive */
  @inherit(u_t0_passive)
  @ext(0x05, 0x02)
  model Z1Timer_Saturday_Slot3_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Sunday Passive */
  @inherit(u_t0_passive)
  @ext(0x06, 0x00)
  model Z1Timer_Sunday_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Sunday Slot 2 Passive */
  @inherit(u_t0_passive)
  @ext(0x06, 0x01)
  model Z1Timer_Sunday_Slot2_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer Heating Sunday Slot 3 Passive */
  @inherit(u_t0_passive)
  @ext(0x06, 0x02)
  model Z1Timer_Sunday_Slot3_Passive {
    @out
    total_slots: UCH;

    @out
    from_hour: UCH;

    @out
    from_min: UCH;

    @out
    to_hour: UCH;

    @out
    to_min: UCH;

    @out
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  // 6.2 Domestic Hot Water - DHW (Circuit 02)
  /** Timer DHW Monday */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x00, 0x00)
  model HwcTimer_Monday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Monday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Monday Slot 2 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x00, 0x01)
  model HwcTimer_Monday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Monday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Monday Slot 3 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x00, 0x02)
  model HwcTimer_Monday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Monday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Tuesday */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x01, 0x00)
  model HwcTimer_Tuesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Tuesday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Tuesday Slot 2 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x01, 0x01)
  model HwcTimer_Tuesday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Tuesday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Tuesday Slot 3 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x01, 0x02)
  model HwcTimer_Tuesday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Tuesday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Wednesday */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x02, 0x00)
  model HwcTimer_Wednesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Wednesday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Wednesday Slot 2 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x02, 0x01)
  model HwcTimer_Wednesday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Wednesday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Wednesday Slot 3 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x02, 0x02)
  model HwcTimer_Wednesday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Wednesday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Thursday */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x03, 0x00)
  model HwcTimer_Thursday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Thursday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Thursday Slot 2 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x03, 0x01)
  model HwcTimer_Thursday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Thursday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Thursday Slot 3 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x03, 0x02)
  model HwcTimer_Thursday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Thursday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Friday */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x04, 0x00)
  model HwcTimer_Friday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Friday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Friday Slot 2 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x04, 0x01)
  model HwcTimer_Friday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Friday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Friday Slot 3 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x04, 0x02)
  model HwcTimer_Friday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Friday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Saturday */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x05, 0x00)
  model HwcTimer_Saturday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Saturday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Saturday Slot 2 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x05, 0x01)
  model HwcTimer_Saturday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Saturday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Saturday Slot 3 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x05, 0x02)
  model HwcTimer_Saturday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Saturday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Sunday */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x06, 0x00)
  model HwcTimer_Sunday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Sunday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Sunday Slot 2 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x06, 0x01)
  model HwcTimer_Sunday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Sunday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  /** Timer DHW Sunday Slot 3 */
  @inherit(r_t2, u_t2, w_t2)
  @ext(0x06, 0x02)
  model HwcTimer_Sunday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Sunday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    temp: UIN;
  }

  // 6.3 Cooling (Circuit 01)
  /** Timer Cooling Monday */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x00, 0x00)
  model CoolingTimer_Monday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Monday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Monday Slot 2 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x00, 0x01)
  model CoolingTimer_Monday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Monday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Monday Slot 3 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x00, 0x02)
  model CoolingTimer_Monday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Monday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Tuesday */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x01, 0x00)
  model CoolingTimer_Tuesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Tuesday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Tuesday Slot 2 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x01, 0x01)
  model CoolingTimer_Tuesday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Tuesday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Tuesday Slot 3 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x01, 0x02)
  model CoolingTimer_Tuesday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Tuesday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Wednesday */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x02, 0x00)
  model CoolingTimer_Wednesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Wednesday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Wednesday Slot 2 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x02, 0x01)
  model CoolingTimer_Wednesday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Wednesday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Wednesday Slot 3 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x02, 0x02)
  model CoolingTimer_Wednesday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Wednesday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Thursday */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x03, 0x00)
  model CoolingTimer_Thursday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Thursday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Thursday Slot 2 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x03, 0x01)
  model CoolingTimer_Thursday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Thursday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Thursday Slot 3 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x03, 0x02)
  model CoolingTimer_Thursday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Thursday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Friday */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x04, 0x00)
  model CoolingTimer_Friday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Friday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Friday Slot 2 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x04, 0x01)
  model CoolingTimer_Friday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Friday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Friday Slot 3 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x04, 0x02)
  model CoolingTimer_Friday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Friday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Saturday */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x05, 0x00)
  model CoolingTimer_Saturday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Saturday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Saturday Slot 2 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x05, 0x01)
  model CoolingTimer_Saturday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Saturday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Saturday Slot 3 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x05, 0x02)
  model CoolingTimer_Saturday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Saturday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Sunday */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x06, 0x00)
  model CoolingTimer_Sunday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Sunday (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Sunday Slot 2 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x06, 0x01)
  model CoolingTimer_Sunday_Slot2 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Sunday Slot 2 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  /** Timer Cooling Sunday Slot 3 */
  @inherit(r_t1, u_t1, w_t1)
  @ext(0x06, 0x02)
  model CoolingTimer_Sunday_Slot3 {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Sunday Slot 3 (HH;MM;HH;MM) */
    @unit("°C")
    @divisor(10)
    cooling_temp: UIN;
  }

  // 6.4 Circulation Pump (Circuit 03)
  /** Timer Circulation Monday */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x00, 0x00)
  model CirculationTimer_Monday {}

  /** Timer Circulation Monday Slot 2 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x00, 0x01)
  model CirculationTimer_Monday_Slot2 {}

  /** Timer Circulation Monday Slot 3 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x00, 0x02)
  model CirculationTimer_Monday_Slot3 {}

  /** Timer Circulation Tuesday */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x01, 0x00)
  model CirculationTimer_Tuesday {}

  /** Timer Circulation Tuesday Slot 2 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x01, 0x01)
  model CirculationTimer_Tuesday_Slot2 {}

  /** Timer Circulation Tuesday Slot 3 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x01, 0x02)
  model CirculationTimer_Tuesday_Slot3 {}

  /** Timer Circulation Wednesday */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x02, 0x00)
  model CirculationTimer_Wednesday {}

  /** Timer Circulation Wednesday Slot 2 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x02, 0x01)
  model CirculationTimer_Wednesday_Slot2 {}

  /** Timer Circulation Wednesday Slot 3 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x02, 0x02)
  model CirculationTimer_Wednesday_Slot3 {}

  /** Timer Circulation Thursday */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x03, 0x00)
  model CirculationTimer_Thursday {}

  /** Timer Circulation Thursday Slot 2 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x03, 0x01)
  model CirculationTimer_Thursday_Slot2 {}

  /** Timer Circulation Thursday Slot 3 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x03, 0x02)
  model CirculationTimer_Thursday_Slot3 {}

  /** Timer Circulation Friday */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x04, 0x00)
  model CirculationTimer_Friday {}

  /** Timer Circulation Friday Slot 2 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x04, 0x01)
  model CirculationTimer_Friday_Slot2 {}

  /** Timer Circulation Friday Slot 3 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x04, 0x02)
  model CirculationTimer_Friday_Slot3 {}

  /** Timer Circulation Saturday */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x05, 0x00)
  model CirculationTimer_Saturday {}

  /** Timer Circulation Saturday Slot 2 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x05, 0x01)
  model CirculationTimer_Saturday_Slot2 {}

  /** Timer Circulation Saturday Slot 3 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x05, 0x02)
  model CirculationTimer_Saturday_Slot3 {}

  /** Timer Circulation Sunday */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x06, 0x00)
  model CirculationTimer_Sunday {}

  /** Timer Circulation Sunday Slot 2 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x06, 0x01)
  model CirculationTimer_Sunday_Slot2 {}

  /** Timer Circulation Sunday Slot 3 */
  @inherit(r_t3, u_t3, w_t3)
  @ext(0x06, 0x02)
  model CirculationTimer_Sunday_Slot3 {}

  // 6.5 Silent Mode (Circuit 04)
  /** Timer Silent Mode Monday */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x00, 0x00)
  model SilentTimer_Monday {}

  /** Timer Silent Mode Monday Slot 2 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x00, 0x01)
  model SilentTimer_Monday_Slot2 {}

  /** Timer Silent Mode Monday Slot 3 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x00, 0x02)
  model SilentTimer_Monday_Slot3 {}

  /** Timer Silent Mode Tuesday */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x01, 0x00)
  model SilentTimer_Tuesday {}

  /** Timer Silent Mode Tuesday Slot 2 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x01, 0x01)
  model SilentTimer_Tuesday_Slot2 {}

  /** Timer Silent Mode Tuesday Slot 3 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x01, 0x02)
  model SilentTimer_Tuesday_Slot3 {}

  /** Timer Silent Mode Wednesday */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x02, 0x00)
  model SilentTimer_Wednesday {}

  /** Timer Silent Mode Wednesday Slot 2 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x02, 0x01)
  model SilentTimer_Wednesday_Slot2 {}

  /** Timer Silent Mode Wednesday Slot 3 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x02, 0x02)
  model SilentTimer_Wednesday_Slot3 {}

  /** Timer Silent Mode Thursday */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x03, 0x00)
  model SilentTimer_Thursday {}

  /** Timer Silent Mode Thursday Slot 2 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x03, 0x01)
  model SilentTimer_Thursday_Slot2 {}

  /** Timer Silent Mode Thursday Slot 3 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x03, 0x02)
  model SilentTimer_Thursday_Slot3 {}

  /** Timer Silent Mode Friday */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x04, 0x00)
  model SilentTimer_Friday {}

  /** Timer Silent Mode Friday Slot 2 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x04, 0x01)
  model SilentTimer_Friday_Slot2 {}

  /** Timer Silent Mode Friday Slot 3 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x04, 0x02)
  model SilentTimer_Friday_Slot3 {}

  /** Timer Silent Mode Saturday */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x05, 0x00)
  model SilentTimer_Saturday {}

  /** Timer Silent Mode Saturday Slot 2 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x05, 0x01)
  model SilentTimer_Saturday_Slot2 {}

  /** Timer Silent Mode Saturday Slot 3 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x05, 0x02)
  model SilentTimer_Saturday_Slot3 {}

  /** Timer Silent Mode Sunday */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x06, 0x00)
  model SilentTimer_Sunday {}

  /** Timer Silent Mode Sunday Slot 2 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x06, 0x01)
  model SilentTimer_Sunday_Slot2 {}

  /** Timer Silent Mode Sunday Slot 3 */
  @inherit(r_t4, u_t4, w_t4)
  @ext(0x06, 0x02)
  model SilentTimer_Sunday_Slot3 {}

  // 6.6 NUMBER OF ACTIVE TIME SLOTS PER DAY (MONDAY TO SUNDAY)

  /** Active slots Circulation */
  @inherit(r_tslots, u_tslots)
  @ext(0x03)
  model CirculationTimer_Slots {
    mon: UCH;
    tue: UCH;
    wed: UCH;
    thu: UCH;
    fri: UCH;
    sat: UCH;
    sun: UCH;

    @maxLength(1)
    ign_2: IGN;
  }

  /** Active slots Cooling */
  @inherit(r_tslots, u_tslots)
  @ext(0x01)
  model CoolingTimer_Slots {
    mon: UCH;
    tue: UCH;
    wed: UCH;
    thu: UCH;
    fri: UCH;
    sat: UCH;
    sun: UCH;

    @maxLength(1)
    ign_2: IGN;
  }

  /** Active slots DHW */
  @inherit(r_tslots, u_tslots)
  @ext(0x02)
  model HwcTimer_Slots {
    mon: UCH;
    tue: UCH;
    wed: UCH;
    thu: UCH;
    fri: UCH;
    sat: UCH;
    sun: UCH;

    @maxLength(1)
    ign_2: IGN;
  }

  /** Active slots Silent Mode */
  @inherit(r_tslots, u_tslots)
  @ext(0x04)
  model SilentTimer_Slots {
    mon: UCH;
    tue: UCH;
    wed: UCH;
    thu: UCH;
    fri: UCH;
    sat: UCH;
    sun: UCH;

    @maxLength(1)
    ign_2: IGN;
  }

  /** Active slots Zone 1 */
  @inherit(r_tslots, u_tslots)
  @ext(0x00)
  model Z1Timer_Slots {
    mon: UCH;
    tue: UCH;
    wed: UCH;
    thu: UCH;
    fri: UCH;
    sat: UCH;
    sun: UCH;

    @maxLength(1)
    ign_2: IGN;
  }

  // ==============================================================================
  // ENUM VALUE SETS
  // ==============================================================================

  enum Values_GlobalSystemOff_value {
    no: 0,
    yes: 1,
  }

  enum Values_AdaptHeatCurve_value {
    no: 0,
    yes: 1,
  }

  enum Values_MultiRelaySetting_value {
    circulation: 0,
    dryer: 1,
    zone: 2,
    legiopump: 3,
  }

  enum Values_MultiInputSetting_value {
    off: 0,
    circulation: 1,
    photovoltaic: 2,
    cooling: 3,
  }

  enum Values_MaintenanceDue_value {
    no: 0,
    yes: 1,
  }

  enum Values_SystemOperatingState_value {
    standby: 0,
    heating: 1,
    cooling: 2,
    dhw: 3,
  }

  enum Values_HwcOpMode_value {
    off: 0,
    auto: 1,
    day: 2,
    night: 3,
  }

  enum Values_HwcSFMode_value {
    auto: 0,
    ventilation: 1,
    party: 2,
    veto: 3,
    onedayaway: 4,
    onedayathome: 5,
    load: 6,
  }

  enum Values_HwcParallelLoading_value {
    off: 0,
    on: 1,
  }

  enum Values_HwcLegionellaDay_day {
    off: 0,
    Monday: 1,
    Tuesday: 2,
    Wednesday: 3,
    Thursday: 4,
    Friday: 5,
    Saturday: 6,
    Sunday: 7,
  }

  enum Values_HwcStatus_value {
    auto: 0,
    holidayaway: 7,
    load: 9,
    off: 10,
  }

  enum Values_Z1OpMode_value {
    off: 0,
    auto: 1,
    day: 2,
    night: 3,
  }

  enum Values_Z1SFMode_value {
    auto: 0,
    ventilation: 1,
    party: 2,
    veto: 3,
    onedayaway: 4,
    onedayathome: 5,
    load: 6,
  }

  enum Values_Hc1RoomTempSwitchOn_value {
    off: 0,
    modulating: 1,
    thermostat: 2,
  }

  enum Values_Hc1AutoOffMode_value {
    eco: 0,
    night: 1,
  }

  enum Values_Hc1CircuitType_mctype {
    inactive: 0,
    mixer: 1,
    fixed: 2,
    hwc: 3,
    returnincr: 4,
    pool: 5,
  }

  enum Values_Z1RoomZoneMapping_value {
    none: 0,
    VRC700: 1,
    VR91_1: 2,
    VR91_2: 3,
    VR91_3: 4,
  }

  enum Values_Z1Status_value {
    auto: 0,
    ventilation: 1,
    veto: 4,
    holidayaway: 7,
    load: 9,
    off: 10,
  }

  enum Values_Z1HeatingState_value {
    off: 0,
    on: 1,
  }

  enum Values_Z1OpModeCooling_value {
    off: 0,
    auto: 1,
    day: 2,
    night: 3,
  }

  enum Values_CoolingReleaseStatus_value {
    off: 0,
    on: 1,
  }

  enum Values_DewPointMonitoring_value {
    off: 0,
    on: 1,
  }

  enum Values_Z1TimeSlotActive_value {
    no: 0,
    yes: 1,
  }

  enum Values_Z1CoolingTimeSlotActive_value {
    no: 0,
    yes: 1,
  }

  enum Values_Hc1CoolingEnabled_value {
    off: 0,
    on: 1,
  }

  enum Values_VentilationBoost_value {
    off: 0,
    on: 1,
  }

  enum Values_Clearerrorhistory_cleared {
    no: 0,
    yes: 1,
  }

  enum Values_AppSessionStatus_status {
    connected: 1,
    disconnected: 0,
  }
}
