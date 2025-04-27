import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotest620_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x25)
namespace Solsy.Hwc {
  // ,SOLSY,auroMATIC 620/3,0020080463 163 DHW
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
  // ##### DHW: Data #####

  /** Storage1Sensor2: Temperature of SP1 sensor */
  @ext(0, 0)
  model Storage1Sensor2 is ReadonlyRegister<tempsensor>;

  /** CirculationPump2: State of the circulation pump */
  @ext(0xc, 0)
  model CirPump2 is ReadonlyRegister<onoff>;

  /** ThreeWayValveLoadingPump12: State of LP/UV1 */
  @ext(0x10, 0)
  model ThreeWayValveLoadingPump12 is ReadonlyRegister<onoff>;

  /** LegioPump2: State of the legionella pump */
  @ext(0x11, 0)
  model LegioPump2 is ReadonlyRegister<onoff>;

  /** State of the Teleswitch */
  @ext(0xa, 0)
  model TeleSwitch is ReadonlyRegister<onoff>;

  /** OneTimeCirculationSwitch: non-recurring circulation pump running period */
  @ext(0xb, 0)
  model OneTimeCirSwitch is ReadonlyRegister<onoff>;

  /** IsInParty: Every bit of this byte represents a heating circuit; if bit is set the party function is activated for the corresponding HC */
  @ext(0x4e, 0)
  model IsInParty is ReadonlyRegister<UCH>;
  // ##### DHW: Configuration #####

  /** DhwLaggingTime2: Time pump is running after energy demand is met */
  @ext(0x61, 0)
  model HwcLaggingTime2 is Register<minutes0>;

  /** DesiredFlowTemperature2: Flow setpoint if tank has an energy demand */
  @ext(0x46, 0)
  model FlowTempDesired2 is ReadonlyRegister<temp1>;

  /** HcParallelTankFillingEnabled2: Heating cuircuits can be loaded in parallel to an active tank loading */
  @ext(0x55, 0)
  model HcParallelStorageFillingEnabled2 is Register<yesno>;

  /** DhwLoadingDelay2: Time waiting for a heating demand in caser of solar gain */
  @ext(0x62, 0)
  model HwcLoadingDelay2 is Register<minutes0>;

  /** SpreadingDhwLoading: Offset for DHW flow temperature */
  @ext(0x88, 0)
  model SpreadingHwcLoading is ServiceRegister<calibration0>;

  /** LegioStartTime2: Hour for legio protection */
  @ext(0x8a, 0)
  model LegioStartTime2 is Register<UCH>;

  /** NativeDhwCircuitDisabled: Disable DHW */
  @ext(0xa9, 0)
  model NativeHwcCircuitDisabled is InstallRegister<yesno>;

  /** NormalDhwHysteresis: The hysteresis for DHW loading */
  @ext(0xaf, 0)
  model NormalHwcHysteresis is Register<calibration0>;

  /** OperatingMode2: Operating mode of the water circuit */
  @ext(0x2b, 0)
  model OperatingMode2 is Register<mcmode>;

  /** DesiredTemperature2: Temperature setpoint of water tank */
  @ext(0x32, 0)
  model TempDesired2 is Register<temp1>;

  /** TeleswitchOperatingMode2: If the tele switch port is activated the water circuit operates in this mode */
  @ext(0x3f, 0)
  model TeleswitchOperatingMode2 is Register<mcmode>;

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
    Iotest620_inc,
    Errors_inc,
  }
}
