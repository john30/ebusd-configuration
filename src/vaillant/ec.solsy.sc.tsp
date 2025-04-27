import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./iotest620_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0xec)
namespace Solsy.Sc {
  // ,SOLSY,auroMATIC 620/3,0020080463 163 Solar
  // ##### Statistics #####

  /** StatPowerOn */
  @ext(0xcc, 0)
  model StatPowerOn is ReadonlyRegister<UIN>;

  /** StatOperatingHours */
  @ext(0xcd, 0)
  model StatOperatingHours is ReadonlyRegister<UIN>;

  /** StatMonthOfInstallation */
  @ext(0xce, 0)
  model StatMonthOfInstallation is ReadonlyRegister<UCH>;

  /** StatYearOfInstallation */
  @ext(0xcf, 0)
  model StatYearOfInstallation is ReadonlyRegister<UCH>;

  /** Stat15MinBusTimeout */
  @ext(0xd0, 0)
  model Stat15MinBusTimeout is ReadonlyRegister<UCH>;

  /** StatRTOSErrorcode */
  @ext(0xd1, 0)
  model StatRTOSErrorcode is ReadonlyRegister<UIN>;

  /** StatRestarts */
  @ext(0xd2, 0)
  model StatRestarts is ReadonlyRegister<UIN>;

  /** StatRTOSErrorCounter */
  @ext(0xd3, 0)
  model StatRTOSErrorCounter is ReadonlyRegister<UIN>;
  // ##### SOLAR: Data #####

  /** Storage1Sensor3: Temperature of SP1 sensor */
  @ext(0, 0)
  model Storage1Sensor3 is ReadonlyRegister<tempsensor>;

  /** Storage2Sensor3: Temperature of SP2 sensor */
  @ext(0x2, 0)
  model Storage2Sensor3 is ReadonlyRegister<tempsensor>;

  /** Storage3Sensor3: Temperature of SP3 sensor */
  @ext(0x5, 0)
  model Storage3Sensor3 is ReadonlyRegister<tempsensor>;

  /** CollectorPumpHRuntime1: Overall runtime of COL1 pump */
  @ext(0x6e, 0)
  model CollPumpHRuntime1 is ReadonlyRegister<hoursum2>;

  /** CollectorPumpHRuntime2: Overall runtime of COL2 pump */
  @ext(0x6e, 0x8)
  model CollPumpHRuntime2 is ReadonlyRegister<hoursum2>;

  /** YieldSensor: Temperature of "Ertrag" sensor */
  @ext(0x8, 0)
  model YieldSensor is Register<tempsensor>;

  /** Collector1Sensor: Temperature of COL1 sensor */
  @ext(0x9, 0)
  model Coll1Sensor is ReadonlyRegister<tempsensor>;

  /** Storage4Sensor3: Temperature of SP4 sensor */
  @ext(0x14, 0)
  model Storage4Sensor3 is ReadonlyRegister<tempsensor>;

  /** SumBackflowSensor: Temperature of TD2 sensor */
  @ext(0x7, 0)
  model SumBackflowSensor is ReadonlyRegister<tempsensor>;

  /** Collector2Sensor: Temperature of COL2 sensor */
  @ext(0x15, 0)
  model Coll2Sensor is ReadonlyRegister<tempsensor>;

  /** SolarCollectorPumpED1: Percantage of power COL1 pump is running actually */
  @ext(0x67, 0)
  model SolCollPumpED1 is ReadonlyRegister<percent0>;

  /** SolarCollectorPumpED2: Percantage of power COL2 pump is running actually */
  @ext(0x67, 0x8)
  model SolCollPumpED2 is ReadonlyRegister<percent0>;

  /** State of the Teleswitch */
  @ext(0xa, 0)
  model TeleSwitch is ReadonlyRegister<onoff>;

  /** HasSolarCollectorVolumeSensor: - */
  @ext(0x9a, 0)
  model HasSolCollVolumeSensor is ReadonlyRegister<yesno>;

  /** SolarCollectorVolumeSensorPowerLastMinute */
  @inherit(r)
  @ext(0x9b, 0)
  model SolCollVolumeSensorPowerLastMinut {
    /**  */
    @unit("l/h")
    value: UIN;
  }

  /** State of multi purpose output */
  @ext(0x1c, 0)
  model OutputMA is ReadonlyRegister<onoff>;
  // ##### SOLAR: Configuration #####

  /** SolEnableDiffTemp1: Temperature difference between collector 1 and tank, which is necassary to start solar pump */
  @ext(0x63, 0)
  model SolEnableDiffTemp1 is Register<temp0>;

  /** DeltaTOnFlexDtController: Temperature difference between flexible deltaT sensors, which is necassary to start solar pump */
  @ext(0xa6, 0)
  model DeltaTOnFlexDtController is Register<calibration0>;

  /** DeltaTOffFlexDtController: Temperature difference between flexible deltaT sensors, which is necassary to stop solar pump */
  @ext(0xa7, 0)
  model DeltaTOffFlexDtController is Register<calibration0>;

  /** SolEnableDiffTemp2: Temperature difference between collector 2 and tank, which is necassary to start solar pump */
  @ext(0x63, 0x8)
  model SolEnableDiffTemp2 is Register<temp0>;

  /** SolDisableDiffTemp1: Temperature difference between collector 1 and tank, at which pump stops */
  @ext(0x64, 0)
  model SolDisableDiffTemp1 is Register<temp0>;

  /** SolDisableDiffTemp2: Temperature difference between collector 2 and tank, at which pump stops */
  @ext(0x64, 0x8)
  model SolDisableDiffTemp2 is Register<temp0>;

  /** SolDhwMaxLoadTemp1: Maximal temperature for solar loading of tank1 */
  @ext(0x65, 0)
  model SolHwcMaxLoadTemp1 is Register<temp0>;

  /** SolDhwMaxLoadTemp2: Maximal temperature for solar loading of tank2 */
  @ext(0x65, 0x8)
  model SolHwcMaxLoadTemp2 is Register<temp0>;

  /** SolarProtection: Collector pump should not start for high temperatures */
  @ext(0x81, 0)
  model SolProtection is Register<onoff>;

  /** SolarProtectionStartTemp: Temperature for collector pump protection in case of high temperatures */
  @ext(0x82, 0)
  model SolProtectionStartTemp is Register<temp0>;

  /** ColKickGradient */
  @inherit(r, ws)
  @ext(0x9d, 0)
  model ColKickGradient {
    @unit("0.1 K / 30 min")
    value: UCH;
  }

  /** ColKickPumpTime */
  @ext(0x9e, 0)
  model ColKickPumpTime is ServiceRegister<seconds0>;

  /** SolarCircuitProtectionHysteresis: After collector pump protection in case of too high temperatures, the collector has to cool down at least this temperature */
  @ext(0x9f, 0)
  model ScProtectionHysteresis is Register<desiredtemp>;

  /** FrostProtectionLimit */
  @inherit(r)
  @ext(0xa2, 0)
  model FrostProtectionLimit {
    /** limits for the solar collector frost protection */
    @unit("K")
    value: SCH;
  }

  /** FrostProtectionEnabled: Solar collector frost protection on/off */
  @ext(0xa3, 0)
  model FrostProtectionEnabled is ReadonlyRegister<onoff>;

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

  /** SolEnablePumpPWM: Collector pumps should be driven by a slow pulse width modulation */
  @ext(0xae, 0)
  model SolEnablePumpPWM is Register<onoff>;

  /** ExtendedYieldCalculation: calculate solar yield like specified by austrian regulation. Uses SP3 or this purpose! */
  @ext(0x7f, 0)
  model ExtendedYieldCalculation is Register<onoff>;

  /** SolarPriority */
  @inherit(r, w)
  @ext(0x99, 0)
  model SolPriority {
    /** Priority of water tanks for solar loading algorithms. 1 = SP2 2 = SP3 */
    @values(Values_SolPriority)
    value: UCH;
  }

  /** SolOperatingMode: Operating mode solar */
  @ext(0xac, 0)
  model SolOperatingMode is ReadonlyRegister<UCH>;

  /** SolTeleswitchOperatingMode: Teleswitch operating mode solar */
  @ext(0xad, 0)
  model SolTeleswitchOperatingMode is ReadonlyRegister<UCH>;

  /** KolMinTemperature1: Temperature COL1 sensor has to reach before starting pumps at least */
  @ext(0xa0, 0)
  model KolTempMin1 is Register<temp0>;

  /** KolMinTemperature2: Temperature COL2 sensor has to reach before starting pumps at least */
  @ext(0xa0, 0x8)
  model KolTempMin2 is Register<temp0>;

  enum Values_SolPriority {
    _1_2: 16,
    _2_1: 4,
  }

  /** included parts */
  union _includes {
    Iotest620_inc,
    Errors_inc,
  }
}
