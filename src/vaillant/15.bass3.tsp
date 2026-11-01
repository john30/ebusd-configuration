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

  /** default *wi for circuit 1 level install */
  @write
  @auth("install")
  @base(MF, 0x24, 0x02, 0x01, 0x01, 0x00)
  model wi_c1 {}

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

  /** default *wi for circuit 2 level install */
  @write
  @auth("install")
  @base(MF, 0x24, 0x02, 0x01, 0x02, 0x00)
  model wi_c2 {}

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

  /** default *wi for circuit 3 level install */
  @write
  @auth("install")
  @base(MF, 0x24, 0x02, 0x01, 0x03, 0x00)
  model wi_c3 {}

  /** default *u for diagnostics */
  @passive
  @base(MF, 0x03)
  model u_err {}

  /** default *w for diagnostics */
  @write
  @auth("install")
  @base(MF, 0x03)
  model wi_err {}

  /** default *u for app */
  @passive
  @base(MF, 0x31)
  model u_app {}

  // Weekly timer base templates per circuit and day
  // Circuit 3 (Heating Zone 1)
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x03, 0x00, 0x00)
  model u_t3_0 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x03, 0x00, 0x00, 0x01)
  model w_t3_0 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x03, 0x01, 0x00)
  model u_t3_1 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x03, 0x01, 0x00, 0x01)
  model w_t3_1 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x03, 0x02, 0x00)
  model u_t3_2 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x03, 0x02, 0x00, 0x01)
  model w_t3_2 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x03, 0x03, 0x00)
  model u_t3_3 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x03, 0x03, 0x00, 0x01)
  model w_t3_3 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x03, 0x04, 0x00)
  model u_t3_4 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x03, 0x04, 0x00, 0x01)
  model w_t3_4 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x03, 0x05, 0x00)
  model u_t3_5 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x03, 0x05, 0x00, 0x01)
  model w_t3_5 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x03, 0x06, 0x00)
  model u_t3_6 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x03, 0x06, 0x00, 0x01)
  model w_t3_6 {}

  // Circuit 2 (DHW)
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x02, 0x00, 0x00)
  model u_t2_0 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x02, 0x00, 0x00, 0x01)
  model w_t2_0 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x02, 0x01, 0x00)
  model u_t2_1 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x02, 0x01, 0x00, 0x01)
  model w_t2_1 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x02, 0x02, 0x00)
  model u_t2_2 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x02, 0x02, 0x00, 0x01)
  model w_t2_2 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x02, 0x03, 0x00)
  model u_t2_3 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x02, 0x03, 0x00, 0x01)
  model w_t2_3 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x02, 0x04, 0x00)
  model u_t2_4 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x02, 0x04, 0x00, 0x01)
  model w_t2_4 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x02, 0x05, 0x00)
  model u_t2_5 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x02, 0x05, 0x00, 0x01)
  model w_t2_5 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x02, 0x06, 0x00)
  model u_t2_6 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x02, 0x06, 0x00, 0x01)
  model w_t2_6 {}

  // Circuit 1 (Cooling)
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x01, 0x00, 0x00)
  model u_t1_0 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x01, 0x00, 0x00, 0x01)
  model w_t1_0 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x01, 0x01, 0x00)
  model u_t1_1 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x01, 0x01, 0x00, 0x01)
  model w_t1_1 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x01, 0x02, 0x00)
  model u_t1_2 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x01, 0x02, 0x00, 0x01)
  model w_t1_2 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x01, 0x03, 0x00)
  model u_t1_3 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x01, 0x03, 0x00, 0x01)
  model w_t1_3 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x01, 0x04, 0x00)
  model u_t1_4 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x01, 0x04, 0x00, 0x01)
  model w_t1_4 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x01, 0x05, 0x00)
  model u_t1_5 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x01, 0x05, 0x00, 0x01)
  model w_t1_5 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x01, 0x06, 0x00)
  model u_t1_6 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x01, 0x06, 0x00, 0x01)
  model w_t1_6 {}

  // Circuit 0 (Circulation)
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x00, 0x00, 0x00)
  model u_t0_0 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x00, 0x00, 0x00, 0x01)
  model w_t0_0 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x00, 0x01, 0x00)
  model u_t0_1 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x00, 0x01, 0x00, 0x01)
  model w_t0_1 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x00, 0x02, 0x00)
  model u_t0_2 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x00, 0x02, 0x00, 0x01)
  model w_t0_2 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x00, 0x03, 0x00)
  model u_t0_3 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x00, 0x03, 0x00, 0x01)
  model w_t0_3 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x00, 0x04, 0x00)
  model u_t0_4 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x00, 0x04, 0x00, 0x01)
  model w_t0_4 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x00, 0x05, 0x00)
  model u_t0_5 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x00, 0x05, 0x00, 0x01)
  model w_t0_5 {}
  @passive
  @base(MF, 0x55, 0xa5, 0x00, 0x00, 0x06, 0x00)
  model u_t0_6 {
    @maxLength(1) ign: IGN;
  }
  @write
  @base(MF, 0x55, 0xa6, 0xff, 0x00, 0x06, 0x00, 0x01)
  model w_t0_6 {}

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
  @inherit(u_c0)
  @ext(0x39, 0x00)
  model WaterPressure {
    /** water pressure */
    @unit("bar")
    press: EXP;
  }

  /** system flow temp */
  @inherit(u_c0)
  @ext(0x4b, 0x00)
  model SystemFlowTemp {
    /** system flow temperature */
    value: tempv;
  }

  /** continuos heating */
  @inherit(u_c0, w_c0)
  @ext(0x02, 0x00)
  model ContinuosHeating {
    /** -26=off, when the outside temperature falls below this threshold temperature the continuous heating function is started (off <=> function is disabled) */
    @unit("°C")
    value: EXP;
  }

  /** frost delay time */
  @inherit(u_c0, w_c0)
  @ext(0x03, 0x00)
  model FrostOverRideTime {
    /** delay before frost protection is activated */
    @unit("h")
    value: UIN;
  }

  /** Global System OFF */
  @poll(9)
  @inherit(r_c0, wi_c0)
  @ext(0x07, 0x00)
  model GlobalSystemOff {
    /** For switching system off */
    @values(Values_GlobalSystemOff_value)
    value: UCH;
  }

  /** max room humidity */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x0e, 0x00)
  model MaxRoomHumidity {
    /** maximum room humidity */
    value: UIN;
  }

  /** adaptive heat curve */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x14, 0x00)
  model AdaptHeatCurve {
    /** automatic correction of configured heat curve */
    @values(Values_AdaptHeatCurve_value)
    value: UCH;
  }

  /** date */
  @inherit(u_c0, w_c0)
  @ext(0x34, 0x00)
  model Date {
    /** current date */
    value: HDA3;
  }

  /** time */
  @inherit(u_c0, w_c0)
  @ext(0x35, 0x00)
  model Time {
    /** current time */
    value: HTI;
  }

  /** system diagram */
  @inherit(u_c0, w_c0)
  @ext(0x36, 0x00)
  model HydraulicScheme {
    /** system diagram */
    value: UIN;
  }

  /** multifunction relay setting */
  @inherit(u_c0, w_c0)
  @ext(0x4d, 0x00)
  model MultiRelaySetting {
    @values(Values_MultiRelaySetting_value)
    value: UIN;
  }

  /** outside temperature */
  @inherit(u_c0)
  @ext(0x73, 0x00)
  model DisplayedOutsideTemp {
    /** outside temperature */
    @unit("°C")
    value: EXP;
  }

  /** average outside temperature */
  @inherit(u_c0, w_c0)
  @ext(0x95, 0x00)
  model OutsideTempAvg {
    /** rounded average outside temperature (updated every 3h) */
    @unit("°C")
    value: EXP;
  }

  // Disabled active polling of non-existent solar registers to prevent bus saturation and read timeouts

  /** total environmental yield */
  @inherit(u_c0, w_c0)
  @ext(0x3e, 0x00)
  model YieldTotal {
    /** total environmental yield */
    @unit("kWh")
    value: ULG;
  }

  /** total solar yield */
  @inherit(u_c0, w_c0)
  @ext(0x3d, 0x00)
  model SolarYieldTotal {
    /** total solar yield */
    @unit("kWh")
    value: ULG;
  }

  /** total energy consumption heating */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x57, 0x00)
  model PrEnergySumHc {
    /** total heating electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** this months energy consumption heating */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x4f, 0x00)
  model PrEnergySumHcThisMonth {
    /** current month heating electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** last months energy consumption heating */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x53, 0x00)
  model PrEnergySumHcLastMonth {
    /** last month heating electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** total energy consumption hot water */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x58, 0x00)
  model PrEnergySumHwc {
    /** total hot water electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** this months energy consumption hot water */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x50, 0x00)
  model PrEnergySumHwcThisMonth {
    /** current month hot water electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** last months energy consumption hot water */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x54, 0x00)
  model PrEnergySumHwcLastMonth {
    /** last month hot water electricity consumption */
    @unit("kWh")
    value: ULG;
  }

  /** code for installer menu */
  @inherit(u_c0, w_c0)
  @ext(0x76, 0x00)
  model KeyCodeforConfigMenu {
    /** 000-999; code for the installer's menues */
    value: UIN;
  }

  /** next maintenance */
  @inherit(u_c0, w_c0)
  @ext(0x2c, 0x00)
  model MaintenanceDate {
    /** next maintenance date */
    value: HDA3;
  }

  /** maintenance due */
  @inherit(u_c0)
  @ext(0x96, 0x00)
  model MaintenanceDue {
    /** indicates whether maintenance is due */
    @values(Values_MaintenanceDue_value)
    value: UCH;
  }

  /** system operating state */
  @inherit(u_c0)
  @ext(0x48, 0x00)
  model SystemOperatingState {
    /** current active system operating state */
    @values(Values_SystemOperatingState_value)
    value: UIN;
  }

  /** bivalence point heating */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x23, 0x00)
  model BivalencePointHc {
    /** bivalence point for heat pump heating */
    @unit("°C")
    value: EXP;
  }

  /** bivalence point hot water */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x01, 0x00)
  model BivalencePointHwc {
    /** bivalence point for hot water */
    @unit("°C")
    value: EXP;
  }

  /** alternative point heating */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x22, 0x00)
  model AlternativePoint {
    /** alternative point threshold temperature */
    @unit("°C")
    value: EXP;
  }

  /** unknown register 04 (uninstalled) */
  @inherit(u_raw_c0)
  @ext(0x04, 0x00)
  model Unknown04 {
    @maxLength(4)
    data: HEX;
  }

  /** solar storage temperature bottom */
  @inherit(u_c0)
  @ext(0x67, 0x00)
  model SolarStorageTempBottom {
    /** solar temperature sensor, bottom */
    value: tempv;
  }

  /** solar storage temperature top */
  @inherit(u_c0)
  @ext(0x68, 0x00)
  model SolarStorageTempTop {
    /** solar temperature sensor, top */
    value: tempv;
  }

  /** unknown setting b6 (uninstalled) */
  @inherit(u_raw_c0)
  @ext(0xb6, 0x00)
  model UnknownSettingB6 {
    @maxLength(4)
    data: HEX;
  }

  /** total solar energy sum */
  @passive
  @id(MF, 0x16, 0x10, 0x00, 0xff, 0xff, 0x01, 0x00, 0x00, 0x00)
  model PrEnergySolarTotal {
    @maxLength(7)
    ign: IGN;

    @unit("Wh")
    energy: EXP;
  }

  // ==============================================================================
  // 2. DOMESTIC HOT WATER (DHW)
  // ==============================================================================

  /** hwc storage temperature */
  @inherit(u_c1)
  @ext(0x05, 0x00)
  model HwcStorageTemp {
    /** actual storage temperature */
    @unit("°C")
    value: EXP;
  }

  /** hwc temperature desired */
  @inherit(u_c1, w_c1)
  @ext(0x04, 0x00)
  model HwcTempDesired {
    /** setpoint of domestic hot water circuit */
    @unit("°C")
    value: EXP;
  }

  /** hwc operation mode */
  @inherit(u_c1, w_c1)
  @ext(0x03, 0x00)
  model HwcOpMode {
    /** operation mode of Hwc */
    @values(Values_HwcOpMode_value)
    value: UIN;
  }

  /** hwc SF mode */
  @poll(9)
  @inherit(r_c1, w_c1)
  @ext(0x0d, 0x00)
  model HwcSFMode {
    @values(Values_HwcSFMode_value)
    value: UCH;
  }

  /** hwc flow temperature */
  @poll(9)
  @inherit(r_c1)
  @ext(0x08, 0x00)
  model HwcFlowTemp {
    /** desired flow temp for Hwc */
    @unit("°C")
    value: EXP;
  }

  /** hwc max flow temp desired */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x46, 0x00)
  model HwcMaxFlowTempDesired {
    /** maximum flow temperature setpoint of Hwc */
    @unit("°C")
    value: EXP;
  }

  /** hwc parallel loading */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x0a, 0x00)
  model HwcParallelLoading {
    /** heating and hot water parallel */
    @values(Values_HwcParallelLoading_value)
    value: UCH;
  }

  /** hwc lock time */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x18, 0x00)
  model HwcLockTime {
    /** DHW lock time */
    @unit("min")
    value: UIN;
  }

  /** maximale Speicherladezeit */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x17, 0x00)
  model MaxCylinderChargeTime {
    /** maximum cylinder charging time */
    @unit("min")
    value: UIN;
  }

  /** pump additional time */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x1b, 0x00)
  model PumpAdditionalTime {
    /** charging pump overrun time */
    @unit("min")
    value: UIN;
  }

  /** hysteresis cylinder charge */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x27, 0x00)
  model CylinderChargeHyst {
    /** cylinder charging hysteresis */
    @unit("K")
    value: EXP;
  }

  /** offset cylinder charge */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x29, 0x00)
  model CylinderChargeOffset {
    /** cylinder charging offset */
    @unit("K")
    value: EXP;
  }

  /** hwc storage temperature top */
  @inherit(u_c0)
  @ext(0x9d, 0x00)
  model HwcStorageTempTop {
    /** DHW temperature sensor, top */
    value: tempv;
  }

  /** storage temperature bottom */
  @inherit(u_c0)
  @ext(0x9e, 0x00)
  model HwcStorageTempBottom {
    /** DHW temperature sensor, bottom */
    value: tempv;
  }

  /** hwc status */
  @inherit(u_c1)
  @ext(0x0f, 0x00)
  model HwcStatus {
    @values(Values_HwcStatus_value)
    value: UIN;
  }

  /** offset buffer charge */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0xa2, 0x00)
  model BufferChargeOffset {
    @unit("K")
    value: EXP;
  }

  // ==============================================================================
  // 3. CLIMATE CONTROL / HEATING (CIRCUIT 1 - SINGLE ZONE)
  // ==============================================================================

  /** room temperature zone 1 */
  @inherit(u_c3)
  @ext(0x0f, 0x00)
  model Z1RoomTemp {
    /** current room temperature in zone 1 */
    @unit("°C")
    value: EXP;
  }

  /** room temperature desired zone 1 */
  @inherit(u_c3, w_c3)
  @ext(0x14, 0x00)
  model Z1ActualRoomTempDesired {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    @unit("°C")
    value: EXP;
  }

  /** operation mode zone 1 */
  @inherit(u_c3, w_c3)
  @ext(0x06, 0x00)
  model Z1OpMode {
    /** operation mode of zone 1 */
    @values(Values_Z1OpMode_value)
    value: UIN;
  }

  /** SF mode zone 1 */
  @poll(9)
  @inherit(r_c3, w_c3)
  @ext(0x0e, 0x00)
  model Z1SFMode {
    @values(Values_Z1SFMode_value)
    value: UCH;
  }

  /** quick veto temperature zone 1 */
  @poll(9)
  @inherit(r_c3, w_c3)
  @ext(0x08, 0x00)
  model Z1QuickVetoTemp {
    /** manual override setpoint for zone 1 */
    @unit("°C")
    value: EXP;
  }

  /** night temperature zone 1 */
  @poll(9)
  @inherit(r_c3, w_c3)
  @ext(0x09, 0x00)
  model Z1NightTemp {
    /** night setpoint for zone 1 */
    @unit("°C")
    value: EXP;
  }

  /** room setpoint holiday period zone 1 */
  @poll(9)
  @inherit(r_c3, w_c3)
  @ext(0x05, 0x00)
  model Z1HolidayTemp {
    /** holiday setpoint for zone 1 */
    @unit("°C")
    value: EXP;
  }

  /** FlowTemp heating circuit 1 */
  @inherit(u_c2)
  @ext(0x08, 0x00)
  model Hc1FlowTemp {
    /** current flow temperature of Hc1 */
    @unit("°C")
    value: EXP;
  }

  /** ActualFlowTempDesired heating circuit 1 */
  @inherit(u_c2)
  @ext(0x07, 0x00)
  model Hc1ActualFlowTempDesired {
    /** current flow temperature setpoint of Hc1 */
    @unit("°C")
    value: EXP;
  }

  /** HeatCurve heating circuit 1 */
  @poll(9)
  @inherit(r_c2, w_c2)
  @ext(0x0f, 0x00)
  model Hc1HeatCurve {
    /** heating curve of Hc1 */
    value: EXP;
  }

  /** summer outside switchoff temperature heating circuit 1 */
  @poll(9)
  @inherit(r_c2, w_c2)
  @ext(0x14, 0x00)
  model Hc1SummerTempLimit {
    /** if outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    @unit("°C")
    value: EXP;
  }

  /** MaxFlowTempDesired heating circuit 1 */
  @poll(9)
  @inherit(r_c2, w_c2)
  @ext(0x10, 0x00)
  model Hc1MaxFlowTempDesired {
    /** maximum flow temperature setpoint (end emphasis) of Hc1 */
    @unit("°C")
    value: EXP;
  }

  /** MinFlowTempDesired heating circuit 1 */
  @poll(9)
  @inherit(r_c2, w_c2)
  @ext(0x12, 0x00)
  model Hc1MinFlowTempDesired {
    /** minimum flow temperature setpoint (end emphasis) of Hc1 */
    @unit("°C")
    value: EXP;
  }

  /** RoomTempSwitchOn heating circuit 1 */
  @poll(9)
  @inherit(r_c2, w_c2)
  @ext(0x15, 0x00)
  model Hc1RoomTempSwitchOn {
    /** room temperature modulation of Hc1 */
    @values(Values_Hc1RoomTempSwitchOn_value)
    value: UIN;
  }

  /** Status heating circuit 1 */
  @poll(9)
  @inherit(r_c2, w_c2)
  @ext(0x1b, 0x00)
  model Hc1Status {
    /** status of zone 1 */
    value: UCH;
  }

  /** PumpStatus heating circuit 1 */
  @inherit(u_c2, w_c2)
  @ext(0x1e, 0x00)
  model Hc1PumpStatus {
    /** pump status of zone 1 */
    value: UIN;
  }

  /** AutoOffMode heating circuit 1 */
  @poll(9)
  @inherit(r_c2, w_c2)
  @ext(0x0e, 0x00)
  model Hc1AutoOffMode {
    /** operation of Hc1 during the lowering time; no influence if room temperature modulation is set to thermostat */
    @values(Values_Hc1AutoOffMode_value)
    value: UIN;
  }

  /** CircuitType heating circuit 1 */
  @inherit(u_c2)
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
  @poll(9)
  @inherit(r_c2, w_c2)
  @ext(0x0b, 0x00)
  model Hc1ExcessTemp {
    /** excess temperature of Hc1 */
    @unit("K")
    value: EXP;
  }

  /** MixerMovement heating circuit 1 */
  @inherit(u_c2)
  @ext(0x1a, 0x00)
  model Hc1MixerMovement {
    /** status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** HeatCurveAdaption heating circuit 1 */
  @inherit(u_c2)
  @ext(0x1c, 0x00)
  model Hc1HeatCurveAdaption {
    /** adaption applied to heating curve of Hc1 */
    value: EXP;
  }

  /** hc storage temperature top */
  @inherit(u_c0)
  @ext(0x9f, 0x00)
  model HcStorageTempTop {
    /** heating storage temperature sensor, top */
    value: tempv;
  }

  /** hc storage temperature bottom */
  @inherit(u_c0)
  @ext(0xa0, 0x00)
  model HcStorageTempBottom {
    /** heating storage temperature sensor, bottom */
    value: tempv;
  }

  /** valve status zone 1 */
  @poll(9)
  @inherit(r_c3, w_c3)
  @ext(0x12, 0x00)
  model Z1ValveStatus {
    /** valve status of zone 1 */
    value: UCH;
  }

  /** room zone mapping zone 1 */
  @inherit(u_c3, w_c3)
  @ext(0x13, 0x00)
  model Z1RoomZoneMapping {
    /** configures which room temperature is assigned to zone 1 */
    @values(Values_Z1RoomZoneMapping_value)
    value: UIN;
  }

  /** short name zone 1 */
  @inherit(u_c3, w_c3)
  @ext(0x16, 0x00)
  model Z1Shortname {
    /** short name of zone 1 */
    @maxLength(6)
    value: STR;
  }

  /** zone 1 label (first part) */
  @inherit(u_c3, w_c3)
  @ext(0x17, 0x00)
  model Z1Name1 {
    /** name of zone 1 */
    @maxLength(5)
    value: STR;
  }

  /** zone 1 status */
  @inherit(u_c3)
  @ext(0x1b, 0x00)
  model Z1Status {
    @values(Values_Z1Status_value)
    value: UIN;
  }

  /** zone 1 heating demand state */
  @inherit(u_c3)
  @ext(0x2c, 0x00)
  model Z1HeatingState {
    /** heating demand status */
    @values(Values_Z1HeatingState_value)
    value: UCH;
  }

  /** manual heating setpoint zone 1 */
  @inherit(u_c3, w_c3)
  @ext(0x22, 0x00)
  model Z1ManualTemp {
    /** temperature */
    @unit("°C")
    value: EXP;
  }

  /** desired day temperature zone 1 */
  @inherit(u_c3, w_c3)
  @ext(0x23, 0x00)
  model Z1DayTemp {
    /** day comfort setpoint for zone 1 */
    @unit("°C")
    value: EXP;
  }

  /** max flow temp zone 1 */
  @inherit(u_c3, w_c3)
  @ext(0x28, 0x00)
  model Z1MaxFlowTempDesired {
    /** max flow temperature zone 1 */
    @unit("°C")
    value: EXP;
  }

  // ==============================================================================
  // 4. COOLING LOGIC (SEASON WINDOW AND SETPOINTS)
  // ==============================================================================

  /** cooling operation mode zone 1 */
  @inherit(u_c3, w_c3)
  @ext(0x01, 0x00)
  model Z1OpModeCooling {
    /** operation mode for cooling of zone 1 */
    @values(Values_Z1OpModeCooling_value)
    value: UIN;
  }

  /** cooling setpoint zone 1 */
  @inherit(u_c3, w_c3)
  @ext(0x02, 0x00)
  model Z1CoolingTemp {
    /** desired cooling setpoint for zone 1 */
    @unit("°C")
    value: EXP;
  }

  /** cooling start date */
  @inherit(u_c0, w_c0)
  @ext(0xda, 0x00)
  model CoolingStartDate {
    day: UCH;
    month: UCH;

    /** Start date for active cooling (day, month, year) */
    year: UCH;
  }

  /** cooling end date */
  @inherit(u_c0, w_c0)
  @ext(0xdb, 0x00)
  model CoolingEndDate {
    day: UCH;
    month: UCH;

    /** End date for active cooling (day, month, year) */
    year: UCH;
  }

  /** cooling room temperature desired zone 1 */
  @inherit(u_c3, w_c3)
  @ext(0x15, 0x00)
  model Z1CoolingTempDesired {
    /** temperature */
    @unit("°C")
    value: EXP;
  }

  /** cooling release status */
  @poll(9)
  @inherit(r_c0)
  @ext(0x09, 0x00)
  model CoolingReleaseStatus {
    /** cooling release status */
    @values(Values_CoolingReleaseStatus_value)
    value: UCH;
  }

  /** cooling min flow temp desired */
  @poll(9)
  @inherit(r_c2, w_c2)
  @ext(0x11, 0x00)
  model CoolingFlowTempDesiredMin {
    /** min flow temperature setpoint for cooling (Circuit 1: 10.0 °C on MiPro Sense) */
    @unit("°C")
    value: EXP;
  }

  /** cooling max flow temp desired */
  @poll(9)
  @inherit(r_c0, w_c0)
  @ext(0x26, 0x00)
  model CoolingFlowTempDesiredMax {
    /** max flow temperature setpoint for cooling */
    @unit("°C")
    value: EXP;
  }

  // ==============================================================================
  // 4b. HOLIDAY / AWAY MODE LOGIC (BASS3 b524 CIRCUIT 00 00)
  // ==============================================================================

  /** holiday room temperature setpoint */
  @inherit(u_c0, w_c0)
  @ext(0xf6, 0x00)
  model HolidayTemp {
    /** holiday setpoint */
    @unit("°C")
    value: EXP;
  }

  /** holiday start date */
  @inherit(u_c0, w_c0)
  @ext(0xf2, 0x00)
  model HolidayStartDate {
    day: UCH;
    month: UCH;

    /** Start date for holiday mode (day, month, year) */
    year: UCH;
  }

  /** holiday start time */
  @inherit(u_c0, w_c0)
  @ext(0xf4, 0x00)
  model HolidayStartTime {
    hours: UCH;
    minutes: UCH;

    /** Start time for holiday mode (hours, minutes, seconds) */
    seconds: UCH;
  }

  /** holiday end date */
  @inherit(u_c0, w_c0)
  @ext(0xf3, 0x00)
  model HolidayEndDate {
    day: UCH;
    month: UCH;

    /** End date for holiday mode (day, month, year) */
    year: UCH;
  }

  /** holiday end time */
  @inherit(u_c0, w_c0)
  @ext(0xf5, 0x00)
  model HolidayEndTime {
    hours: UCH;
    minutes: UCH;

    /** End time for holiday mode (hours, minutes, seconds) */
    seconds: UCH;
  }

  /** holiday cancel trigger */
  @inherit(u_c0, w_c0)
  @ext(0xf7, 0x00)
  model HolidayCancel {
    /** holiday cancel trigger */
    value: UCH;
  }

  // ==============================================================================
  // 5. DIAGNOSTICS AND ERROR LOGGING
  // ==============================================================================

  /** Current errors */
  @inherit(u_err)
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
  @inherit(u_err)
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
  @inherit(u_err)
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
  @inherit(u_app)
  @ext(0x03, 0x01)
  model AppSessionStatus {
    /** app session status */
    @values(Values_AppSessionStatus_status)
    status: UCH;
  }

  // ==============================================================================
  // 6. WEEKLY TIME SCHEDULE (b5 55: READ r / WRITE w)
  // ==============================================================================
  // Read command structure (a5): a5 00 [circuit] [day 00-06] [slot 00-02]
  // Write command structure (a6): a6 ff [circuit] [day 00-06] [slot 00-02] [total_slots 01-03]
  // 6.1 Heating Zone 1 (Circuit 03)

  /** Timer Zone 1 Monday */
  @inherit(u_t3_0, w_t3_0)
  @ext
  model Z1Timer_Monday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Monday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Heating schedule Monday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Zone 1 Tuesday */
  @inherit(u_t3_1, w_t3_1)
  @ext
  model Z1Timer_Tuesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Tuesday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Heating schedule Tuesday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Zone 1 Wednesday */
  @inherit(u_t3_2, w_t3_2)
  @ext
  model Z1Timer_Wednesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Wednesday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Heating schedule Wednesday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Zone 1 Thursday */
  @inherit(u_t3_3, w_t3_3)
  @ext
  model Z1Timer_Thursday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Thursday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Heating schedule Thursday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Zone 1 Friday */
  @inherit(u_t3_4, w_t3_4)
  @ext
  model Z1Timer_Friday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Friday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Heating schedule Friday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Zone 1 Saturday */
  @inherit(u_t3_5, w_t3_5)
  @ext
  model Z1Timer_Saturday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Saturday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Heating schedule Saturday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Zone 1 Sunday */
  @inherit(u_t3_6, w_t3_6)
  @ext
  model Z1Timer_Sunday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Heating schedule Sunday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Heating schedule Sunday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  // 6.2 Domestic Hot Water - DHW (Circuit 02)

  /** Timer DHW Monday */
  @inherit(u_t2_0, w_t2_0)
  @ext
  model HwcTimer_Monday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Monday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** DHW schedule Monday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer DHW Tuesday */
  @inherit(u_t2_1, w_t2_1)
  @ext
  model HwcTimer_Tuesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Tuesday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** DHW schedule Tuesday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer DHW Wednesday */
  @inherit(u_t2_2, w_t2_2)
  @ext
  model HwcTimer_Wednesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Wednesday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** DHW schedule Wednesday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer DHW Thursday */
  @inherit(u_t2_3, w_t2_3)
  @ext
  model HwcTimer_Thursday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Thursday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** DHW schedule Thursday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer DHW Friday */
  @inherit(u_t2_4, w_t2_4)
  @ext
  model HwcTimer_Friday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Friday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** DHW schedule Friday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer DHW Saturday */
  @inherit(u_t2_5, w_t2_5)
  @ext
  model HwcTimer_Saturday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Saturday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** DHW schedule Saturday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer DHW Sunday */
  @inherit(u_t2_6, w_t2_6)
  @ext
  model HwcTimer_Sunday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** DHW schedule Sunday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** DHW schedule Sunday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  // 6.3 Cooling (Circuit 01)

  /** Timer Cooling Monday */
  @inherit(u_t1_0, w_t1_0)
  @ext
  model CoolingTimer_Monday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Monday (HH;MM;HH;MM) */
    @in(false) @unit("°C") cooling_temp: D1C;

    /** Cooling schedule Monday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Cooling Tuesday */
  @inherit(u_t1_1, w_t1_1)
  @ext
  model CoolingTimer_Tuesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Tuesday (HH;MM;HH;MM) */
    @in(false) @unit("°C") cooling_temp: D1C;

    /** Cooling schedule Tuesday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Cooling Wednesday */
  @inherit(u_t1_2, w_t1_2)
  @ext
  model CoolingTimer_Wednesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Wednesday (HH;MM;HH;MM) */
    @in(false) @unit("°C") cooling_temp: D1C;

    /** Cooling schedule Wednesday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Cooling Thursday */
  @inherit(u_t1_3, w_t1_3)
  @ext
  model CoolingTimer_Thursday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Thursday (HH;MM;HH;MM) */
    @in(false) @unit("°C") cooling_temp: D1C;

    /** Cooling schedule Thursday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Cooling Friday */
  @inherit(u_t1_4, w_t1_4)
  @ext
  model CoolingTimer_Friday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Friday (HH;MM;HH;MM) */
    @in(false) @unit("°C") cooling_temp: D1C;

    /** Cooling schedule Friday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Cooling Saturday */
  @inherit(u_t1_5, w_t1_5)
  @ext
  model CoolingTimer_Saturday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Saturday (HH;MM;HH;MM) */
    @in(false) @unit("°C") cooling_temp: D1C;

    /** Cooling schedule Saturday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Cooling Sunday */
  @inherit(u_t1_6, w_t1_6)
  @ext
  model CoolingTimer_Sunday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Cooling schedule Sunday (HH;MM;HH;MM) */
    @in(false) @unit("°C") cooling_temp: D1C;

    /** Cooling schedule Sunday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  // 6.4 Circulation Pump (Circuit 00)

  /** Timer Circulation Monday */
  @inherit(u_t0_0, w_t0_0)
  @ext
  model CirculationTimer_Monday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Circulation schedule Monday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Circulation schedule Monday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Circulation Tuesday */
  @inherit(u_t0_1, w_t0_1)
  @ext
  model CirculationTimer_Tuesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Circulation schedule Tuesday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Circulation schedule Tuesday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Circulation Wednesday */
  @inherit(u_t0_2, w_t0_2)
  @ext
  model CirculationTimer_Wednesday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Circulation schedule Wednesday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Circulation schedule Wednesday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Circulation Thursday */
  @inherit(u_t0_3, w_t0_3)
  @ext
  model CirculationTimer_Thursday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Circulation schedule Thursday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Circulation schedule Thursday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Circulation Friday */
  @inherit(u_t0_4, w_t0_4)
  @ext
  model CirculationTimer_Friday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Circulation schedule Friday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Circulation schedule Friday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Circulation Saturday */
  @inherit(u_t0_5, w_t0_5)
  @ext
  model CirculationTimer_Saturday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Circulation schedule Saturday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Circulation schedule Saturday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  /** Timer Circulation Sunday */
  @inherit(u_t0_6, w_t0_6)
  @ext
  model CirculationTimer_Sunday {
    from_hour: UCH;
    from_min: UCH;
    to_hour: UCH;
    to_min: UCH;

    /** Circulation schedule Sunday (HH;MM;HH;MM) */
    @in(false) @maxLength(2) ign_2: IGN;

    /** Circulation schedule Sunday (HH;MM;HH;MM) */
    @out(true)
    @constValue("FFFF")
    @maxLength(2)
    ignore: HEX;
  }

  // ==============================================================================
  // 6.5 NUMBER OF ACTIVE TIME SLOTS PER DAY (MONDAY TO SUNDAY)
  // ==============================================================================

  /** Active slots Circulation */
  @inherit(u_tslots)
  @ext(0x00)
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
  @inherit(u_tslots)
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
  @inherit(u_tslots)
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

  /** Active slots Zone 1 */
  @inherit(u_tslots)
  @ext(0x03)
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

  enum Values_Clearerrorhistory_cleared {
    no: 0,
    yes: 1,
  }

  enum Values_AppSessionStatus_status {
    connected: 1,
    disconnected: 0,
  }
}
