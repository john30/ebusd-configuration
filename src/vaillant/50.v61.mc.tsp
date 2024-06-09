import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
import "./timerhc_inc.tsp";
import "./tempsetpoints_inc.tsp";
import "./iotestbmc_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x50)
namespace v61.mc {
  // ,V6100,VR 61,V61 219

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
  // ##### general #####

  @condition(id.id.sw, "<202")
  namespace sw_202 {
    /** InternalOperatingMode430 */
    @inherit(r, w)
    @ext(0x31, 0)
    model InternalOperatingMode430 {
      /** operation mode of the second heating circuit for 430 */
      @values(values_InternalOperatingMode430)
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=202")
  namespace sw__202 {
    /** InternalOperatingMode470 */
    @inherit(r, w)
    @ext(0x31, 0)
    model InternalOperatingMode470 {
      /** operation mode of the second heating circuit for 470 */
      @values(values_InternalOperatingMode470)
      value: UCH;
    }
  }

  /** DesiredLowTemperature */
  @inherit(r, w)
  @ext(0x13, 0)
  model TempDesiredLow {
    /** lowering temperature setpoint of the second heating circuit */
    value: temp1;
  }

  /** DesiredHighTemperature */
  @inherit(r, w)
  @ext(0x38, 0)
  model TempDesiredHigh {
    /** day temperature setpoint of the second heating circuit */
    value: temp1;
  }

  /** DesiredHolidayTemperature */
  @inherit(r, w)
  @ext(0x14, 0)
  model HolidayTempDesired {
    /** 4.5=frostprotect, holiday temperature of the second heating circuit */
    value: D1C;
  }

  /** HC2_ManualOPRoomSetpoint */
  @inherit(r, w)
  @ext(0x34, 0)
  model Hc2ManualOPRoomTempDesired {
    /** room setpoint in operation mode manual of the second heating circuit */
    value: temp1;
  }

  /** HC2_QuickVetoTemp */
  @inherit(r)
  @ext(0x32, 0)
  model Hc2QuickVetoTemp {
    /** manual override setpoint of the second heating circuit */
    value: temp1;
  }

  /** DisplayedRoomSetpoint */
  @inherit(r)
  @ext(0x48, 0)
  model DisplayedRoomTempDesired {
    value: temp;
  }

  /** SunMoonInfo */
  @inherit(r)
  @ext(0x47, 0)
  model SunMoonInfo {
    /** (2 = sun, 4 = moon) */
    value: UCH;
  }
  // ##### extra #####

  /** Flow1Sensor */
  @inherit(r)
  @ext(0, 0)
  model Flow1Sensor {
    /** second heating circuit's flow temperature and sensorstate */
    value: tempsensor;
  }

  /** BurnerCircuitPump */
  @inherit(r)
  @ext(0x20, 0)
  model BoilerCircuitPump {
    /** first heating circuit (burner circuit) pump's state */
    value: onoff;
  }

  /** circulation pump */
  @inherit(r)
  @ext(1, 0)
  model CirPump {
    /** control state of the circulation respectively loading pump (functionality of the pump depends on the configuration) */
    value: onoff;
  }

  /** Hk1P_Kol1P_P1_Port */
  @inherit(r)
  @ext(0x42, 0)
  model Hc1PumpKol1PP1Port {
    /** first heating circuit pump's state */
    value: onoff;
  }

  /** Hk2P_Al_Port */
  @inherit(r)
  @ext(0x43, 0)
  model Hc2PumpAlPort {
    /** second heating circuit (mixer circuit) pump's state */
    value: onoff;
  }

  /** Mixer1DutyCycle */
  @inherit(r)
  @ext(0x2, 0)
  model Mixer1DutyCycle {
    /** velocity by which the mixer is driven to its end position (positive value: end position is open, negative value: end position is shut) */
    value: percents;
  }

  /** Mixer1State */
  @inherit(r)
  @ext(0x3, 0)
  model Mixer1State {
    /** mixer's state */
    value: UCH;
  }

  /** HC2_CircuitType */
  @inherit(r)
  @ext(0x1e, 0)
  model Hc2CircuitType {
    /** type of the second heating circuit */
    @values(values_Hc2CircuitType)
    value: UCH;
  }

  /** MinFlowTemp */
  @inherit(r, wi)
  @ext(0x10, 0)
  model FlowTempMin {
    /** lower limitation of the second heating circuit's flow temperature */
    value: temp1;
  }

  /** MaxFlowTemp */
  @inherit(r, wi)
  @ext(0x11, 0)
  model FlowTempMax {
    /** upper limitation of the second heating circuit's flow temperature */
    value: temp1;
  }

  /** Heating curve */
  @inherit(r, wi)
  @ext(0x15, 0)
  model HeatingCurve {
    /** heating curve of the second heating circuit */
    value: curve;
  }

  /** HC2_RoomControlMode */
  @inherit(r, wi)
  @ext(0x35, 0)
  model Hc2RoomControlMode {
    /** room temperature modulation of the second heating circuit */
    @values(values_Hc2RoomControlMode)
    value: UCH;
  }

  /** HC2_SummerOffset */
  @inherit(r, wi)
  @ext(0x37, 0)
  model Hc2SummerOffset {
    /** summer offset of the second heating circuit (if outside temperature > room setpoint + summer offset => heating is OFF; applies to comfort and night setback setpoint; no influence if room temperature modulation is set to "thermostat") */
    value: calibration1;
  }

  /** AutoOFF_Mode */
  @inherit(r, wi)
  @ext(0x1f, 0)
  model AutoOffMode {
    /** operation during the auto-off period */
    @values(values_AutoOffMode)
    value: UCH;
  }

  /** HcParallelTankFillingEnabled */
  @inherit(r)
  @ext(0x2d, 0)
  model HcParallelStorageFillingEnabled {
    /** enable parallel tank loading */
    value: onoff;
  }

  /** Flow setpoint */
  @inherit(r)
  @ext(0x22, 0)
  model FlowTempDesired {
    /** flow temperature setpoint of the second heating circuit */
    value: temp1;
  }

  /** FloorPavingDryingDay */
  @inherit(r, wi)
  @ext(0x1a, 0)
  model FloorPavingDryingDay {
    /** active day of the floor pavement drying function */
    value: UCH;
  }

  /** FloorPavingDryingTemperature */
  @inherit(r)
  @ext(0x4, 0)
  model FloorPavingDryingTemp {
    /** flow temperature setpoint for the current day of floor pavement drying */
    value: temp1;
  }
  // ##### developer's info #####

  /** weekday */
  @inherit(r)
  @ext(0xb, 0)
  model Weekday {
    /** current day of week */
    value: bday;
  }

  /** date */
  @inherit(r)
  @ext(0xa, 0)
  model Date {
    /** current date */
    value: date;
  }

  /** time */
  @inherit(r)
  @ext(0x9, 0)
  model Time {
    /** current time */
    value: time;
  }

  /** ActualDesiredTemp */
  @inherit(r)
  @ext(0x2f, 0)
  model ActualTempDesired {
    /** current setpoint for the second heating circuit considering all basic conditions passed to the control algorithms */
    value: temp1;
  }

  /** DayNightState */
  @inherit(r)
  @ext(0x50, 0)
  model DayNightState {
    /** 0 = day, 1 = night */
    value: UCH;
  }

  /** FrostProtectDelay */
  @inherit(r)
  @ext(0x25, 0)
  model FrostProtectDelay {
    /** delay before frost protection is activated */
    value: hours;
  }

  /** HcPumpIdlePeriod */
  @inherit(r)
  @ext(0x28, 0)
  model HcPumpIdlePeriod {
    /** 0=off, heating circuit pump's maximum blocking time for pump's energy saving function */
    value: UCH;
  }

  /** MaxPreheatingMinutes */
  @inherit(r)
  @ext(0x24, 0)
  model PreheatingMinutesMax {
    /** in steps of 10, maximum time of enabling the heating before the heating time window starts */
    value: UIN;
  }

  /** BoilerMaxPreShutdown */
  @inherit(r)
  @ext(0x18, 0)
  model BoilerMaxPreShutdown {
    /** in steps of 10, maximum time of starting the lowering operation before the heating time window ends */
    value: UCH;
  }

  /** HC2_ContinuosHeating */
  @inherit(r)
  @ext(0x36, 0)
  model Hc2ContinuosHeating {
    /** -26=off, when the outside temperature falls below this threshold temperature the continuous heating function is started (off <=> function is disabled) */
    value: SCH;
  }

  /** HcFlowIncrease */
  @inherit(r)
  @ext(0x19, 0)
  model HcFlowIncrease {
    /** excess temperature (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibration1;
  }

  /** Holiday function active */
  @inherit(r)
  @ext(0x8, 0)
  model IsInHoliday {
    value: yesno;
  }

  /** IsInOneDayHoliday */
  @inherit(r)
  @ext(0x56, 0)
  model IsInOneDayHoliday {
    /** indicates that the VR61 is in one day holiday mode */
    value: yesno;
  }

  /** IsInBankHoliday */
  @inherit(r)
  @ext(0x53, 0)
  model IsInBankHoliday {
    /** indicates that the VR61 is in bank holiday mode */
    value: yesno;
  }

  /** IsInOneDayBankHoliday */
  @inherit(r)
  @ext(0x52, 0)
  model IsInOneDayBankHoliday {
    /** indicates that the VR61 is in one day bank holiday mode */
    value: yesno;
  }

  /** IsInParty */
  @inherit(r)
  @ext(0x55, 0)
  model IsInParty {
    value: yesno;
  }

  /** IsInImpactVentilation */
  @inherit(r)
  @ext(0x57, 0)
  model IsInImpactVentilation {
    /** indicates that the VR61 is in impact ventilation mode */
    value: yesno;
  }

  /** IsInSystemOff */
  @inherit(r)
  @ext(0x54, 0)
  model IsInSystemOff {
    /** indicates that the VR61 is in system off mode */
    value: yesno;
  }

  /** HC2_QuickVetoActive */
  @inherit(r)
  @ext(0x33, 0)
  model Hc2QuickVetoActive {
    /** manual override of the second heating circuit enabled */
    value: yesno;
  }

  /** HcPreHeatingActive */
  @inherit(r)
  @ext(0x2a, 0)
  model HcPreHeatingActive {
    /** bit-array where a set bit indicates that preheating is active for the corresponding heating circuit */
    value: yesno;
  }

  /** HcPreShutdownActive */
  @inherit(r)
  @ext(0x29, 0)
  model HcPreShutdownActive {
    /** bit-array where a set bit indicates that early cut off is active for the corresponding heating circuit */
    value: yesno;
  }

  /** HcPumpIdlePeriodActive */
  @inherit(r)
  @ext(0x2b, 0)
  model HcPumpIdlePeriodActive {
    /** bit-array where a set bit indicates that pump's energy saving function is active for the corresponding heating circuit */
    value: yesno;
  }

  /** MonitorEEpromInkonsiNumber */
  @inherit(r)
  @ext(0x46, 0)
  model MonitorEEpromInkonsiNumber {
    /** identification of the last eight EEPROM inconsistencies */
    @maxLength(8)
    value: HEX;
  }

  /** Hk2a_LegP_P2_Port */
  @inherit(r)
  @ext(0x44, 0)
  model Hc2aLegPumpP2Port {
    /** port: open mixer */
    value: onoff;
  }

  /** Hk2z_Port */
  @inherit(r)
  @ext(0x45, 0)
  model Hc2zPort {
    /** port: close mixer */
    value: onoff;
  }

  /** Hk2pDemand */
  @inherit(r)
  @ext(0x49, 0)
  model Hc2pDemand {
    value: onoff;
  }

  /** SfState */
  @inherit(r)
  @ext(0x4a, 0)
  model SfState {
    /** 0 = _SfsNone, 1 = _SfsForceConsumption, 2 = _SfsFloorPavingDrying, 3 = _SfsSummerSwitchOff, 4 =_SfsTankFilling */
    value: UCH;
  }

  /** PsSetpoint */
  @inherit(r)
  @ext(0x4c, 0)
  model PsTempDesired {
    value: temp;
  }

  /** PumpSavingState */
  @inherit(r)
  @ext(0x4d, 0)
  model PumpSavingState {
    /** 0 = _PssInactive, 1 = _PssMonitoring, 2 = _PssCounting, 3 = _PssPostrun, 4 = _PssSaving */
    value: UCH;
  }

  /** OffConfig */
  @inherit(r)
  @ext(0x4e, 0)
  model OffConfig {
    /** 0 = _OffConfig_Off, 1 = _OffConfig_Low */
    value: UCH;
  }

  /** FrostProtConfig */
  @inherit(r)
  @ext(0x4f, 0)
  model FrostProtConfig {
    /** 0 = _FrostProtConfig_Low, 1 = _FrostProtConfig_PumpKick */
    value: UCH;
  }

  /** FrostProtState */
  @inherit(r)
  @ext(0x4b, 0)
  model FrostProtState {
    /** 0 = _Fps_NoFrost, 1 = _Fps_Delay, 2 = _Fps_PumpKick, 3 = _Fps_KickOff, 4 = _Fps_Active */
    value: UCH;
  }

  /** ThermostatState */
  @inherit(r)
  @ext(0x51, 0)
  model ThermostatState {
    /** 0 = _ThermOn, 1 =_ThermOff */
    value: UCH;
  }

  enum values_InternalOperatingMode430 {
    off: 0,
    manual: 1,
    auto: 2,
  }

  enum values_InternalOperatingMode470 {
    auto: 2,
    on: 3,
    night: 4,
    summer: 5,
  }

  enum values_Hc2CircuitType {
    disabled: 0,
    mixing: 1,
    zone: 2,
  }

  enum values_Hc2RoomControlMode {
    off: 0,
    modulating: 1,
    thermostat: 2,
  }

  enum values_AutoOffMode {
    frostprotection: 0,
    lowering: 1,
    eco: 2,
  }

  /** included parts */
  union _includes {
    errors_inc,
    timerhc_inc,
    tempsetpoints_inc,
    iotestbmc_inc,
  }
}
