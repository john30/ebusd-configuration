import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./timercc_inc.tsp";
import "./timerhwc_inc.tsp";
import "./errors_inc.tsp";
import "./timerhc_inc.tsp";
import "./tempsetpoints_inc.tsp";
import "./service_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x15)
namespace f43 {
  // ,F4300,VRC 430f,F43 221

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

  /** DisplayedRoomTemp */
  @inherit(r)
  @ext(0x80, 0)
  model DisplayedRoomTemp {
    /** displayed room temperature */
    value: temp;
  }

  /** RaumtemperaturIst */
  @inherit(r)
  @ext(0, 0)
  model RoomTemp {
    /** raw value current room temperature and sensorstate (without any correction) */
    value: tempsensor;
  }

  /** OutsideTempSensor */
  @inherit(r)
  @ext(0x62, 0)
  model OutsideTemp {
    /** current outdoor temperature and sensorstate */
    value: tempsensor;
  }

  /** Actual Weekday */
  @inherit(r, w)
  @ext(0x5f, 0)
  model ActualWeekday {
    /** current day of week */
    value: bday;
  }

  /** time */
  @inherit(r, w)
  @ext(0x60, 0)
  model Time {
    /** current time */
    value: time;
  }

  /** date */
  @inherit(r, w)
  @ext(0x61, 0)
  model Date {
    /** current date */
    value: date;
  }

  /** StatusDcf */
  @inherit(r)
  @ext(0x2, 0)
  model StatusDcf {
    /** status of the DCF signal (0x00 = no DCF-Signal detected / no RTC value; 0x01 = DCF-signal detected; 0x02 = DCF-signal is being interpreted; 0x03 = DCF-data valid; 0x04 = RTC-data is valid) */
    value: dcfstate;
  }

  /** Holiday function active */
  @inherit(r)
  @ext(0xb, 0)
  model IsInHoliday {
    /** holidays active */
    value: yesno;
  }

  /** HC1_OPMode */
  @inherit(r, w)
  @ext(0x2f, 0)
  model Hc1OPMode {
    /** operation mode of the first heating circuit */
    @values(values_Hc1OPMode)
    value: UCH;
  }

  /** HC1_NightSetTemp */
  @inherit(r, w)
  @ext(0x30, 0)
  model Hc1NightTemp {
    /** lowering temperature setpoint of the first heating circuit */
    value: temp1;
  }

  /** HC1_HeatCurve */
  @inherit(r, w)
  @ext(0x31, 0)
  model Hc1HeatCurve {
    /** heating curve of the first heating circuit */
    value: curve;
  }

  /** HC1_ManualOPRoomSetpoint */
  @inherit(r, w)
  @ext(0x32, 0)
  model Hc1ManualOPRoomTempDesired {
    /** room setpoint in operation mode manual of the first heating circuit */
    value: temp1;
  }

  /** HC1_QuickVetoTemp */
  @inherit(r)
  @ext(0x3c, 0)
  model Hc1QuickVetoTemp {
    /** manual override setpoint of the first heating circuit */
    value: temp1;
  }

  /** HC1_QuickVetoActive */
  @inherit(r)
  @ext(0x3d, 0)
  model Hc1QuickVetoActive {
    /** manual override of the first heating circuit enabled */
    value: yesno;
  }

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

  /** HolidayRoomSetTemp */
  @inherit(r, w)
  @ext(0x40, 0)
  model HolidayRoomTemp {
    /** 4.5=frostprotect, room setpoint during holidays */
    value: D1C;
  }

  /** HolidayStartPeriod */
  @inherit(r, w)
  @ext(0x11, 0)
  model HolidayStartPeriod {
    /** start date of holidays */
    value: date;
  }

  /** HolidayEndPeriod */
  @inherit(r, w)
  @ext(0x12, 0)
  model HolidayEndPeriod {
    /** end date of holidays */
    value: date;
  }

  /** DHW_OPMode */
  @inherit(r, w)
  @ext(0x42, 0)
  model HwcOPMode {
    /** operation mode of the domestic hot water circuit */
    @values(values_HwcOPMode)
    value: UCH;
  }

  /** DHW_DesiredTemp */
  @inherit(r, w)
  @ext(0x44, 0)
  model HwcTempDesired {
    /** setpoint of domestic hot water circuit */
    value: temp1;
  }

  /** DHW_QuickVetoTemp */
  @inherit(r)
  @ext(0x45, 0)
  model HwcQuickVetoTemp {
    /** manual override setpoint for the domestic hot water circuit */
    value: temp1;
  }

  /** DHW_QuickVetoActive */
  @inherit(r)
  @ext(0x43, 0)
  model HwcQuickVetoActive {
    /** manual override of the domestic hot water circuit enabled */
    value: yesno;
  }

  /** DHW_ManualOPSetpoint */
  @inherit(r, w)
  @ext(0x4c, 0)
  model HwcManualOPTempDesired {
    /** setpoint of domestic hot water circuit in manual operation mode */
    value: temp1;
  }

  /** SummerWinterTimeAdjust */
  @inherit(r, w)
  @ext(0x53, 0)
  model SummerWinterTimeAdjust {
    /** enable automatic switching over to daylight saving's time (when a DCF receiver is connected to the BMU the value is set fix to ON) */
    value: onoff;
  }

  /** DisplayedDHWTankTemperature */
  @inherit(r)
  @ext(0x9e, 0)
  model DisplayedHwcStorageTemp {
    /** display of the storage's temperature in C4 (also in case of an SP1 error) */
    value: temp1;
  }

  /** DisplayedHK1RoomSetpoint */
  @inherit(r)
  @ext(0x96, 0)
  model DisplayedHc1RoomTempDesired {
    /** 0= >5°C, currently displayed room temperature setpoint */
    value: temp1;
  }
  // ##### extra #####

  /** RoomTempCorrection */
  @inherit(r)
  @ext(0x57, 0)
  model RoomTempCorrection {
    /** room temperature correction */
    value: calibrations;
  }

  /** OutDoorTempCorr */
  @inherit(r, wi)
  @ext(0x58, 0)
  model OutsideTempOffset {
    /** outside temperature correction */
    value: calibrations;
  }

  /** FrostOverRideTime */
  @inherit(r, wi)
  @ext(0x1a, 0)
  model FrostOverRideTime {
    /** delay before frost protection is activated */
    value: hours;
  }

  /** BaseDisplay */
  @inherit(r)
  @ext(0x2e, 0)
  model BaseDisplay {
    /** selection which heating circuit's parameters are shown in the basic display */
    @values(values_BaseDisplay)
    value: UCH;
  }

  /** HC1_RoomTempSwitchOn */
  @inherit(r, wi)
  @ext(0x34, 0)
  model Hc1RoomTempSwitchOn {
    /** room temperature modulation of the first heating circuit */
    @values(values_Hc1RoomTempSwitchOn)
    value: UCH;
  }

  /** HC1_MinimalFlowSetpoint */
  @inherit(r, wi)
  @ext(0x35, 0)
  model Hc1MinimalFlowTempDesired {
    /** minimum flow temperature setpoint (end emphasis) of the first heating circuit */
    value: temp1;
  }

  /** HC1_HCType */
  @inherit(r, wi)
  @ext(0x3a, 0)
  model Hc1HcType {
    /** type of the first heating circuit */
    @values(values_Hc1HcType)
    value: UCH;
  }

  /** HC1_SummerOffset */
  @inherit(r, wi)
  @ext(0x3b, 0)
  model Hc1SummerOffset {
    /** summer offset of the first heating circuit (if outside temperature > room setpoint + summer offset => heating is OFF;applies to comfort and night setback setpoint; no influence if room temperature modulation is set to "thermostat") */
    value: calibration1;
  }

  /** HC1ActualFlowSetPoint */
  @inherit(r)
  @ext(0x3e, 0)
  model Hc1ActualFlowTempDesired {
    /** calculated flow temperature setpoint of the first heating circuit */
    value: temp1;
  }

  /** DHW_LoadingOffset */
  @inherit(r, wi)
  @ext(0x46, 0)
  model HwcLoadingOffset {
    /** flow temperature's tank loading offset (flow setpoint of the DHW circuit = DHW setpoint + flow temperature's tank loading offset; only relevant if DHW control is done by control) */
    value: calibration1;
  }

  /** DHW_LP_postrunningtime */
  @inherit(r, wi)
  @ext(0x47, 0)
  model HwcPressLowpostrunningtime {
    /** duration of the tank loading pump's lag (only relevant if DHW control is done by control) */
    value: minutes0;
  }

  /** DHW_Parallel_Loading */
  @inherit(r, wi)
  @ext(0x48, 0)
  model HwcParallelLoading {
    /** enable parallel tank loading */
    value: onoff;
  }

  /** DHW_LegioStartDay */
  @inherit(r, wi)
  @ext(0x49, 0)
  model HwcLegioStartDay {
    /** weekday on which legionella protection is started (may also be every day of the week) */
    @values(values_HwcLegioStartDay)
    value: UCH;
  }

  /** DHW_LegioStartTime */
  @inherit(r, wi)
  @ext(0x4a, 0)
  model HwcLegioStartTime {
    /** time on which legionella protection is started */
    value: time;
  }

  /** DHW_CircuitActive */
  @inherit(r, wi)
  @ext(0x4b, 0)
  model HwcCircuitActive {
    /** domestic hot water circuit is enabled */
    value: yesno;
  }

  /** AutoOFF_Mode */
  @inherit(r, wi)
  @ext(0x4d, 0)
  model AutoOffMode {
    /** operation during the lowering time */
    @values(values_AutoOffMode)
    value: UCH;
  }

  /** ContinuosHeating */
  @inherit(r, wi)
  @ext(0x4f, 0)
  model ContinuosHeating {
    /** -26=off, when the outside temperature falls below this threshold temperature the continuous heating function is started (off <=> function is disabled) */
    value: SCH;
  }

  /** PreheatingTime */
  @inherit(r, wi)
  @ext(0x50, 0)
  model PreheatingTime {
    /** in steps of 10, maximum time of enabling the heating before the heating time window starts */
    value: UIN;
  }

  /** PreStopTime */
  @inherit(r, wi)
  @ext(0x51, 0)
  model PreStopTime {
    /** in steps of 10, maximum time of starting the lowering operation before the heating time window ends */
    value: UCH;
  }

  /** ExcessTemperature */
  @inherit(r, wi)
  @ext(0x52, 0)
  model ExcessTemp {
    /** excess temperature (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibration1;
  }

  /** aucPhoneNumber_1 */
  @inherit(r)
  @ext(0x54, 0)
  model PhoneNumber1 {
    /** first part of the installer's telephone number */
    @maxLength(10)
    value: STR;
  }

  /** aucPhoneNumber_2 */
  @inherit(r)
  @ext(0x54, 0x8)
  model PhoneNumber2 {
    /** second part of the installer's telephone number */
    @maxLength(9)
    value: STR;
  }

  /** KeyCodeforConfigMenue */
  @inherit(r, wi)
  @ext(0x55, 0)
  model KeyCodeforConfigMenu {
    /** code for the installer's menues */
    @maxLength(4)
    value: HEX;
  }

  /** MaintenanceDate */
  @inherit(r, wi)
  @ext(0x59, 0)
  model MaintenanceDate {
    /** date of the next maintenance service */
    value: date;
  }

  /** LcdContrastValue */
  @inherit(r, wi)
  @ext(0x5a, 0)
  model LcdContrastValue {
    /** setting of the LCD contrast */
    value: UCH;
  }

  @condition(id.id.sw, ">=119")
  namespace sw__119 {
    /** HC1_FloorPavementDryingTemperature */
    @inherit(r)
    @ext(0x2a, 0)
    model Hc1FloorPavementDryingTemp {
      /** HC1's current flow temperature setpoint with activated floor pavement drying */
      value: temp1;
    }
  }

  @condition(id.id.sw, ">=119")
  namespace sw__119 {
    /** HC1_FloorPavementDryingDay */
    @inherit(r)
    @ext(0x38, 0)
    model Hc1FloorPavementDryingDay {
      /** HC1's current day of floor pavement drying */
      value: UCH;
    }
  }

  /** BKMK1ConfigCPLPAsLP */
  @inherit(r, wi)
  @ext(0x7d, 0)
  model HcMc1ConfigCPLPAsLP {
    /** configuration of the VR61 relay-output */
    @values(values_HcMc1ConfigCPLPAsLP)
    value: UCH;
  }

  /** MaxPumpBlockingTime */
  @inherit(r, wi)
  @ext(0x7e, 0)
  model PumpBlockingTimeMax {
    /** 0=off, heating circuit pump's maximum blocking time for pump's energy saving function */
    value: UCH;
  }

  /** CircuPumpRunning */
  @inherit(r)
  @ext(0x81, 0)
  model CirPump {
    /** circulation pump's state */
    value: onoff;
  }

  /** HK1PumpState */
  @inherit(r)
  @ext(0x82, 0)
  model Hc1Pump {
    /** first heating circuit pump's state */
    value: onoff;
  }

  /** HC2_HCType */
  @inherit(r, wi)
  @ext(0x85, 0)
  model Hc2HcType {
    /** type of the second heating circuit */
    @values(values_Hc2HcType)
    value: UCH;
  }

  /** DHW_ActualDesired_Setpoint */
  @inherit(r)
  @ext(0x86, 0)
  model HwcActualTempDesired {
    /** current domestic hot water setpoint */
    value: temp1;
  }

  /** BMU_FlowTempOrVF_1 */
  @inherit(r)
  @ext(0x87, 0)
  model BMUFlowTempOrVF1 {
    /** value of either an externally connected flow temperature sensor or the BMU's internal flow sensor if an external sensor is missing */
    value: tempsensor;
  }

  /** RF_Quality_OT_DCF */
  @inherit(r)
  @ext(0xba, 0)
  model RFQualityOTDCF {
    /** RF quality of the connection between VR20/21 and base station */
    value: UCH;
  }

  /** RF_Quality_CI */
  @inherit(r)
  @ext(0xbb, 0)
  model RFQualityCI {
    /** RF quality of the connection between CI and base station */
    value: UCH;
  }
  // ##### developer's info #####

  /** StarteEepromAktualisierung */
  @inherit(r)
  @ext(0xe, 0)
  model StartEepromUpdate {
    /** update of the EEPROM is to be started */
    value: onoff;
  }

  /** EepromAktualisierungAktiv */
  @inherit(r)
  @ext(0xf, 0)
  model EepromUpdateActive {
    /** update of the EEPROM has been started */
    value: onoff;
  }

  /** RaumTempOffsetEigenErwaerm */
  @inherit(r)
  @ext(0x15, 0)
  model RoomTempOffsetSelfWarming {
    /** room temperature intrinsic heating offset */
    value: temp;
  }

  /** CountryVariant */
  @inherit(r)
  @ext(0x17, 0)
  model CountryVariant {
    /** country variant (0 = west, 1 = east) */
    value: UCH;
  }

  /** ActualRoomTempSetpointHC1 */
  @inherit(r)
  @ext(0x63, 0)
  model ActualRoomTempDesiredHc1 {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    value: temp;
  }

  /** SolarModuleDetected */
  @inherit(r)
  @ext(0x6c, 0)
  model SolModuleDetected {
    /** indicates that a VR68 has been detected */
    value: yesno;
  }

  /** BKMK1Detected */
  @inherit(r)
  @ext(0x6d, 0)
  model HcMc1Detected {
    /** indicates that a VR61 has been detected */
    value: yesno;
  }

  /** HRUDetected */
  @inherit(r)
  @ext(0x6e, 0)
  model HRUDetected {
    /** indicates that an airvent module / a heat recovery unit has been detected */
    value: yesno;
  }

  /** ACTOstorDetected */
  @inherit(r)
  @ext(0x6f, 0)
  model ACTOstorDetected {
    /** indicates that an ACTOstor has been detected */
    value: yesno;
  }

  /** BMUB51101_ErrorStatus */
  @inherit(r)
  @ext(0x70, 0)
  model BMUB51101ErrorStatus {
    /** error state of BMU received via eBUS service B51101 */
    value: UCH;
  }

  /** BMUB51101_TankTemp */
  @inherit(r)
  @ext(0x71, 0)
  model BMUB51101StorageTemp {
    /** hot water storage temperature received via eBUS service B5 11 01 */
    value: temp1;
  }

  /** LegioProtectActive */
  @inherit(r)
  @ext(0x73, 0)
  model LegioProtectActive {
    /** legionella protection is active */
    value: yesno;
  }

  /** BMUB51101_DHWState */
  @inherit(r)
  @ext(0x75, 0)
  model BMUB51101HwcState {
    /** flame is on because of either tapping or tank loading */
    value: onoff;
  }

  /** VF_1 */
  @inherit(r)
  @ext(0x76, 0)
  model VF1 {
    /** current external flow temperature and sensorstate */
    value: tempsensor;
  }

  /** BMUB51101_BoilerFlowTemp */
  @inherit(r)
  @ext(0x77, 0)
  model BMUB51101BoilerFlowTemp {
    /** current flow temperature inside the BMU */
    value: temp1;
  }

  /** EnermanState */
  @inherit(r)
  @ext(0x7a, 0)
  model EnermanState {
    /** current energy-manager-state (Off = 0, Heating = 1, DHW = 2, DHW pump lag = 3) */
    value: UCH;
  }

  /** B51000SetPointLoadingPump */
  @inherit(r)
  @ext(0x7b, 0)
  model B51000TempDesiredLoadingPump {
    /** loading pump's setpoint sent via B5 10 00 to the BMU */
    value: D1C;
  }

  /** BKMK1CPLPState */
  @inherit(r)
  @ext(0x7f, 0)
  model HcMc1CPLPState {
    /** nominal condition of the VR61's circulation or loading pump */
    value: onoff;
  }

  /** CP_LPLast24started */
  @inherit(r)
  @ext(0x83, 0)
  model CPLPLast24started {
    /** circulation respectively loading pump has been started during the last 24h */
    value: yesno;
  }

  /** HK1PumpLast24started */
  @inherit(r)
  @ext(0x84, 0)
  model Hc1PumpLast24started {
    /** first heating circuit's pump has been started during the last 24h */
    value: yesno;
  }

  /** FrostProtectState_Monitor */
  @inherit(r)
  @ext(0x89, 0)
  model FrostProtectStateMonitor {
    /** monitoring of the frost protection's state transition diagram */
    value: UCH;
  }

  /** FrostProtectionRequired_Monitor */
  @inherit(r)
  @ext(0x8a, 0)
  model FrostProtectionRequiredMonitor {
    /** frost protection should be enabled */
    value: yesno;
  }

  /** HC1PreOrContinuosHeatingActive */
  @inherit(r)
  @ext(0x8b, 0)
  model Hc1PreOrContinuosHeatingActive {
    /** preheating or continous heating is active for the first heating circuit */
    value: yesno;
  }

  /** CalculatedKickStopTime */
  @inherit(r)
  @ext(0x8c, 0)
  model CalculatedKickStopTime {
    /** calculated time in between two pump kicks during frostprotection (time depends on outside temperature) */
    value: minutes0;
  }

  /** B51000FlowSetMonitor */
  @inherit(r)
  @ext(0x8d, 0)
  model B51000FlowSetMonitor {
    /** flow temperature setpoint sent via B5 10 00 to the BMU */
    value: temp1;
  }

  @condition(id.id.sw, ">=121")
  namespace sw__121 {
    /** B51000M7OpModeMonitor */
    @inherit(r)
    @ext(0x65, 0)
    model B51000M7OpModeMonitor {
      /** operation mode sent via B5 10 00 (0 = auto, 1 = forced off, 2 = forced CH, 3 = forced DHW) */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=121")
  namespace sw__121 {
    /** B51000M10DHWFlowSetMon */
    @inherit(r)
    @ext(0x66, 0)
    model B51000M10HwcFlowSetMon {
      /** flow setpoint DHW sent via B5 10 00 */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=121")
  namespace sw__121 {
    /** B51000M12DisableBitsMon */
    @inherit(r)
    @ext(0x67, 0)
    model B51000M12DisableBitsMon {
      /** bits 0-7: disable CH/disable DHW tapping/disable DHW tank loading/not used/clear burner blocking DHW/dis, disable bits sent via B5 10 00 (leftmost bit 0, rightmost bit 7) */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=121")
  namespace sw__121 {
    /** B51000M14Monitor */
    @inherit(r)
    @ext(0x68, 0)
    model B51000M14Monitor {
      /** bits 0-7: remote control CH pump/release backup heater/release cooling/not used/left stop position DHW o, bits sent in M14 of B5 10 00 (leftmost bit 0, rightmost bit 7; relevant is bit 0: remote control of CH pump) */
      value: UCH;
    }
  }

  @condition(id.id.sw, "<=120")
  namespace sw__120 {
    /** B51000CHDisableMonitor */
    @inherit(r)
    @ext(0x8e, 0)
    model B51000HcDisableMonitor {
      /** copy of the M12 byte of the B5 10 00 service containing the disable bits */
      value: UCH;
    }
  }

  /** FrostProtectDelayMonitor */
  @inherit(r)
  @ext(0x8f, 0)
  model FrostProtectDelayMonitor {
    /** frost protection delay has not elapsed yet */
    value: yesno;
  }

  /** ChimneySweepModeActive */
  @inherit(r)
  @ext(0x90, 0)
  model ChimneySweepModeActive {
    /** chimney sweep mode has been enabled by the BMU */
    value: yesno;
  }

  /** PumpEnergySaveStateMonitor */
  @inherit(r)
  @ext(0x91, 0)
  model PumpEnergySaveStateMonitor {
    /** monitoring of the pump energy saving's state transition diagram */
    value: UCH;
  }

  /** PumpEnergySaveCalculatedTimeMonitor */
  @inherit(r)
  @ext(0x92, 0)
  model PumpEnergySaveCalculatedTimeMonitor {
    /** calculated time for the heating circuit's pump's switch off time during pump energy saving function (depends on outside temperature) */
    value: minutes0;
  }

  /** DHWLoadingIn430Active */
  @inherit(r)
  @ext(0x93, 0)
  model HwcLoadingIn430Active {
    /** DHW-loading is active in non parallel loading cases */
    value: yesno;
  }

  /** actoSTOR_OPMode */
  @inherit(r)
  @ext(0x94, 0)
  model actoSTOROPMode {
    /** Zustands-Automat actSTOR Ansteuerung */
    value: UCH;
  }

  /** DHWLoadingInBMUActive */
  @inherit(r)
  @ext(0x9d, 0)
  model HwcLoadingInBMUActive {
    /** indicates that BMU is in DHW preparation */
    value: yesno;
  }

  /** MonitorEEpromInkonsiNumber */
  @inherit(r)
  @ext(0x9f, 0)
  model MonitorEEpromInkonsiNumber {
    /** identification of the last eight EEPROM inconsistencies */
    @maxLength(8)
    value: HEX;
  }

  /** Variant */
  @inherit(r)
  @ext(0x2c, 0)
  model Variant {
    /** control type (430f: 43605; 21930 392f: 61455; 4080) */
    uin: UIN;

    uin_1: UIN;
  }

  /** AssertFileName */
  @inherit(r)
  @ext(0xa0, 0)
  model AssertFileName {
    /** shows, if assert is enabled, the name of the module where the 'assert fail' occured */
    @maxLength(10)
    value: STR;
  }

  /** AssertLineNumber */
  @inherit(r)
  @ext(0xa1, 0)
  model AssertLineNumber {
    /** assert fail occured in this line */
    value: UIN;
  }

  /** actostorstate */
  @inherit(r)
  @ext(0xa4, 0)
  model actostorstate {
    /** state of the actoSTOR control (0 = off; 1 = DHW released; 2 = DHW loading; 3 = Pump overrun; 4 = stop pump overrun) */
    value: UCH;
  }

  /** B50418actDesFlowTemp */
  @inherit(r)
  @ext(0x6b, 0)
  model B50418actDesFlowTemp {
    /** flow temperature setpoint calculated by actoSTOR (S3 of B5 04 18) */
    value: D1C;
  }

  /** Net_ID */
  @inherit(r)
  @ext(0xb4, 0)
  model NetID {
    /** net ID from teach in */
    @maxLength(2)
    value: HEX;
  }

  /** Rf_ChannelSettings */
  @inherit(r)
  @ext(0xb9, 0)
  model RfChannelSettings {
    /** used rf channel settings */
    value: UCH;
  }

  enum values_Hc1OPMode {
    off: 0,
    manual: 1,
    auto: 2,
  }

  enum values_HwcOPMode {
    off: 0,
    manual: 1,
    auto: 2,
  }

  enum values_BaseDisplay {
    off: 0,
    HC1: 1,
    HC2: 2,
  }

  enum values_Hc1RoomTempSwitchOn {
    off: 0,
    modulating: 1,
    thermostat: 2,
  }

  enum values_Hc1HcType {
    disabled: 0,
    burnercircuit: 1,
  }

  enum values_HwcLegioStartDay {
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

  enum values_AutoOffMode {
    frostprotection: 0,
    lowering: 1,
    eco: 2,
  }

  enum values_HcMc1ConfigCPLPAsLP {
    CP: 0,
    LP: 1,
  }

  enum values_Hc2HcType {
    disabled: 0,
    mixing: 1,
    zone: 2,
  }

  /** included parts */
  union _includes {
    timercc_inc,
    timerhwc_inc,
    errors_inc,
    timerhc_inc,
    tempsetpoints_inc,
    service_inc,
  }
}
