import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace Basv3 {
  // ,BASV3,sensoCOMFORT VRC 720/3f via Base Station D (SW=0760;HW=7304)
  // ##### General #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0, 0)
  model r_1 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0, 0)
  model w_1 {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x24, 0x2, 1, 0, 0)
  model wi_1 {}

  /** Hwc bivalence point */
  @inherit(r_1, w_1)
  @ext(0x1, 0)
  model HwcBivalencePoint {
    value: tempv;
  }

  /** continuos heating */
  @inherit(r_1, w_1)
  @ext(0x2, 0)
  model ContinuosHeating {
    /** -26=off, when the outside temperature falls below this threshold temperature the continuous heating function is started (off <=> function is disabled) */
    value: tempv;
  }

  /** frost delay time */
  @inherit(r_1, w_1)
  @ext(0x3, 0)
  model FrostOverRideTime {
    /** Delay before frost protection is activated */
    value: hoursum2;
  }

  /** Global System OFF */
  @inherit(r_1, wi_1)
  @ext(0x7, 0)
  model GlobalSystemOff {
    /** For switching system off */
    value: yesno;
  }

  /** hwc parallel loading */
  @inherit(r_1, w_1)
  @ext(0xa, 0)
  model HwcParallelLoading {
    value: onoff;
  }

  /** max room humidity */
  @inherit(r_1, w_1)
  @ext(0xe, 0)
  model MaxRoomHumidity {
    /** Maximum room humidity */
    value: UIN;
  }

  /** adaptive heat curve */
  @inherit(r_1, w_1)
  @ext(0x14, 0)
  model AdaptHeatCurve {
    /** Automatic correction of configured heat curve */
    value: yesno;
  }

  /** maximum cylinder charging time */
  @inherit(r_1, w_1)
  @ext(0x17, 0)
  model MaxCylinderChargeTime {
    value: minutes2;
  }

  /** hwc lock time */
  @inherit(r_1, w_1)
  @ext(0x18, 0)
  model HwcLockTime {
    value: minutes2;
  }

  /** pump additional time */
  @inherit(r_1, w_1)
  @ext(0x1b, 0)
  model PumpAdditionalTime {
    /** Additional time the pump is running */
    value: minutes2;
  }

  /** hysteresis cylinder charge */
  @inherit(r_1, w_1)
  @ext(0x27, 0)
  model CylinderChargeHyst {
    /** Hysteresis cylinder charge */
    value: calibrationv;
  }

  /** offset cylinder charge */
  @inherit(r_1, w_1)
  @ext(0x29, 0)
  model CylinderChargeOffset {
    value: calibrationv;
  }

  /** next maintenance */
  @inherit(r_1, w_1)
  @ext(0x2c, 0)
  model MaintenanceDate {
    /** Date for next maintenance */
    value: date;
  }

  /** date */
  @inherit(r_1)
  @ext(0x34, 0)
  model Date {
    /** Current date */
    value: date;
  }

  /** time */
  @inherit(r_1)
  @ext(0x35, 0)
  model Time {
    /** Current time */
    value: HTI;
  }

  /** hydraulic scheme */
  @inherit(r_1, w_1)
  @ext(0x36, 0)
  model HydraulicScheme {
    value: UIN;
  }

  /** water pressure */
  @inherit(r_1)
  @ext(0x39, 0)
  model WaterPressure {
    value: pressv;
  }

  /** total solar yield */
  @inherit(r_1)
  @ext(0x3d, 0)
  model SolarYieldTotal {
    value: energy4;
  }

  /** total environmental yield */
  @inherit(r_1)
  @ext(0x3e, 0)
  model EnvYieldTotal {
    value: energy4;
  }

  /** hwc max flow temp desired */
  @inherit(r_1, w_1)
  @ext(0x46, 0)
  model HwcMaxFlowTempDesired {
    /** Maximum flow temperature setpoint of Hwc */
    value: tempv;
  }

  /** system flow temp */
  @inherit(r_1)
  @ext(0x4b, 0)
  model SystemFlowTemp {
    value: tempv;
  }

  /** multifunction relay setting */
  @inherit(r_1, w_1)
  @ext(0x4d, 0)
  model MultiRelaySetting {
    value: mamode;
  }

  /** this month's fuel consumption heating */
  @inherit(r_1)
  @ext(0x4e, 0)
  model PrFuelSumHcThisMonth {
    /** This month's fuel consumption for heating */
    value: energy4;
  }

  /** this month's energy consumption heating */
  @inherit(r_1)
  @ext(0x4f, 0)
  model PrEnergySumHcThisMonth {
    /** This month's energy consumption for heating */
    value: energy4;
  }

  /** this month's energy consumption hot water */
  @inherit(r_1)
  @ext(0x50, 0)
  model PrEnergySumHwcThisMonth {
    /** This month's energy consumption for hot water */
    value: energy4;
  }

  /** this month's fuel consumption hot water */
  @inherit(r_1)
  @ext(0x51, 0)
  model PrFuelSumHwcThisMonth {
    /** This month's fuel consumption for hot water */
    value: energy4;
  }

  /** last month's fuel consumption heating */
  @inherit(r_1)
  @ext(0x52, 0)
  model PrFuelSumHcLastMonth {
    /** Last month's fuel consumption for heating */
    value: energy4;
  }

  /** last month's energy consumption heating */
  @inherit(r_1)
  @ext(0x53, 0)
  model PrEnergySumHcLastMonth {
    /** Last month's energy consumption for heating */
    value: energy4;
  }

  /** last month's energy consumption hot water */
  @inherit(r_1)
  @ext(0x54, 0)
  model PrEnergySumHwcLastMonth {
    /** Last month's energy consumption for hot water */
    value: energy4;
  }

  /** last month's fuel consumption hot water */
  @inherit(r_1)
  @ext(0x55, 0)
  model PrFuelSumHwcLastMonth {
    /** Last month's fuel consumption for hot water */
    value: energy4;
  }

  /** total fuel consumption heating */
  @inherit(r_1)
  @ext(0x56, 0)
  model PrFuelSumHc {
    /** Total fuel consumption for heating */
    value: energy4;
  }

  /** total energy consumption heating */
  @inherit(r_1)
  @ext(0x57, 0)
  model PrEnergySumHc {
    /** Total energy consumption for heating */
    value: energy4;
  }

  /** total energy consumption hot water */
  @inherit(r_1)
  @ext(0x58, 0)
  model PrEnergySumHwc {
    /** Total energy consumption for hot water */
    value: energy4;
  }

  /** total fuel consumption hot water */
  @inherit(r_1)
  @ext(0x59, 0)
  model PrFuelSumHwc {
    /** Total fuel consumption for hot water */
    value: energy4;
  }

  /** total energy consumption */
  // TODO: invalid position
  //@inherit(r_1, w_1)
  //@ext(0x5c, 0)
  //model PrEnergySum {
    /** Total year electricity consumption */
  //  value: energy4;
  //}

  /** total fuel consumption */
  // TODO: invalid position
  //@inherit(r_1, w_1)
  //@ext(0x5d, 0)
  //model PrFuelSum {
    /** Total fuel consumption */
  //  value: energy4;
  //}

  /** installer name 1 */
  @inherit(r_1, w_1)
  @ext(0x6c, 0)
  model Installer1 {
    /** Installer's name */
    value: shortname;
  }

  /** installer name 2 */
  @inherit(r_1, w_1)
  @ext(0x6d, 0)
  model Installer2 {
    /** Installer's name */
    value: shortname;
  }

  /** phone number 1 (first part) */
  @inherit(r_1, w_1)
  @ext(0x6f, 0)
  model PhoneNumber1 {
    /** Installer's telephone number */
    value: shortphone;
  }

  /** phone number 2 (second part) */
  @inherit(r_1, w_1)
  @ext(0x70, 0)
  model PhoneNumber2 {
    /** Installer's telephone number */
    value: shortphone;
  }

  /** outside temperature */
  @inherit(r_1)
  @ext(0x73, 0)
  model DisplayedOutsideTemp {
    value: tempv;
  }

  /** code for installer menu */
  @inherit(r_1, w_1)
  @ext(0x76, 0)
  model KeyCodeforConfigMenu {
    /** 000-999; code for the installer's menues */
    value: UIN;
  }

  /** average outside temperature */
  @inherit(r_1)
  @ext(0x95, 0)
  model OutsideTempAvg {
    /** Average outside temperature (updated every 3h) */
    value: tempv;
  }

  /** maintenance due */
  @inherit(r_1)
  @ext(0x96, 0)
  model MaintenanceDue {
    value: yesno;
  }

  /** hwc storage temperature top */
  @inherit(r_1)
  @ext(0x9d, 0)
  model HwcStorageTempTop {
    value: tempv;
  }

  /** storage temperature bottom */
  @inherit(r_1)
  @ext(0x9e, 0)
  model HwcStorageTempBottom {
    value: tempv;
  }

  /** hc storage temperature top */
  @inherit(r_1)
  @ext(0x9f, 0)
  model HcStorageTempTop {
    value: tempv;
  }

  /** hc storage temperature bottom */
  @inherit(r_1)
  @ext(0xa0, 0)
  model HcStorageTempBottom {
    value: tempv;
  }
  // ##### hot water circuit #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 1, 0)
  model r_2 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 1, 0)
  model w_2 {}

  /** hwc operation mode */
  @inherit(r_2, w_2)
  @ext(0x3, 0)
  model HwcOpMode {
    /** Operation mode of Hwc */
    value: opmode;
  }

  /** hwc temperature desired */
  @inherit(r_2, w_2)
  @ext(0x4, 0)
  model HwcTempDesired {
    /** Setpoint of domestic hot water circuit */
    value: tempv;
  }

  /** hwc storage temperature */
  @inherit(r_2)
  @ext(0x5, 0)
  model HwcStorageTemp {
    /** Hwc storage temperature */
    value: tempv;
  }

  /** hwc flow temperature */
  @inherit(r_2)
  @ext(0x8, 0)
  model HwcFlowTemp {
    /** Desired flow temp for Hwc */
    value: tempv;
  }

  /** hwc holiday start period */
  @inherit(r_2, w_2)
  @ext(0x9, 0)
  model HwcHolidayStartPeriod {
    /** Start date of holidays */
    value: hfrom;
  }

  /** hwc holiday end period */
  @inherit(r_2, w_2)
  @ext(0xa, 0)
  model HwcHolidayEndPeriod {
    /** End date of holidays */
    value: hto;
  }

  /** hwc SF mode */
  @inherit(r_2, w_2)
  @ext(0xd, 0)
  model HwcSFMode {
    value: sfmode;
  }

  // ##### heating circuit 1 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x2, 0)
  model r_3 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x2, 0)
  model w_3 {}

  /** CircuitType heating circuit 1 */
  @inherit(r_3)
  @ext(0x2, 0)
  model Hc1CircuitType {
    mctype: mctype;
    @maxLength(1) ign: IGN;
  }

  /** ActualFlowTempDesired heating circuit 1 */
  @inherit(r_3)
  @ext(0x7, 0)
  model Hc1ActualFlowTempDesired {
    /** Current flow temperature setpoint of Hc1 */
    value: tempv;
  }

  /** FlowTemp heating circuit 1 */
  @inherit(r_3)
  @ext(0x8, 0)
  model Hc1FlowTemp {
    /** Current flow temperature of Hc1 */
    value: tempv;
  }

  /** ExcessTemp heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xb, 0)
  model Hc1ExcessTemp {
    /** Excess temperature of Hc1 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }

  /** AutoOffMode heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xe, 0)
  model Hc1AutoOffMode {
    /** Operation of Hc1 during the lowering time; no influence if room temperature modulation is set to thermostat */
    value: offmode;
  }

  /** HeatCurve heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xf, 0)
  model Hc1HeatCurve {
    value: EXP;
  }

  /** MaxFlowTempDesired heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x10, 0)
  model Hc1MaxFlowTempDesired {
    /** Maximum flow temperature setpoint (end emphasis) of Hc1 */
    value: tempv;
  }

  /** MinFlowTempDesired heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x12, 0)
  model Hc1MinFlowTempDesired {
    /** Minimum flow temperature setpoint (end emphasis) of Hc1 */
    value: tempv;
  }

  /** summer outside switchoff temperature heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x14, 0)
  model Hc1SummerTempLimit {
    /** If outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempSwitchOn heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x15, 0)
  model Hc1RoomTempSwitchOn {
    /** Room temperature modulation of Hc1 */
    value: rcmode;
  }

  /** MixerMovement heating circuit 1 */
  @inherit(r_3)
  @ext(0x1a, 0)
  model Hc1MixerMovement {
    /** Status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** HeatCurveAdaption heating circuit 1 */
  @inherit(r_3)
  @ext(0x1c, 0)
  model Hc1HeatCurveAdaption {
    /** Adaption applied to heating curve of Hc1 */
    value: EXP;
  }

  /** Status heating circuit 1 */
  @inherit(r_3)
  @ext(0x1b, 0)
  model Hc1Status {
    value: onoff;
  }

  /** PumpStatus heating circuit 1 */
  @inherit(r_3)
  @ext(0x1e, 0)
  model Hc1PumpStatus {
    value: onoff;
  }
  // ##### heating circuit 2 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x2, 1)
  model r_4 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x2, 1)
  model w_4 {}

  /** CircuitType heating circuit 2 */
  @inherit(r_4)
  @ext(0x2, 0)
  model Hc2CircuitType {
    mctype: mctype;
    @maxLength(1) ign: IGN;
  }

  /** ActualFlowTempDesired heating circuit 2 */
  @inherit(r_4)
  @ext(0x7, 0)
  model Hc2ActualFlowTempDesired {
    /** Current flow temperature setpoint of Hc2 */
    value: tempv;
  }

  /** FlowTemp heating circuit 2 */
  @inherit(r_4)
  @ext(0x8, 0)
  model Hc2FlowTemp {
    /** Current flow temperature of Hc2 */
    value: tempv;
  }

  /** ExcessTemp heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xb, 0)
  model Hc2ExcessTemp {
    /** Excess temperature of Hc2 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }

  /** AutoOffMode heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xe, 0)
  model Hc2AutoOffMode {
    /** Operation of Hc2 during the lowering time; no influence if room temperature modulation is set to thermostat */
    value: offmode;
  }

  /** HeatCurve heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xf, 0)
  model Hc2HeatCurve {
    value: EXP;
  }

  /** MaxFlowTempDesired heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x10, 0)
  model Hc2MaxFlowTempDesired {
    /** Maximum flow temperature setpoint (end emphasis) of Hc2 */
    value: tempv;
  }

  /** MinFlowTempDesired heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x12, 0)
  model Hc2MinFlowTempDesired {
    /** Minimum flow temperature setpoint (end emphasis) of Hc2 */
    value: tempv;
  }

  /** summer outside switchoff temperature heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x14, 0)
  model Hc2SummerTempLimit {
    /** If outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempSwitchOn heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x15, 0)
  model Hc2RoomTempSwitchOn {
    /** Room temperature modulation of Hc2 */
    value: rcmode;
  }

  /** MixerMovement heating circuit 2 */
  @inherit(r_4)
  @ext(0x1a, 0)
  model Hc2MixerMovement {
    /** Status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** HeatCurveAdaption heating circuit 2 */
  @inherit(r_4)
  @ext(0x1c, 0)
  model Hc2HeatCurveAdaption {
    /** Adaption applied to heating curve of Hc2 */
    value: EXP;
  }

  /** Status heating circuit 2 */
  @inherit(r_4)
  @ext(0x1b, 0)
  model Hc2Status {
    value: onoff;
  }

  /** PumpStatus heating circuit 2 */
  @inherit(r_4)
  @ext(0x1e, 0)
  model Hc2PumpStatus {
    value: onoff;
  }
  // ##### heating circuit 3 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x2, 0x2)
  model r_5 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x2, 0x2)
  model w_5 {}

  /** CircuitType heating circuit 3 */
  @inherit(r_5)
  @ext(0x2, 0)
  model Hc3CircuitType {
    mctype: mctype;
    @maxLength(1) ign: IGN;
  }

  /** ActualFlowTempDesired heating circuit 3 */
  @inherit(r_5)
  @ext(0x7, 0)
  model Hc3ActualFlowTempDesired {
    /** Current flow temperature setpoint of Hc3 */
    value: tempv;
  }

  /** FlowTemp heating circuit 3 */
  @inherit(r_5)
  @ext(0x8, 0)
  model Hc3FlowTemp {
    /** Current flow temperature of Hc3 */
    value: tempv;
  }

  /** ExcessTemp heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xb, 0)
  model Hc3ExcessTemp {
    /** Excess temperature of Hc3 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }

  /** AutoOffMode heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xe, 0)
  model Hc3AutoOffMode {
    /** Operation of Hc3 during the lowering time; no influence if room temperature modulation is set to thermostat */
    value: offmode;
  }

  /** HeatCurve heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xf, 0)
  model Hc3HeatCurve {
    value: EXP;
  }

  /** MaxFlowTempDesired heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x10, 0)
  model Hc3MaxFlowTempDesired {
    /** Maximum flow temperature setpoint (end emphasis) of Hc3 */
    value: tempv;
  }

  /** MinFlowTempDesired heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x12, 0)
  model Hc3MinFlowTempDesired {
    /** Minimum flow temperature setpoint (end emphasis) of Hc3 */
    value: tempv;
  }

  /** summer outside switchoff temperature heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x14, 0)
  model Hc3SummerTempLimit {
    /** If outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempSwitchOn heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x15, 0)
  model Hc3RoomTempSwitchOn {
    /** Room temperature modulation of Hc3 */
    value: rcmode;
  }

  /** MixerMovement heating circuit 3 */
  @inherit(r_5)
  @ext(0x1a, 0)
  model Hc3MixerMovement {
    /** Status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** HeatCurveAdaption heating circuit 3 */
  @inherit(r_5)
  @ext(0x1c, 0)
  model Hc3HeatCurveAdaption {
    /** Adaption applied to heating curve of Hc3 */
    value: EXP;
  }

  /** Status heating circuit 3 */
  @inherit(r_5)
  @ext(0x1b, 0)
  model Hc3Status {
    value: onoff;
  }

  /** PumpStatus heating circuit 3 */
  @inherit(r_5)
  @ext(0x1e, 0)
  model Hc3PumpStatus {
    value: onoff;
  }

  // ##### zone 1 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x3, 0)
  model r_6 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x3, 0)
  model w_6 {}

  /** cooling operation mode zone 1 */
  @inherit(r_6, w_6)
  @ext(1, 0)
  model Z1OpModeCooling {
    /** Operation mode for cooling of zone 1 */
    value: opmode;
  }

  /** cooling setpoint zone 1 */
  @inherit(r_6, w_6)
  @ext(0x2, 0)
  model Z1CoolingTemp {
    /** Desired cooling setpoint for zone 1 */
    value: tempv;
  }

  /** holiday period start zone 1 */
  @inherit(r_6, w_6)
  @ext(0x3, 0)
  model Z1HolidayStartPeriod {
    /** Start date of holidays for zone 1 */
    value: hfrom;
  }

  /** holiday period end zone 1 */
  @inherit(r_6, w_6)
  @ext(0x4, 0)
  model Z1HolidayEndPeriod {
    /** End date of holidays for zone 1 */
    value: hto;
  }

  /** room setpoint holiday period zone 1 */
  @inherit(r_6, w_6)
  @ext(0x5, 0)
  model Z1HolidayTemp {
    /** Holiday setpoint for zone 1 */
    value: tempv;
  }

  /** operation mode zone 1 */
  @inherit(r_6, w_6)
  @ext(0x6, 0)
  model Z1OpMode {
    /** Operation mode of zone 1 */
    value: opmode;
  }

  /** desired temperature zone 1 */
  // TODO: verify
  //@inherit(r_6, w_6)
  //@ext(0x22, 0)
  //model Z1DayTemp {
    /** Day setpoint for zone 1 */
  //  value: tempv;
  //}

  /** quick veto temperature zone 1 */
  @inherit(r_6, w_6)
  @ext(0x8, 0)
  model Z1QuickVetoTemp {
    /** Manual override setpoint for zone 1 */
    value: tempv;
  }

  /** night temperature zone 1 */
  @inherit(r_6, w_6)
  @ext(0x9, 0)
  model Z1NightTemp {
    /** Night setpoint for zone 1 */
    value: tempv;
  }

  /** SF mode zone 1 */
  @inherit(r_6, w_6)
  @ext(0xe, 0)
  model Z1SFMode {
    value: sfmode;
  }

  /** room temperature zone 1 */
  @inherit(r_6)
  @ext(0xf, 0)
  model Z1RoomTemp {
    /** Current room temperature in zone 1 */
    value: tempv;
  }

  /** valve status zone 1 */
  @inherit(r_6)
  @ext(0x12, 0)
  model Z1ValveStatus {
    value: zonevalve;
  }

  /** room zone mapping zone 1 */
  @inherit(r_6, w_6)
  @ext(0x13, 0)
  model Z1RoomZoneMapping {
    /** Configures which room temperature is assigned to zone 1 */
    value: zmapping;
  }

  /** room temperature desired zone 1 */
  @inherit(r_6, w_6)
  @ext(0x14, 0)
  model Z1ActualRoomTempDesired {
    /** Current room setpoint considering all basic conditions passed to the control algorithms */
    value: tempv;
  }

  /** short name of zone 1 */
  @inherit(r_6, w_6)
  @ext(0x16, 0)
  model Z1Shortname {
    value: shortname;
  }

  /** zone 1 label (first part) */
  @inherit(r_6, w_6)
  @ext(0x17, 0)
  model Z1Name1 {
    value: zname;
  }

  /** zone 1 label (second part) */
  @inherit(r_6, w_6)
  @ext(0x18, 0)
  model Z1Name2 {
    value: zname;
  }

  /** manual heating setpoint zone 1 */
  @inherit(r_6, w_6)
  @ext(0x22, 0)
  model Z1HeatingTempManual {
    /** Desired heating setpoint in manual mode for zone 1 */
    value: tempv;
  }

  /** manual cooling setpoint zone 1 */
  @inherit(r_6, w_6)
  @ext(0x23, 0)
  model Z1CoolingTempManual {
    /** Desired cooling setpoint in manual mode for zone 1 */
    value: tempv;
  }

  // ##### zone 2 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x3, 1)
  model r_7 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x3, 1)
  model w_7 {}

  /** cooling operation mode zone 2 */
  @inherit(r_7, w_7)
  @ext(1, 0)
  model Z2OpModeCooling {
    /** Operation mode for cooling of zone 2 */
    value: opmode;
  }

  /** cooling setpoint zone 2 */
  @inherit(r_7, w_7)
  @ext(0x2, 0)
  model Z2CoolingTemp {
    /** Desired cooling setpoint for zone 2 */
    value: tempv;
  }

  /** holiday period start zone 2 */
  @inherit(r_7, w_7)
  @ext(0x3, 0)
  model Z2HolidayStartPeriod {
    /** Start date of holidays for zone 2 */
    value: hfrom;
  }

  /** holiday period end zone 2 */
  @inherit(r_7, w_7)
  @ext(0x4, 0)
  model Z2HolidayEndPeriod {
    /** End date of holidays for zone 2 */
    value: hto;
  }

  /** room setpoint holiday period zone 2 */
  @inherit(r_7, w_7)
  @ext(0x5, 0)
  model Z2HolidayTemp {
    /** Holiday setpoint for zone 2 */
    value: tempv;
  }

  /** operation mode zone 2 */
  @inherit(r_7, w_7)
  @ext(0x6, 0)
  model Z2OpMode {
    /** Operation mode of zone 2 */
    value: opmode;
  }

  /** desired temperature zone 2 */
  // TODO: verify
  //@inherit(r_7, w_7)
  //@ext(0x22, 0)
  //model Z2DayTemp {
    /** Day setpoint for zone 2 */
  //  value: tempv;
  //}

  /** quick veto temperature zone 2 */
  @inherit(r_7, w_7)
  @ext(0x8, 0)
  model Z2QuickVetoTemp {
    /** Manual override setpoint for zone 2 */
    value: tempv;
  }

  /** night temperature zone 2 */
  @inherit(r_7, w_7)
  @ext(0x9, 0)
  model Z2NightTemp {
    /** Night setpoint for zone 2 */
    value: tempv;
  }

  /** SF mode zone 2 */
  @inherit(r_7, w_7)
  @ext(0xe, 0)
  model Z2SFMode {
    value: sfmode;
  }

  /** room temperature zone 2 */
  @inherit(r_7)
  @ext(0xf, 0)
  model Z2RoomTemp {
    /** Current room temperature in zone 2 */
    value: tempv;
  }

  /** valve status zone 2 */
  @inherit(r_7)
  @ext(0x12, 0)
  model Z2ValveStatus {
    value: zonevalve;
  }

  /** room zone mapping zone 2 */
  @inherit(r_7, w_7)
  @ext(0x13, 0)
  model Z2RoomZoneMapping {
    /** Configures which room temperature is assigned to zone 2 */
    value: zmapping;
  }

  /** room temperature desired zone 2 */
  @inherit(r_7, w_7)
  @ext(0x14, 0)
  model Z2ActualRoomTempDesired {
    /** Current room setpoint considering all basic conditions passed to the control algorithms */
    value: tempv;
  }

  /** short name of zone 2 */
  @inherit(r_7, w_7)
  @ext(0x16, 0)
  model Z2Shortname {
    value: shortname;
  }

  /** zone 2 label (first part) */
  @inherit(r_7, w_7)
  @ext(0x17, 0)
  model Z2Name1 {
    value: zname;
  }

  /** zone 2 label (second part) */
  @inherit(r_7, w_7)
  @ext(0x18, 0)
  model Z2Name2 {
    value: zname;
  }

  /** manual heating setpoint zone 2 */
  @inherit(r_7, w_7)
  @ext(0x22, 0)
  model Z2HeatingTempManual {
    /** Desired heating setpoint in manual mode for zone 2 */
    value: tempv;
  }

  /** manual cooling setpoint zone 2 */
  @inherit(r_7, w_7)
  @ext(0x23, 0)
  model Z2CoolingTempManual {
    /** Desired cooling setpoint in manual mode for zone 2 */
    value: tempv;
  }

  // ##### zone 3 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x3, 0x2)
  model r_8 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x3, 0x2)
  model w_8 {}

  /** cooling operation mode zone 3 */
  @inherit(r_8, w_8)
  @ext(1, 0)
  model Z3OpModeCooling {
    /** Operation mode for cooling of zone 3 */
    value: opmode;
  }

  /** cooling setpoint zone 3 */
  @inherit(r_8, w_8)
  @ext(0x2, 0)
  model Z3CoolingTemp {
    /** Desired cooling setpoint for zone 3 */
    value: tempv;
  }

  /** holiday period start zone 3 */
  @inherit(r_8, w_8)
  @ext(0x3, 0)
  model Z3HolidayStartPeriod {
    /** Start date of holidays for zone 3 */
    value: hfrom;
  }

  /** holiday period end zone 3 */
  @inherit(r_8, w_8)
  @ext(0x4, 0)
  model Z3HolidayEndPeriod {
    /** End date of holidays for zone 3 */
    value: hto;
  }

  /** room setpoint holiday period zone 3 */
  @inherit(r_8, w_8)
  @ext(0x5, 0)
  model Z3HolidayTemp {
    /** Holiday setpoint for zone 3 */
    value: tempv;
  }

  /** operation mode zone 3 */
  @inherit(r_8, w_8)
  @ext(0x6, 0)
  model Z3OpMode {
    /** Operation mode of zone 3 */
    value: opmode;
  }

  /** desired temperature zone 3 */
  // TODO: verify
  //@inherit(r_8, w_8)
  //@ext(0x22, 0)
  //model Z3DayTemp {
    /** Day setpoint for zone 3 */
  //  value: tempv;
  //}

  /** quick veto temperature zone 3 */
  @inherit(r_8, w_8)
  @ext(0x8, 0)
  model Z3QuickVetoTemp {
    /** Manual override setpoint for zone 3 */
    value: tempv;
  }

  /** night temperature zone 3 */
  @inherit(r_8, w_8)
  @ext(0x9, 0)
  model Z3NightTemp {
    /** Night setpoint for zone 3 */
    value: tempv;
  }

  /** SF mode zone 3 */
  @inherit(r_8, w_8)
  @ext(0xe, 0)
  model Z3SFMode {
    value: sfmode;
  }

  /** room temperature zone 3 */
  @inherit(r_8)
  @ext(0xf, 0)
  model Z3RoomTemp {
    /** Current room temperature in zone 3 */
    value: tempv;
  }

  /** valve status zone 3 */
  @inherit(r_8)
  @ext(0x12, 0)
  model Z3ValveStatus {
    value: zonevalve;
  }

  /** room zone mapping zone 3 */
  @inherit(r_8, w_8)
  @ext(0x13, 0)
  model Z3RoomZoneMapping {
    /** Configures which room temperature is assigned to zone 3 */
    value: zmapping;
  }

  /** room temperature desired zone 3 */
  @inherit(r_8, w_8)
  @ext(0x14, 0)
  model Z3ActualRoomTempDesired {
    /** Current room setpoint considering all basic conditions passed to the control algorithms */
    value: tempv;
  }

  /** short name of zone 3 */
  @inherit(r_8, w_8)
  @ext(0x16, 0)
  model Z3Shortname {
    value: shortname;
  }

  /** zone 3 label (first part) */
  @inherit(r_8, w_8)
  @ext(0x17, 0)
  model Z3Name1 {
    value: zname;
  }

  /** zone 3 label (second part) */
  @inherit(r_8, w_8)
  @ext(0x18, 0)
  model Z3Name2 {
    value: zname;
  }

  /** manual heating setpoint zone 3 */
  @inherit(r_8, w_8)
  @ext(0x22, 0)
  model Z3HeatingTempManual {
    /** Desired heating setpoint in manual mode for zone 3 */
    value: tempv;
  }

  /** manual cooling setpoint zone 3 */
  @inherit(r_8, w_8)
  @ext(0x23, 0)
  model Z3CoolingTempManual {
    /** Desired cooling setpoint in manual mode for zone 3 */
    value: tempv;
  }

  // includes

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
