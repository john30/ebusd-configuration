import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./timercool_inc.tsp";
import "./mcmode_inc.tsp";
import "./timer_inc.tsp";
import "./errors_inc.tsp";
import "./roomtempoffset_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x52)
namespace Mc2.Mc._4 {
  // ,MC2,VR 60/3,306782<<<< 163 Mixer
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

  /** DesiredFlowTemperature1: Desired flow temperature of MK1 */
  @ext(0x46, 0)
  model FlowTempDesired is ReadonlyRegister<temp1>;

  /** Flow1Sensor1: Flow temperature */
  @ext(1, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** OutsideTempSensor: current outside temperature (valid only if a sensor is connected to the VR60) */
  @ext(0x6, 0)
  model OutsideTemp is ReadonlyRegister<tempsensor>;

  /** State of the Teleswitch */
  @ext(0xa, 0)
  model TeleSwitch is ReadonlyRegister<onoff>;

  /** Holiday function active: Every bit of this byte represents a heating circuit; holiday function can be started by setting the HC's corresponding bit */
  @ext(0x27, 0)
  model IsInHoliday is ReadonlyRegister<UCH>;

  /** IsInParty: Every bit of this byte represents a heating circuit; if bit is set the party function is activated for the corresponding HC */
  @ext(0x4e, 0)
  model IsInParty is ReadonlyRegister<UCH>;

  /** CleaningLady: saving function is activated until read value * 1/2 h */
  @ext(0x4b, 0)
  model CleaningLady is ReadonlyRegister<UCH>;

  /** IsInTankFilling: heating circuit is locked because of ongoing tank loading unless parallel loading has been activated */
  @ext(0x47, 0)
  model IsInStorageFilling is ReadonlyRegister<yesno>;

  /** Mixer1DutyCycle1: Telswitch,Pump,Circulation pump,DHW rewquest,DHW permittion */
  @ext(0xe, 0)
  model MixerDutyCycle is ReadonlyRegister<SCH>;

  /** Hk2P_Port1: Status of mixer cicuit pump on MK1P */
  @ext(0x91, 0)
  model HcPumpPort is ReadonlyRegister<onoff>;
  // ##### MK1: Configuration #####

  /** CfgHeatSinkType1 */
  @inherit(r, wi)
  @ext(0x3c, 0)
  model CfgHeatSinkType {
    /** Type of the configurable mixer circuit */
    @values(Values_CfgHeatSinkType)
    value: UCH;
  }

  /** Operating mode of mixer circuit */
  @ext(0x2b, 0)
  model OperatingMode is Register<mcmode>;

  /** DesiredTemperature1: Day temperature setpoint of the circuit */
  @ext(0x32, 0)
  model TempDesired is Register<temp1>;

  /** DesiredLowTemperature1: Night temperature setpoint of the circuit */
  @ext(0x33, 0)
  model TempDesiredLow is Register<temp1>;

  /** Heating curve */
  @ext(0x35, 0)
  model HeatingCurve is Register<curve>;

  /** OtShutdownLimit1: For outside temperatures higher than this, there is no heat demand generated anymore */
  @ext(0x36, 0)
  model OtShutdownLimit is Register<desiredtemp>;

  /** HcPumpIdlePeriod1: Time pump is not running in a pause at least */
  @ext(0x4f, 0)
  model HcPumpIdlePeriod is Register<minutes0>;

  /** MinFlowTemp1: For a heat demand the desired flow temperature will at least be this value */
  @ext(0x30, 0)
  model FlowTempMin is Register<temp0>;

  /** MaxFlowTemp1: For a heat demand the desired flow temperature will maximal be this value */
  @ext(0x31, 0)
  model FlowTempMax is Register<temp0>;

  /** HcMaxPreHeating1: The heating start before a time window could shifted forwards maximal this time (related to the outside temperature) */
  @ext(0x38, 0)
  model HcMaxPreHeating is Register<minutes5>;

  /** TeleswitchOperatingMode1: If the tele switch port is activated the mixer circuit operates in this mode */
  @ext(0x3f, 0)
  model TeleswitchOperatingMode is Register<mcmode>;

  /** FloorPavingDryingDay1: Current day of floor paving drying routine */
  @ext(0x3b, 0)
  model FloorPavingDryingDay is InstallRegister<UCH>;
  // ##### MK1: Cooling #####

  /** CoolingRequest */
  @ext(0xb6, 0)
  model CoolingRequest is ReadonlyRegister<yesno>;

  /** AutocoolTestModeActive */
  @ext(0xb5, 0)
  model AutocoolTestModeActive is ReadonlyRegister<yesno>;

  /** SystemMode */
  @ext(0xb4, 0)
  model SystemMode is ReadonlyRegister<UCH>;

  /** CoolingSupported */
  @ext(0xb9, 0)
  model CoolingSupported is ReadonlyRegister<yesno>;

  /** DWMOffToHeatingDelay */
  @ext(0xb7, 0)
  model DWMOffToHeatingDelay is ReadonlyRegister<UCH>;

  /** DWMOffToCoolingDelay */
  @ext(0xb8, 0)
  model DWMOffToCoolingDelay is ReadonlyRegister<UCH>;

  /** CoolingStartOffset */
  @ext(0xba, 0)
  model CoolingStartOffset is Register<D1C>;

  /** Tot_24h: Outside temperature mean value over 24 hours */
  @ext(0xbb, 0)
  model Tot24h is ReadonlyRegister<temp>;

  /** Tot_AverageTime */
  @ext(0xbc, 0)
  model TotAverageTime is ReadonlyRegister<UCH>;

  /** CoolingEfficiencyState */
  @ext(0xbd, 0)
  model CoolingEfficiencyState is ReadonlyRegister<UCH>;

  /** MinEfficiencyHysteresis */
  @ext(0xbe, 0)
  model EfficiencyHysteresisMin is Register<D1C>;

  /** CoolingOperatingMode: Operating mode of cooling circuit */
  @ext(0xbf, 0)
  model CoolingOperatingMode is Register<mcmode>;

  /** TemperaturDiffInOutdoor */
  @ext(0xc1, 0)
  model TempDiffInOutdoor is ReadonlyRegister<D1C>;

  /** HCManualWorkingModeTriggeringActive */
  @ext(0xc2, 0)
  model HcManualWorkingModeTriggeringActive is ReadonlyRegister<UCH>;

  /** HeatCircuitMode */
  @ext(0xc3, 0)
  model HcMode is ReadonlyRegister<UCH>;

  /** HeatCircuitModeAutomaticState */
  @ext(0xc4, 0)
  model HcModeAutomaticState is ReadonlyRegister<UCH>;

  /** HeatCircuitModeManualState */
  @ext(0xc5, 0)
  model HcModeManualState is ReadonlyRegister<UCH>;

  /** CoolingOpmodeAutoState */
  @ext(0xc6, 0)
  model CoolingOpmodeAutoState is ReadonlyRegister<UCH>;

  /** CoolingModeAutomaticState */
  @ext(0xc7, 0)
  model CoolingModeAutomaticState is ReadonlyRegister<UCH>;

  /** CoolingWhileHolidaySupported */
  @ext(0xc8, 0)
  model CoolingWhileHolidaySupported is ReadonlyRegister<UCH>;

  /** RcRoomTemp */
  @ext(0xc9, 0)
  model RcRoomTemp is ReadonlyRegister<temp>;

  /** SystemWithCooling */
  @ext(0xd4, 0)
  model SystemWithCooling is ReadonlyRegister<yesno>;

  enum Values_CfgHeatSinkType {
    disabled: 0,
    mixer: 1,
    water: 2,
    fixvalue: 3,
    backflow: 4,
  }

  /** included parts */
  union _includes {
    Timercool_inc,
    Mcmode_inc,
    Timer_inc,
    Errors_inc,
    Roomtempoffset_inc,
    Quick_inc,
  }
}
