import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./timercc_inc.tsp";
import "./timerhwc_inc.tsp";
import "./errors_inc.tsp";
import "./timerhc_inc.tsp";
import "./tempsetpoints_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace _430 {
  // ,43000,VRC 430,430 220
  // ##### general #####

  /** DisplayedRoomTemp: displayed room temperature */
  @ext(0x80, 0)
  model DisplayedRoomTemp is ReadonlyRegister<temp>;

  /** RaumtemperaturIst: raw value current room temperature and sensorstate (without any correction) */
  @ext(0, 0)
  model RoomTemp is ReadonlyRegister<tempsensor>;

  /** OutsideTempSensor: current outdoor temperature and sensorstate */
  @ext(0x62, 0)
  model OutsideTemp is ReadonlyRegister<tempsensor>;

  /** ActualWeekday: current day of week */
  @ext(0x5f, 0)
  model ActualWeekday is Register<bday>;

  /** current time */
  @ext(0x60, 0)
  model Time is Register<time>;

  /** current date */
  @ext(0x61, 0)
  model Date is Register<date>;

  /** StatusDcf: status of the DCF signal (0x00 = no DCF-Signal detected / no RTC value; 0x01 = DCF-signal detected; 0x02 = DCF-signal is being interpreted; 0x03 = DCF-data valid; 0x04 = RTC-data is valid) */
  @ext(0x2, 0)
  model StatusDcf is ReadonlyRegister<dcfstate>;

  /** Holiday function active: holidays active */
  @ext(0xb, 0)
  model IsInHoliday is ReadonlyRegister<yesno>;

  /** HC1_OPMode */
  @inherit(r, w)
  @ext(0x2f, 0)
  model Hc1OPMode {
    /** operation mode of the first heating circuit */
    @values(Values_Hc1OPMode)
    value: UCH;
  }

  /** HC1_NightSetTemp: lowering temperature setpoint of the first heating circuit */
  @ext(0x30, 0)
  model Hc1NightTemp is Register<temp1>;

  /** HC1_HeatCurve: heating curve of the first heating circuit */
  @ext(0x31, 0)
  model Hc1HeatCurve is Register<curve>;

  /** HC1_ManualOPRoomSetpoint: room setpoint in operation mode manual of the first heating circuit */
  @ext(0x32, 0)
  model Hc1ManualOPRoomTempDesired is Register<temp1>;

  /** HC1_QuickVetoTemp: manual override setpoint of the first heating circuit */
  @ext(0x3c, 0)
  model Hc1QuickVetoTemp is ReadonlyRegister<temp1>;

  /** HC1_QuickVetoActive: manual override of the first heating circuit enabled */
  @ext(0x3d, 0)
  model Hc1QuickVetoActive is ReadonlyRegister<yesno>;

  /** Circuits_Name_HC1 */
  @inherit(r, w)
  @ext(0x3f, 0)
  model NameHc1 {
    /** labelling of the first heating circuit */
    @maxLength(10)
    value: STR;
  }

  /** Circuits_Name_HC2 */
  @inherit(r, w)
  @ext(0x3f, 0x8)
  model NameHc2 {
    /** labelling of the second heating circuit */
    @maxLength(10)
    value: STR;
  }

  /** Circuits_Name_DHW */
  @inherit(r, w)
  @ext(0x3f, 0x78)
  model NameHwc {
    /** labelling of the domestic hot water circuit */
    @maxLength(10)
    value: STR;
  }

  /** HolidayRoomSetTemp: 4.5=frostprotect, room setpoint during holidays */
  @ext(0x40, 0)
  model HolidayRoomTemp is Register<D1C>;

  /** HolidayStartPeriod: start date of holidays */
  @ext(0x11, 0)
  model HolidayStartPeriod is Register<date>;

  /** HolidayEndPeriod: end date of holidays */
  @ext(0x12, 0)
  model HolidayEndPeriod is Register<date>;

  /** DHW_OPMode */
  @inherit(r, w)
  @ext(0x42, 0)
  model HwcOPMode {
    /** operation mode of the domestic hot water circuit */
    @values(Values_HwcOPMode)
    value: UCH;
  }

  /** DHW_DesiredTemp: setpoint of domestic hot water circuit */
  @ext(0x44, 0)
  model HwcTempDesired is Register<temp1>;

  /** DHW_QuickVetoTemp: manual override setpoint for the domestic hot water circuit */
  @ext(0x45, 0)
  model HwcQuickVetoTemp is ReadonlyRegister<temp1>;

  /** DHW_QuickVetoActive: manual override of the domestic hot water circuit enabled */
  @ext(0x43, 0)
  model HwcQuickVetoActive is ReadonlyRegister<yesno>;

  /** DHW_ManualOPSetpoint: setpoint of domestic hot water circuit in manual operation mode */
  @ext(0x4c, 0)
  model HwcManualOPTempDesired is Register<temp1>;

  /** SummerWinterTimeAdjust: enable automatic switching over to daylight saving's time (when a DCF receiver is connected to the BMU the value is set fix to ON) */
  @ext(0x53, 0)
  model SummerWinterTimeAdjust is Register<onoff>;

  /** DisplayedHK1RoomSetpoint: 0= >5°C, currently displayed room temperature setpoint */
  @ext(0x96, 0)
  model DisplayedHc1RoomTempDesired is ReadonlyRegister<temp1>;
  // ##### extra #####

  /** RoomTempCorrection: room temperature correction */
  @ext(0x57, 0)
  model RoomTempCorrection is InstallRegister<calibrations>;

  /** OutDoorTempCorr: outside temperature correction */
  @ext(0x58, 0)
  model OutsideTempOffset is InstallRegister<calibrations>;

  /** FrostOverRideTime: delay before frost protection is activated */
  @ext(0x1a, 0)
  model FrostOverRideTime is InstallRegister<hours>;

  /** BaseDisplay */
  @inherit(r)
  @ext(0x2e, 0)
  model BaseDisplay {
    /** selection which heating circuit's parameters are shown in the basic display */
    @values(Values_BaseDisplay)
    value: UCH;
  }

  /** HC1_RoomTempSwitchOn */
  @inherit(r, wi)
  @ext(0x34, 0)
  model Hc1RoomTempSwitchOn {
    /** room temperature modulation of the first heating circuit */
    @values(Values_Hc1RoomTempSwitchOn)
    value: UCH;
  }

  /** HC1_MinimalFlowSetpoint: minimum flow temperature setpoint (end emphasis) of the first heating circuit */
  @ext(0x35, 0)
  model Hc1MinimalFlowTempDesired is InstallRegister<temp1>;

  /** HC1_HCType */
  @inherit(r, wi)
  @ext(0x3a, 0)
  model Hc1HcType {
    /** type of the first heating circuit */
    @values(Values_Hc1HcType)
    value: UCH;
  }

  /** HC1_SummerOffset: summer offset of the first heating circuit (if outside temperature > room setpoint + summer offset => heating is OFF;applies to comfort and night setback setpoint; no influence if room temperature modulation is set to "thermostat") */
  @ext(0x3b, 0)
  model Hc1SummerOffset is InstallRegister<calibration1>;

  /** HC1ActualFlowSetPoint: calculated flow temperature setpoint of the first heating circuit */
  @ext(0x3e, 0)
  model Hc1ActualFlowTempDesired is ReadonlyRegister<temp1>;

  /** DHW_LoadingOffset: flow temperature's tank loading offset (flow setpoint of the DHW circuit = DHW setpoint + flow temperature's tank loading offset; only relevant if DHW control is done by control) */
  @ext(0x46, 0)
  model HwcLoadingOffset is InstallRegister<calibration1>;

  /** DHW_LP_postrunningtime: duration of the tank loading pump's lag (only relevant if DHW control is done by control) */
  @ext(0x47, 0)
  model HwcPressLowpostrunningtime is InstallRegister<minutes0>;

  /** DHW_Parallel_Loading: enable parallel tank loading */
  @ext(0x48, 0)
  model HwcParallelLoading is InstallRegister<onoff>;

  /** DHW_LegioStartDay */
  @inherit(r, wi)
  @ext(0x49, 0)
  model HwcLegioStartDay {
    /** weekday on which legionella protection is started (may also be every day of the week) */
    @values(Values_HwcLegioStartDay)
    value: UCH;
  }

  /** DHW_LegioStartTime: time on which legionella protection is started */
  @ext(0x4a, 0)
  model HwcLegioStartTime is InstallRegister<time>;

  /** DHW_CircuitActive: domestic hot water circuit is enabled */
  @ext(0x4b, 0)
  model HwcCircuitActive is InstallRegister<yesno>;

  /** AutoOFF_Mode */
  @inherit(r, wi)
  @ext(0x4d, 0)
  model AutoOffMode {
    /** operation during the lowering time */
    @values(Values_AutoOffMode)
    value: UCH;
  }

  /** ContinuosHeating: -26=off, when the outside temperature falls below this threshold temperature the continuous heating function is started (off <=> function is disabled) */
  @ext(0x4f, 0)
  model ContinuosHeating is InstallRegister<SCH>;

  /** PreheatingTime: in steps of 10, maximum time of enabling the heating before the heating time window starts */
  @ext(0x50, 0)
  model PreheatingTime is InstallRegister<UIN>;

  /** PreStopTime: in steps of 10, maximum time of starting the lowering operation before the heating time window ends */
  @ext(0x51, 0)
  model PreStopTime is InstallRegister<UCH>;

  /** ExcessTemperature: excess temperature (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
  @ext(0x52, 0)
  model ExcessTemp is InstallRegister<calibration1>;

  /** aucPhoneNumber_1: first part of the installer's telephone number */
  @ext(0x54, 0)
  model PhoneNumber1 is ReadonlyRegister<phone>;

  /** aucPhoneNumber_2: second part of the installer's telephone number */
  @ext(0x54, 0x8)
  model PhoneNumber2 is ReadonlyRegister<phone>;

  /** KeyCodeforConfigMenue */
  @inherit(r, wi)
  @ext(0x55, 0)
  model KeyCodeforConfigMenu {
    /** code for the installer's menues */
    @maxLength(4)
    value: HEX;
  }

  /** MaintenanceDate: date of the next maintenance service */
  @ext(0x59, 0)
  model MaintenanceDate is InstallRegister<date>;

  /** LcdContrastValue: setting of the LCD contrast */
  @ext(0x5a, 0)
  model LcdContrastValue is InstallRegister<UCH>;

  /** BKMK1ConfigCPLPAsLP */
  @inherit(r, wi)
  @ext(0x7d, 0)
  model HcMc1ConfigCPLPAsLP {
    /** configuration of the VR61 relay-output */
    @values(Values_HcMc1ConfigCPLPAsLP)
    value: UCH;
  }

  /** MaxPumpBlockingTime: 0=off, heating circuit pump's maximum blocking time for pump's energy saving function */
  @ext(0x7e, 0)
  model PumpBlockingTimeMax is InstallRegister<UCH>;

  /** CircuPumpRunning: circulation pump's state */
  @ext(0x81, 0)
  model CirPump is ReadonlyRegister<onoff>;

  /** HK1PumpState: first heating circuit pump's state */
  @ext(0x82, 0)
  model Hc1Pump is ReadonlyRegister<onoff>;

  /** HC2_HCType */
  @inherit(r, wi)
  @ext(0x85, 0)
  model Hc2HcType {
    /** type of the second heating circuit */
    @values(Values_Hc2HcType)
    value: UCH;
  }

  /** DHW_ActualDesired_Setpoint: current domestic hot water setpoint */
  @ext(0x86, 0)
  model HwcActualTempDesired is ReadonlyRegister<temp1>;

  /** BMU_FlowTempOrVF_1: value of either an externally connected flow temperature sensor or the BMU's internal flow sensor if an external sensor is missing */
  @ext(0x87, 0)
  model BMUFlowTempOrVF1 is ReadonlyRegister<tempsensor>;
  // ##### developer's info #####

  /** StarteEepromAktualisierung: update of the EEPROM is to be started */
  @ext(0xe, 0)
  model StartEepromUpdate is ReadonlyRegister<onoff>;

  /** EepromAktualisierungAktiv: update of the EEPROM has been started */
  @ext(0xf, 0)
  model EepromUpdateActive is ReadonlyRegister<onoff>;

  /** RaumTempOffsetEigenErwaerm: room temperature intrinsic heating offset */
  @ext(0x15, 0)
  model RoomTempOffsetSelfWarming is ReadonlyRegister<temp>;

  /** CountryVariant: country variant (0 = west, 1 = east) */
  @ext(0x17, 0)
  model CountryVariant is ReadonlyRegister<UCH>;

  /** ActualRoomTempSetpointHC1: current room setpoint considering all basic conditions passed to the control algorithms */
  @ext(0x63, 0)
  model ActualRoomTempDesiredHc1 is ReadonlyRegister<temp>;

  /** SolarModuleDetected: indicates that a VR68 has been detected */
  @ext(0x6c, 0)
  model SolModuleDetected is ReadonlyRegister<yesno>;

  /** BKMK1Detected: indicates that a VR61 has been detected */
  @ext(0x6d, 0)
  model HcMc1Detected is ReadonlyRegister<yesno>;

  /** HRUDetected: indicates that an airvent module / a heat recovery unit has been detected */
  @ext(0x6e, 0)
  model HRUDetected is ReadonlyRegister<yesno>;

  /** ACTOstorDetected: indicates that an ACTOstor has been detected */
  @ext(0x6f, 0)
  model ACTOstorDetected is ReadonlyRegister<yesno>;

  /** BMUB51101_ErrorStatus: error state of BMU received via eBUS service B51101 */
  @ext(0x70, 0)
  model BMUB51101ErrorStatus is ReadonlyRegister<UCH>;

  /** BMUB51101_TankTemp: hot water storage temperature received via eBUS service B5 11 01 */
  @ext(0x71, 0)
  model BMUB51101StorageTemp is ReadonlyRegister<temp1>;

  /** LegioProtectActive: legionella protection is active */
  @ext(0x73, 0)
  model LegioProtectActive is ReadonlyRegister<yesno>;

  /** BMUB51101_DHWState: flame is on because of either tapping or tank loading */
  @ext(0x75, 0)
  model BMUB51101HwcState is ReadonlyRegister<onoff>;

  /** VF_1: current external flow temperature and sensorstate */
  @ext(0x76, 0)
  model VF1 is ReadonlyRegister<tempsensor>;

  /** BMUB51101_BoilerFlowTemp: current flow temperature inside the BMU */
  @ext(0x77, 0)
  model BMUB51101BoilerFlowTemp is ReadonlyRegister<temp1>;

  /** EnermanState: current energy-manager-state (Off = 0, Heating = 1, DHW = 2, DHW pump lag = 3) */
  @ext(0x7a, 0)
  model EnermanState is ReadonlyRegister<UCH>;

  /** B51000SetPointLoadingPump: loading pump's setpoint sent via B5 10 00 to the BMU */
  @ext(0x7b, 0)
  model B51000TempDesiredLoadingPump is ReadonlyRegister<D1C>;

  /** BKMK1CPLPState: nominal condition of the VR61's circulation or loading pump */
  @ext(0x7f, 0)
  model HcMc1CPLPState is ReadonlyRegister<onoff>;

  /** CP_LPLast24started: circulation respectively loading pump has been started during the last 24h */
  @ext(0x83, 0)
  model CPLPLast24started is ReadonlyRegister<yesno>;

  /** HK1PumpLast24started: first heating circuit's pump has been started during the last 24h */
  @ext(0x84, 0)
  model Hc1PumpLast24started is ReadonlyRegister<yesno>;

  /** FrostProtectState_Monitor: monitoring of the frost protection's state transition diagram */
  @ext(0x89, 0)
  model FrostProtectStateMonitor is ReadonlyRegister<UCH>;

  /** FrostProtectionRequired_Monitor: frost protection should be enabled */
  @ext(0x8a, 0)
  model FrostProtectionRequiredMonitor is ReadonlyRegister<yesno>;

  /** HC1PreOrContinuosHeatingActive: preheating or continous heating is active for the first heating circuit */
  @ext(0x8b, 0)
  model Hc1PreOrContinuosHeatingActive is ReadonlyRegister<yesno>;

  /** CalculatedKickStopTime: calculated time in between two pump kicks during frostprotection (time depends on outside temperature) */
  @ext(0x8c, 0)
  model CalculatedKickStopTime is ReadonlyRegister<minutes0>;

  /** B51000FlowSetMonitor: flow temperature setpoint sent via B5 10 00 to the BMU */
  @ext(0x8d, 0)
  model B51000FlowSetMonitor is ReadonlyRegister<temp1>;

  /** FrostProtectDelayMonitor: frost protection delay has not elapsed yet */
  @ext(0x8f, 0)
  model FrostProtectDelayMonitor is ReadonlyRegister<yesno>;

  /** ChimneySweepModeActive: chimney sweep mode has been enabled by the BMU */
  @ext(0x90, 0)
  model ChimneySweepModeActive is ReadonlyRegister<yesno>;

  /** PumpEnergySaveStateMonitor: monitoring of the pump energy saving's state transition diagram */
  @ext(0x91, 0)
  model PumpEnergySaveStateMonitor is ReadonlyRegister<UCH>;

  /** PumpEnergySaveCalculatedTimeMonitor: calculated time for the heating circuit's pump's switch off time during pump energy saving function (depends on outside temperature) */
  @ext(0x92, 0)
  model PumpEnergySaveCalculatedTimeMonitor is ReadonlyRegister<minutes0>;

  /** DHWLoadingIn430Active: DHW-loading is active in non parallel loading cases */
  @ext(0x93, 0)
  model HwcLoadingIn430Active is ReadonlyRegister<yesno>;

  /** actoSTOR_OPMode: Zustands-Automat actSTOR Ansteuerung */
  @ext(0x94, 0)
  model ActoSTOROPMode is ReadonlyRegister<UCH>;

  /** B50418actDesFlowTemp: flow temperature setpoint calculated by actoSTOR (S3 of B5 04 18) */
  @ext(0x6b, 0)
  model B50418actDesFlowTemp is ReadonlyRegister<D1C>;
  // ##### adaptive heating #####

  /** adpPreH_RoomSetpoint */
  @ext(0xb4, 0)
  model AdpPreHRoomTempDesired is ReadonlyRegister<temp>;

  /** adpPreH_CurrentRoomTemp */
  @ext(0xb5, 0)
  model AdpPreHCurrentRoomTemp is ReadonlyRegister<temp>;

  /** adpPreH_MinutesBeforeFirstTW */
  @ext(0xb6, 0)
  model AdpPreHMinutesBeforeFirstTW is ReadonlyRegister<seconds2>;

  /** adpPreH_PreheatingTime */
  @ext(0xb7, 0)
  model AdpPreHPreheatingTime is ReadonlyRegister<minutes2>;

  /** adpPreH_OutdoorTemp */
  @ext(0xb8, 0)
  model AdpPreHOutdoorTemp is ReadonlyRegister<temp>;

  /** adpPreH_InSideTW */
  @ext(0xb9, 0)
  model AdpPreHInSideTW is ReadonlyRegister<onoff>;

  /** adpPreH_OutdoorTempStart */
  @ext(0xba, 0)
  model AdpPreHOutdoorTempStart is ReadonlyRegister<temp>;

  /** adpPreH_Ramp */
  @ext(0xbb, 0)
  model AdpPreHRamp is ReadonlyRegister<UIN>;

  /** adpPreH_Starttime */
  @ext(0xbc, 0)
  model AdpPreHStarttime is ReadonlyRegister<seconds2>;

  /** adpPreH_RoomTempStart */
  @ext(0xbd, 0)
  model AdpPreHRoomTempStart is ReadonlyRegister<temp>;

  /** adpPreH_Active */
  @ext(0xbe, 0)
  model AdpPreHActive is ReadonlyRegister<onoff>;

  enum Values_Hc1OPMode {
    off: 0,
    manual: 1,
    auto: 2,
  }

  enum Values_HwcOPMode {
    off: 0,
    manual: 1,
    auto: 2,
  }

  enum Values_BaseDisplay {
    off: 0,
    HC1: 1,
    HC2: 2,
  }

  enum Values_Hc1RoomTempSwitchOn {
    off: 0,
    modulating: 1,
    thermostat: 2,
  }

  enum Values_Hc1HcType {
    disabled: 0,
    burnercircuit: 1,
  }

  enum Values_HwcLegioStartDay {
    Mon: 0,
    Tue: 1,
    Wed: 2,
    Thu: 3,
    Fri: 4,
    Sat: 5,
    Sun: 6,
    off: 7,
    Mon_Sun: 8,
  }

  enum Values_AutoOffMode {
    frostprotection: 0,
    lowering: 1,
    eco: 2,
  }

  enum Values_HcMc1ConfigCPLPAsLP {
    CP: 0,
    LP: 1,
  }

  enum Values_Hc2HcType {
    disabled: 0,
    mixing: 1,
    zone: 2,
  }
  @condition(Id.Id.sw, ">=215")
  namespace Sw_ge215 {
    /** DHW_QuickVetoTemp */
    @inherit(w)
    @ext(0x45, 0)
    model HwcQuickVetoTemp {
      /** manual override setpoint for the domestic hot water circuit */
      value: temp1;
    }

    /** DHW_QuickVetoActive */
    @inherit(w)
    @ext(0x43, 0)
    model HwcQuickVetoActive {
      /** manual override of the domestic hot water circuit enabled */
      value: yesno;
    }
  }
  @condition(Id.Id.sw, ">=125")
  namespace Sw_ge125 {
    /** DisplayedDHWTankTemperature: display of the storage's temperature in C4 (also in case of an SP1 error) */
    @ext(0x9e, 0)
    model DisplayedHwcStorageTemp is ReadonlyRegister<temp1>;

    /** DHWLoadingInBMUActive: indicates that BMU is in DHW preparation */
    @ext(0x9d, 0)
    model HwcLoadingInBMUActive is ReadonlyRegister<yesno>;

    /** MonitorEEpromInkonsiNumber */
    @inherit(r)
    @ext(0x9f, 0)
    model MonitorEEpromInkonsiNumber {
      /** identification of the last eight EEPROM inconsistencies */
      @maxLength(8)
      value: HEX;
    }
  }
  @condition(Id.Id.sw, ">=216")
  namespace Sw_ge216 {
    /** HC1_FloorPavementDryingTemperature: HC1's current flow temperature setpoint with activated floor pavement drying */
    @ext(0x2a, 0)
    model Hc1FloorPavementDryingTemp is ReadonlyRegister<temp1>;

    /** HC1_FloorPavementDryingDay: HC1's current day of floor pavement drying */
    @ext(0x38, 0)
    model Hc1FloorPavementDryingDay is ReadonlyRegister<UCH>;
  }
  @condition(Id.Id.sw, "<=209")
  namespace Sw_le209 {
    /** B51000CHDisableMonitor: copy of the M12 byte of the B5 10 00 service containing the disable bits */
    @ext(0x8e, 0)
    model B51000HcDisableMonitor is ReadonlyRegister<UCH>;
  }
  @condition(Id.Id.sw, ">=210")
  namespace Sw_ge210 {
    /** B51000M7OpModeMonitor: operation mode sent via B5 10 00 (0 = auto, 1 = forced off, 2 = forced CH, 3 = forced DHW) */
    @ext(0x65, 0)
    model B51000M7OpModeMonitor is ReadonlyRegister<UCH>;

    /** B51000M10DHWFlowSetMon: flow setpoint DHW sent via B5 10 00 */
    @ext(0x66, 0)
    model B51000M10HwcFlowSetMon is ReadonlyRegister<UCH>;

    /** B51000M12DisableBitsMon: bits 0-7: disable CH/disable DHW tapping/disable DHW tank loading/not used/clear burner blocking DHW/dis, disable bits sent via B5 10 00 (leftmost bit 0, rightmost bit 7) */
    @ext(0x67, 0)
    model B51000M12DisableBitsMon is ReadonlyRegister<UCH>;

    /** B51000M14Monitor: bits 0-7: remote control CH pump/release backup heater/release cooling/not used/left stop position DHW o, bits sent in M14 of B5 10 00 (leftmost bit 0, rightmost bit 7; relevant is bit 0: remote control of CH pump) */
    @ext(0x68, 0)
    model B51000M14Monitor is ReadonlyRegister<UCH>;
  }
  @condition(Id.Id.sw, ">=126")
  namespace Sw_ge126 {
    /** AssertFileName */
    @inherit(r)
    @ext(0xa0, 0)
    model AssertFileName {
      /** shows, if assert is enabled, the name of the module where the 'assert fail' occured */
      @maxLength(10)
      value: STR;
    }

    /** AssertLineNumber: assert fail occured in this line */
    @ext(0xa1, 0)
    model AssertLineNumber is ReadonlyRegister<UIN>;

    /** actostorstate: state of the actoSTOR control (0 = off; 1 = DHW released; 2 = DHW loading; 3 = Pump overrun; 4 = stop pump overrun) */
    @ext(0xa4, 0)
    model Actostorstate is ReadonlyRegister<UCH>;
  }
  @condition(Id.Id.sw, ">=208")
  namespace Sw_ge208 {
    /** V430_PluggedIn: false if calorMATIC 430 is set inside a wall socket and not plugged in */
    @ext(0xb3, 0)
    model V430PluggedIn is ReadonlyRegister<onoff>;
  }

  /** included parts */
  union _includes {
    Timercc_inc,
    Timerhwc_inc,
    Errors_inc,
    Timerhc_inc,
    Tempsetpoints_inc,
  }
}
