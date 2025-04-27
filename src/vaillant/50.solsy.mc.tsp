import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./mcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotest620_inc.tsp";
import "./errors_inc.tsp";
import "./roomtempoffset_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x50)
namespace Solsy.Mc {
  // ,SOLSY,auroMATIC 620/3,0020080463 163 Mixer
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
  // ##### MK1: Data #####

  /** Flow2Sensor1: Temperature measured on VF2 */
  @ext(1, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** DesiredFlowTemperature1: Desired flow temperature of MK1 */
  @ext(0x46, 0)
  model FlowTempDesired is ReadonlyRegister<temp1>;

  /** State of the Teleswitch */
  @ext(0xa, 0)
  model TeleSwitch is ReadonlyRegister<onoff>;

  /** Holiday function active: Every bit of this byte represents a heating circuit; holiday function can be started by setting the HC's corresponding bit */
  @ext(0x27, 0)
  model IsInHoliday is ReadonlyRegister<UCH>;

  /** IsInTankFilling: heating circuit is locked because of ongoing tank loading unless parallel loading has been activated */
  @ext(0x47, 0)
  model IsInStorageFilling is ReadonlyRegister<yesno>;

  /** CleaningLady: saving function is activated until read value * 1/2 h */
  @ext(0x4b, 0)
  model CleaningLady is ReadonlyRegister<UCH>;

  /** IsInParty: Every bit of this byte represents a heating circuit; if bit is set the party function is activated for the corresponding HC */
  @ext(0x4e, 0)
  model IsInParty is ReadonlyRegister<UCH>;

  /** Hk2P_Port1: Status of mixer cicuit pump on MK1P */
  @ext(0x91, 0)
  model HcPumpPort is ReadonlyRegister<onoff>;
  // ##### MK1: Configuration #####

  /** OtShutdownLimit1: For outside temperatures higher than this, there is no heat demand generated anymore */
  @ext(0x36, 0)
  model OtShutdownLimit is Register<desiredtemp>;

  /** MinFlowTemp1: For a heat demand the desired flow temperature will at least be this value */
  @ext(0x30, 0)
  model FlowTempMin is Register<temp0>;

  /** DesiredLowTemperature1: Night temperature setpoint of the circuit */
  @ext(0x33, 0)
  model TempDesiredLow is Register<temp1>;

  /** CfgHeatSinkType1 */
  @inherit(r, wi)
  @ext(0x3c, 0)
  model CfgHeatSinkType {
    /** Type of the configurable mixer circuit */
    @values(Values_CfgHeatSinkType)
    value: UCH;
  }

  /** HcPumpIdlePeriod1: Time pump is not running in a pause at least */
  @ext(0x4f, 0)
  model HcPumpIdlePeriod is Register<minutes0>;

  /** Mixer1DutyCycle1: Telswitch,Pump,Circulation pump,DHW rewquest,DHW permittion */
  @ext(0xe, 0)
  model MixerDutyCycle is ReadonlyRegister<SCH>;

  /** Operating mode of mixer circuit */
  @ext(0x2b, 0)
  model OperatingMode is Register<mcmode>;

  /** MaxFlowTemp1: For a heat demand the desired flow temperature will maximal be this value */
  @ext(0x31, 0)
  model FlowTempMax is Register<temp0>;

  /** DesiredTemperature1: Day temperature setpoint of the circuit */
  @ext(0x32, 0)
  model TempDesired is Register<temp1>;

  /** Heating curve */
  @ext(0x35, 0)
  model HeatingCurve is Register<curve>;

  /** FloorPavingDryingDay1: Current day of floor paving drying routine */
  @ext(0x3b, 0)
  model FloorPavingDryingDay is ReadonlyRegister<UCH>;

  /** TeleswitchOperatingMode1: If the tele switch port is activated the mixer circuit operates in this mode */
  @ext(0x3f, 0)
  model TeleswitchOperatingMode is Register<mcmode>;

  enum Values_CfgHeatSinkType {
    disabled: 0,
    mixer: 1,
    water: 2,
    fixvalue: 3,
    backflow: 4,
  }
  @condition(Id.Id.sw, ">=401")
  namespace Sw_ge401 {
    /** HcMaxPreHeating1: maximum time central heating is released in advance of the first time window (time is adjusted according to current outside temperature) */
    @ext(0x38, 0)
    model HcMaxPreHeating is InstallRegister<minutes5>;
  }
  @condition(Id.Id.sw, "<=400")
  namespace Sw_le400 {
    /** HcMaxPreHeating1: The heating start before a time window could shifted forwards maximal this time (related to the outside temperature) */
    @ext(0x38, 0)
    model HcMaxPreHeating is Register<hours>;
  }

  /** included parts */
  union _includes {
    Mcmode_inc,
    Timer_inc,
    Iotest620_inc,
    Errors_inc,
    Roomtempoffset_inc,
    Quick_inc,
  }
}
