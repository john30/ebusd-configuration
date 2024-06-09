import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./timercool_inc.tsp";
import "./mcmode_inc.tsp";
import "./timer_inc.tsp";
import "./errors_inc.tsp";
import "./roomtempoffset_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x53)
namespace mc2.mc._5 {
  // ,MC2,VR 60/3,306782<<<< 163 Mixer

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
  // ##### MK2: Data #####

  /** DesiredFlowTemperature3 */
  @inherit(r)
  @ext(0x46, 0)
  model FlowTempDesired {
    /** Desired flow temperature of MK2 */
    value: temp1;
  }

  /** Flow2Sensor3 */
  @inherit(r)
  @ext(0x3, 0)
  model FlowTemp {
    /** Flow temperature */
    value: tempsensor;
  }

  /** OutsideTempSensor */
  @inherit(r)
  @ext(0x6, 0)
  model OutsideTemp {
    /** current outside temperature (valid only if a sensor is connected to the VR60) */
    value: tempsensor;
  }

  /** TeleSwitch */
  @inherit(r)
  @ext(0xa, 0)
  model TeleSwitch {
    /** State of the Teleswitch */
    value: onoff;
  }

  /** Holiday function active */
  @inherit(r)
  @ext(0x27, 0)
  model IsInHoliday {
    /** Every bit of this byte represents a heating circuit; holiday function can be started by setting the HC's corresponding bit */
    value: UCH;
  }

  /** IsInParty */
  @inherit(r)
  @ext(0x4e, 0)
  model IsInParty {
    /** Every bit of this byte represents a heating circuit; if bit is set the party function is activated for the corresponding HC */
    value: UCH;
  }

  /** CleaningLady */
  @inherit(r)
  @ext(0x4b, 0)
  model CleaningLady {
    /** saving function is activated until read value * 1/2 h */
    value: UCH;
  }

  /** IsInTankFilling */
  @inherit(r)
  @ext(0x47, 0)
  model IsInStorageFilling {
    /** heating circuit is locked because of ongoing tank loading unless parallel loading has been activated */
    value: yesno;
  }

  /** Mixer2DutyCycle3 */
  @inherit(r)
  @ext(0xf, 0)
  model MixerDutyCycle {
    /** Telswitch,Pump,Circulation pump,DHW rewquest,DHW permittion */
    value: SCH;
  }

  /** Hk3P_Port3 */
  @inherit(r)
  @ext(0x94, 0)
  model HcPumpPort {
    /** Status of mixer cicuit pump on MK1P */
    value: onoff;
  }
  // ##### MK2: Configuration #####

  /** CfgHeatSinkType3 */
  @inherit(r, wi)
  @ext(0x3c, 0)
  model CfgHeatSinkType {
    /** Type of the configurable mixer circuit */
    @values(values_CfgHeatSinkType)
    value: UCH;
  }

  /** OperatingMode3 */
  @inherit(r, w)
  @ext(0x2b, 0)
  model OperatingMode {
    /** Operating mode of mixer circuit */
    value: mcmode;
  }

  /** DesiredTemperature3 */
  @inherit(r, w)
  @ext(0x32, 0)
  model TempDesired {
    /** Day temperature setpoint of the circuit */
    value: temp1;
  }

  /** DesiredLowTemperature3 */
  @inherit(r, w)
  @ext(0x33, 0)
  model TempDesiredLow {
    /** Night temperature setpoint of the circuit */
    value: temp1;
  }

  /** HeatingCurve3 */
  @inherit(r, w)
  @ext(0x35, 0)
  model HeatingCurve {
    /** Heating curve */
    value: curve;
  }

  /** OtShutdownLimit3 */
  @inherit(r, w)
  @ext(0x36, 0)
  model OtShutdownLimit {
    /** For outside temperatures higher than this, there is no heat demand generated anymore */
    value: desiredtemp;
  }

  /** HcPumpIdlePeriod3 */
  @inherit(r, w)
  @ext(0x4f, 0)
  model HcPumpIdlePeriod {
    /** Time pump is not running in a pause at least */
    value: minutes0;
  }

  /** MinFlowTemp3 */
  @inherit(r, w)
  @ext(0x30, 0)
  model FlowTempMin {
    /** For a heat demand the desired flow temperature will at least be this value */
    value: temp0;
  }

  /** MaxFlowTemp3 */
  @inherit(r, w)
  @ext(0x31, 0)
  model FlowTempMax {
    /** For a heat demand the desired flow temperature will maximal be this value */
    value: temp0;
  }

  /** HcMaxPreHeating3 */
  @inherit(r, w)
  @ext(0x38, 0)
  model HcMaxPreHeating {
    /** The heating start before a time window could shifted forwards maximal this time (related to the outside temperature) */
    value: hours;
  }

  /** TeleswitchOperatingMode3 */
  @inherit(r, w)
  @ext(0x3f, 0)
  model TeleswitchOperatingMode {
    /** If the tele switch port is activated the mixer circuit operates in this mode */
    value: mcmode;
  }

  /** FloorPavingDryingDay3 */
  @inherit(r, wi)
  @ext(0x3b, 0)
  model FloorPavingDryingDay {
    /** Current day of floor paving drying routine */
    value: UCH;
  }
  // ##### MK2: Cooling #####

  /** CoolingRequest */
  @inherit(r)
  @ext(0xb6, 0)
  model CoolingRequest {
    value: yesno;
  }

  /** CoolingSupported */
  @inherit(r)
  @ext(0xb9, 0)
  model CoolingSupported {
    value: yesno;
  }

  /** DWMOffToHeatingDelay */
  @inherit(r)
  @ext(0xb7, 0)
  model DWMOffToHeatingDelay {
    value: UCH;
  }

  /** DWMOffToCoolingDelay */
  @inherit(r)
  @ext(0xb8, 0)
  model DWMOffToCoolingDelay {
    value: UCH;
  }

  /** CoolingStartOffset */
  @inherit(r, w)
  @ext(0xba, 0)
  model CoolingStartOffset {
    value: D1C;
  }

  /** CoolingModeStateCounter */
  @inherit(r)
  @ext(0xc0, 0)
  model CoolingModeStateCounter {
    value: UCH;
  }

  /** CoolingEfficiencyState */
  @inherit(r)
  @ext(0xbd, 0)
  model CoolingEfficiencyState {
    value: UCH;
  }

  /** MinEfficiencyHysteresis */
  @inherit(r)
  @ext(0xbe, 0)
  model EfficiencyHysteresisMin {
    value: D1C;
  }

  /** TemperaturDiffInOutdoor */
  @inherit(r)
  @ext(0xc1, 0)
  model TempDiffInOutdoor {
    value: D1C;
  }

  /** HCManualWorkingModeTriggeringActive */
  @inherit(r)
  @ext(0xc2, 0)
  model HcManualWorkingModeTriggeringActive {
    value: UCH;
  }

  /** HeatCircuitMode */
  @inherit(r)
  @ext(0xc3, 0)
  model HcMode {
    value: UCH;
  }

  /** HeatCircuitModeAutomaticState */
  @inherit(r)
  @ext(0xc4, 0)
  model HcModeAutomaticState {
    value: UCH;
  }

  /** HeatCircuitModeManualState */
  @inherit(r)
  @ext(0xc5, 0)
  model HcModeManualState {
    value: UCH;
  }

  /** CoolingOpmodeAutoState */
  @inherit(r)
  @ext(0xc6, 0)
  model CoolingOpmodeAutoState {
    value: UCH;
  }

  /** CoolingModeAutomaticState */
  @inherit(r)
  @ext(0xc7, 0)
  model CoolingModeAutomaticState {
    value: UCH;
  }

  /** CoolingWhileHolidaySupported */
  @inherit(r)
  @ext(0xc8, 0)
  model CoolingWhileHolidaySupported {
    value: UCH;
  }

  /** RcRoomTemp */
  @inherit(r)
  @ext(0xc9, 0)
  model RcRoomTemp {
    value: temp;
  }

  enum values_CfgHeatSinkType {
    disabled: 0,
    mixer: 1,
    water: 2,
    fixvalue: 3,
    backflow: 4,
  }

  /** included parts */
  union _includes {
    timercool_inc,
    mcmode_inc,
    timer_inc,
    errors_inc,
    roomtempoffset_inc,
    quick_inc,
  }
}
