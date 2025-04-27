import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
import "./timerhc_inc.tsp";
import "./tempsetpoints_inc.tsp";
import "./iotestbmc_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x50)
namespace V61.Mc {
  // ,V6100,VR 61,V61 219
  // ##### general #####

  /** DesiredLowTemperature: lowering temperature setpoint of the second heating circuit */
  @ext(0x13, 0)
  model TempDesiredLow is Register<temp1>;

  /** DesiredHighTemperature: day temperature setpoint of the second heating circuit */
  @ext(0x38, 0)
  model TempDesiredHigh is Register<temp1>;

  /** DesiredHolidayTemperature: 4.5=frostprotect, holiday temperature of the second heating circuit */
  @ext(0x14, 0)
  model HolidayTempDesired is Register<D1C>;

  /** HC2_ManualOPRoomSetpoint: room setpoint in operation mode manual of the second heating circuit */
  @ext(0x34, 0)
  model Hc2ManualOPRoomTempDesired is Register<temp1>;

  /** HC2_QuickVetoTemp: manual override setpoint of the second heating circuit */
  @ext(0x32, 0)
  model Hc2QuickVetoTemp is ReadonlyRegister<temp1>;

  /** DisplayedRoomSetpoint */
  @ext(0x48, 0)
  model DisplayedRoomTempDesired is ReadonlyRegister<temp>;

  /** SunMoonInfo: (2 = sun, 4 = moon) */
  @ext(0x47, 0)
  model SunMoonInfo is ReadonlyRegister<UCH>;
  // ##### extra #####

  /** Flow1Sensor: second heating circuit's flow temperature and sensorstate */
  @ext(0, 0)
  model Flow1Sensor is ReadonlyRegister<tempsensor>;

  /** BurnerCircuitPump: first heating circuit (burner circuit) pump's state */
  @ext(0x20, 0)
  model BoilerCircuitPump is ReadonlyRegister<onoff>;

  /** CirculationPump: control state of the circulation respectively loading pump (functionality of the pump depends on the configuration) */
  @ext(1, 0)
  model CirPump is ReadonlyRegister<onoff>;

  /** Hk1P_Kol1P_P1_Port: first heating circuit pump's state */
  @ext(0x42, 0)
  model Hc1PumpKol1PP1Port is ReadonlyRegister<onoff>;

  /** Hk2P_Al_Port: second heating circuit (mixer circuit) pump's state */
  @ext(0x43, 0)
  model Hc2PumpAlPort is ReadonlyRegister<onoff>;

  /** Mixer1DutyCycle: velocity by which the mixer is driven to its end position (positive value: end position is open, negative value: end position is shut) */
  @ext(0x2, 0)
  model Mixer1DutyCycle is ReadonlyRegister<percents>;

  /** Mixer1State: mixer's state */
  @ext(0x3, 0)
  model Mixer1State is ReadonlyRegister<UCH>;

  /** HC2_CircuitType */
  @inherit(r)
  @ext(0x1e, 0)
  model Hc2CircuitType {
    /** type of the second heating circuit */
    @values(Values_Hc2CircuitType)
    value: UCH;
  }

  /** MinFlowTemp: lower limitation of the second heating circuit's flow temperature */
  @ext(0x10, 0)
  model FlowTempMin is InstallRegister<temp1>;

  /** MaxFlowTemp: upper limitation of the second heating circuit's flow temperature */
  @ext(0x11, 0)
  model FlowTempMax is InstallRegister<temp1>;

  /** heating curve of the second heating circuit */
  @ext(0x15, 0)
  model HeatingCurve is InstallRegister<curve>;

  /** HC2_RoomControlMode */
  @inherit(r, wi)
  @ext(0x35, 0)
  model Hc2RoomControlMode {
    /** room temperature modulation of the second heating circuit */
    @values(Values_Hc2RoomControlMode)
    value: UCH;
  }

  /** HC2_SummerOffset: summer offset of the second heating circuit (if outside temperature > room setpoint + summer offset => heating is OFF; applies to comfort and night setback setpoint; no influence if room temperature modulation is set to "thermostat") */
  @ext(0x37, 0)
  model Hc2SummerOffset is InstallRegister<calibration1>;

  /** AutoOFF_Mode */
  @inherit(r, wi)
  @ext(0x1f, 0)
  model AutoOffMode {
    /** operation during the auto-off period */
    @values(Values_AutoOffMode)
    value: UCH;
  }

  /** HcParallelTankFillingEnabled: enable parallel tank loading */
  @ext(0x2d, 0)
  model HcParallelStorageFillingEnabled is ReadonlyRegister<onoff>;

  /** Flow setpoint: flow temperature setpoint of the second heating circuit */
  @ext(0x22, 0)
  model FlowTempDesired is ReadonlyRegister<temp1>;

  /** FloorPavingDryingDay: active day of the floor pavement drying function */
  @ext(0x1a, 0)
  model FloorPavingDryingDay is InstallRegister<UCH>;

  /** FloorPavingDryingTemperature: flow temperature setpoint for the current day of floor pavement drying */
  @ext(0x4, 0)
  model FloorPavingDryingTemp is ReadonlyRegister<temp1>;
  // ##### developer's info #####

  /** Weekday: current day of week */
  @ext(0xb, 0)
  model Weekday is ReadonlyRegister<bday>;

  /** current date */
  @ext(0xa, 0)
  model Date is ReadonlyRegister<date>;

  /** current time */
  @ext(0x9, 0)
  model Time is ReadonlyRegister<time>;

  /** ActualDesiredTemp: current setpoint for the second heating circuit considering all basic conditions passed to the control algorithms */
  @ext(0x2f, 0)
  model ActualTempDesired is ReadonlyRegister<temp1>;

  /** DayNightState: 0 = day, 1 = night */
  @ext(0x50, 0)
  model DayNightState is ReadonlyRegister<UCH>;

  /** FrostProtectDelay: delay before frost protection is activated */
  @ext(0x25, 0)
  model FrostProtectDelay is ReadonlyRegister<hours>;

  /** HcPumpIdlePeriod: 0=off, heating circuit pump's maximum blocking time for pump's energy saving function */
  @ext(0x28, 0)
  model HcPumpIdlePeriod is ReadonlyRegister<UCH>;

  /** MaxPreheatingMinutes: in steps of 10, maximum time of enabling the heating before the heating time window starts */
  @ext(0x24, 0)
  model PreheatingMinutesMax is ReadonlyRegister<UIN>;

  /** BoilerMaxPreShutdown: in steps of 10, maximum time of starting the lowering operation before the heating time window ends */
  @ext(0x18, 0)
  model BoilerMaxPreShutdown is ReadonlyRegister<UCH>;

  /** HC2_ContinuosHeating: -26=off, when the outside temperature falls below this threshold temperature the continuous heating function is started (off <=> function is disabled) */
  @ext(0x36, 0)
  model Hc2ContinuosHeating is ReadonlyRegister<SCH>;

  /** HcFlowIncrease: excess temperature (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
  @ext(0x19, 0)
  model HcFlowIncrease is ReadonlyRegister<calibration1>;

  /** Holiday function active */
  @ext(0x8, 0)
  model IsInHoliday is ReadonlyRegister<yesno>;

  /** IsInOneDayHoliday: indicates that the VR61 is in one day holiday mode */
  @ext(0x56, 0)
  model IsInOneDayHoliday is ReadonlyRegister<yesno>;

  /** IsInBankHoliday: indicates that the VR61 is in bank holiday mode */
  @ext(0x53, 0)
  model IsInBankHoliday is ReadonlyRegister<yesno>;

  /** IsInOneDayBankHoliday: indicates that the VR61 is in one day bank holiday mode */
  @ext(0x52, 0)
  model IsInOneDayBankHoliday is ReadonlyRegister<yesno>;

  /** IsInParty */
  @ext(0x55, 0)
  model IsInParty is ReadonlyRegister<yesno>;

  /** IsInImpactVentilation: indicates that the VR61 is in impact ventilation mode */
  @ext(0x57, 0)
  model IsInImpactVentilation is ReadonlyRegister<yesno>;

  /** IsInSystemOff: indicates that the VR61 is in system off mode */
  @ext(0x54, 0)
  model IsInSystemOff is ReadonlyRegister<yesno>;

  /** HC2_QuickVetoActive: manual override of the second heating circuit enabled */
  @ext(0x33, 0)
  model Hc2QuickVetoActive is ReadonlyRegister<yesno>;

  /** HcPreHeatingActive: bit-array where a set bit indicates that preheating is active for the corresponding heating circuit */
  @ext(0x2a, 0)
  model HcPreHeatingActive is ReadonlyRegister<yesno>;

  /** HcPreShutdownActive: bit-array where a set bit indicates that early cut off is active for the corresponding heating circuit */
  @ext(0x29, 0)
  model HcPreShutdownActive is ReadonlyRegister<yesno>;

  /** HcPumpIdlePeriodActive: bit-array where a set bit indicates that pump's energy saving function is active for the corresponding heating circuit */
  @ext(0x2b, 0)
  model HcPumpIdlePeriodActive is ReadonlyRegister<yesno>;

  /** MonitorEEpromInkonsiNumber */
  @inherit(r)
  @ext(0x46, 0)
  model MonitorEEpromInkonsiNumber {
    /** identification of the last eight EEPROM inconsistencies */
    @maxLength(8)
    value: HEX;
  }

  /** Hk2a_LegP_P2_Port: port: open mixer */
  @ext(0x44, 0)
  model Hc2aLegPumpP2Port is ReadonlyRegister<onoff>;

  /** Hk2z_Port: port: close mixer */
  @ext(0x45, 0)
  model Hc2zPort is ReadonlyRegister<onoff>;

  /** Hk2pDemand */
  @ext(0x49, 0)
  model Hc2pDemand is ReadonlyRegister<onoff>;

  /** SfState: 0 = _SfsNone, 1 = _SfsForceConsumption, 2 = _SfsFloorPavingDrying, 3 = _SfsSummerSwitchOff, 4 =_SfsTankFilling */
  @ext(0x4a, 0)
  model SfState is ReadonlyRegister<UCH>;

  /** PsSetpoint */
  @ext(0x4c, 0)
  model PsTempDesired is ReadonlyRegister<temp>;

  /** PumpSavingState: 0 = _PssInactive, 1 = _PssMonitoring, 2 = _PssCounting, 3 = _PssPostrun, 4 = _PssSaving */
  @ext(0x4d, 0)
  model PumpSavingState is ReadonlyRegister<UCH>;

  /** 0 = _OffConfig_Off, 1 = _OffConfig_Low */
  @ext(0x4e, 0)
  model OffConfig is ReadonlyRegister<UCH>;

  /** 0 = _FrostProtConfig_Low, 1 = _FrostProtConfig_PumpKick */
  @ext(0x4f, 0)
  model FrostProtConfig is ReadonlyRegister<UCH>;

  /** FrostProtState: 0 = _Fps_NoFrost, 1 = _Fps_Delay, 2 = _Fps_PumpKick, 3 = _Fps_KickOff, 4 = _Fps_Active */
  @ext(0x4b, 0)
  model FrostProtState is ReadonlyRegister<UCH>;

  /** ThermostatState: 0 = _ThermOn, 1 =_ThermOff */
  @ext(0x51, 0)
  model ThermostatState is ReadonlyRegister<UCH>;

  enum Values_InternalOperatingMode430 {
    off: 0,
    manual: 1,
    auto: 2,
  }

  enum Values_InternalOperatingMode470 {
    auto: 2,
    on: 3,
    night: 4,
    summer: 5,
  }

  enum Values_Hc2CircuitType {
    disabled: 0,
    mixing: 1,
    zone: 2,
  }

  enum Values_Hc2RoomControlMode {
    off: 0,
    modulating: 1,
    thermostat: 2,
  }

  enum Values_AutoOffMode {
    frostprotection: 0,
    lowering: 1,
    eco: 2,
  }
  @condition(Id.Id.sw, "<202")
  namespace Sw_lt202 {
    /** InternalOperatingMode430 */
    @inherit(r, w)
    @ext(0x31, 0)
    model InternalOperatingMode430 {
      /** operation mode of the second heating circuit for 430 */
      @values(Values_InternalOperatingMode430)
      value: UCH;
    }
  }
  @condition(Id.Id.sw, ">=202")
  namespace Sw_ge202 {
    /** InternalOperatingMode470 */
    @inherit(r, w)
    @ext(0x31, 0)
    model InternalOperatingMode470 {
      /** operation mode of the second heating circuit for 470 */
      @values(Values_InternalOperatingMode470)
      value: UCH;
    }
  }

  /** included parts */
  union _includes {
    Errors_inc,
    Timerhc_inc,
    Tempsetpoints_inc,
    Iotestbmc_inc,
  }
}
