import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./yield3d43_inc.tsp";
import "./timercc_inc.tsp";
import "./timerhwc_inc.tsp";
import "./timerhc_inc.tsp";
import "./timercool_inc.tsp";
import "./timertariff_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace _470 {
  // ,47000,VRC 470,470 260
  // ##### general #####

  /** ActualWeekday: current day of week */
  @ext(0x5f, 0)
  model ActualWeekday is ReadonlyRegister<bday>;

  /** current date */
  @ext(0x61, 0)
  model Date is Register<date>;

  /** current time */
  @ext(0x60, 0)
  model Time is Register<time>;

  /** RaumtemperaturIst: raw value current room temperature and sensorstate (without any correction) */
  @ext(0, 0)
  model RoomTemp is ReadonlyRegister<tempsensor>;

  /** RoomTempCorrection: room temperature correction */
  @ext(0x57, 0)
  model RoomTempCorrection is Register<calibrations>;

  /** OutsideTempSensor: current outdoor temperature and sensorstate */
  @ext(0x62, 0)
  model OutsideTemp is ReadonlyRegister<tempsensor>;

  /** OutDoorTempCorr: outside temperature correction */
  @ext(0x58, 0)
  model OutsideTempOffset is Register<calibrations>;

  /** DisplayedHK1RoomSetpoint: 0= >5°C, currently displayed room temperature setpoint */
  @ext(0x96, 0)
  model DisplayedHc1RoomTempDesired is ReadonlyRegister<temp1>;

  /** HC1_OPMode */
  @inherit(r, w)
  @ext(0x2f, 0)
  model Hc1OPMode {
    /** operation mode of the first heating circuit */
    @values(Values_Hc1OPMode)
    value: UCH;
  }

  /** HC1_DaySetTemp: day setpoint */
  @ext(0x27, 0)
  model Hc1DayTemp is Register<temp1>;

  /** HC1_NightSetTemp: lowering temperature setpoint of the first heating circuit */
  @ext(0x30, 0)
  model Hc1NightTemp is Register<temp1>;

  /** HC1_QuickVetoTemp: manual override setpoint of the first heating circuit */
  @ext(0x3c, 0)
  model Hc1QuickVetoTemp is ReadonlyRegister<temp1>;

  /** HC1_HolidayRoomSetTemp: 4.5=frostprotect, room setpoint during holidays */
  @ext(0x40, 0)
  model Hc1HolidayRoomTemp is Register<D1C>;

  /** HC1_SFMode */
  @inherit(r)
  @ext(0x5d, 0)
  model Hc1SFMode {
    /** activated special function of first heating circuit */
    @values(Values_Hc1SFMode)
    value: UCH;
  }

  /** HC1HolidayStartPeriod: first heating circuit's start date of holidays */
  @ext(0x11, 0)
  model Hc1HolidayStartPeriod is Register<date>;

  /** HC1HolidayEndPeriod: first heating circuit's end date of holidays */
  @ext(0x12, 0)
  model Hc1HolidayEndPeriod is Register<date>;

  /** HC1BankHolidayStartPeriod: first heating circuit's start date of bank holidays */
  @ext(0x21, 0)
  model Hc1BankHolidayStartPeriod is Register<date>;

  /** HC1BankHolidayEndPeriod: first heating circuit's end date of bank holidays */
  @ext(0x22, 0)
  model Hc1BankHolidayEndPeriod is Register<date>;

  /** HC2HolidayStartPeriod: second heating circuit's start date of holidays */
  @ext(0x23, 0)
  model Hc2HolidayStartPeriod is Register<date>;

  /** HC2HolidayEndPeriod: second heating circuit's end date of holidays */
  @ext(0x24, 0)
  model Hc2HolidayEndPeriod is Register<date>;

  /** HC2BankHolidayStartPeriod: second heating circuit's start date of bank holidays */
  @ext(0x25, 0)
  model Hc2BankHolidayStartPeriod is Register<date>;

  /** HC2BankHolidayEndPeriod: second heating circuit's end date of bank holidays */
  @ext(0x26, 0)
  model Hc2BankHolidayEndPeriod is Register<date>;

  /** HC2_SFMode */
  @inherit(r)
  @ext(0x1c, 0)
  model Hc2SFMode {
    /** activated special function of second heating circuit */
    @values(Values_Hc2SFMode)
    value: UCH;
  }

  /** DHW_DesiredTemp: setpoint of domestic hot water circuit */
  @ext(0x44, 0)
  model HwcTempDesired is Register<temp1>;

  /** aaucHcNames_HK1: labelling of the first heating circuit (only A-Z,0-9,blank) */
  @ext(0x3f, 0)
  model HcName1 is Register<hcname>;

  /** aaucHcNames_HK2: labelling of the second heating circuit (only A-Z,0-9,blank) */
  @ext(0x3f, 0x8)
  model HcName2 is Register<hcname>;

  /** aucContactName */
  @inherit(r, wi)
  @ext(0xb4, 0)
  model ContactName {
    /** installer's name (only A-Z,0-9,blank) */
    @maxLength(13)
    value: STR;
  }

  /** aucPhoneNumber */
  @inherit(r, wi)
  @ext(0x54, 0)
  model PhoneNumber {
    /** installer's telephone number (only 0-9,-,blank) */
    @maxLength(13)
    value: STR;
  }

  /** MaintenanceDate: date of the next maintenance service */
  @ext(0x59, 0)
  model MaintenanceDate is InstallRegister<date>;

  /** LcdContrastValue: setting of the LCD contrast */
  @ext(0x5a, 0)
  model LcdContrastValue is Register<UCH>;

  /** SummerWinterTimeAdjust */
  @inherit(r, w)
  @ext(0x53, 0)
  model SummerWinterTimeAdjust {
    /** enable automatic switching over to daylight saving's time (when a DCF receiver is connected to the BMU the value is set fix to ON) */
    @values(Values_SummerWinterTimeAdjust)
    value: UCH;
  }

  /** LanguageVariant */
  @inherit(r, w)
  @ext(0x16, 0)
  model LanguageVariant {
    /** display language */
    @values(Values_LanguageVariant)
    value: UCH;
  }
  // ##### extra #####

  /** BMU_FlowTempOrVF_1: value of either an externally connected flow temperature sensor or the BMU's internal flow sensor if an external sensor is missing */
  @ext(0x87, 0)
  model BMUFlowTempOrVF1 is ReadonlyRegister<tempsensor>;

  /** RaumTempOffsetEigenErwaerm: room temperature intrinsic heating offset */
  @ext(0x15, 0)
  model RoomTempOffsetSelfWarming is ReadonlyRegister<temp>;

  /** OpModeEffect */
  @inherit(r, wi)
  @ext(0xb8, 0)
  model OpModeEffect {
    /** selection which heating circuit is affected by changing parameters in the basic display */
    @values(Values_OpModeEffect)
    value: UCH;
  }

  /** HydraulicSwitch: hydraulic switch is installed */
  @ext(0xb7, 0)
  model HydraulicSwitch is InstallRegister<yesno>;

  /** BKMK1ConfigCPLP */
  @inherit(r, wi)
  @ext(0x7d, 0)
  model HcMc1ConfigCPLP {
    /** configuration of the VR61 relay-output */
    @values(Values_HcMc1ConfigCPLP)
    value: UCH;
  }

  /** CircuPumpRunning: circulation pump's state */
  @ext(0x81, 0)
  model CirPump is ReadonlyRegister<yesno>;

  /** HC1_HCType */
  @inherit(r, wi)
  @ext(0x3a, 0)
  model Hc1HcType {
    /** type of the first heating circuit */
    @values(Values_Hc1HcType)
    value: UCH;
  }

  /** HC1_HeatCurve: heating curve of the first heating circuit */
  @ext(0x31, 0)
  model Hc1HeatCurve is InstallRegister<curve>;

  /** HC1_RoomTempSwitchOn */
  @inherit(r, wi)
  @ext(0x34, 0)
  model Hc1RoomTempSwitchOn {
    /** room temperature modulation of the first heating circuit */
    @values(Values_Hc1RoomTempSwitchOn)
    value: UCH;
  }

  /** HC1_SummerOffset: summer offset of the first heating circuit (if outside temperature > room setpoint + summer offset => heating is OFF;applies to comfort and night setback setpoint; no influence if room temperature modulation is set to "thermostat") */
  @ext(0x3b, 0)
  model Hc1SummerOffset is InstallRegister<calibrations>;

  /** HC1_MinimalFlowSetpoint: minimum flow temperature setpoint (end emphasis) of the first heating circuit */
  @ext(0x35, 0)
  model Hc1MinimalFlowTempDesired is InstallRegister<temp1>;

  /** HC1_AutoOFF_Mode */
  @inherit(r, wi)
  @ext(0x4d, 0)
  model Hc1AutoOffMode {
    /** operation during the lowering time */
    @values(Values_Hc1AutoOffMode)
    value: UCH;
  }

  /** HC1ActualFlowSetPoint: current flow temperature setpoint of the first heating circuit */
  @ext(0x3e, 0)
  model Hc1ActualFlowTempDesired is ReadonlyRegister<temp1>;

  /** HC1_FloorPavementDryingTemperature: HC1's current flow temperature setpoint with activated floor pavement drying */
  @ext(0x2a, 0)
  model Hc1FloorPavementDryingTemp is ReadonlyRegister<temp1>;

  /** HC1_FloorPavementDryingDay: HC1's current day of floor pavement drying */
  @ext(0x38, 0)
  model Hc1FloorPavementDryingDay is InstallRegister<UCH>;

  /** HC2_HCType */
  @inherit(r, wi)
  @ext(0x85, 0)
  model Hc2HcType {
    /** type of the second heating circuit */
    @values(Values_Hc2HcType)
    value: UCH;
  }

  /** DHW_CircuitActive: domestic hot water circuit is enabled */
  @ext(0x4b, 0)
  model HwcCircuitActive is InstallRegister<yesno>;

  /** DHW_Parallel_Loading: enable parallel tank loading */
  @ext(0x48, 0)
  model HwcParallelLoading is ReadonlyRegister<onoff>;

  /** DHW_LoadingOffset: flow temperature's tank loading offset (flow setpoint of the DHW circuit = DHW setpoint + flow temperature's tank loading offset; only relevant if DHW control is done by control) */
  @ext(0x46, 0)
  model HwcLoadingOffset is InstallRegister<calibration1>;

  /** DHW_LP_postrunningtime: duration of the tank loading pump's lag (only relevant if DHW control is done by control) */
  @ext(0x47, 0)
  model HwcPressLowpostrunningtime is InstallRegister<minutes0>;

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

  /** DisplayedDHWTankTemperature: display of the storage's temperature (also in case of an SP1error) */
  @ext(0x9e, 0)
  model DisplayedHwcStorageTemp is ReadonlyRegister<temp1>;

  /** DHW_ActualDesired_Setpoint: current domestic hot water setpoint */
  @ext(0x86, 0)
  model HwcActualTempDesired is ReadonlyRegister<temp1>;

  /** FrostOverRideTime: delay before frost protection is activated */
  @ext(0x1a, 0)
  model FrostOverRideTime is InstallRegister<hours>;

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

  /** MaxPumpBlockingTime: 0=off, heating circuit pump's maximum blocking time for pump's energy saving function (0 <=> Off; value range only 5-60 min) */
  @ext(0x7e, 0)
  model PumpBlockingTimeMax is InstallRegister<UCH>;

  /** KeyCodeforConfigMenue: code for the installer's menues */
  @ext(0x55, 0)
  model KeyCodeforConfigMenu is InstallRegister<code>;

  /** GlobalSystemOFF: Set to TRUE if "System Off" is selected */
  @ext(1, 0)
  model GlobalSystemOff is ReadonlyRegister<onoff>;

  /** StatusDcf */
  @inherit(r)
  @ext(0x2, 0)
  model StatusDcf {
    /** status of the DCF signal */
    @values(Values_StatusDcf)
    value: UCH;
  }

  /** DcfIsValid: validity of DCF signal */
  @ext(0x4, 0)
  model DcfIsValid is ReadonlyRegister<yesno>;

  /** BKMK1Detected: indicates that a VR61 has been detected */
  @ext(0x6d, 0)
  model HcMc1Detected is ReadonlyRegister<yesno>;

  /** SolarModuleDetected: indicates that a VR68 has been detected */
  @ext(0x6c, 0)
  model SolModuleDetected is ReadonlyRegister<yesno>;

  /** ACTOstorDetected: indicates that an ACTOstor has been detected */
  @ext(0x6f, 0)
  model ACTOstorDetected is ReadonlyRegister<yesno>;

  /** VR81Detected: indicates that a VR81 has been detected */
  @ext(0x74, 0)
  model VR81Detected is ReadonlyRegister<yesno>;

  /** ASCDetected: indicates that a VMS has been detected */
  @ext(0xbb, 0)
  model ASCDetected is ReadonlyRegister<yesno>;
  // ##### developer's info #####

  /** VF_1: current external flow temperature and sensorstate */
  @ext(0x76, 0)
  model VF1 is ReadonlyRegister<tempsensor>;

  /** HydraulicMap: hydraulic map (0 = H1, 3 = H4, 11 = A1, 12 = A2, 14 = A5, 15 = S1, 16 = S3a, 17 = S3b) */
  @ext(0x18, 0)
  model HydraulicMap is ReadonlyRegister<UCH>;

  /** ActualRoomTempSetpointHC1: current room setpoint considering all basic conditions passed to the control algorithms */
  @ext(0x63, 0)
  model ActualRoomTempDesiredHc1 is ReadonlyRegister<temp>;

  /** HC2_OPMode */
  @inherit(r)
  @ext(0x1b, 0)
  model Hc2OPMode {
    /** operation mode of the second heating circuit */
    @values(Values_Hc2OPMode)
    value: UCH;
  }

  /** HC2_Desired_TempB50418: current flow temperature setpoint of the second heating circuit */
  @ext(0x32, 0)
  model Hc2TempDesiredB50418 is ReadonlyRegister<temp1>;

  /** B51000M7OpModeMonitor: operation mode sent via B5 10 00 (0 = auto, 1 = forced off, 2 = forced CH, 3 = forced DHW) */
  @ext(0x65, 0)
  model B51000M7OpModeMonitor is ReadonlyRegister<UCH>;

  /** B51000M8HeatFlowSetMonitor: flow temperature setpoint sent via B5 10 00 to the BMU */
  @ext(0x8d, 0)
  model B51000M8HeatFlowSetMonitor is ReadonlyRegister<D1C>;

  /** B51000M9TappingSetMon: DHW setpoint without loading offset (for hydraulic map H1) */
  @ext(0x56, 0)
  model B51000M9TappingSetMon is ReadonlyRegister<D1C>;

  /** B51000M10DHWFlowSetMon: flow setpoint DHW sent via B5 10 00 */
  @ext(0x66, 0)
  model B51000M10HwcFlowSetMon is ReadonlyRegister<UCH>;

  /** B51000M12DisableBitsMon: bits 0-7: disable CH/disable DHW tapping/disable DHW tank loading/not used/clear burner blocking DHW/dis, disable bits sent via B5 10 00 (left bit 0, right bit 7) */
  @ext(0x67, 0)
  model B51000M12DisableBitsMon is ReadonlyRegister<UCH>;

  /** B51000M14Monitor: bits 0-7: remote control CH pump/release backup heater/release cooling/not used/left stop position DHW o, bits sent in M14 of B5 10 00 (left bit 0, right bit 7; relevant is bit 0: remote control of CH pump) */
  @ext(0x68, 0)
  model B51000M14Monitor is ReadonlyRegister<UCH>;

  /** TestVarActivateFunction: 0=All SF_OFF11/2=1DayHolON/OFF13/4=1DayBankON/OFF15/6=1DayHolON/OFF27/8=1DayBankON/OFF29/10=1xDHWLoadON/OFF11/12=QVetoON/OFF113/14=QVetoON/OFF215/16=PartyON/OFF117/18=PartyON/OFF219/20=Ventil.ON/OFF121/22=Ventil.ON/OFF223/24=SystemOff_ON/OFF */
  @ext(0xb, 0)
  model TestVarActivateFunction is ReadonlyRegister<UCH>;

  /** DHW_OPMode */
  @inherit(r)
  @ext(0x42, 0)
  model HwcOPMode {
    /** operation mode of the domestic hot water circuit set implicitly */
    @values(Values_HwcOPMode)
    value: UCH;
  }

  /** BMUB51101_DHWState: flame is on because of either tapping or tank loading */
  @ext(0x75, 0)
  model BMUB51101HwcState is ReadonlyRegister<UCH>;

  /** B51000SetPointLoadingPump: loading pump's setpoint sent via B5 10 00 to the BMU */
  @ext(0x7b, 0)
  model B51000TempDesiredLoadingPump is ReadonlyRegister<D1C>;

  /** BMUB51101_BoilerFlowTemp: current flow temperature inside the BMU */
  @ext(0x77, 0)
  model BMUB51101BoilerFlowTemp is ReadonlyRegister<temp1>;

  /** BMUB51101_TankTemp: hot water storage temperature received via eBUS service B5 11 01 */
  @ext(0x71, 0)
  model BMUB51101StorageTemp is ReadonlyRegister<temp1>;

  /** BMUB51101_ErrorStatus: error state of BMU received via eBUS service B51101 */
  @ext(0x70, 0)
  model BMUB51101ErrorStatus is ReadonlyRegister<UCH>;

  /** StarteEepromAktualisierung: update of the EEPROM has to be started */
  @ext(0xe, 0)
  model StartEepromUpdate is ReadonlyRegister<yesno>;

  /** EepromAktualisierungAktiv: update of the EEPROM has been started */
  @ext(0xf, 0)
  model EepromUpdateActive is ReadonlyRegister<yesno>;

  /** HC1PreOrContinuosHeatingActive: preheating or continous heating is active for the first heating circuit */
  @ext(0x8b, 0)
  model Hc1PreOrContinuosHeatingActive is ReadonlyRegister<yesno>;

  /** HC1_PreCutOffActive: early cut off is active for the first heating circuit */
  @ext(0x41, 0)
  model Hc1PreCutOffActive is ReadonlyRegister<yesno>;

  /** HC2HolidayPeriodIsActive: calculated by 470 and sent to VR61 */
  @ext(0xc, 0)
  model Hc2HolidayPeriodIsActive is ReadonlyRegister<yesno>;

  /** HC2BankHolidayPeriodIsActive: calculated by 470 and sent to VR61 */
  @ext(0xd, 0)
  model Hc2BankHolidayPeriodIsActive is ReadonlyRegister<yesno>;

  /** ChimneySweepModeActive: chimney sweep mode has been enabled by the BMU */
  @ext(0x90, 0)
  model ChimneySweepModeActive is ReadonlyRegister<yesno>;

  /** DHWLoadingIn430Active: DHW-loading is active in non parallel loading cases */
  @ext(0x93, 0)
  model HwcLoadingIn430Active is ReadonlyRegister<yesno>;

  /** LegioProtectActive: legionella protection is active */
  @ext(0x73, 0)
  model LegioProtectActive is ReadonlyRegister<yesno>;

  /** V430_PluggedIn: false if calorMATIC 470 is set inside a wall socket and not plugged in */
  @ext(0xb3, 0)
  model V430PluggedIn is ReadonlyRegister<yesno>;

  /** InstallAssistant: install assistant not active (0 = active, 1 = not active) */
  @ext(0x5e, 0)
  model InstallAssistant is ReadonlyRegister<onoff>;

  /** VR81ActiveForHC1: VR81 is connected to the first heating circuit */
  @ext(0x5c, 0)
  model VR81ActiveForHc1 is ReadonlyRegister<yesno>;

  /** VR81ActiveForHC2: VR81 is connected to the second heating circuit */
  @ext(0xa7, 0)
  model VR81ActiveForHc2 is ReadonlyRegister<yesno>;

  /** FactoryTestAktiv: Factory Test Pin */
  @ext(0x10, 0)
  model FactoryTestActive is ReadonlyRegister<yesno>;

  /** BKMK1CPLPState: nominal condition of the VR61's circulation or loading pump */
  @ext(0x7f, 0)
  model HcMc1CPLPState is ReadonlyRegister<onoff>;

  /** EnermanState: current energy-manager-state (0 = off, 1 = heating, 2 = DHW, 3 = DHW pump lag) */
  @ext(0x7a, 0)
  model EnermanState is ReadonlyRegister<UCH>;

  /** HK1PumpState: first heating circuit pump's state */
  @ext(0x82, 0)
  model Hc1Pump is ReadonlyRegister<onoff>;

  /** HK1PumpLast24started: first heating circuit's pump has been started during the last 24h */
  @ext(0x84, 0)
  model Hc1PumpLast24started is ReadonlyRegister<yesno>;

  /** CP_LPLast24started: circulation respectively loading pump has been started during the last 24h */
  @ext(0x83, 0)
  model CPLPLast24started is ReadonlyRegister<yesno>;

  /** CalculatedKickStopTime: calculated time in between two pump kicks during frostprotection (time depends on outside temperature) */
  @ext(0x8c, 0)
  model CalculatedKickStopTime is ReadonlyRegister<minutes0>;

  /** FrostProtectState_Monitor: monitoring of the frost protection's state transition diagram */
  @ext(0x89, 0)
  model FrostProtectStateMonitor is ReadonlyRegister<UCH>;

  /** FrostProtectionRequired_Monitor: frost protection should be enabled */
  @ext(0x8a, 0)
  model FrostProtectionRequiredMonitor is ReadonlyRegister<yesno>;

  /** FrostProtectDelayMonitor: frost protection delay has not elapsed yet */
  @ext(0x8f, 0)
  model FrostProtectDelayMonitor is ReadonlyRegister<yesno>;

  /** PumpEnergySaveStateMonitor: monitoring of the pump energy saving's state transition diagram */
  @ext(0x91, 0)
  model PumpEnergySaveStateMonitor is ReadonlyRegister<UCH>;

  /** PumpEnergySaveCalculatedTimeMonitor: calculated time for the heating circuit's pump's switch off time during pump energy saving function (depends on outside temperature) */
  @ext(0x92, 0)
  model PumpEnergySaveCalculatedTimeMonitor is ReadonlyRegister<minutes0>;

  /** actoSTOR_OPMode: state diagram actoSTOR control */
  @ext(0x94, 0)
  model ActoSTOROPMode is ReadonlyRegister<UCH>;

  /** ClockSwitchSummerWinterDone: automatic switching over to/from daylight saving's time has been done */
  @ext(0x78, 0)
  model ClockSwitchSummerWinterDone is ReadonlyRegister<yesno>;

  /** MonitorEEpromInkonsiNumber */
  @inherit(r)
  @ext(0x9f, 0)
  model MonitorEEpromInkonsiNumber {
    /** identification of the last eight EEPROM inconsistencies */
    @maxLength(8)
    value: HEX;
  }

  /** MonitorCurrent_I_Anteil: current i-control value; updated every 3 minutes */
  @ext(0x33, 0)
  model MonitorCurrentIPart is ReadonlyRegister<temp>;

  /** CountryVariant: country variant (0 = west, 1 = east, 2 = all) */
  @ext(0x17, 0)
  model CountryVariant is ReadonlyRegister<UCH>;

  /** DisplayedRoomTemp: displayed room temperature */
  @ext(0x80, 0)
  model DisplayedRoomTemp is ReadonlyRegister<temp>;

  /** RaumtempIstUnten: lower room temp sensor value */
  @ext(0xc1, 0)
  model RaumtempIstUnten is ReadonlyRegister<tempsensor>;

  /** ADCValue_T_below: lower room temp sensor ADC value */
  @ext(0x4e, 0)
  model ADCValueTempbelow is ReadonlyRegister<UIN>;
  // ##### test info #####

  /** MenuTesting_CurrScreenNo */
  @ext(0xf5, 0)
  model MenuTestingCurrScreenCount is ReadonlyRegister<UIN>;

  /** MenuTesting_CurrValue */
  @ext(0xf6, 0)
  model MenuTestingCurrValue is ReadonlyRegister<ULG>;

  /** MenuTesting_SymAddrFromCurrValue */
  @ext(0xf7, 0)
  model MenuTestingSymAddrFromCurrValue is ReadonlyRegister<UIN>;

  /** MenuTesting_CurrPid */
  @ext(0xf8, 0)
  model MenuTestingCurrPid is ReadonlyRegister<UIN>;

  /** MenuTesting_CurrParameterTextId */
  @ext(0xf9, 0)
  model MenuTestingCurrParameterTextId is ReadonlyRegister<UIN>;

  enum Values_Hc1OPMode {
    auto: 2,
    on: 3,
    night: 4,
    summer: 5,
  }

  enum Values_Hc1SFMode {
    none: 0,
    party: 1,
    onedaybankholiday: 2,
    onedayholiday: 3,
    holiday: 4,
    bankholiday: 5,
    quickveto: 6,
    onetimeventilation: 7,
    onetimewater: 8,
  }

  enum Values_Hc2SFMode {
    none: 0,
    party: 1,
    onedaybankholiday: 2,
    onedayholiday: 3,
    holiday: 4,
    bankholiday: 5,
    quickveto: 6,
    onetimeventilation: 7,
    onetimewater: 8,
  }

  enum Values_SummerWinterTimeAdjust {
    off: 0,
    auto: 1,
  }

  enum Values_LanguageVariant {
    german: 0,
    english: 1,
    french: 2,
    italian: 3,
    danish: 4,
    dutch: 5,
    spanish: 6,
    turkish: 7,
    hungarian: 8,
    russian: 9,
    ukrainian: 10,
    estonian: 11,
    latvian: 12,
    lithuanian: 13,
    swedish: 14,
    norwegian: 15,
    polish: 16,
    czech: 17,
    croatian: 18,
    slovakian: 19,
    romanian: 20,
    slovenian: 21,
    serbian: 22,
  }

  enum Values_OpModeEffect {
    HC1: 0,
    HC2: 1,
    HC1_HC2: 3,
  }

  enum Values_HcMc1ConfigCPLP {
    off: 0,
    CP: 1,
    LP: 2,
  }

  enum Values_Hc1HcType {
    disabled: 0,
    burnercircuit: 1,
  }

  enum Values_Hc1RoomTempSwitchOn {
    off: 0,
    modulating: 1,
    thermostat: 2,
  }

  enum Values_Hc1AutoOffMode {
    frostprotection: 0,
    lowering: 1,
    eco: 2,
  }

  enum Values_Hc2HcType {
    disabled: 0,
    mixing: 1,
    zone: 2,
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

  enum Values_StatusDcf {
    nosignal: 0,
    ok: 1,
    sync: 2,
    validDCF: 3,
    validRTC: 4,
  }

  enum Values_Hc2OPMode {
    auto: 2,
    on: 3,
    night: 4,
    summer: 5,
  }

  enum Values_HwcOPMode {
    off: 0,
    on: 1,
    auto: 2,
    autosunday: 3,
    party: 4,
    load: 5,
    holiday: 7,
  }

  /** included parts */
  union _includes {
    Yield3d43_inc,
    Timercc_inc,
    Timerhwc_inc,
    Timerhc_inc,
    Timercool_inc,
    Timertariff_inc,
    Errors_inc,
  }
}
