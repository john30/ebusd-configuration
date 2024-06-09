import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./mcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotest620_inc.tsp";
import "./errors_inc.tsp";
import "./roomtempoffset_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x50)
namespace solsy.mc {
  // ,SOLSY,auroMATIC 620/3,0020080463 163 Mixer

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
  // ##### MK1: Data #####

  /** Flow2Sensor1 */
  @inherit(r)
  @ext(1, 0)
  model FlowTemp {
    /** Temperature measured on VF2 */
    value: tempsensor;
  }

  /** DesiredFlowTemperature1 */
  @inherit(r)
  @ext(0x46, 0)
  model FlowTempDesired {
    /** Desired flow temperature of MK1 */
    value: temp1;
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

  /** IsInTankFilling */
  @inherit(r)
  @ext(0x47, 0)
  model IsInStorageFilling {
    /** heating circuit is locked because of ongoing tank loading unless parallel loading has been activated */
    value: yesno;
  }

  /** CleaningLady */
  @inherit(r)
  @ext(0x4b, 0)
  model CleaningLady {
    /** saving function is activated until read value * 1/2 h */
    value: UCH;
  }

  /** IsInParty */
  @inherit(r)
  @ext(0x4e, 0)
  model IsInParty {
    /** Every bit of this byte represents a heating circuit; if bit is set the party function is activated for the corresponding HC */
    value: UCH;
  }

  /** Hk2P_Port1 */
  @inherit(r)
  @ext(0x91, 0)
  model HcPumpPort {
    /** Status of mixer cicuit pump on MK1P */
    value: onoff;
  }
  // ##### MK1: Configuration #####

  /** OtShutdownLimit1 */
  @inherit(r, w)
  @ext(0x36, 0)
  model OtShutdownLimit {
    /** For outside temperatures higher than this, there is no heat demand generated anymore */
    value: desiredtemp;
  }

  /** MinFlowTemp1 */
  @inherit(r, w)
  @ext(0x30, 0)
  model FlowTempMin {
    /** For a heat demand the desired flow temperature will at least be this value */
    value: temp0;
  }

  /** DesiredLowTemperature1 */
  @inherit(r, w)
  @ext(0x33, 0)
  model TempDesiredLow {
    /** Night temperature setpoint of the circuit */
    value: temp1;
  }

  /** CfgHeatSinkType1 */
  @inherit(r, wi)
  @ext(0x3c, 0)
  model CfgHeatSinkType {
    /** Type of the configurable mixer circuit */
    @values(values_CfgHeatSinkType)
    value: UCH;
  }

  /** HcPumpIdlePeriod1 */
  @inherit(r, w)
  @ext(0x4f, 0)
  model HcPumpIdlePeriod {
    /** Time pump is not running in a pause at least */
    value: minutes0;
  }

  /** Mixer1DutyCycle1 */
  @inherit(r)
  @ext(0xe, 0)
  model MixerDutyCycle {
    /** Telswitch,Pump,Circulation pump,DHW rewquest,DHW permittion */
    value: SCH;
  }

  /** OperatingMode */
  @inherit(r, w)
  @ext(0x2b, 0)
  model OperatingMode {
    /** Operating mode of mixer circuit */
    value: mcmode;
  }

  /** MaxFlowTemp1 */
  @inherit(r, w)
  @ext(0x31, 0)
  model FlowTempMax {
    /** For a heat demand the desired flow temperature will maximal be this value */
    value: temp0;
  }

  /** DesiredTemperature1 */
  @inherit(r, w)
  @ext(0x32, 0)
  model TempDesired {
    /** Day temperature setpoint of the circuit */
    value: temp1;
  }

  /** Heating curve */
  @inherit(r, w)
  @ext(0x35, 0)
  model HeatingCurve {
    /** Heating curve */
    value: curve;
  }

  @condition(id.id.sw, ">=401")
  namespace sw__401 {
    /** HcMaxPreHeating1 */
    @inherit(r, wi)
    @ext(0x38, 0)
    model HcMaxPreHeating {
      /** maximum time central heating is released in advance of the first time window (time is adjusted according to current outside temperature) */
      @unit("min / 5")
      value: UCH;
    }
  }

  @condition(id.id.sw, "<=400")
  namespace sw__400 {
    /** HcMaxPreHeating1 */
    @inherit(r, w)
    @ext(0x38, 0)
    model HcMaxPreHeating {
      /** The heating start before a time window could shifted forwards maximal this time (related to the outside temperature) */
      value: hours;
    }
  }

  /** FloorPavingDryingDay1 */
  @inherit(r)
  @ext(0x3b, 0)
  model FloorPavingDryingDay {
    /** Current day of floor paving drying routine */
    value: UCH;
  }

  /** TeleswitchOperatingMode1 */
  @inherit(r, w)
  @ext(0x3f, 0)
  model TeleswitchOperatingMode {
    /** If the tele switch port is activated the mixer circuit operates in this mode */
    value: mcmode;
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
    mcmode_inc,
    timer_inc,
    iotest620_inc,
    errors_inc,
    roomtempoffset_inc,
    quick_inc,
  }
}
