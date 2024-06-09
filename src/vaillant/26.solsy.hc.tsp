import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotest620_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x26)
namespace solsy.hc {
  // ,SOLSY,auroMATIC 620/3,0020080463 163 Burner

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
  // ##### BK1: Data #####

  /** SumFlowSensor_DK */
  @inherit(r)
  @ext(0x4, 0)
  model SumFlowSensor {
    /** Temperature measured on VF1 */
    value: tempsensor;
  }

  /** OutsideTempSensor_DK */
  @inherit(r)
  @ext(0x6, 0)
  model OutsideTemp {
    /** outside temperature */
    value: tempsensor;
  }

  /** Flow setpoint */
  @inherit(r)
  @ext(0x46, 0)
  model FlowTempDesired {
    /** Flow temperature BK1 want to have to fullfill the actual heat demand */
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
    /** burner circuit is locked because of ongoing tank loading */
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

  /** Hk1P_Port */
  @inherit(r)
  @ext(0x8e, 0)
  model Hc1PumpPort {
    /** State of burner cicuit pump on HK1P */
    value: onoff;
  }
  // ##### BK1: Configuration #####

  /** OutsideTempSensorCorrection */
  @inherit(r)
  @ext(0x2d, 0)
  model OutsideTempCorrection {
    /** Correction for outside temperature sensor */
    value: temps;
  }

  /** BoilerMaxPreShutdown */
  @inherit(r)
  @ext(0x39, 0)
  model BoilerMaxPreShutdown {
    /** Maximal Boiler preshutdown time */
    value: minutes0;
  }

  /** HcFlowIncrease */
  @inherit(r)
  @ext(0x3a, 0)
  model HcFlowIncrease {
    /** Offset added to flow temperature */
    value: calibration0;
  }

  /** FrostProtectDelay */
  @inherit(r)
  @ext(0x49, 0)
  model FrostProtectDelay {
    /** Delay time of frost protection */
    value: hours;
  }

  /** Hzdraulic plan */
  @inherit(r)
  @ext(0x60, 0)
  model HydraulicScheme {
    value: UCH;
  }

  @condition(id.id.sw, ">=401")
  namespace sw__401 {
    /** EnergyDemandNotReachedDelay */
    @inherit(r)
    @ext(0x7b, 0)
    model EnergyDemandNotReachedDelay {
      /** Delay time for not reached temperature */
      value: hours;
    }
  }

  /** EnergyDemandPercentage */
  @inherit(r)
  @ext(0x7e, 0)
  model EnergyDemandPercentage {
    /** Flow temperature's maximum deviation from setpoint for set delay time */
    value: percent0;
  }

  /** OtShutdownLimit */
  @inherit(r, w)
  @ext(0x36, 0)
  model OtShutdownLimit {
    /** For outside temperatures higher than this, there is no heat demand generated anymore */
    value: desiredtemp;
  }

  /** MinFlowTemp */
  @inherit(r, w)
  @ext(0x30, 0)
  model FlowTempMin {
    /** For a heat demand the desired flow temperature will at least be this value */
    value: temp0;
  }

  /** DesiredLowTemperature */
  @inherit(r, w)
  @ext(0x33, 0)
  model TempDesiredLow {
    /** Night temperature setpoint of the burner circuit */
    value: temp1;
  }

  /** BurnerCircuitDisabled */
  @inherit(r, wi)
  @ext(0xaa, 0)
  model BoilerCircuitDisabled {
    /** Disable the burner circuit? */
    value: yesno;
  }

  /** OperatingMode */
  @inherit(r, w)
  @ext(0x2b, 0)
  model OperatingMode {
    /** Operating mode of burner circuit */
    value: mcmode;
  }

  /** MaxFlowTemp */
  @inherit(r, w)
  @ext(0x31, 0)
  model FlowTempMax {
    /** For a heat demand the desired flow temperature will maximal be this value */
    value: temp0;
  }

  /** desired temperature */
  @inherit(r, w)
  @ext(0x32, 0)
  model TempDesired {
    /** Day temperature setpoint of the burner circuit */
    value: temp1;
  }

  /** Heating curve */
  @inherit(r, w)
  @ext(0x35, 0)
  model HeatingCurve {
    /** Heating curve */
    value: curve;
  }

  @condition(id.id.sw, "<=400")
  namespace sw__400 {
    /** HcMaxPreHeating */
    @inherit(r, w)
    @ext(0x38, 0)
    model HcMaxPreHeating {
      /** The heating start before a time window could shifted forwards maximal this time (related to the outside temperature) */
      value: hours;
    }
  }

  @condition(id.id.sw, ">=401")
  namespace sw__401 {
    /** HcMaxPreHeating */
    @inherit(r, wi)
    @ext(0x38, 0)
    model HcMaxPreHeating {
      /** maximum time central heating is released in advance of the first time window (time is adjusted according to current outside temperature) */
      @unit("min / 5")
      value: UCH;
    }
  }

  /** TeleswitchOperatingMode */
  @inherit(r, w)
  @ext(0x3f, 0)
  model TeleswitchOperatingMode {
    /** If the tele switch port is activated the burner circuit operates in this mode */
    value: mcmode;
  }

  /** included parts */
  union _includes {
    hcmode_inc,
    timer_inc,
    iotest620_inc,
    errors_inc,
  }
}
