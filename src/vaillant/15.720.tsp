import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./b516_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace _720 {
  // Developed based on
  // BASV3,sensoCOMFORT VRC 720/3f via Base Station D (SW=0760;HW=7304)

  // Errors

  /** default *r */
  @base(MF, 0x3, 0)
  model r_0a {}

  /** Current errors */
  @inherit(r_0a)
  @ext(1)
  model CurrentError {
    value: errors;
  }

  /** default *r */
  @base(MF, 0x3, 1)
  model r_0b {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x3, 0x2)
  model wi_0b {}

  model errorHistoryEntry {
    @values(Values_720ErrorStatus)
    status: UCH;

    time: BTM;
    date: BDA3;

    error: error;
  }

  /** Error history */
  @inherit(r_0b)
  @ext(1)
  @passive
  model ErrorHistory {
    @out
    index: UCH;

    errorhistory: errorHistoryEntry;
  }

  /** Clear error history */
  @inherit(wi_0b)
  @ext(1)
  model ClearErrorHistory {
    @in
    cleared: yesno;
  }

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0, 0)
  model r_1 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *ri for user level "install" */
  @auth("install")
  @base(MF, 0x24, 0x2, 0, 0, 0)
  model ri_1 {
    @maxLength(4)
    ign: IGN;
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
  @inherit(ri_1, wi_1)
  @ext(0x1, 0)
  model HwcBivalencePoint {
    @minValue(-20)
    @maxValue(50)
    @step(1)
    value: tempv;
  }

  /** continous heating */
  @inherit(ri_1, wi_1)
  @ext(0x2, 0)
  model ContinuousHeating {
    /** -26=off, when the outside temperature falls below this threshold temperature the continuous heating function is started (off <=> function is disabled) */
    @minValue(-26)
    @maxValue(10)
    @step(1)
    value: tempv;
  }

  /** frost delay time */
  @inherit(ri_1, wi_1)
  @ext(0x3, 0)
  model FrostOverrideTime {
    /** delay before frost protection is activated */
    value: hoursum2;
  }

  /** Global System OFF */
  @inherit(r_1, w_1)
  @ext(0x7, 0)
  model GlobalSystemOff {
    value: yesno;
  }

  /** hwc parallel loading */
  @inherit(r_1, w_1)
  @ext(0xa, 0)
  model HwcParallelLoading {
    /** heating and hot water parallel */
    value: onoff;
  }

  /** max room humidity */
  @inherit(ri_1, wi_1)
  @ext(0xe, 0)
  model MaxRoomHumidity {
    /** maximum room humidity */
    value: percent0;
    @maxLength(3)
    ign: IGN;
  }

  /** hybrid manager */
  @inherit(ri_1, wi_1)
  @ext(0xf, 0)
  model HybridManager {
    value: hmmode;
  }

  /** tariff aux heater */
  @inherit(ri_1)
  @ext(0x10, 0)
  model TariffAuxHeater {
    value: UIN;
  }

  /** adaptive heat curve */
  @inherit(r_1, w_1)
  @ext(0x14, 0)
  model AdaptHeatCurve {
    /** automatic correction of configured heat curve */
    value: yesno;
  }

  /** maximum cylinder charging time hwc (15=no limit) */
  @inherit(r_1, w_1)
  @ext(0x17, 0)
  model MaxCylinderChargeTime {
    value: minutes2;
  }

  /** hwc lock time */
  @inherit(r_1, w_1)
  @ext(0x18, 0)
  model HwcLockTime {
    /** Lock time hot water current */
    value: minutes2;
  }

  /** solar flow rate: preset flow rate solar circuit for solar yield calculation */
  @inherit(r_1, w_1)
  @ext(0x19, 0)
  @condition(_720.FM5Config.value, "<=2")
  model SolarFlowRate {
    @minValue(0)
    @unit("l/min")
    value: EXP;
  }

  /** pump additional time */
  @inherit(ri_1, wi_1)
  @ext(0x1b, 0)
  model PumpAdditionalTime {
    /** chargepump additional operationtime */
    value: minutes2;
  }

  /** hc alternative point */
  @inherit(ri_1, wi_1)
  @ext(0x22, 0)
  model HcAlternativePoint {
    @minValue(-21)
    @maxValue(40)
    @step(1)
    value: tempv;
  }

  /** hc bivalence point */
  @inherit(ri_1, wi_1)
  @ext(0x23, 0)
  model HcBivalencePoint {
    @minValue(-20)
    @maxValue(30)
    @step(1)
    value: tempv;
  }

  /** backup boiler */
  @inherit(ri_1, wi_1)
  @ext(0x24, 0)
  model BackupBoiler {
    value: backmode2;
  }

  /** hc emergency temperature */
  @inherit(ri_1, wi_1)
  @ext(0x26, 0)
  model HcEmergencyTemp {
    @minValue(20)
    @maxValue(80)
    @step(1)
    value: tempv;
  }

  /** hysteresis cylinder charge */
  @inherit(r_1, w_1)
  @ext(0x27, 0)
  model CylinderChargeHyst {
    @minValue(3)
    @maxValue(20)
    @step(0.5)
    value: calibrationv;
  }

  /** offset cylinder charge */
  @inherit(r_1, w_1)
  @ext(0x29, 0)
  model CylinderChargeOffset {
    @minValue(0)
    @maxValue(40)
    @step(1)
    value: calibrationv;
  }

  /** hwc legionella time */
  @inherit(r_1, w_1)
  @ext(0x2a, 0)
  model HwcLegionellaTime {
    value: HTI;
  }

  /** hwc legionella day */
  @inherit(r_1, w_1)
  @ext(0x2b, 0)
  model HwcLegionellaDay {
    value: daysel3;
  }

  /** next maintenance */
  @inherit(r_1, w_1)
  @ext(0x2c, 0)
  model MaintenanceDate {
    value: date;
  }

  /** offset outside temperature */
  @inherit(r_1, w_1)
  @ext(0x2d, 0)
  model OffsetOutsideTemp {
    @minValue(-3)
    @maxValue(3)
    @step(0.5)
    value: calibrationv;
  }

  /** fm5 config: FM5 VR71 module configuration (for VRC720 and FM5 used values are 1 2 3 and 6) */
  @inherit(r_1, w_1)
  @ext(0x2f, 0)
  model FM5Config {
    @minValue(1)
    @maxValue(11)
    value: UIN;
  }

  /** current date */
  @inherit(r_1)
  @ext(0x34, 0)
  model Date {
    value: date;
  }

  /** current time */
  @inherit(r_1)
  @ext(0x35, 0)
  model Time {
    value: HTI;
  }

  /** hydraulic scheme */
  @inherit(ri_1, wi_1)
  @ext(0x36, 0)
  model HydraulicScheme {
    @minValue(1)
    @maxValue(16)
    value: UIN;
  }

  /** cooling outside temperature threshold */
  @inherit(ri_1, wi_1)
  @ext(0x38, 0)
  model CoolingOutsideTempThreshold {
    @minValue(10)
    @maxValue(30)
    @step(1)
    value: tempv;
  }

  /** water pressure */
  @inherit(r_1)
  @ext(0x39, 0)
  model WaterPressure {
    value: pressv;
  }

  /** dew point offset */
  @inherit(ri_1, wi_1)
  @ext(0x3A, 0)
  model DewPointOffset {
    @minValue(-10)
    @maxValue(10)
    @step(1)
    value: tempv;
  }

  /** total solar yield */
  @inherit(r_1, wi_1)
  @ext(0x3d, 0)
  @condition(_720.FM5Config.value, "<=2")
  model SolarYieldTotal {
    value: energy4;
  }

  /** total environmental yield */
  @inherit(r_1, wi_1)
  @ext(0x3e, 0)
  model YieldTotal {
    value: energy4;
  }

  /** esco block function */
  @inherit(r_1, w_1)
  @ext(0x45, 0)
  model ESCO {
    value: escomode;
  }

  /** hwc max flow temp */
  @inherit(r_1, w_1)
  @ext(0x46, 0)
  model HwcFlowTempMax {
    @minValue(15)
    @maxValue(80)
    @step(1)
    value: tempv;
  }

  /** system flow temperature */
  @inherit(r_1)
  @ext(0x4b, 0)
  model SystemFlowTemp {
    value: tempv;
  }

  /** multifunction relay setting */
  @inherit(r_1, w_1)
  @ext(0x4d, 0)
  model MultiRelaySetting {
    value: mamode2;
  }

  /** this month fuel consumption heating */
  @inherit(r_1)
  @ext(0x4e, 0)
  model PrFuelSumHcThisMonth {
    value: energy4;
  }

  /** this month energy consumption heating */
  @inherit(r_1)
  @ext(0x4f, 0)
  model PrEnergySumHcThisMonth {
    value: energy4;
  }

  /** this month energy consumption hot water */
  @inherit(r_1)
  @ext(0x50, 0)
  model PrEnergySumHwcThisMonth {
    value: energy4;
  }

  /** this month fuel consumption hot water */
  @inherit(r_1)
  @ext(0x51, 0)
  model PrFuelSumHwcThisMonth {
    value: energy4;
  }

  /** last month fuel consumption heating */
  @inherit(r_1)
  @ext(0x52, 0)
  model PrFuelSumHcLastMonth {
    value: energy4;
  }

  /** last month energy consumption heating */
  @inherit(r_1)
  @ext(0x53, 0)
  model PrEnergySumHcLastMonth {
    value: energy4;
  }

  /** last month energy consumption hot water */
  @inherit(r_1)
  @ext(0x54, 0)
  model PrEnergySumHwcLastMonth {
    value: energy4;
  }

  /** last month fuel consumption hot water */
  @inherit(r_1)
  @ext(0x55, 0)
  model PrFuelSumHwcLastMonth {
    value: energy4;
  }

  /** total fuel consumption heating */
  @inherit(r_1)
  @ext(0x56, 0)
  model PrFuelSumHc {
    value: energy4;
  }

  /** total energy consumption heating */
  @inherit(r_1)
  @ext(0x57, 0)
  model PrEnergySumHc {
    value: energy4;
  }

  /** total energy consumption hot water */
  @inherit(r_1)
  @ext(0x58, 0)
  model PrEnergySumHwc {
    value: energy4;
  }

  /** total fuel consumption hot water */
  @inherit(r_1)
  @ext(0x59, 0)
  model PrFuelSumHwc {
    value: energy4;
  }

  /** installer name 1 (first part) */
  @inherit(r_1, w_1)
  @ext(0x6c, 0)
  model Installer1 {
    @minLength(0)
    value: shortname;
  }

  /** installer name 2 (second part) */
  @inherit(r_1, w_1)
  @ext(0x6d, 0)
  model Installer2 {
    @minLength(0)
    value: shortname;
  }

  /** phone number 1 (first part) */
  @inherit(r_1, w_1)
  @ext(0x6f, 0)
  model PhoneNumber1 {
    @minLength(0)
    value: shortphone;
  }

  /** phone number 2 (second part) */
  @inherit(r_1, w_1)
  @ext(0x70, 0)
  model PhoneNumber2 {
    @minLength(0)
    value: shortphone;
  }

  /** outside temperature */
  @inherit(r_1)
  @ext(0x73, 0)
  model OutsideTemp {
    value: tempv;
  }

  /** code for installer menu */
  @inherit(ri_1, wi_1)
  @ext(0x76, 0)
  model KeyCodeforConfigMenu {
    @minValue(0)
    @maxValue(999)
    value: UIN;
  }

  /** average outside temperature */
  @inherit(r_1)
  @ext(0x95, 0)
  model OutsideTempAvg {
    value: tempv;
  }

  /** maintenance due */
  @inherit(r_1)
  @ext(0x96, 0)
  model MaintenanceDue {
    value: yesno;
  }

  /** green iq */
  @inherit(r_1)
  @ext(0x9a, 0)
  model GreenIQ {
    value: onoff;
  }

  /** hwc cylinder temperature top */
  @inherit(r_1)
  @ext(0x9d, 0)
  model HwcStorageTempTop {
    value: tempv;
  }

  /** hwc cylinder temperature bottom */
  @inherit(r_1)
  @ext(0x9e, 0)
  model HwcStorageTempBottom {
    value: tempv;
  }

  /** hc cylinder temperature top */
  @inherit(r_1)
  @ext(0x9f, 0)
  model HcStorageTempTop {
    value: tempv;
  }

  /** hc cylinder temperature bottom */
  @inherit(r_1)
  @ext(0xa0, 0)
  model HcStorageTempBottom {
    value: tempv;
  }

  /** offset buffer charge */
  @inherit(r_1, w_1)
  @ext(0xa2, 0)
  model BufferChargeOffset {
    @minValue(0)
    @maxValue(15)
    @step(1)
    value: calibrationv;
  }

  // ##### Hot water circuit #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 1, 0)
  model r_2 {
    @maxLength(4)
    ign: IGN;
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

  /** hwc status */
  @inherit(r_2)
  @ext(0xf, 0)
  model HwcStatus {
    value: zonestatus2;
  }

  @condition(_720.HwcEnabled.value, "1")
  namespace HotWaterCircuit {
    /** hwc circulation pump status */
    @inherit(r_2)
    @ext(0x2, 0)
    model HwcCircPumpStatus {
      value: onoff;
    }

    /** hwc operation mode */
    @inherit(r_2, w_2)
    @ext(0x3, 0)
    model HwcOpMode {
      value: opmode2;
    }

    /** hwc desired temperature */
    @inherit(r_2, w_2)
    @ext(0x4, 0)
    model HwcTempDesired {
      @minValue(35)
      @maxValue(70)
      @step(1)
      value: tempv;
    }

    /** hwc cylinder temperature */
    @inherit(r_2)
    @ext(0x5, 0)
    model HwcStorageTemp {
      value: tempv;
    }

    /** hwc reheating active */
    @inherit(r_2)
    @ext(0x6, 0)
    model HwcReheatingActive {
      value: yesno;
    }

    /** hwc flow desired temperature */
    @inherit(r_2)
    @ext(0x8, 0)
    model HwcFlowTemp {
      value: tempv;
    }

    /** hwc holiday start period */
    @inherit(r_2, w_2)
    @ext(0x9, 0)
    model HwcHolidayStartPeriod {
      value: hfrom;
    }

    /** hwc holiday end period */
    @inherit(r_2, w_2)
    @ext(0xa, 0)
    model HwcHolidayEndPeriod {
      value: hto;
    }

    /** hwc Special Function (SF) mode */
    @inherit(r_2, w_2)
    @ext(0xd, 0)
    model HwcSFMode {
      value: sfmodehwc;
    }

    /** hwc holiday start time */
    @inherit(r_2, w_2)
    @ext(0x10, 0)
    model HwcHolidayStartTime {
      value: HTI;
    }

    /** hwc holiday end time */
    @inherit(r_2, w_2)
    @ext(0x11, 0)
    model HwcHolidayEndTime {
      value: HTI;
    }
  }

  // ##### Heating circuit 1 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x2, 0)
  model r_3 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *ri for user level "install" */
  @auth("install")
  @base(MF, 0x24, 0x2, 0, 0x2, 0)
  model ri_3 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x2, 0)
  model w_3 {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x24, 0x2, 1, 0x2, 0)
  model wi_3 {}

  /** Circuit type heating circuit 1 */
  @inherit(r_3)
  @ext(0x2, 0)
  model Hc1CircuitType {
    value: hctype;
    @maxLength(1) ign: IGN;
  }

  /** Desired return temperature heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x4, 0)
  @condition(_720.Hc1CircuitType.value, "4")
  model Hc1DesiredReturnTemp {
    @minValue(15)
    @maxValue(80)
    @step(1)
    value: tempv;
  }

  /** Dew point monitoring heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x5, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  @condition(_720.Hc1CoolingEnabled.value, "1")
  @condition(_720.Hc1RoomTempModulation.value, ">=1")
  model Hc1DewPointMonitoring {
    value: onoff;
  }

  /** Cooling enabled heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x6, 0)
  model Hc1CoolingEnabled {
    value: onoff;
  }

  /** Desired flow temperature heating circuit 1 */
  @inherit(r_3)
  @ext(0x7, 0)
  model Hc1FlowTempDesired {
    value: tempv;
  }

  /** Flow temperature heating circuit 1 */
  @inherit(r_3)
  @ext(0x8, 0)
  model Hc1FlowTemp {
    value: tempv;
  }

  /** External hot water desired temperature heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x9, 0)
  @condition(_720.Hc1CircuitType.value, "3")
  model Hc1ExtHwcTempDesired {
    value: tempv;
  }

  /** Dew point offset heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xa, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  @condition(_720.Hc1CoolingEnabled.value, "1")
  @condition(_720.Hc1RoomTempModulation.value, ">=1")
  model Hc1DewPointOffset {
    @minValue(-10)
    @maxValue(10)
    @step(1)
    value: calibrationv;
  }

  /** Excess temperature heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xb, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Hc1ExcessTemp {
    /** excess temperature: flow temperature setpoint is increased by this value to keep the mixing valve in its control range */
    @minValue(0)
    @maxValue(20)
    @step(1)
    value: calibrationv;
  }

  /** Desired temperature (fixed) heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xc, 0)
  @condition(_720.Hc1CircuitType.value, "2")
  model Hc1FixedDesiredTemp {
    @minValue(5)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** Setback mode temperature (fixed) heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xd, 0)
  @condition(_720.Hc1CircuitType.value, "2")
  model Hc1SetbackModeTemp {
    @minValue(0)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** Setback mode heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xe, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Hc1SetbackMode {
    value: offmode2;
  }

  /** Heating curve heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xf, 0)
  model Hc1HeatCurve {
    value: curvev;
  }

  /** Heating flow max temperature heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x10, 0)
  model Hc1HeatingFlowTempMax {
    @minValue(15)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** Cooling flow min temperature heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x11, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  @condition(_720.Hc1CoolingEnabled.value, "1")
  model Hc1CoolingFlowTempMin {
    /** minimum cooling temperature setpoint Hc1 */
    @minValue(7)
    @maxValue(24)
    @step(1)
    value: tempv;
  }

  /** Heating flow min temperature heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x12, 0)
  model Hc1HeatingFlowTempMin {
    @minValue(15)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** External hot water operation mode heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x13, 0)
  @condition(_720.Hc1CircuitType.value, "3")
  model Hc1ExtHwcOpMode {
    value: opmode2;
  }

  /** Summer outside switchoff temperature heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x14, 0)
  model Hc1SummerTempLimit {
    @minValue(10)
    @maxValue(99)
    @step(1)
    value: tempv;
  }

  /** Room temperature modulation heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x15, 0)
  model Hc1RoomTempModulation {
    value: rcmode2;
  }

  /** Screed drying day heating circuit 1 */
  @inherit(ri_3, wi_3)
  @ext(0x16, 0)
  model Hc1ScreedDryingDay {
    @minValue(0)
    @maxValue(29)
    value: UIN;
  }

  /** Screed drying desired temperature heating circuit 1 */
  @inherit(ri_3)
  @ext(0x17, 0)
  model Hc1ScreedDryingDesiredTemp {
    @minValue(0)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** External hot water active heating circuit 1 */
  @inherit(r_3)
  @ext(0x18, 0)
  model Hc1ExtHwcActive {
    value: onoff;
  }

  /** External heat demand heating circuit 1 */
  @inherit(r_3)
  @ext(0x19, 0)
  model Hc1ExtHeatDemand {
    value: onoff;
  }

  /** Mixer movement heating circuit 1 */
  @inherit(r_3)
  @ext(0x1a, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Hc1MixerMovement {
    /** status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** Heating curve adaption heating circuit 1 */
  @inherit(r_3)
  @ext(0x1c, 0)
  model Hc1HeatCurveAdaption {
    value: EXP;
  }

  /** Status heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x1b, 0)
  model Hc1Status {
    value: onoff;
  }

  /** Pump status heating circuit 1 */
  @inherit(r_3)
  @ext(0x1e, 0)
  model Hc1PumpStatus {
    value: hcpumpmode;
  }

  // ##### Heating circuit 2 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x2, 1)
  model r_4 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *ri for user level "install" */
  @auth("install")
  @base(MF, 0x24, 0x2, 0, 0x2, 1)
  model ri_4 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x2, 1)
  model w_4 {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x24, 0x2, 1, 0x2, 1)
  model wi_4 {}

  /** Circuit type heating circuit 2 */
  @inherit(r_4)
  @ext(0x2, 0)
  model Hc2CircuitType {
    value: hctype;
    @maxLength(1) ign: IGN;
  }

  /** Desired return temperature heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x4, 0)
  @condition(_720.Hc2CircuitType.value, "4")
  model Hc2DesiredReturnTemp {
    @minValue(15)
    @maxValue(80)
    @step(1)
    value: tempv;
  }

  /** Dew point monitoring heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x5, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  @condition(_720.Hc2CoolingEnabled.value, "1")
  @condition(_720.Hc2RoomTempModulation.value, ">=1")
  model Hc2DewPointMonitoring {
    value: onoff;
  }

  /** Cooling enabled heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x6, 0)
  model Hc2CoolingEnabled {
    value: onoff;
  }

  /** Desired flow temperature heating circuit 2 */
  @inherit(r_4)
  @ext(0x7, 0)
  model Hc2FlowTempDesired {
    value: tempv;
  }

  /** Flow temperature heating circuit 2 */
  @inherit(r_4)
  @ext(0x8, 0)
  model Hc2FlowTemp {
    value: tempv;
  }

  /** External hot water desired temperature heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x9, 0)
  @condition(_720.Hc2CircuitType.value, "3")
  model Hc2ExtHwcTempDesired {
    value: tempv;
  }

  /** Dew point offset heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xa, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  @condition(_720.Hc2CoolingEnabled.value, "1")
  @condition(_720.Hc2RoomTempModulation.value, ">=1")
  model Hc2DewPointOffset {
    @minValue(-10)
    @maxValue(10)
    @step(1)
    value: calibrationv;
  }

  /** Excess temperature heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xb, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Hc2ExcessTemp {
    /** excess temperature: flow temperature setpoint is increased by this value to keep the mixing valve in its control range */
    @minValue(0)
    @maxValue(20)
    @step(1)
    value: calibrationv;
  }

  /** Desired temperature (fixed) heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xc, 0)
  @condition(_720.Hc2CircuitType.value, "2")
  model Hc2FixedDesiredTemp {
    @minValue(5)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** Setback mode temperature (fixed) heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xd, 0)
  @condition(_720.Hc2CircuitType.value, "2")
  model Hc2SetbackModeTemp {
    @minValue(0)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** Setback mode heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xe, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Hc2SetbackMode {
    value: offmode2;
  }

  /** Heating curve heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xf, 0)
  model Hc2HeatCurve {
    value: curvev;
  }

  /** Heating flow max temperature heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x10, 0)
  model Hc2HeatingFlowTempMax {
    @minValue(15)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** Cooling flow min temperature heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x11, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  @condition(_720.Hc2CoolingEnabled.value, "1")
  model Hc2CoolingFlowTempMin {
    /** minimum cooling temperature setpoint Hc2 */
    @minValue(7)
    @maxValue(24)
    @step(1)
    value: tempv;
  }

  /** Heating flow min temperature heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x12, 0)
  model Hc2HeatingFlowTempMin {
    @minValue(15)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** External hot water operation mode heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x13, 0)
  @condition(_720.Hc2CircuitType.value, "3")
  model Hc2ExtHwcOpMode {
    value: opmode2;
  }

  /** Summer outside switchoff temperature heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x14, 0)
  model Hc2SummerTempLimit {
    @minValue(10)
    @maxValue(99)
    @step(1)
    value: tempv;
  }

  /** Room temperature modulation heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x15, 0)
  model Hc2RoomTempModulation {
    value: rcmode2;
  }

  /** Screed drying day heating circuit 2 */
  @inherit(ri_4, wi_4)
  @ext(0x16, 0)
  model Hc2ScreedDryingDay {
    @minValue(0)
    @maxValue(29)
    value: UIN;
  }

  /** Screed drying desired temperature heating circuit 2 */
  @inherit(ri_4)
  @ext(0x17, 0)
  model Hc2ScreedDryingDesiredTemp {
    @minValue(0)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** External hot water active heating circuit 2 */
  @inherit(r_4)
  @ext(0x18, 0)
  model Hc2ExtHwcActive {
    value: onoff;
  }

  /** External heat demand heating circuit 2 */
  @inherit(r_4)
  @ext(0x19, 0)
  model Hc2ExtHeatDemand {
    value: onoff;
  }

  /** Mixer movement heating circuit 2 */
  @inherit(r_4)
  @ext(0x1a, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Hc2MixerMovement {
    /** status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** Heating curve adaption heating circuit 2 */
  @inherit(r_4)
  @ext(0x1c, 0)
  model Hc2HeatCurveAdaption {
    value: EXP;
  }

  /** Status heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x1b, 0)
  model Hc2Status {
    value: onoff;
  }

  /** Pump status heating circuit 2 */
  @inherit(r_4)
  @ext(0x1e, 0)
  model Hc2PumpStatus {
    value: hcpumpmode;
  }

  // ##### Heating circuit 3 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x2, 0x2)
  model r_5 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *ri for user level "install" */
  @auth("install")
  @base(MF, 0x24, 0x2, 0, 0x2, 0x2)
  model ri_5 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x2, 0x2)
  model w_5 {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x24, 0x2, 1, 0x2, 0x2)
  model wi_5 {}

  /** Circuit type heating circuit 3 */
  @inherit(r_5)
  @ext(0x2, 0)
  model Hc3CircuitType {
    value: hctype;
    @maxLength(1) ign: IGN;
  }

  /** Desired return temperature heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x4, 0)
  @condition(_720.Hc3CircuitType.value, "4")
  model Hc3DesiredReturnTemp {
    @minValue(15)
    @maxValue(80)
    @step(1)
    value: tempv;
  }

  /** Dew point monitoring heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x5, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  @condition(_720.Hc3CoolingEnabled.value, "1")
  @condition(_720.Hc3RoomTempModulation.value, ">=1")
  model Hc3DewPointMonitoring {
    value: onoff;
  }

  /** Cooling enabled heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x6, 0)
  model Hc3CoolingEnabled {
    value: onoff;
  }

  /** Desired flow temperature heating circuit 3 */
  @inherit(r_5)
  @ext(0x7, 0)
  model Hc3FlowTempDesired {
    value: tempv;
  }

  /** Flow temperature heating circuit 3 */
  @inherit(r_5)
  @ext(0x8, 0)
  model Hc3FlowTemp {
    value: tempv;
  }

  /** External hot water desired temperature heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x9, 0)
  @condition(_720.Hc3CircuitType.value, "3")
  model Hc3ExtHwcTempDesired {
    value: tempv;
  }

  /** Dew point offset heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xa, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  @condition(_720.Hc3CoolingEnabled.value, "1")
  @condition(_720.Hc3RoomTempModulation.value, ">=1")
  model Hc3DewPointOffset {
    @minValue(-10)
    @maxValue(10)
    @step(1)
    value: calibrationv;
  }

  /** Excess temperature heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xb, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Hc3ExcessTemp {
    /** excess temperature: flow temperature setpoint is increased by this value to keep the mixing valve in its control range */
    @minValue(0)
    @maxValue(20)
    @step(1)
    value: calibrationv;
  }

  /** Desired temperature (fixed) heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xc, 0)
  @condition(_720.Hc3CircuitType.value, "2")
  model Hc3FixedDesiredTemp {
    @minValue(5)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** Setback mode temperature (fixed) heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xd, 0)
  @condition(_720.Hc3CircuitType.value, "2")
  model Hc3SetbackModeTemp {
    @minValue(0)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** Setback mode heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xe, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Hc3SetbackMode {
    value: offmode2;
  }

  /** Heating curve heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xf, 0)
  model Hc3HeatCurve {
    value: curvev;
  }

  /** Heating flow max temperature heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x10, 0)
  model Hc3HeatingFlowTempMax {
    @minValue(15)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** Cooling flow min temperature heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x11, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  @condition(_720.Hc3CoolingEnabled.value, "1")
  model Hc3CoolingFlowTempMin {
    /** minimum cooling temperature setpoint Hc1 */
    @minValue(7)
    @maxValue(24)
    @step(1)
    value: tempv;
  }

  /** Heating flow min temperature heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x12, 0)
  model Hc3HeatingFlowTempMin {
    @minValue(15)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** External hot water operation mode heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x13, 0)
  @condition(_720.Hc3CircuitType.value, "3")
  model Hc3ExtHwcOpMode {
    value: opmode2;
  }

  /** Summer outside switchoff temperature heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x14, 0)
  model Hc3SummerTempLimit {
    @minValue(10)
    @maxValue(99)
    @step(1)
    value: tempv;
  }

  /** Room temperature modulation heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x15, 0)
  model Hc3RoomTempModulation {
    value: rcmode2;
  }

  /** Screed drying day heating circuit 3 */
  @inherit(ri_5, wi_5)
  @ext(0x16, 0)
  model Hc3ScreedDryingDay {
    @minValue(0)
    @maxValue(29)
    value: UIN;
  }

  /** Screed drying desired temperature heating circuit 3 */
  @inherit(ri_5)
  @ext(0x17, 0)
  model Hc3ScreedDryingDesiredTemp {
    @minValue(0)
    @maxValue(90)
    @step(1)
    value: tempv;
  }

  /** External hot water active heating circuit 3 */
  @inherit(r_5)
  @ext(0x18, 0)
  model Hc3ExtHwcActive {
    value: onoff;
  }

  /** External heat demand heating circuit 3 */
  @inherit(r_5)
  @ext(0x19, 0)
  model Hc3ExtHeatDemand {
    value: onoff;
  }

  /** Mixer movement heating circuit 3 */
  @inherit(r_5)
  @ext(0x1a, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Hc3MixerMovement {
    /** status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** Heating curve adaption heating circuit 3 */
  @inherit(r_5)
  @ext(0x1c, 0)
  model Hc3HeatCurveAdaption {
    value: EXP;
  }

  /** Status heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x1b, 0)
  model Hc3Status {
    value: onoff;
  }

  /** Pump status heating circuit 3 */
  @inherit(r_5)
  @ext(0x1e, 0)
  model Hc3PumpStatus {
    value: hcpumpmode;
  }

  // ##### Zone 1 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x3, 0)
  model r_6 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x3, 0)
  model w_6 {}

  /** cooling operation mode zone 1 */
  @inherit(r_6, w_6)
  @ext(0x1, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  @condition(_720.Hc1CoolingEnabled.value, "1")
  model Z1CoolingOpMode {
    value: opmode2;
  }

  /** cooling setback temperature zone 1 */
  @inherit(r_6, w_6)
  @ext(0x2, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  @condition(_720.Hc1CoolingEnabled.value, "1")
  model Z1CoolingSetbackTemp {
    @minValue(15)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** holiday period start zone 1 */
  @inherit(r_6, w_6)
  @ext(0x3, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1HolidayStartPeriod {
    value: hfrom;
  }

  /** holiday period end zone 1 */
  @inherit(r_6, w_6)
  @ext(0x4, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1HolidayEndPeriod {
    value: hto;
  }

  /** room setpoint holiday period zone 1 */
  @inherit(r_6, w_6)
  @ext(0x5, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1HolidayTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** heating operation mode zone 1 */
  @inherit(r_6, w_6)
  @ext(0x6, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1OpMode {
    value: opmode2;
  }

  /** quick veto temperature zone 1 */
  @inherit(r_6, w_6)
  @ext(0x8, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1QuickVetoTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** heating setback temperature zone 1 */
  @inherit(r_6, w_6)
  @ext(0x9, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1SetbackTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** Special Function (SF) mode zone 1 */
  @inherit(r_6, w_6)
  @ext(0xe, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1SFMode {
    value: sfmodezone;
  }

  /** room temperature zone 1 */
  @inherit(r_6)
  @ext(0xf, 0)
  model Z1RoomTemp {
    value: tempv;
  }

  /** valve status zone 1 */
  @inherit(r_6)
  @ext(0x12, 0)
  model Z1ValveStatus {
    value: openclose;
  }

  /** room zone mapping zone 1 */
  @inherit(r_6, w_6)
  @ext(0x13, 0)
  model Z1RoomZoneMapping {
    /** configures which room temperature is assigned to zone 1 */
    value: zmapping;
  }

  /** heating room temperature desired zone 1 */
  @inherit(r_6)
  @ext(0x14, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1TempDesired {
    value: tempv;
  }

  /** cooling room temperature desired zone 1 */
  @inherit(r_6)
  @ext(0x15, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  @condition(_720.Hc1CoolingEnabled.value, "1")
  model Z1CoolingTempDesired {
    value: tempv;
  }

  /** short name of zone 1 */
  @inherit(r_6, w_6)
  @ext(0x16, 0)
  model Z1Shortname {
    @minLength(0)
    value: shortname;
  }

  /** zone 1 label (first part) */
  @inherit(r_6, w_6)
  @ext(0x17, 0)
  model Z1Name1 {
    @minLength(0)
    value: zname;
  }

  /** zone 1 label (second part) */
  @inherit(r_6, w_6)
  @ext(0x18, 0)
  model Z1Name2 {
    @minLength(0)
    value: zname;
  }

  /** heating time slot active zone 1 */
  @inherit(r_6)
  @ext(0x19, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1TimeSlotActive {
    value: yesno;
  }

  /** cooling time slot active zone 1 */
  @inherit(r_6)
  @ext(0x1A, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  @condition(_720.Hc1CoolingEnabled.value, "1")
  model Z1CoolingTimeSlotActive {
    value: yesno;
  }

  /** zone 1 status */
  @inherit(r_6)
  @ext(0x1b, 0)
  model Z1Status {
    value: zonestatus3;
  }

  /** quick veto end time zone 1 */
  @inherit(r_6)
  @ext(0x1e, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1QuickVetoEndTime {
    value: HTI;
  }

  /** end time of holidays for zone 1 */
  @inherit(r_6, w_6)
  @ext(0x20, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1HolidayEndTime {
    value: HTI;
  }

  /** start time of holidays for zone 1 */
  @inherit(r_6, w_6)
  @ext(0x21, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1HolidayStartTime {
    value: HTI;
  }

  /** manual heating setpoint zone 1 */
  @inherit(r_6, w_6)
  @ext(0x22, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1ManualTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** manual cooling setpoint zone 1 */
  @inherit(r_6, w_6)
  @ext(0x23, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  @condition(_720.Hc1CoolingEnabled.value, "1")
  model Z1CoolingManualTemp {
    @minValue(15)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** quick veto end date zone 1 */
  @inherit(r_6)
  @ext(0x24, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1QuickVetoEndDate {
    value: date;
  }

  /** quick veto duration zone 1 */
  @inherit(r_6, w_6)
  @ext(0x26, 0)
  @condition(_720.Hc1CircuitType.value, "1")
  model Z1QuickVetoDuration {
    @minValue(0.5)
    @maxValue(12)
    @step(0.5)
    @unit("h")
    value: EXP;
  }

  /** room humidity zone 1 */
  @inherit(r_6)
  @ext(0x28, 0)
  model Z1RoomHumidity {
    value: percentv;
  }

  // ##### Zone 2 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x3, 1)
  model r_7 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x3, 1)
  model w_7 {}

  /** cooling operation mode zone 2 */
  @inherit(r_7, w_7)
  @ext(0x1, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  @condition(_720.Hc2CoolingEnabled.value, "1")
  model Z2CoolingOpMode {
    value: opmode2;
  }

  /** cooling setback temperature zone 2 */
  @inherit(r_7, w_7)
  @ext(0x2, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  @condition(_720.Hc2CoolingEnabled.value, "1")
  model Z2CoolingSetbackTemp {
    @minValue(15)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** holiday period start zone 2 */
  @inherit(r_7, w_7)
  @ext(0x3, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2HolidayStartPeriod {
    value: hfrom;
  }

  /** holiday period end zone 2 */
  @inherit(r_7, w_7)
  @ext(0x4, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2HolidayEndPeriod {
    value: hto;
  }

  /** room setpoint holiday period zone 2 */
  @inherit(r_7, w_7)
  @ext(0x5, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2HolidayTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** heating operation mode zone 2 */
  @inherit(r_7, w_7)
  @ext(0x6, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2OpMode {
    value: opmode2;
  }

  /** quick veto temperature zone 2 */
  @inherit(r_7, w_7)
  @ext(0x8, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2QuickVetoTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** heating setback temperature zone 2 */
  @inherit(r_7, w_7)
  @ext(0x9, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2SetbackTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** Special Function (SF) mode zone 2 */
  @inherit(r_7, w_7)
  @ext(0xe, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2SFMode {
    value: sfmodezone;
  }

  /** room temperature zone 2 */
  @inherit(r_7)
  @ext(0xf, 0)
  model Z2RoomTemp {
    value: tempv;
  }

  /** valve status zone 2 */
  @inherit(r_7)
  @ext(0x12, 0)
  model Z2ValveStatus {
    value: openclose;
  }

  /** room zone mapping zone 2 */
  @inherit(r_7, w_7)
  @ext(0x13, 0)
  model Z2RoomZoneMapping {
    /** configures which room temperature is assigned to zone 2 */
    value: zmapping2;
  }

  /** heating room temperature desired zone 2 */
  @inherit(r_7)
  @ext(0x14, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2TempDesired {
    value: tempv;
  }

  /** cooling room temperature desired zone 2 */
  @inherit(r_7)
  @ext(0x15, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  @condition(_720.Hc2CoolingEnabled.value, "1")
  model Z2CoolingTempDesired {
    value: tempv;
  }

  /** short name of zone 2 */
  @inherit(r_7, w_7)
  @ext(0x16, 0)
  model Z2Shortname {
    @minLength(0)
    value: shortname;
  }

  /** zone 2 label (first part) */
  @inherit(r_7, w_7)
  @ext(0x17, 0)
  model Z2Name1 {
    @minLength(0)
    value: zname;
  }

  /** zone 2 label (second part) */
  @inherit(r_7, w_7)
  @ext(0x18, 0)
  model Z2Name2 {
    @minLength(0)
    value: zname;
  }

  /** heating time slot active zone 2 */
  @inherit(r_7)
  @ext(0x19, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2TimeSlotActive {
    value: yesno;
  }

  /** cooling time slot active zone 2 */
  @inherit(r_7)
  @ext(0x1A, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  @condition(_720.Hc2CoolingEnabled.value, "1")
  model Z2CoolingTimeSlotActive {
    value: yesno;
  }

  /** zone 2 status */
  @inherit(r_7)
  @ext(0x1b, 0)
  model Z2Status {
    value: zonestatus3;
  }

  /** quick veto end time zone 2 */
  @inherit(r_7)
  @ext(0x1e, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2QuickVetoEndTime {
    value: HTI;
  }

  /** end time of holidays for zone 2 */
  @inherit(r_7, w_7)
  @ext(0x20, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2HolidayEndTime {
    value: HTI;
  }

  /** start time of holidays for zone 2 */
  @inherit(r_7, w_7)
  @ext(0x21, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2HolidayStartTime {
    value: HTI;
  }

  /** manual heating setpoint zone 2 */
  @inherit(r_7, w_7)
  @ext(0x22, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2ManualTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** manual cooling setpoint zone 2 */
  @inherit(r_7, w_7)
  @ext(0x23, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  @condition(_720.Hc2CoolingEnabled.value, "1")
  model Z2CoolingManualTemp {
    @minValue(15)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** quick veto end date zone 2 */
  @inherit(r_7)
  @ext(0x24, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2QuickVetoEndDate {
    value: date;
  }

  /** quick veto duration zone 2 */
  @inherit(r_7, w_7)
  @ext(0x26, 0)
  @condition(_720.Hc2CircuitType.value, "1")
  model Z2QuickVetoDuration {
    @minValue(0.5)
    @maxValue(12)
    @step(0.5)
    @unit("h")
    value: EXP;
  }

  /** room humidity zone 2 */
  @inherit(r_7)
  @ext(0x28, 0)
  model Z2RoomHumidity {
    value: percentv;
  }

  // ##### Zone 3 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x3, 0x2)
  model r_8 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x3, 0x2)
  model w_8 {}

  /** cooling operation mode zone 3 */
  @inherit(r_8, w_8)
  @ext(0x1, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  @condition(_720.Hc3CoolingEnabled.value, "1")
  model Z3CoolingOpMode {
    value: opmode2;
  }

  /** cooling setback zone 3 */
  @inherit(r_8, w_8)
  @ext(0x2, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  @condition(_720.Hc3CoolingEnabled.value, "1")
  model Z3CoolingSetbackTemp {
    @minValue(15)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** holiday period start zone 3 */
  @inherit(r_8, w_8)
  @ext(0x3, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3HolidayStartPeriod {
    value: hfrom;
  }

  /** holiday period end zone 3 */
  @inherit(r_8, w_8)
  @ext(0x4, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3HolidayEndPeriod {
    value: hto;
  }

  /** room setpoint holiday period zone 3 */
  @inherit(r_8, w_8)
  @ext(0x5, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3HolidayTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** heating operation mode zone 3 */
  @inherit(r_8, w_8)
  @ext(0x6, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3OpMode {
    value: opmode2;
  }

  /** quick veto temperature zone 3 */
  @inherit(r_8, w_8)
  @ext(0x8, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3QuickVetoTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** setback temperature zone 3 */
  @inherit(r_8, w_8)
  @ext(0x9, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3SetbackTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** Special Function (SF) mode zone 3 */
  @inherit(r_8, w_8)
  @ext(0xe, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3SFMode {
    value: sfmodezone;
  }

  /** room temperature zone 3 */
  @inherit(r_8)
  @ext(0xf, 0)
  model Z3RoomTemp {
    value: tempv;
  }

  /** valve status zone 3 */
  @inherit(r_8)
  @ext(0x12, 0)
  model Z3ValveStatus {
    value: openclose;
  }

  /** room zone mapping zone 3 */
  @inherit(r_8, w_8)
  @ext(0x13, 0)
  model Z3RoomZoneMapping {
    /** configures which room temperature is assigned to zone 3 */
    value: zmapping2;
  }

  /** heating room temperature desired zone 3 */
  @inherit(r_8)
  @ext(0x14, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3TempDesired {
    value: tempv;
  }

  /** cooling room temperature desired zone 3 */
  @inherit(r_8)
  @ext(0x15, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  @condition(_720.Hc3CoolingEnabled.value, "1")
  model Z3CoolingTempDesired {
    value: tempv;
  }

  /** short name of zone 3 */
  @inherit(r_8, w_8)
  @ext(0x16, 0)
  model Z3Shortname {
    @minLength(0)
    value: shortname;
  }

  /** zone 3 label (first part) */
  @inherit(r_8, w_8)
  @ext(0x17, 0)
  model Z3Name1 {
    @minLength(0)
    value: zname;
  }

  /** zone 3 label (second part) */
  @inherit(r_8, w_8)
  @ext(0x18, 0)
  model Z3Name2 {
    @minLength(0)
    value: zname;
  }

  /** heating time slot active zone 3 */
  @inherit(r_8)
  @ext(0x19, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3TimeSlotActive {
    value: yesno;
  }

  /** cooling time slot active zone 3 */
  @inherit(r_8)
  @ext(0x1A, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  @condition(_720.Hc3CoolingEnabled.value, "1")
  model Z3CoolingTimeSlotActive {
    value: yesno;
  }

  /** zone 3 status */
  @inherit(r_8)
  @ext(0x1b, 0)
  model Z3Status {
    value: zonestatus3;
  }

  /** quick veto end time zone 3 */
  @inherit(r_8)
  @ext(0x1e, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3QuickVetoEndTime {
    value: HTI;
  }

  /** end time of holidays for zone 3 */
  @inherit(r_8, w_8)
  @ext(0x20, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3HolidayEndTime {
    value: HTI;
  }

  /** start time of holidays for zone 3 */
  @inherit(r_8, w_8)
  @ext(0x21, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3HolidayStartTime {
    value: HTI;
  }

  /** manual heating setpoint zone 3 */
  @inherit(r_8, w_8)
  @ext(0x22, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3ManualTemp {
    @minValue(5)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** manual cooling setpoint zone 3 */
  @inherit(r_8, w_8)
  @ext(0x23, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  @condition(_720.Hc3CoolingEnabled.value, "1")
  model Z3CoolingManualTemp {
    @minValue(15)
    @maxValue(30)
    @step(0.5)
    value: tempv;
  }

  /** quick veto end date zone 3 */
  @inherit(r_8)
  @ext(0x24, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3QuickVetoEndDate {
    value: date;
  }

  /** quick veto duration zone 3 */
  @inherit(r_8, w_8)
  @ext(0x26, 0)
  @condition(_720.Hc3CircuitType.value, "1")
  model Z3QuickVetoDuration {
    @minValue(0.5)
    @maxValue(12)
    @step(0.5)
    @unit("h")
    value: EXP;
  }

  /** room humidity zone 3 */
  @inherit(r_8)
  @ext(0x28, 0)
  model Z3RoomHumidity {
    value: percentv;
  }

  // ##### Solar Circuit #####

  @base(MF, 0x24, 0x2, 0, 0x4, 0)
  model r_19 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x4, 0)
  model w_18 {}

  @condition(_720.FM5Config.value, "<=2")
  namespace SolarCircuit {
    /** SolarPumpKick */
    @inherit(r_19, w_18)
    @ext(0x2, 0)
    model SolarPumpKick {
      value: onoff;
    }

    /** SolarCollectorTemp */
    @inherit(r_19)
    @ext(0x3, 0)
    model SolarCollectorTemp {
      value: tempv;
    }

    /** SolarCollectorTempMin */
    @inherit(r_19, w_18)
    @ext(0x4, 0)
    model SolarCollectorTempMin {
      value: tempv;
    }

    /** SolarCollectorTempMax */
    @inherit(r_19, w_18)
    @ext(0x5, 0)
    model SolarCollectorTempMax {
      value: tempv;
    }

    /** SolarYieldTemp */
    @inherit(r_19)
    @ext(0x7, 0)
    model SolarYieldTemp {
      value: tempv;
    }

    /** SolarPump */
    @inherit(r_19)
    @ext(0x8, 0)
    model SolarPump {
      value: onoff;
    }

    /** SolarPumpHours */
    @inherit(r_19)
    @ext(0xb, 0)
    model SolarPumpHours {
      value: hoursum;
    }
  }

  // ##### Solar Cylinder 1 #####

  @base(MF, 0x24, 0x2, 0, 0x5, 0)
  model r_20 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x5, 0)
  model w_19 {}

  @condition(_720.FM5Config.value, "<=2")
  namespace SolarCylinder1 {
    /** maximum cylinder charging temperature (BottomTemp sensor) */
    @inherit(r_20, w_19)
    @ext(0x1, 0)
    model SolarCylinder1TempMax {
      value: tempv;
    }

    /** charge if the temperature difference between the cylinder temperature sensor at the bottom and the collector temperature sensor is greater */
    @inherit(r_20, w_19)
    @ext(0x2, 0)
    model SolarCylinder1SwitchOnDifferential {
      value: calibrationv;
    }

    /** turn charge off if temperature difference between the bottom cylinder temperature sensor and the collector temperature sensor is smaller */
    @inherit(r_20, w_19)
    @ext(0x3, 0)
    model SolarCylinder1SwitchOffDifferential {
      value: calibrationv;
    }
  }

  // ##### Timers #####

  /** default *r */
  model r_9 {}

  // Hot water timers
  /** default *r */
  @base(MF, 0x55, 0xa5, 0, 0x2)
  model r_10 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0, 0x2)
  model w_9 {}

  @condition(_720.HwcEnabled.value, "1")
  namespace HotWaterCircutTimer {
    // /** hwc timer Configuration */
    // @inherit(r_9)
    // @ext(MF, 0x55, 0xa3, 0, 0x2)
    // model HwcTimer_Config {
    //   /** Configuration */
    //   @maxLength(9)
    //   value: HEX;
    // }

    /** hwc timer amount */
    @inherit(r_9)
    @ext(MF, 0x55, 0xa4, 0, 0x2)
    model HwcTimer_Timeframes {
      /** Amount of configured slots per weekday */
      value: slotCountWeek;
    }

    /** hwc timer monday 1 */
    @inherit(r_10)
    @ext(0, 0)
    model HwcTimer_Monday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** hwc timer monday */
    @inherit(r_10, w_9)
    @ext(0)
    model HwcTimer_Monday {
      value: wTimeSlotWithoutTemp;
    }

    /** hwc timer tuesday 1 */
    @inherit(r_10)
    @ext(1, 0)
    model HwcTimer_Tuesday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** hwc timer tuesday */
    @inherit(r_10, w_9)
    @ext(1)
    model HwcTimer_Tuesday {
      value: wTimeSlotWithoutTemp;
    }

    /** hwc timer wednesday 1 */
    @inherit(r_10)
    @ext(2, 0)
    model HwcTimer_Wednesday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** hwc timer wednesday */
    @inherit(r_10, w_9)
    @ext(2)
    model HwcTimer_Wednesday {
      value: wTimeSlotWithoutTemp;
    }

    /** hwc timer thursday 1 */
    @inherit(r_10)
    @ext(3, 0)
    model HwcTimer_Thursday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** hwc timer thursday */
    @inherit(r_10, w_9)
    @ext(3)
    model HwcTimer_Thursday {
      value: wTimeSlotWithoutTemp;
    }

    /** hwc timer friday 1 */
    @inherit(r_10)
    @ext(4, 0)
    model HwcTimer_Friday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** hwc timer friday */
    @inherit(r_10, w_9)
    @ext(4)
    model HwcTimer_Friday {
      value: wTimeSlotWithoutTemp;
    }

    /** hwc timer saturday 1 */
    @inherit(r_10)
    @ext(5, 0)
    model HwcTimer_Saturday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** hwc timer saturday */
    @inherit(r_10, w_9)
    @ext(5)
    model HwcTimer_Saturday {
      value: wTimeSlotWithoutTemp;
    }

    /** hwc timer sunday 1 */
    @inherit(r_10)
    @ext(6, 0)
    model HwcTimer_Sunday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** hwc timer sunday */
    @inherit(r_10, w_9)
    @ext(6)
    model HwcTimer_Sunday {
      value: wTimeSlotWithoutTemp;
    }
  }

  // Circulation pump timers

  /** default *r */
  @base(MF, 0x55, 0xa5, 0, 0x3)
  model r_11 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0, 0x3)
  model w_10 {}

  @condition(_720.HwcEnabled.value, "1")
  namespace CirculationCircuitTimer {
    // /** cc timer Configuration
    // @inherit(r_9)
    // @ext(MF, 0x55, 0xa3, 0, 0x3)
    // model CcTimer_Config {
    //   /** Configuration */
    //   @maxLength(9)
    //   value: HEX;
    // }

    /** cc timer amount */
    @inherit(r_9)
    @ext(MF, 0x55, 0xa4, 0, 0x3)
    model CcTimer_Timeframes {
      /** Amount of configured slots per weekday */
      value: slotCountWeek;
    }

    /** cc timer monday 1 */
    @inherit(r_11)
    @ext(0, 0)
    model CcTimer_Monday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** cc timer monday */
    @inherit(r_11, w_10)
    @ext(0)
    model CcTimer_Monday {
      value: wTimeSlotWithoutTemp;
    }

    /** cc timer tuesday 1 */
    @inherit(r_11)
    @ext(1, 0)
    model CcTimer_Tuesday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** cc timer tuesday */
    @inherit(r_11, w_10)
    @ext(1)
    model CcTimer_Tuesday {
      value: wTimeSlotWithoutTemp;
    }

    /** cc timer wednesday 1 */
    @inherit(r_11)
    @ext(0x2, 0)
    model CcTimer_Wednesday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** cc timer wednesday */
    @inherit(r_11, w_10)
    @ext(0x2)
    model CcTimer_Wednesday {
      value: wTimeSlotWithoutTemp;
    }

    /** cc timer thursday 1 */
    @inherit(r_11)
    @ext(0x3, 0)
    model CcTimer_Thursday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** cc timer thursday */
    @inherit(r_11, w_10)
    @ext(0x3)
    model CcTimer_Thursday {
      value: wTimeSlotWithoutTemp;
    }

    /** cc timer friday 1 */
    @inherit(r_11)
    @ext(0x4, 0)
    model CcTimer_Friday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** cc timer friday */
    @inherit(r_11, w_10)
    @ext(0x4)
    model CcTimer_Friday {
      value: wTimeSlotWithoutTemp;
    }

    /** cc timer saturday 1 */
    @inherit(r_11)
    @ext(0x5, 0)
    model CcTimer_Saturday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** cc timer saturday */
    @inherit(r_11, w_10)
    @ext(0x5)
    model CcTimer_Saturday {
      value: wTimeSlotWithoutTemp;
    }

    /** cc timer sunday 1 */
    @inherit(r_11)
    @ext(0x6, 0)
    model CcTimer_Sunday0 {
      value: rTimeSlotWithoutTemp;
    }

    /** cc timer sunday */
    @inherit(r_11, w_10)
    @ext(0x6)
    model CcTimer_Sunday {
      value: wTimeSlotWithoutTemp;
    }
  }

  // Silent mode timers

  /** default *r */
  @base(MF, 0x55, 0xa5, 0, 0x4)
  model r_12 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0, 0x4)
  model w_11 {}

  // /** silent timer Configuration */
  // @inherit(r_9)
  // @ext(MF, 0x55, 0xa3, 0, 0x4)
  // model SilentTimer_Config {
  //   /** Configuration */
  //   @maxLength(9)
  //   value: HEX;
  // }

  /** silent timer amount */
  @inherit(r_9)
  @ext(MF, 0x55, 0xa4, 0, 0x4)
  model SilentTimer_Timeframes {
    /** Amount of configured slots per weekday */
    value: slotCountWeek;
  }

  /** silent timer monday 1 */
  @inherit(r_12)
  @ext(0, 0)
  model SilentTimer_Monday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** silent timer monday */
  @inherit(r_12, w_11)
  @ext(0)
  model SilentTimer_Monday {
    value: wTimeSlotWithoutTemp;
  }

  /** silent timer tuesday 1 */
  @inherit(r_12)
  @ext(1, 0)
  model SilentTimer_Tuesday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** silent timer tuesday */
  @inherit(r_12, w_11)
  @ext(1)
  model SilentTimer_Tuesday {
    value: wTimeSlotWithoutTemp;
  }

  /** silent timer wednesday 1 */
  @inherit(r_12)
  @ext(0x2, 0)
  model SilentTimer_Wednesday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** silent timer wednesday */
  @inherit(r_12, w_11)
  @ext(0x2)
  model SilentTimer_Wednesday {
    value: wTimeSlotWithoutTemp;
  }

  /** silent timer thursday 1 */
  @inherit(r_12)
  @ext(0x3, 0)
  model SilentTimer_Thursday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** silent timer thursday */
  @inherit(r_12, w_11)
  @ext(0x3)
  model SilentTimer_Thursday {
    value: wTimeSlotWithoutTemp;
  }

  /** silent timer friday 1 */
  @inherit(r_12)
  @ext(0x4, 0)
  model SilentTimer_Friday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** silent timer friday */
  @inherit(r_12, w_11)
  @ext(0x4)
  model SilentTimer_Friday {
    value: wTimeSlotWithoutTemp;
  }

  /** silent timer saturday 1 */
  @inherit(r_12)
  @ext(0x5, 0)
  model SilentTimer_Saturday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** silent timer saturday */
  @inherit(r_12, w_11)
  @ext(0x5)
  model SilentTimer_Saturday {
    value: wTimeSlotWithoutTemp;
  }

  /** silent timer sunday 1 */
  @inherit(r_12)
  @ext(0x6, 0)
  model SilentTimer_Sunday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** silent timer sunday */
  @inherit(r_12, w_11)
  @ext(0x6)
  model SilentTimer_Sunday {
    value: wTimeSlotWithoutTemp;
  }

  // Heating timers zone 1

  /** default *r */
  @base(MF, 0x55, 0xa5, 0, 0)
  model r_13 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0, 0)
  model w_12 {}

  @condition(_720.Hc1CircuitType.value, "1")
  namespace Zone1HeatingTimer {
    // /** timer Configuration */
    // @inherit(r_9)
    // @ext(MF, 0x55, 0xa3, 0, 0)
    // model Z1Timer_Config {
    //   /** Configuration */
    //   @maxLength(9)
    //   value: HEX;
    // }

    /** timer amount */
    @inherit(r_9)
    @ext(MF, 0x55, 0xa4, 0, 0)
    model Z1Timer_Timeframes {
      /** Amount of configured slots per weekday */
      value: slotCountWeek;
    }

    /** timer heating monday 1 */
    @inherit(r_13)
    @ext(0, 0)
    model Z1Timer_Monday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating monday */
    @inherit(r_13, w_12)
    @ext(0)
    model Z1Timer_Monday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating tuesday 1 */
    @inherit(r_13)
    @ext(1, 0)
    model Z1Timer_Tuesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating tuesday */
    @inherit(r_13, w_12)
    @ext(1)
    model Z1Timer_Tuesday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating wednesday 1 */
    @inherit(r_13)
    @ext(0x2, 0)
    model Z1Timer_Wednesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating wednesday */
    @inherit(r_13, w_12)
    @ext(0x2)
    model Z1Timer_Wednesday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating thursday 1 */
    @inherit(r_13)
    @ext(0x3, 0)
    model Z1Timer_Thursday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating thursday */
    @inherit(r_13, w_12)
    @ext(0x3)
    model Z1Timer_Thursday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating friday 1 */
    @inherit(r_13)
    @ext(0x4, 0)
    model Z1Timer_Friday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating friday */
    @inherit(r_13, w_12)
    @ext(0x4)
    model Z1Timer_Friday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating saturday 1 */
    @inherit(r_13)
    @ext(0x5, 0)
    model Z1Timer_Saturday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating saturday */
    @inherit(r_13, w_12)
    @ext(0x5)
    model Z1Timer_Saturday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating sunday 1 */
    @inherit(r_13)
    @ext(0x6, 0)
    model Z1Timer_Sunday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating sunday */
    @inherit(r_13, w_12)
    @ext(0x6)
    model Z1Timer_Sunday {
      value: wTimeSlotWithTemp;
    }
  }

  // Cooling timers zone 1

  /** default *r */
  @base(MF, 0x55, 0xa5, 0, 1)
  model r_14 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0, 1)
  model w_13 {}

  // /** timer Configuration */
  // @inherit(r_9)
  // @ext(MF, 0x55, 0xa3, 0, 1)
  // model Z1CoolingTimer_Config {
  //   /** Configuration */
  //   @maxLength(9)
  //   value: HEX;
  // }

  @condition(_720.Hc1CircuitType.value, "1")
  @condition(_720.Hc1CoolingEnabled.value, "1")
  namespace Zone1CoolingTimer {
    /** timer amount */
    @inherit(r_9)
    @ext(MF, 0x55, 0xa4, 0, 1)
    model Z1CoolingTimer_Timeframes {
      /** Amount of configured slots per weekday */
      value: slotCountWeek;
    }

    /** timer cooling monday 1 */
    @inherit(r_14)
    @ext(0, 0)
    model Z1CoolingTimer_Monday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling monday */
    @inherit(r_14, w_13)
    @ext(0)
    model Z1CoolingTimer_Monday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling tuesday 1 */
    @inherit(r_14)
    @ext(1, 0)
    model Z1CoolingTimer_Tuesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling tuesday */
    @inherit(r_14, w_13)
    @ext(1)
    model Z1CoolingTimer_Tuesday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling wednesday 1 */
    @inherit(r_14)
    @ext(0x2, 0)
    model Z1CoolingTimer_Wednesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling wednesday */
    @inherit(r_14, w_13)
    @ext(0x2)
    model Z1CoolingTimer_Wednesday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling thursday 1 */
    @inherit(r_14)
    @ext(0x3, 0)
    model Z1CoolingTimer_Thursday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling thursday */
    @inherit(r_14, w_13)
    @ext(0x3)
    model Z1CoolingTimer_Thursday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling friday 1 */
    @inherit(r_14)
    @ext(0x4, 0)
    model Z1CoolingTimer_Friday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling friday */
    @inherit(r_14, w_13)
    @ext(0x4)
    model Z1CoolingTimer_Friday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling saturday 1 */
    @inherit(r_14)
    @ext(0x5, 0)
    model Z1CoolingTimer_Saturday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling saturday */
    @inherit(r_14, w_13)
    @ext(0x5)
    model Z1CoolingTimer_Saturday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling sunday 1 */
    @inherit(r_14)
    @ext(0x6, 0)
    model Z1CoolingTimer_Sunday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling sunday */
    @inherit(r_14, w_13)
    @ext(0x6)
    model Z1CoolingTimer_Sunday {
      value: wTimeSlotWithoutTemp;
    }
  }

  // Heating timers zone 2

  /** default *r */
  @base(MF, 0x55, 0xa5, 1, 0)
  model r_15 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 1, 0)
  model w_14 {}

  // /** timer Configuration */
  // @inherit(r_9)
  // @ext(MF, 0x55, 0xa3, 1, 0)
  // model Z2Timer_Config {
  //   /** Configuration */
  //   @maxLength(9)
  //   value: HEX;
  // }

  @condition(_720.Hc2CircuitType.value, "1")
  namespace Zone2HeatingTimer {
    /** timer amount */
    @inherit(r_9)
    @ext(MF, 0x55, 0xa4, 1, 0)
    model Z2Timer_Timeframes {
      /** Amount of configured slots per weekday */
      value: slotCountWeek;
    }

    /** timer heating monday 1 */
    @inherit(r_15)
    @ext(0, 0)
    model Z2Timer_Monday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating monday */
    @inherit(r_15, w_14)
    @ext(0)
    model Z2Timer_Monday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating tuesday 1 */
    @inherit(r_15)
    @ext(1, 0)
    model Z2Timer_Tuesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating tuesday */
    @inherit(r_15, w_14)
    @ext(1)
    model Z2Timer_Tuesday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating wednesday 1 */
    @inherit(r_15)
    @ext(0x2, 0)
    model Z2Timer_Wednesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating wednesday */
    @inherit(r_15, w_14)
    @ext(0x2)
    model Z2Timer_Wednesday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating thursday 1 */
    @inherit(r_15)
    @ext(0x3, 0)
    model Z2Timer_Thursday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating thursday */
    @inherit(r_15, w_14)
    @ext(0x3)
    model Z2Timer_Thursday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating friday 1 */
    @inherit(r_15)
    @ext(0x4, 0)
    model Z2Timer_Friday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating friday */
    @inherit(r_15, w_14)
    @ext(0x4)
    model Z2Timer_Friday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating saturday 1 */
    @inherit(r_15)
    @ext(0x5, 0)
    model Z2Timer_Saturday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating saturday */
    @inherit(r_15, w_14)
    @ext(0x5)
    model Z2Timer_Saturday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating sunday 1 */
    @inherit(r_15)
    @ext(0x6, 0)
    model Z2Timer_Sunday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating sunday */
    @inherit(r_15, w_14)
    @ext(0x6)
    model Z2Timer_Sunday {
      value: wTimeSlotWithTemp;
    }
  }

  // Cooling timers zone 2

  /** default *r */
  @base(MF, 0x55, 0xa5, 1, 1)
  model r_16 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 1, 1)
  model w_15 {}

  // /** timer Configuration */
  // @inherit(r_9)
  // @ext(MF, 0x55, 0xa3, 1, 1)
  // model Z2CoolingTimer_Config {
  //   /** Configuration */
  //   @maxLength(9)
  //   value: HEX;
  // }

  @condition(_720.Hc2CircuitType.value, "1")
  @condition(_720.Hc2CoolingEnabled.value, "1")
  namespace Zone2CoolingTimer {
    /** timer amount */
    @inherit(r_9)
    @ext(MF, 0x55, 0xa4, 1, 1)
    model Z2CoolingTimer_Timeframes {
      /** Amount of configured slots per weekday */
      value: slotCountWeek;
    }

    /** timer cooling monday 1 */
    @inherit(r_16)
    @ext(0, 0)
    model Z2CoolingTimer_Monday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling monday */
    @inherit(r_16, w_15)
    @ext(0)
    model Z2CoolingTimer_Monday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling tuesday 1 */
    @inherit(r_16)
    @ext(1, 0)
    model Z2CoolingTimer_Tuesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling tuesday */
    @inherit(r_16, w_15)
    @ext(1)
    model Z2CoolingTimer_Tuesday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling wednesday 1 */
    @inherit(r_16)
    @ext(0x2, 0)
    model Z2CoolingTimer_Wednesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling wednesday */
    @inherit(r_16, w_15)
    @ext(0x2)
    model Z2CoolingTimer_Wednesday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling thursday 1 */
    @inherit(r_16)
    @ext(0x3, 0)
    model Z2CoolingTimer_Thursday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling thursday */
    @inherit(r_16, w_15)
    @ext(0x3)
    model Z2CoolingTimer_Thursday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling friday 1 */
    @inherit(r_16)
    @ext(0x4, 0)
    model Z2CoolingTimer_Friday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling friday */
    @inherit(r_16, w_15)
    @ext(0x4)
    model Z2CoolingTimer_Friday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling saturday 1 */
    @inherit(r_16)
    @ext(0x5, 0)
    model Z2CoolingTimer_Saturday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling saturday */
    @inherit(r_16, w_15)
    @ext(0x5)
    model Z2CoolingTimer_Saturday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling sunday 1 */
    @inherit(r_16)
    @ext(0x6, 0)
    model Z2CoolingTimer_Sunday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling sunday */
    @inherit(r_16, w_15)
    @ext(0x6)
    model Z2CoolingTimer_Sunday {
      value: wTimeSlotWithoutTemp;
    }
  }

  // Heating timers zone 3

  /** default *r */
  @base(MF, 0x55, 0xa5, 2, 0)
  model r_17 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 2, 0)
  model w_16 {}

  // /** timer Configuration */
  // @inherit(r_9)
  // @ext(MF, 0x55, 0xa3, 2, 0)
  // model Z3Timer_Config {
  //   /** Configuration */
  //   @maxLength(9)
  //   value: HEX;
  // }

  @condition(_720.Hc3CircuitType.value, "1")
  namespace Zone3HeatingTimer {
    /** timer amount */
    @inherit(r_9)
    @ext(MF, 0x55, 0xa4, 2, 0)
    model Z3Timer_Timeframes {
      /** Amount of configured slots per weekday */
      value: slotCountWeek;
    }

    /** timer heating monday 1 */
    @inherit(r_17)
    @ext(0, 0)
    model Z3Timer_Monday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating monday */
    @inherit(r_17, w_16)
    @ext(0)
    model Z3Timer_Monday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating tuesday 1 */
    @inherit(r_17)
    @ext(1, 0)
    model Z3Timer_Tuesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating tuesday */
    @inherit(r_17, w_16)
    @ext(1)
    model Z3Timer_Tuesday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating wednesday 1 */
    @inherit(r_17)
    @ext(0x2, 0)
    model Z3Timer_Wednesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating wednesday */
    @inherit(r_17, w_16)
    @ext(0x2)
    model Z3Timer_Wednesday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating thursday 1 */
    @inherit(r_17)
    @ext(0x3, 0)
    model Z3Timer_Thursday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating thursday */
    @inherit(r_17, w_16)
    @ext(0x3)
    model Z3Timer_Thursday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating friday 1 */
    @inherit(r_17)
    @ext(0x4, 0)
    model Z3Timer_Friday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating friday */
    @inherit(r_17, w_16)
    @ext(0x4)
    model Z3Timer_Friday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating saturday 1 */
    @inherit(r_17)
    @ext(0x5, 0)
    model Z3Timer_Saturday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating saturday */
    @inherit(r_17, w_16)
    @ext(0x5)
    model Z3Timer_Saturday {
      value: wTimeSlotWithTemp;
    }

    /** timer heating sunday 1 */
    @inherit(r_17)
    @ext(0x6, 0)
    model Z3Timer_Sunday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer heating sunday */
    @inherit(r_17, w_16)
    @ext(0x6)
    model Z3Timer_Sunday {
      value: wTimeSlotWithTemp;
    }
  }

  // Cooling timers zone 3

  /** default *r */
  @base(MF, 0x55, 0xa5, 2, 1)
  model r_18 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 2, 1)
  model w_17 {}

  // /** timer Configuration */
  // @inherit(r_9)
  // @ext(MF, 0x55, 0xa3, 2, 1)
  // model Z3CoolingTimer_Config {
  //   /** Configuration */
  //   @maxLength(9)
  //   value: HEX;
  // }

  @condition(_720.Hc3CircuitType.value, "1")
  @condition(_720.Hc3CoolingEnabled.value, "1")
  namespace Zone3CoolingTimer {
    /** timer amount */
    @inherit(r_9)
    @ext(MF, 0x55, 0xa4, 2, 1)
    model Z3CoolingTimer_Timeframes {
      /** Amount of configured slots per weekday */
      value: slotCountWeek;
    }

    /** timer cooling monday 1 */
    @inherit(r_18)
    @ext(0, 0)
    model Z3CoolingTimer_Monday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling monday */
    @inherit(r_18, w_17)
    @ext(0)
    model Z3CoolingTimer_Monday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling tuesday 1 */
    @inherit(r_18)
    @ext(1, 0)
    model Z3CoolingTimer_Tuesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling tuesday */
    @inherit(r_18, w_17)
    @ext(1)
    model Z3CoolingTimer_Tuesday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling wednesday 1 */
    @inherit(r_18)
    @ext(0x2, 0)
    model Z3CoolingTimer_Wednesday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling wednesday */
    @inherit(r_18, w_17)
    @ext(0x2)
    model Z3CoolingTimer_Wednesday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling thursday 1 */
    @inherit(r_18)
    @ext(0x3, 0)
    model Z3CoolingTimer_Thursday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling thursday */
    @inherit(r_18, w_17)
    @ext(0x3)
    model Z3CoolingTimer_Thursday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling friday 1 */
    @inherit(r_18)
    @ext(0x4, 0)
    model Z3CoolingTimer_Friday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling friday */
    @inherit(r_18, w_17)
    @ext(0x4)
    model Z3CoolingTimer_Friday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling saturday 1 */
    @inherit(r_18)
    @ext(0x5, 0)
    model Z3CoolingTimer_Saturday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling saturday */
    @inherit(r_18, w_17)
    @ext(0x5)
    model Z3CoolingTimer_Saturday {
      value: wTimeSlotWithoutTemp;
    }

    /** timer cooling sunday 1 */
    @inherit(r_18)
    @ext(0x6, 0)
    model Z3CoolingTimer_Sunday0 {
      value: rTimeSlotWithTemp;
    }

    /** timer cooling sunday */
    @inherit(r_18, w_17)
    @ext(0x6)
    model Z3CoolingTimer_Sunday {
      value: wTimeSlotWithoutTemp;
    }
  }

  // ##### Room Sensors #####

  // 720 regulator

  /** default *r */
  @base(MF, 0x24, 0x6, 0, 9, 1)
  model r_21 {
    @maxLength(4)
    ign: IGN;
  }

  /** room humidity shown by regulator */
  @inherit(r_21)
  @ext(0x7, 0)
  model RoomHumidity {
    value: percentv;
  }

  /** room temperature shown by regulator */
  @inherit(r_21)
  @ext(0xf, 0)
  model RoomTemp {
    value: tempv;
  }

  // VR92 address 1

  /** default *r */
  @base(MF, 0x24, 0x6, 0, 0xa, 1)
  model r_22 {
    @maxLength(4)
    ign: IGN;
  }

  /** room humidity shown by VR92 address 1 */
  @inherit(r_22)
  @ext(0x7, 0)
  model VR92Addr1RoomHumidity {
    value: percentv;
  }

  /** room temperature shown by VR92 address 1 */
  @inherit(r_22)
  @ext(0xf, 0)
  model VR92Addr1RoomTemp {
    value: tempv;
  }

  // VR92 address 2

  /** default *r */
  @base(MF, 0x24, 0x6, 0, 0xa, 2)
  model r_23 {
    @maxLength(4)
    ign: IGN;
  }

  /** room humidity shown by VR92 address 2 */
  @inherit(r_23)
  @ext(0x7, 0)
  model VR92Addr2RoomHumidity {
    value: percentv;
  }

  /** room temperature shown by VR92 address 2 */
  @inherit(r_23)
  @ext(0xf, 0)
  model VR92Addr2RoomTemp {
    value: tempv;
  }

  // VR92 address 3

  /** default *r */
  @base(MF, 0x24, 0x6, 0, 0xa, 3)
  model r_24 {
    @maxLength(4)
    ign: IGN;
  }

  /** room humidity shown by VR92 address 3 */
  @inherit(r_24)
  @ext(0x7, 0)
  model VR92Addr3RoomHumidity {
    value: percentv;
  }

  /** room temperature shown by VR92 address 3 */
  @inherit(r_24)
  @ext(0xf, 0)
  model VR92Addr3RoomTemp {
    value: tempv;
  }

  // VR92 address 4

  /** default *r */
  @base(MF, 0x24, 0x6, 0, 0xa, 4)
  model r_25 {
    @maxLength(4)
    ign: IGN;
  }

  /** room humidity shown by VR92 address 4 */
  @inherit(r_25)
  @ext(0x7, 0)
  model VR92Addr4RoomHumidity {
    value: percentv;
  }

  /** room temperature shown by VR92 address 4 */
  @inherit(r_25)
  @ext(0xf, 0)
  model VR92Addr4RoomTemp {
    value: tempv;
  }

  // VR92 address 5

  /** default *r */
  @base(MF, 0x24, 0x6, 0, 0xa, 5)
  model r_26 {
    @maxLength(4)
    ign: IGN;
  }

  /** room humidity shown by VR92 address 5 */
  @inherit(r_26)
  @ext(0x7, 0)
  model VR92Addr5RoomHumidity {
    value: percentv;
  }

  /** room temperature shown by VR92 address 5 */
  @inherit(r_26)
  @ext(0xf, 0)
  model VR92Addr5RoomTemp {
    value: tempv;
  }

  // VR92 address 6

  /** default *r */
  @base(MF, 0x24, 0x6, 0, 0xa, 6)
  model r_27 {
    @maxLength(4)
    ign: IGN;
  }

  /** room humidity shown by VR92 address 6 */
  @inherit(r_27)
  @ext(0x7, 0)
  model VR92Addr6RoomHumidity {
    value: percentv;
  }

  /** room temperature shown by VR92 address 6 */
  @inherit(r_27)
  @ext(0xf, 0)
  model VR92Addr6RoomTemp {
    value: tempv;
  }

  // VR92 address 7

  /** default *r */
  @base(MF, 0x24, 0x6, 0, 0xa, 7)
  model r_28 {
    @maxLength(4)
    ign: IGN;
  }

  /** room humidity shown by VR92 address 7 */
  @inherit(r_28)
  @ext(0x7, 0)
  model VR92Addr7RoomHumidity {
    value: percentv;
  }

  /** room temperature shown by VR92 address 7 */
  @inherit(r_28)
  @ext(0xf, 0)
  model VR92Addr7RoomTemp {
    value: tempv;
  }

  // VR92 address 8

  /** default *r */
  @base(MF, 0x24, 0x6, 0, 0xa, 8)
  model r_29 {
    @maxLength(4)
    ign: IGN;
  }

  /** room humidity shown by VR92 address 8 */
  @inherit(r_29)
  @ext(0x7, 0)
  model VR92Addr8RoomHumidity {
    value: percentv;
  }

  /** room temperature shown by VR92 address 8 */
  @inherit(r_29)
  @ext(0xf, 0)
  model VR92Addr8RoomTemp {
    value: tempv;
  }

  enum Values_720ErrorStatus {
    None: 0,
    Ongoing: 1,
    Resolved: 2,
  }

  // includes

  /** included parts */
  union _includes {
    B516_inc,
  }
}
