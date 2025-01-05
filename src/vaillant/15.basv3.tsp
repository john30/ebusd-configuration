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

  /** hybrid manager */
  @inherit(r_1)
  @ext(0xf, 0)
  model HybridManager {
    /** 0=Trivalence (tariff based); 1=Bivalence (Outside temperature based) */
    value: hmmode;
  }

  /** tariff aux heater */
  @inherit(r_1)
  @ext(0x10, 0)
  model TariffAuxHeater {
    /** Secondary heater tariff value */
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

  /** hc alternative point */
  @inherit(r_1, w_1)
  @ext(0x22, 0)
  model HcAlternativePoint {
    /** exclusively alternate heating below alternative point (-21=off) */
    value: tempv;
  }

  /** hc bivalence point */
  @inherit(r_1, w_1)
  @ext(0x23, 0)
  model HcBivalencePoint {
    /** Bivalence point heating */
    value: tempv;
  }

  /** backup boiler */
  @inherit(r_1, w_1)
  @ext(0x24, 0)
  model BackupBoiler {
    /** Function of back-up boiler (Off/Hc/Hwc/Hc+Hwc) */
    value: backmode2;
  }

  /** hc emergency temperature */
  @inherit(r_1, w_1)
  @ext(0x26, 0)
  model HcEmergencyTemperature {
    /** Emergency operation temperature */
    value: tempv;
  }

  /** hysteresis cylinder charge */
  @inherit(r_1, w_1)
  @ext(0x27, 0)
  model HwcCylinderChargeHyst {
    /** Hysteresis cylinder charge */
    value: calibrationv;
  }

  /** offset cylinder charge */
  @inherit(r_1, w_1)
  @ext(0x29, 0)
  model HwcCylinderChargeOffset {
    value: calibrationv;
  }

  /** offset outside temperature */
  @inherit(r_1, w_1)
  @ext(0x2d, 0)
  model OffsetOutsideTemp {
    /* Offset outside temperature (used to determined DisplayedOutsideTemp) */
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

  /** cooling outside temperature threshold */
  @inherit(r_1, w_1)
  @ext(0x38, 0)
  model CoolingOutsideTempThreshold {
    /** Activate Cooling when average outside temperature exceeds threshold */
    value: tempv;
  }

  /** water pressure */
  @inherit(r_1)
  @ext(0x39, 0)
  model WaterPressure {
    value: pressv;
  }

  /** dew point offset */
  @inherit(r_1, w_1)
  @ext(0x3A, 0)
  model DewPointOffset {
    /** Subtract from Z*RoomTemp to calculate dew point */
    value: tempv;
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
  @inherit(r_1, w_1)
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

  /** hwc storage temperature bottom */
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

  /** offset hwc cylinder charge */
  @inherit(r_1, w_1)
  @ext(0xa2, 0)
  model HwcCylinderOffset {
    value: calibrationv;
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

  /** hwc enabled */
  @inherit(r_2, w_2)
  @ext(0x1, 0)
  model HwcEnabled {
    value: yesno;
  }

  /** hwc circulation pump status */
  @inherit(r_2)
  @ext(0x2, 0)
  model HwcCircPumpStatus {
    /* Hwc circulation pump status (also turns on during a legionella run) */
    value: onoff;
  }

  /** hwc operation mode */
  @inherit(r_2, w_2)
  @ext(0x3, 0)
  model HwcOpMode {
    /** Operation mode of Hwc */
    value: opmode2;
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

  /** hwc reheating active */
  @inherit(r_2)
  @ext(0x6, 0)
  model HwcReheatingActive {
    /* Indicates ongoing hot/legionella water run */
    value: yesno;
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

  /** hwc Special Function (SF) mode */
  @inherit(r_2, w_2)
  @ext(0xd, 0)
  model HwcSFMode {
    /** Only auto=0; load=6 supported */
    value: sfmode3;
  }

  /** hwc status */
  @inherit(r_2)
  @ext(0xf, 0)
  model HwcStatus {
    /** Only auto=0; holidayaway=7; load=9; off=10 supported */
    value: zonestatus;
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

  /** DesiredReturnTemp heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x4, 0)
  model Hc1DesiredReturnTemp {
    /** Temperature for the increase in return circuit (default 30) */
    value: tempv;
  }

  /** DewPointMonitoring heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x5, 0)
  model Hc1DewPointMonitoring {
    value: onoff;
  }

  /** CoolingEnabled heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x6, 0)
  model Hc1CoolingEnabled {
    value: onoff;
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

  /** ExtHwcTempDesired heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x9, 0)
  model Hc1ExtHwcTempDesired {
    /** Desired external Hwc temperature */
    value: tempv;
  }

  /** DewPointOffset heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xa, 0)
  model Hc1DewPointOffset {
    value: calibrationv;
  }

  /** ExcessTemp heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xb, 0)
  model Hc1ExcessTemp {
    /** Excess temperature of Hc1 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }

  /** DesiredTemp heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xc, 0)
  model Hc1DesiredTemp {
    value: tempv;
  }

  /** DesiredSetbackTemp heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xd, 0)
  model Hc1DesiredSetbackTemp {
    /* Target setback temperatur Hc1 (fixed circuit type) */
    value: tempv;
  }

  /** SetbackMode heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xe, 0)
  model Hc1SetbackMode {
    /** Operation of Hc1 during the lowering time; no influence if room temperature modulation is set to expanded */
    value: offmode2;
  }

  /** HeatCurve heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xf, 0)
  model Hc1HeatCurve {
    value: EXP;
  }

  /** HeatingMaxFlowTempDesired heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x10, 0)
  model Hc1HeatingMaxFlowTempDesired {
    /** Maximum flow temperature setpoint (end emphasis) of Hc1 */
    value: tempv;
  }

  /** CoolingMaxFlowTempDesired heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x11, 0)
  model Hc1CoolingMaxFlowTempDesired {
    value: tempv;
  }

  /** HeatingMinFlowTempDesired heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x12, 0)
  model Hc1HeatingMinFlowTempDesired {
    /** Minimum flow temperature setpoint (end emphasis) of Hc1 */
    value: tempv;
  }

  /** ExtHwcOpMode heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x13, 0)
  model Hc1ExtHwcOpMode {
    value: opmode2;
  }

  /** summer outside switchoff temperature heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x14, 0)
  model Hc1SummerTempLimit {
    /** If outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempMod heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x15, 0)
  model Hc1RoomTempMod {
    /** Room temperature modulation of Hc1 */
    value: rcmode2;
  }

  /** ExtHwcActive heating circuit 1 */
  @inherit(r_3)
  @ext(0x18, 0)
  model Hc1ExtHwcActive {
    value: onoff;
  }

  /** ExtHeatDemand heating circuit 1 */
  @inherit(r_3)
  @ext(0x19, 0)
  model Hc1ExtHeatDemand {
    value: onoff;
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
  @inherit(r_3, w_3)
  @ext(0x1b, 0)
  model Hc1Status {
    value: onoff;
  }

  /** PumpStatus heating circuit 1 */
  @inherit(r_3)
  @ext(0x1e, 0)
  model Hc1PumpStatus {
    value: hcpumpmode;
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

  /** DesiredReturnTemp heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x4, 0)
  model Hc2DesiredReturnTemp {
    /** Temperature for the increase in return circuit (default 30) */
    value: tempv;
  }

  /** DewPointMonitoring heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x5, 0)
  model Hc2DewPointMonitoring {
    value: onoff;
  }

  /** CoolingEnabled heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x6, 0)
  model Hc2CoolingEnabled {
    value: onoff;
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

  /** ExtHwcTempDesired heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x9, 0)
  model Hc2ExtHwcTempDesired {
    /** Desired external Hwc temperature */
    value: tempv;
  }

  /** DewPointOffset heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xa, 0)
  model Hc2DewPointOffset {
    value: calibrationv;
  }

  /** ExcessTemp heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xb, 0)
  model Hc2ExcessTemp {
    /** Excess temperature of Hc2 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }

  /** SetbackMode heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xe, 0)
  model Hc2SetbackMode {
    /** Operation of Hc2 during the lowering time; no influence if room temperature modulation is set to expanded */
    value: offmode2;
  }

  /** HeatCurve heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xf, 0)
  model Hc2HeatCurve {
    value: EXP;
  }

  /** HeatingMaxFlowTempDesired heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x10, 0)
  model Hc2HeatingMaxFlowTempDesired {
    /** Maximum flow temperature setpoint (end emphasis) of Hc2 */
    value: tempv;
  }

  /** CoolingMaxFlowTempDesired heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x11, 0)
  model Hc2CoolingMaxFlowTempDesired {
    value: tempv;
  }

  /** HeatingMinFlowTempDesired heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x12, 0)
  model Hc2HeatingMinFlowTempDesired {
    /** Minimum flow temperature setpoint (end emphasis) of Hc2 */
    value: tempv;
  }

  /** ExtHwcOpMode heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x13, 0)
  model Hc2ExtHwcOpMode {
    value: opmode2;
  }

  /** summer outside switchoff temperature heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x14, 0)
  model Hc2SummerTempLimit {
    /** If outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempMod heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x15, 0)
  model Hc2RoomTempMod {
    /** Room temperature modulation of Hc2 */
    value: rcmode2;
  }

  /** ExtHwcActive heating circuit 2 */
  @inherit(r_4)
  @ext(0x18, 0)
  model Hc2ExtHwcActive {
    value: onoff;
  }

  /** ExtHeatDemand heating circuit 2 */
    @inherit(r_4)
    @ext(0x19, 0)
    model Hc2ExtHeatDemand {
      value: onoff;
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
  @inherit(r_4, w_4)
  @ext(0x1b, 0)
  model Hc2Status {
    value: onoff;
  }

  /** PumpStatus heating circuit 2 */
  @inherit(r_4)
  @ext(0x1e, 0)
  model Hc2PumpStatus {
    value: hcpumpmode;
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

  /** DesiredReturnTemp heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x4, 0)
  model Hc3DesiredReturnTemp {
    /** Temperature for the increase in return circuit (default 30) */
    value: tempv;
  }

  /** DewPointMonitoring heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x5, 0)
  model Hc3DewPointMonitoring {
    value: onoff;
  }

  /** CoolingEnabled heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x6, 0)
  model Hc3CoolingEnabled {
    value: onoff;
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

  /** ExtHwcTempDesired heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x9, 0)
  model Hc3ExtHwcTempDesired {
    /** Desired external Hwc temperature */
    value: tempv;
  }

  /** DewPointOffset heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xa, 0)
  model Hc3DewPointOffset {
    value: calibrationv;
  }

  /** ExcessTemp heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xb, 0)
  model Hc3ExcessTemp {
    /** Excess temperature of Hc3 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }

  /** SetbackMode heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xe, 0)
  model Hc3SetbackMode {
    /** Operation of Hc3 during the lowering time; no influence if room temperature modulation is set to expanded */
    value: offmode2;
  }

  /** HeatCurve heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xf, 0)
  model Hc3HeatCurve {
    value: EXP;
  }

  /** HeatingMaxFlowTempDesired heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x10, 0)
  model Hc3HeatingMaxFlowTempDesired {
    /** Maximum flow temperature setpoint (end emphasis) of Hc3 */
    value: tempv;
  }

  /** CoolingMaxFlowTempDesired heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x11, 0)
  model Hc3CoolingMaxFlowTempDesired {
    value: tempv;
  }

  /** HeatingMinFlowTempDesired heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x12, 0)
  model Hc3HeatingMinFlowTempDesired {
    /** Minimum flow temperature setpoint (end emphasis) of Hc3 */
    value: tempv;
  }

  /** ExtHwcOpMode heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x13, 0)
  model Hc3ExtHwcOpMode {
    value: opmode2;
  }

  /** summer outside switchoff temperature heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x14, 0)
  model Hc3SummerTempLimit {
    /** If outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempMod heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x15, 0)
  model Hc3RoomTempMod {
    /** Room temperature modulation of Hc3 */
    value: rcmode2;
  }

  /** ExtHwcActive heating circuit 3 */
  @inherit(r_5)
  @ext(0x18, 0)
  model Hc3ExtHwcActive {
    value: onoff;
  }

  /** ExtHeatDemand heating circuit 3 */
  @inherit(r_5)
  @ext(0x19, 0)
  model Hc3ExtHeatDemand {
    value: onoff;
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
  @inherit(r_5, w_5)
  @ext(0x1b, 0)
  model Hc3Status {
    value: onoff;
  }

  /** PumpStatus heating circuit 3 */
  @inherit(r_5)
  @ext(0x1e, 0)
  model Hc3PumpStatus {
    value: hcpumpmode;
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
  @ext(0x1, 0)
  model Z1CoolingOpMode {
    /** Operation mode for cooling of zone 1 */
    value: opmode2;
  }

  /** cooling setpoint zone 1 */
  @inherit(r_6, w_6)
  @ext(0x2, 0)
  model Z1CoolingTempDesiredTimeControlled {
    /** Time controlled desired cooling room temperature for zone 1 */
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

  /** heating operation mode zone 1 */
  @inherit(r_6, w_6)
  @ext(0x6, 0)
  model Z1HeatingOpMode {
    /** Operation mode of zone 1 */
    value: opmode2;
  }

  /** quick veto temperature zone 1 */
  @inherit(r_6, w_6)
  @ext(0x8, 0)
  model Z1QuickVetoTemp {
    /** Manual override setpoint for zone 1 */
    value: tempv;
  }

  /** set back temperature zone 1 */
  @inherit(r_6, w_6)
  @ext(0x9, 0)
  model Z1SetBackTemp {
    /** Set back temperature zone 1 (time controlled heating) */
    value: tempv;
  }

  /** Special Function (SF) mode zone 1 */
  @inherit(r_6, w_6)
  @ext(0xe, 0)
  model Z1SFMode {
    /* Only auto=0; ventilation=1; veto=3 supported */
    value: sfmode2;
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
    value: closeopen;
  }

  /** room zone mapping zone 1 */
  @inherit(r_6, w_6)
  @ext(0x13, 0)
  model Z1RoomZoneMapping {
    /** Configures which room temperature is assigned to zone 1 */
    value: zmapping;
  }

  /** heating room temperature desired zone 1 */
  @inherit(r_6)
  @ext(0x14, 0)
  model Z1HeatingActualRoomTempDesired {
    /** Current room setpoint considering all basic conditions passed to the control algorithms (0 = heating inactive) */
    value: tempv;
  }

  /** cooling room temperature desired zone 1 */
  @inherit(r_6)
  @ext(0x15, 0)
  model Z1CoolingActualRoomTempDesired {
    /** Current room setpoint considering all basic conditions passed to the control algorithms (99 = cooling inactive) */
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

  /** zone 1 status */
  @inherit(r_6)
  @ext(0x1b, 0)
  model Z1Status {
    /** Only auto=0; ventilation=1; veto=4; holidayaway=7; load=9; off=10 supported */
    value: zonestatus;
  }

  /** manual heating setpoint zone 1 */
  @inherit(r_6, w_6)
  @ext(0x22, 0)
  model Z1HeatingTempDesiredManual {
    /** Desired heating setpoint in manual mode for zone 1 */
    value: tempv;
  }

  /** manual cooling setpoint zone 1 */
  @inherit(r_6, w_6)
  @ext(0x23, 0)
  model Z1CoolingTempDesiredManual {
    /** Desired cooling setpoint in manual mode for zone 1 */
    value: tempv;
  }

  /** room humidity zone 1 */
  @inherit(r_6)
  @ext(0x28, 0)
  model Z1RoomHumidity {
    value: percentv;
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
  @ext(0x1, 0)
  model Z2CoolingOpMode {
    /** Operation mode for cooling of zone 2 */
    value: opmode2;
  }

  /** cooling setpoint zone 2 */
  @inherit(r_7, w_7)
  @ext(0x2, 0)
  model Z2CoolingTempDesiredTimeControlled {
    /** Time controlled desired cooling room temperature for zone 2 */
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
  model Z2HeatingOpMode {
    /** Operation mode of zone 2 */
    value: opmode2;
  }

  /** quick veto temperature zone 2 */
  @inherit(r_7, w_7)
  @ext(0x8, 0)
  model Z2QuickVetoTemp {
    /** Manual override setpoint for zone 2 */
    value: tempv;
  }

  /** set back temperature zone 2 */
  @inherit(r_7, w_7)
  @ext(0x9, 0)
  model Z2SetBackTemp {
    /** Set back temperature zone 2 (time controlled heating) */
    value: tempv;
  }

  /** Special Function (SF) mode zone 2 */
  @inherit(r_7, w_7)
  @ext(0xe, 0)
  model Z2SFMode {
    /* Only auto=0; ventilation=1; veto=3 supported */
    value: sfmode2;
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
    value: closeopen;
  }

  /** room zone mapping zone 2 */
  @inherit(r_7, w_7)
  @ext(0x13, 0)
  model Z2RoomZoneMapping {
    /** Configures which room temperature is assigned to zone 2 */
    value: zmapping;
  }

  /** heating room temperature desired zone 2 */
  @inherit(r_7)
  @ext(0x14, 0)
  model Z2HeatingActualRoomTempDesired {
    /** Current room setpoint considering all basic conditions passed to the control algorithms (0 = heating inactive) */
    value: tempv;
  }

  /** cooling room temperature desired zone 2 */
  @inherit(r_7)
  @ext(0x15, 0)
  model Z2CoolingActualRoomTempDesired {
    /** Current room setpoint considering all basic conditions passed to the control algorithms (99 = cooling inactive) */
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

  /** zone 2 status */
  @inherit(r_7)
  @ext(0x1b, 0)
  model Z2Status {
    /** Only auto=0; ventilation=1; veto=4; holidayaway=7; load=9; off=10 supported */
    value: zonestatus;
  }

  /** manual heating setpoint zone 2 */
  @inherit(r_7, w_7)
  @ext(0x22, 0)
  model Z2HeatingTempDesiredManual {
    /** Desired heating setpoint in manual mode for zone 2 */
    value: tempv;
  }

  /** manual cooling setpoint zone 2 */
  @inherit(r_7, w_7)
  @ext(0x23, 0)
  model Z2CoolingTempDesiredManual {
    /** Desired cooling setpoint in manual mode for zone 2 */
    value: tempv;
  }

  /** room humidity zone 2 */
  @inherit(r_7)
  @ext(0x28, 0)
  model Z2RoomHumidity {
    value: percentv;
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
  @ext(0x1, 0)
  model Z3CoolingOpMode {
    /** Operation mode for cooling of zone 3 */
    value: opmode2;
  }

  /** cooling setpoint zone 3 */
  @inherit(r_8, w_8)
  @ext(0x2, 0)
  model Z3CoolingTempDesiredTimeControlled {
    /** Time controlled desired cooling room temperature for zone 3 */
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
  model Z3HeatingOpMode {
    /** Operation mode of zone 3 */
    value: opmode2;
  }

  /** quick veto temperature zone 3 */
  @inherit(r_8, w_8)
  @ext(0x8, 0)
  model Z3QuickVetoTemp {
    /** Manual override setpoint for zone 3 */
    value: tempv;
  }

  /** set back temperature zone 3 */
  @inherit(r_8, w_8)
  @ext(0x9, 0)
  model Z3SetBackTemp {
    /** Set back temperature zone 1 (time controlled heating) */
    value: tempv;
  }

  /** Special Function (SF) mode zone 3 */
  @inherit(r_8, w_8)
  @ext(0xe, 0)
  model Z3SFMode {
    /* Only auto=0; ventilation=1; veto=3 supported */
    value: sfmode2;
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
    value: closeopen;
  }

  /** room zone mapping zone 3 */
  @inherit(r_8, w_8)
  @ext(0x13, 0)
  model Z3RoomZoneMapping {
    /** Configures which room temperature is assigned to zone 3 */
    value: zmapping;
  }

  /** heating room temperature desired zone 3 */
  @inherit(r_8)
  @ext(0x14, 0)
  model Z3HeatingActualRoomTempDesired {
    /** Current room setpoint considering all basic conditions passed to the control algorithms (0 = heating inactive) */
    value: tempv;
  }

  /** cooling room temperature desired zone 2 */
  @inherit(r_8)
  @ext(0x15, 0)
  model Z3CoolingActualRoomTempDesired {
    /** Current room setpoint considering all basic conditions passed to the control algorithms (99 = cooling inactive) */
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

  /** zone 3 status */
  @inherit(r_8)
  @ext(0x1b, 0)
  model Z3Status {
    /** Only auto=0; ventilation=1; veto=4; holidayaway=7; load=9; off=10 supported */
    value: zonestatus;
  }

  /** manual heating setpoint zone 3 */
  @inherit(r_8, w_8)
  @ext(0x22, 0)
  model Z3HeatingTempDesiredManual {
    /** Desired heating setpoint in manual mode for zone 3 */
    value: tempv;
  }

  /** manual cooling setpoint zone 3 */
  @inherit(r_8, w_8)
  @ext(0x23, 0)
  model Z3CoolingTempDesiredManual {
    /** Desired cooling setpoint in manual mode for zone 3 */
    value: tempv;
  }

  /** room humidity zone 3 */
  @inherit(r_8)
  @ext(0x28, 0)
  model Z3RoomHumidity {
    value: percentv;
  }

  // includes

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
