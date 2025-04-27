import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hcmode_inc.tsp";
import "./timer_inc.tsp";
import "./iotest620_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x26)
namespace Solsy.Hc {
  // ,SOLSY,auroMATIC 620/3,0020080463 163 Burner
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
  // ##### BK1: Data #####

  /** SumFlowSensor_DK: Temperature measured on VF1 */
  @ext(0x4, 0)
  model SumFlowSensor is ReadonlyRegister<tempsensor>;

  /** OutsideTempSensor_DK: Outside temperature */
  @ext(0x6, 0)
  model OutsideTemp is ReadonlyRegister<tempsensor>;

  /** Flow setpoint: Flow temperature BK1 want to have to fullfill the actual heat demand */
  @ext(0x46, 0)
  model FlowTempDesired is ReadonlyRegister<temp1>;

  /** State of the Teleswitch */
  @ext(0xa, 0)
  model TeleSwitch is ReadonlyRegister<onoff>;

  /** Holiday function active: Every bit of this byte represents a heating circuit; holiday function can be started by setting the HC's corresponding bit */
  @ext(0x27, 0)
  model IsInHoliday is ReadonlyRegister<UCH>;

  /** IsInTankFilling: burner circuit is locked because of ongoing tank loading */
  @ext(0x47, 0)
  model IsInStorageFilling is ReadonlyRegister<yesno>;

  /** CleaningLady: saving function is activated until read value * 1/2 h */
  @ext(0x4b, 0)
  model CleaningLady is ReadonlyRegister<UCH>;

  /** IsInParty: Every bit of this byte represents a heating circuit; if bit is set the party function is activated for the corresponding HC */
  @ext(0x4e, 0)
  model IsInParty is ReadonlyRegister<UCH>;

  /** Hk1P_Port: State of burner cicuit pump on HK1P */
  @ext(0x8e, 0)
  model Hc1PumpPort is ReadonlyRegister<onoff>;
  // ##### BK1: Configuration #####

  /** OutsideTempSensorCorrection: Correction for outside temperature sensor */
  @ext(0x2d, 0)
  model OutsideTempCorrection is ReadonlyRegister<temps>;

  /** BoilerMaxPreShutdown: Maximal Boiler preshutdown time */
  @ext(0x39, 0)
  model BoilerMaxPreShutdown is ReadonlyRegister<minutes0>;

  /** HcFlowIncrease: Offset added to flow temperature */
  @ext(0x3a, 0)
  model HcFlowIncrease is ReadonlyRegister<calibration0>;

  /** FrostProtectDelay: Delay time of frost protection */
  @ext(0x49, 0)
  model FrostProtectDelay is ReadonlyRegister<hours>;

  /** Hzdraulic plan */
  @ext(0x60, 0)
  model HydraulicScheme is ReadonlyRegister<UCH>;

  /** EnergyDemandPercentage: Flow temperature's maximum deviation from setpoint for set delay time */
  @ext(0x7e, 0)
  model EnergyDemandPercentage is ReadonlyRegister<percent0>;

  /** OtShutdownLimit: For outside temperatures higher than this, there is no heat demand generated anymore */
  @ext(0x36, 0)
  model OtShutdownLimit is Register<desiredtemp>;

  /** MinFlowTemp: For a heat demand the desired flow temperature will at least be this value */
  @ext(0x30, 0)
  model FlowTempMin is Register<temp0>;

  /** DesiredLowTemperature: Night temperature setpoint of the burner circuit */
  @ext(0x33, 0)
  model TempDesiredLow is Register<temp1>;

  /** BurnerCircuitDisabled: Disable the burner circuit? */
  @ext(0xaa, 0)
  model BoilerCircuitDisabled is InstallRegister<yesno>;

  /** OperatingMode: Operating mode of burner circuit */
  @ext(0x2b, 0)
  model OperatingMode is Register<mcmode>;

  /** MaxFlowTemp: For a heat demand the desired flow temperature will maximal be this value */
  @ext(0x31, 0)
  model FlowTempMax is Register<temp0>;

  /** DesiredTemperature: Day temperature setpoint of the burner circuit */
  @ext(0x32, 0)
  model TempDesired is Register<temp1>;

  /** Heating curve */
  @ext(0x35, 0)
  model HeatingCurve is Register<curve>;

  /** TeleswitchOperatingMode: If the tele switch port is activated the burner circuit operates in this mode */
  @ext(0x3f, 0)
  model TeleswitchOperatingMode is Register<mcmode>;
  @condition(Id.Id.sw, ">=401")
  namespace Sw_ge401 {
    /** EnergyDemandNotReachedDelay: Delay time for not reached temperature */
    @ext(0x7b, 0)
    model EnergyDemandNotReachedDelay is ReadonlyRegister<hours>;

    /** HcMaxPreHeating: maximum time central heating is released in advance of the first time window (time is adjusted according to current outside temperature) */
    @ext(0x38, 0)
    model HcMaxPreHeating is InstallRegister<minutes5>;
  }
  @condition(Id.Id.sw, "<=400")
  namespace Sw_le400 {
    /** HcMaxPreHeating: The heating start before a time window could shifted forwards maximal this time (related to the outside temperature) */
    @ext(0x38, 0)
    model HcMaxPreHeating is Register<hours>;
  }

  /** included parts */
  union _includes {
    Hcmode_inc,
    Timer_inc,
    Iotest620_inc,
    Errors_inc,
  }
}
