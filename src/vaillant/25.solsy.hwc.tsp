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

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x9, 0xe)
  model wi {}

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
  // ##### DHW: Data #####

  /** Storage1Sensor2 */
  @inherit(r)
  @ext(0, 0)
  model Storage1Sensor2 {
    /** Temperature of SP1 sensor */
    value: tempsensor;
  }

  /** CirculationPump2 */
  @inherit(r)
  @ext(0xc, 0)
  model CirPump2 {
    /** State of the circulation pump */
    value: onoff;
  }

  /** ThreeWayValveLoadingPump12 */
  @inherit(r)
  @ext(0x10, 0)
  model ThreeWayValveLoadingPump12 {
    /** State of LP/UV1 */
    value: onoff;
  }

  /** LegioPump2 */
  @inherit(r)
  @ext(0x11, 0)
  model LegioPump2 {
    /** State of the legionella pump */
    value: onoff;
  }

  /** TeleSwitch */
  @inherit(r)
  @ext(0xa, 0)
  model TeleSwitch {
    /** State of the Teleswitch */
    value: onoff;
  }

  /** OneTimeCirculationSwitch */
  @inherit(r)
  @ext(0xb, 0)
  model OneTimeCirSwitch {
    /** non-recurring circulation pump running period */
    value: onoff;
  }

  /** IsInParty */
  @inherit(r)
  @ext(0x4e, 0)
  model IsInParty {
    /** Every bit of this byte represents a heating circuit; if bit is set the party function is activated for the corresponding HC */
    value: UCH;
  }
  // ##### DHW: Configuration #####

  /** DhwLaggingTime2 */
  @inherit(r, w)
  @ext(0x61, 0)
  model HwcLaggingTime2 {
    /** Time pump is running after energy demand is met */
    value: minutes0;
  }

  /** DesiredFlowTemperature2 */
  @inherit(r)
  @ext(0x46, 0)
  model FlowTempDesired2 {
    /** Flow setpoint if tank has an energy demand */
    value: temp1;
  }

  /** HcParallelTankFillingEnabled2 */
  @inherit(r, w)
  @ext(0x55, 0)
  model HcParallelStorageFillingEnabled2 {
    /** Heating cuircuits can be loaded in parallel to an active tank loading */
    value: yesno;
  }

  /** DhwLoadingDelay2 */
  @inherit(r, w)
  @ext(0x62, 0)
  model HwcLoadingDelay2 {
    /** Time waiting for a heating demand in caser of solar gain */
    value: minutes0;
  }

  /** SpreadingDhwLoading */
  @inherit(r, ws)
  @ext(0x88, 0)
  model SpreadingHwcLoading {
    /** Offset for DHW flow temperature */
    value: calibration0;
  }

  /** LegioStartTime2 */
  @inherit(r, w)
  @ext(0x8a, 0)
  model LegioStartTime2 {
    /** Hour for legio protection */
    value: UCH;
  }

  /** NativeDhwCircuitDisabled */
  @inherit(r, wi)
  @ext(0xa9, 0)
  model NativeHwcCircuitDisabled {
    /** Disable DHW */
    value: yesno;
  }

  /** NormalDhwHysteresis */
  @inherit(r, w)
  @ext(0xaf, 0)
  model NormalHwcHysteresis {
    /** The hysteresis for DHW loading */
    value: calibration0;
  }

  /** OperatingMode2 */
  @inherit(r, w)
  @ext(0x2b, 0)
  model OperatingMode2 {
    /** Operating mode of the water circuit */
    value: mcmode;
  }

  /** DesiredTemperature2 */
  @inherit(r, w)
  @ext(0x32, 0)
  model TempDesired2 {
    /** Temperature setpoint of water tank */
    value: temp1;
  }

  /** TeleswitchOperatingMode2 */
  @inherit(r, w)
  @ext(0x3f, 0)
  model TeleswitchOperatingMode2 {
    /** If the tele switch port is activated the water circuit operates in this mode */
    value: mcmode;
  }

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
    Iotest620_inc,
    Errors_inc,
  }
}
