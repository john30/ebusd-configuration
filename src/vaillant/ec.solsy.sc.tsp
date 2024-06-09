import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./iotest620_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0xec)
namespace solsy.sc {
  // ,SOLSY,auroMATIC 620/3,0020080463 163 Solar

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x9, 0xe)
  model ws {}
  // ##### Statistics #####

  /** StatPowerOn */
  @inherit(r)
  @ext(0xcc, 0)
  model StatPowerOn {
    value: UIN;
  }

  /** StatOperatingHours */
  @inherit(r)
  @ext(0xcd, 0)
  model StatOperatingHours {
    value: UIN;
  }

  /** StatMonthOfInstallation */
  @inherit(r)
  @ext(0xce, 0)
  model StatMonthOfInstallation {
    value: UCH;
  }

  /** StatYearOfInstallation */
  @inherit(r)
  @ext(0xcf, 0)
  model StatYearOfInstallation {
    value: UCH;
  }

  /** Stat15MinBusTimeout */
  @inherit(r)
  @ext(0xd0, 0)
  model Stat15MinBusTimeout {
    value: UCH;
  }

  /** StatRTOSErrorcode */
  @inherit(r)
  @ext(0xd1, 0)
  model StatRTOSErrorcode {
    value: UIN;
  }

  /** StatRestarts */
  @inherit(r)
  @ext(0xd2, 0)
  model StatRestarts {
    value: UIN;
  }

  /** StatRTOSErrorCounter */
  @inherit(r)
  @ext(0xd3, 0)
  model StatRTOSErrorCounter {
    value: UIN;
  }
  // ##### SOLAR: Data #####

  /** Storage1Sensor3 */
  @inherit(r)
  @ext(0, 0)
  model Storage1Sensor3 {
    /** Temperature of SP1 sensor */
    value: tempsensor;
  }

  /** Storage2Sensor3 */
  @inherit(r)
  @ext(0x2, 0)
  model Storage2Sensor3 {
    /** Temperature of SP2 sensor */
    value: tempsensor;
  }

  /** Storage3Sensor3 */
  @inherit(r)
  @ext(0x5, 0)
  model Storage3Sensor3 {
    /** Temperature of SP3 sensor */
    value: tempsensor;
  }

  /** CollectorPumpHRuntime1 */
  @inherit(r)
  @ext(0x6e, 0)
  model CollPumpHRuntime1 {
    /** Overall runtime of COL1 pump */
    value: hoursum2;
  }

  /** CollectorPumpHRuntime2 */
  @inherit(r)
  @ext(0x6e, 0x8)
  model CollPumpHRuntime2 {
    /** Overall runtime of COL2 pump */
    value: hoursum2;
  }

  /** YieldSensor */
  @inherit(r, w)
  @ext(0x8, 0)
  model YieldSensor {
    /** Temperature of "Ertrag" sensor */
    value: tempsensor;
  }

  /** Collector1Sensor */
  @inherit(r)
  @ext(0x9, 0)
  model Coll1Sensor {
    /** Temperature of COL1 sensor */
    value: tempsensor;
  }

  /** Storage4Sensor3 */
  @inherit(r)
  @ext(0x14, 0)
  model Storage4Sensor3 {
    /** Temperature of SP4 sensor */
    value: tempsensor;
  }

  /** SumBackflowSensor */
  @inherit(r)
  @ext(0x7, 0)
  model SumBackflowSensor {
    /** Temperature of TD2 sensor */
    value: tempsensor;
  }

  /** Collector2Sensor */
  @inherit(r)
  @ext(0x15, 0)
  model Coll2Sensor {
    /** Temperature of COL2 sensor */
    value: tempsensor;
  }

  /** SolarCollectorPumpED1 */
  @inherit(r)
  @ext(0x67, 0)
  model SolCollPumpED1 {
    /** Percantage of power COL1 pump is running actually */
    value: percent0;
  }

  /** SolarCollectorPumpED2 */
  @inherit(r)
  @ext(0x67, 0x8)
  model SolCollPumpED2 {
    /** Percantage of power COL2 pump is running actually */
    value: percent0;
  }

  /** TeleSwitch */
  @inherit(r)
  @ext(0xa, 0)
  model TeleSwitch {
    /** State of the Teleswitch */
    value: onoff;
  }

  /** HasSolarCollectorVolumeSensor */
  @inherit(r)
  @ext(0x9a, 0)
  model HasSolCollVolumeSensor {
    /**  */
    value: yesno;
  }

  /** SolarCollectorVolumeSensorPowerLastMinute */
  @inherit(r)
  @ext(0x9b, 0)
  model SolCollVolumeSensorPowerLastMinut {
    /**  */
    @unit("l/h")
    value: UIN;
  }

  /** Multi purpose output */
  @inherit(r)
  @ext(0x1c, 0)
  model OutputMA {
    /** State of multi purpose output */
    value: onoff;
  }
  // ##### SOLAR: Configuration #####

  /** SolEnableDiffTemp1 */
  @inherit(r, w)
  @ext(0x63, 0)
  model SolEnableDiffTemp1 {
    /** Temperature difference between collector 1 and tank, which is necassary to start solar pump */
    value: temp0;
  }

  /** DeltaTOnFlexDtController */
  @inherit(r, w)
  @ext(0xa6, 0)
  model DeltaTOnFlexDtController {
    /** Temperature difference between flexible deltaT sensors, which is necassary to start solar pump */
    value: calibration0;
  }

  /** DeltaTOffFlexDtController */
  @inherit(r, w)
  @ext(0xa7, 0)
  model DeltaTOffFlexDtController {
    /** Temperature difference between flexible deltaT sensors, which is necassary to stop solar pump */
    value: calibration0;
  }

  /** SolEnableDiffTemp2 */
  @inherit(r, w)
  @ext(0x63, 0x8)
  model SolEnableDiffTemp2 {
    /** Temperature difference between collector 2 and tank, which is necassary to start solar pump */
    value: temp0;
  }

  /** SolDisableDiffTemp1 */
  @inherit(r, w)
  @ext(0x64, 0)
  model SolDisableDiffTemp1 {
    /** Temperature difference between collector 1 and tank, at which pump stops */
    value: temp0;
  }

  /** SolDisableDiffTemp2 */
  @inherit(r, w)
  @ext(0x64, 0x8)
  model SolDisableDiffTemp2 {
    /** Temperature difference between collector 2 and tank, at which pump stops */
    value: temp0;
  }

  /** SolDhwMaxLoadTemp1 */
  @inherit(r, w)
  @ext(0x65, 0)
  model SolHwcMaxLoadTemp1 {
    /** Maximal temperature for solar loading of tank1 */
    value: temp0;
  }

  /** SolDhwMaxLoadTemp2 */
  @inherit(r, w)
  @ext(0x65, 0x8)
  model SolHwcMaxLoadTemp2 {
    /** Maximal temperature for solar loading of tank2 */
    value: temp0;
  }

  /** SolarProtection */
  @inherit(r, w)
  @ext(0x81, 0)
  model SolProtection {
    /** Collector pump should not start for high temperatures */
    value: onoff;
  }

  /** SolarProtectionStartTemp */
  @inherit(r, w)
  @ext(0x82, 0)
  model SolProtectionStartTemp {
    /** Temperature for collector pump protection in case of high temperatures */
    value: temp0;
  }

  /** ColKickGradient */
  @inherit(r, ws)
  @ext(0x9d, 0)
  model ColKickGradient {
    @unit("0.1 K / 30 min")
    value: UCH;
  }

  /** ColKickPumpTime */
  @inherit(r, ws)
  @ext(0x9e, 0)
  model ColKickPumpTime {
    value: seconds0;
  }

  /** SolarCircuitProtectionHysteresis */
  @inherit(r, w)
  @ext(0x9f, 0)
  model ScProtectionHysteresis {
    /** After collector pump protection in case of too high temperatures, the collector has to cool down at least this temperature */
    value: desiredtemp;
  }

  /** FrostProtectionLimit */
  @inherit(r)
  @ext(0xa2, 0)
  model FrostProtectionLimit {
    /** limits for the solar collector frost protection */
    @unit("K")
    value: SCH;
  }

  /** FrostProtectionEnabled */
  @inherit(r)
  @ext(0xa3, 0)
  model FrostProtectionEnabled {
    /** Solar collector frost protection on/off */
    value: onoff;
  }

  /** SolarCollectorVolumeSensorTicksPer10Liter */
  @inherit(r)
  @ext(0xb0, 0)
  model SolCollVolumeSensorTicksPer10Lite {
    /** How often the volume sensor has to pulse for the detection of 10 liters */
    @unit("ticks")
    value: UCH;
  }

  /** SolarFlowRate */
  @inherit(r, w)
  @ext(0x74, 0)
  model SolFlowRate {
    /** Flow rate the collector pumps are able to deliver for 100% power */
    @unit("l/min")
    @divisor(60)
    value: UIN;
  }

  /** SolEnablePumpPWM */
  @inherit(r, w)
  @ext(0xae, 0)
  model SolEnablePumpPWM {
    /** Collector pumps should be driven by a slow pulse width modulation */
    value: onoff;
  }

  /** ExtendedYieldCalculation */
  @inherit(r, w)
  @ext(0x7f, 0)
  model ExtendedYieldCalculation {
    /** calculate solar yield like specified by austrian regulation. Uses SP3 or this purpose! */
    value: onoff;
  }

  /** SolarPriority */
  @inherit(r, w)
  @ext(0x99, 0)
  model SolPriority {
    /** Priority of water tanks for solar loading algorithms. 1 = SP2 2 = SP3 */
    @values(values_SolPriority)
    value: UCH;
  }

  /** SolOperatingMode */
  @inherit(r)
  @ext(0xac, 0)
  model SolOperatingMode {
    /** Operating mode solar */
    value: UCH;
  }

  /** SolTeleswitchOperatingMode */
  @inherit(r)
  @ext(0xad, 0)
  model SolTeleswitchOperatingMode {
    /** Teleswitch operating mode solar */
    value: UCH;
  }

  /** KolMinTemperature1 */
  @inherit(r, w)
  @ext(0xa0, 0)
  model KolTempMin1 {
    /** Temperature COL1 sensor has to reach before starting pumps at least */
    value: temp0;
  }

  /** KolMinTemperature2 */
  @inherit(r, w)
  @ext(0xa0, 0x8)
  model KolTempMin2 {
    /** Temperature COL2 sensor has to reach before starting pumps at least */
    value: temp0;
  }

  enum values_SolPriority {
    _1_2: 16,
    _2_1: 4,
  }

  /** included parts */
  union _includes {
    iotest620_inc,
    errors_inc,
  }
}
