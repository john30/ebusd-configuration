import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./timercc_inc.tsp";
import "./timerhwc_inc.tsp";
import "./timerhc_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x15)
namespace f37 {
  // ,F3700,VRT 370f,F37 260

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

  /** Actual Weekday */
  @inherit(r)
  @ext(0x5f, 0)
  model ActualWeekday {
    /** current day of week */
    value: bday;
  }

  /** date */
  @inherit(r, w)
  @ext(0x61, 0)
  model Date {
    /** current date */
    value: date;
  }

  /** time */
  @inherit(r, w)
  @ext(0x60, 0)
  model Time {
    /** current time */
    value: time;
  }

  /** RaumtemperaturIst */
  @inherit(r)
  @ext(0, 0)
  model RoomTemp {
    /** raw value current room temperature and sensorstate (without any correction) */
    value: tempsensor;
  }

  /** RoomTempCorrection */
  @inherit(r, w)
  @ext(0x57, 0)
  model RoomTempCorrection {
    /** room temperature correction */
    value: calibrations;
  }

  /** DisplayedHK1RoomSetpoint */
  @inherit(r)
  @ext(0x96, 0)
  model DisplayedHc1RoomTempDesired {
    /** 0= >5°C, currently displayed room temperature setpoint */
    value: temp1;
  }

  /** HC1_OPMode */
  @inherit(r, w)
  @ext(0x2f, 0)
  model Hc1OPMode {
    /** operation mode of the first heating circuit */
    @values(values_Hc1OPMode)
    value: UCH;
  }

  /** HC1_DaySetTemp */
  @inherit(r, w)
  @ext(0x27, 0)
  model Hc1DayTemp {
    /** day setpoint */
    value: temp1;
  }

  /** HC1_NightSetTemp */
  @inherit(r, w)
  @ext(0x30, 0)
  model Hc1NightTemp {
    /** lowering temperature setpoint of the first heating circuit */
    value: temp1;
  }

  /** HC1_QuickVetoTemp */
  @inherit(r)
  @ext(0x3c, 0)
  model Hc1QuickVetoTemp {
    /** manual override setpoint of the first heating circuit */
    value: temp1;
  }

  /** HC1_HolidayRoomSetTemp */
  @inherit(r, w)
  @ext(0x40, 0)
  model Hc1HolidayRoomTemp {
    /** 4.5=frostprotect, room setpoint during holidays */
    value: D1C;
  }

  /** HC1_SFMode */
  @inherit(r)
  @ext(0x5d, 0)
  model Hc1SFMode {
    /** activated special function of first heating circuit */
    @values(values_Hc1SFMode)
    value: UCH;
  }

  /** HC1HolidayStartPeriod */
  @inherit(r, w)
  @ext(0x11, 0)
  model Hc1HolidayStartPeriod {
    /** first heating circuit's start date of holidays */
    value: date;
  }

  /** HC1HolidayEndPeriod */
  @inherit(r, w)
  @ext(0x12, 0)
  model Hc1HolidayEndPeriod {
    /** first heating circuit's end date of holidays */
    value: date;
  }

  /** HC1BankHolidayStartPeriod */
  @inherit(r, w)
  @ext(0x21, 0)
  model Hc1BankHolidayStartPeriod {
    /** first heating circuit's start date of bank holidays */
    value: date;
  }

  /** HC1BankHolidayEndPeriod */
  @inherit(r, w)
  @ext(0x22, 0)
  model Hc1BankHolidayEndPeriod {
    /** first heating circuit's end date of bank holidays */
    value: date;
  }

  /** DHW_DesiredTemp */
  @inherit(r, w)
  @ext(0x44, 0)
  model HwcTempDesired {
    /** setpoint of domestic hot water circuit */
    value: temp1;
  }

  /** aaucHcNames_HK1 */
  @inherit(r, w)
  @ext(0x3f, 0)
  model HcName1 {
    /** labelling of the first heating circuit (only A-Z,0-9,blank) */
    @maxLength(11)
    value: STR;
  }

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

  /** MaintenanceDate */
  @inherit(r, wi)
  @ext(0x59, 0)
  model MaintenanceDate {
    /** date of the next maintenance service */
    value: date;
  }

  /** LcdContrastValue */
  @inherit(r, w)
  @ext(0x5a, 0)
  model LcdContrastValue {
    /** setting of the LCD contrast */
    value: UCH;
  }

  /** SummerWinterTimeAdjust */
  @inherit(r, w)
  @ext(0x53, 0)
  model SummerWinterTimeAdjust {
    /** enable automatic switching over to daylight saving's time (when a DCF receiver is connected to the BMU the value is set fix to ON) */
    @values(values_SummerWinterTimeAdjust)
    value: UCH;
  }

  /** LanguageVariant */
  @inherit(r, w)
  @ext(0x16, 0)
  model LanguageVariant {
    /** display language */
    @values(values_LanguageVariant)
    value: UCH;
  }
  // ##### extra #####

  /** BMU_FlowTempOrVF_1 */
  @inherit(r)
  @ext(0x87, 0)
  model BMUFlowTempOrVF1 {
    /** value of either an externally connected flow temperature sensor or the BMU's internal flow sensor if an external sensor is missing */
    value: tempsensor;
  }

  /** RaumTempOffsetEigenErwaerm */
  @inherit(r)
  @ext(0x15, 0)
  model RoomTempOffsetSelfWarming {
    /** room temperature intrinsic heating offset */
    value: temp;
  }

  /** HC1_2stepanalogCtrl */
  @inherit(r, wi)
  @ext(0x36, 0)
  model Hc12stepanalogCtrl {
    /** two-point / analogue control */
    @values(values_Hc12stepanalogCtrl)
    value: UCH;
  }

  /** HC1_LineMatchingAdaption */
  @inherit(r, wi)
  @ext(0x37, 0)
  model Hc1LineMatchingAdaption {
    /** adjustment of closed loop control */
    value: SCH;
  }

  /** CircuPumpRunning */
  @inherit(r)
  @ext(0x81, 0)
  model CirPump {
    /** circulation pump's state */
    value: yesno;
  }

  /** HC1ActualFlowSetPoint */
  @inherit(r)
  @ext(0x3e, 0)
  model Hc1ActualFlowTempDesired {
    /** current flow temperature setpoint of the first heating circuit */
    value: temp1;
  }

  /** DHW_CircuitActive */
  @inherit(r, wi)
  @ext(0x4b, 0)
  model HwcCircuitActive {
    /** domestic hot water circuit is enabled */
    value: yesno;
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

  /** DisplayedDHWTankTemperature */
  @inherit(r)
  @ext(0x9e, 0)
  model DisplayedHwcStorageTemp {
    /** display of the storage's temperature (also in case of an SP1error) */
    value: temp1;
  }

  /** DHW_ActualDesired_Setpoint */
  @inherit(r)
  @ext(0x86, 0)
  model HwcActualTempDesired {
    /** current domestic hot water setpoint */
    value: temp1;
  }

  /** KeyCodeforConfigMenue */
  @inherit(r, wi)
  @ext(0x55, 0)
  model KeyCodeforConfigMenu {
    /** code for the installer's menues */
    value: code;
  }

  /** GlobalSystemOFF */
  @inherit(r)
  @ext(1, 0)
  model GlobalSystemOff {
    /** Set to TRUE if "System Off" is selected */
    value: onoff;
  }

  /** StatusDcf */
  @inherit(r)
  @ext(0x2, 0)
  model StatusDcf {
    /** status of the DCF signal */
    @values(values_StatusDcf)
    value: UCH;
  }

  /** DcfIsValid */
  @inherit(r)
  @ext(0x4, 0)
  model DcfIsValid {
    /** validity of DCF signal */
    value: yesno;
  }

  /** ACTOstorDetected */
  @inherit(r)
  @ext(0x6f, 0)
  model ACTOstorDetected {
    /** indicates that an ACTOstor has been detected */
    value: yesno;
  }
  // ##### developer's info #####

  /** HydraulicMap */
  @inherit(r)
  @ext(0x18, 0)
  model HydraulicMap {
    /** hydraulic map (0 = H1, 3 = H4, 11 = A1, 12 = A2, 14 = A5, 15 = S1, 16 = S3a, 17 = S3b) */
    value: UCH;
  }

  /** ActualRoomTempSetpointHC1 */
  @inherit(r)
  @ext(0x63, 0)
  model ActualRoomTempDesiredHc1 {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    value: temp;
  }

  /** B51000M7OpModeMonitor */
  @inherit(r)
  @ext(0x65, 0)
  model B51000M7OpModeMonitor {
    /** operation mode sent via B5 10 00 (0 = auto, 1 = forced off, 2 = forced CH, 3 = forced DHW) */
    value: UCH;
  }

  /** B51000M8HeatFlowSetMonitor */
  @inherit(r)
  @ext(0x8d, 0)
  model B51000M8HeatFlowSetMonitor {
    /** flow temperature setpoint sent via B5 10 00 to the BMU */
    value: D1C;
  }

  /** B51000M9TappingSetMon */
  @inherit(r)
  @ext(0x56, 0)
  model B51000M9TappingSetMon {
    /** DHW setpoint without loading offset (for hydraulic map H1) */
    value: D1C;
  }

  /** B51000M10DHWFlowSetMon */
  @inherit(r)
  @ext(0x66, 0)
  model B51000M10HwcFlowSetMon {
    /** flow setpoint DHW sent via B5 10 00 */
    value: UCH;
  }

  /** B51000M12DisableBitsMon */
  @inherit(r)
  @ext(0x67, 0)
  model B51000M12DisableBitsMon {
    /** bits 0-7: disable CH/disable DHW tapping/disable DHW tank loading/not used/clear burner blocking DHW/dis, disable bits sent via B5 10 00 (left bit 0, right bit 7) */
    value: UCH;
  }

  /** B51000M14Monitor */
  @inherit(r)
  @ext(0x68, 0)
  model B51000M14Monitor {
    /** bits 0-7: remote control CH pump/release backup heater/release cooling/not used/left stop position DHW o, bits sent in M14 of B5 10 00 (left bit 0, right bit 7; relevant is bit 0: remote control of CH pump) */
    value: UCH;
  }

  /** TestVarActivateFunction */
  @inherit(r)
  @ext(0xb, 0)
  model TestVarActivateFunction {
    /** 0=All SF_OFF11/2=1DayHolON/OFF13/4=1DayBankON/OFF19/10=1xDHWLoadON/OFF11/12=QVetoON/OFF115/16=PartyON/OFF119/20=Ventil.ON/OFF123/24=SystemOff_ON/OFF */
    value: UCH;
  }

  /** DHW_OPMode */
  @inherit(r)
  @ext(0x42, 0)
  model HwcOPMode {
    /** operation mode of the domestic hot water circuit set implicitly (0 = off, 1 = on, 2 = auto, 3 = auto sunday, 4 = party, 6 = one time tank loading, 7 = holiday) */
    value: UCH;
  }

  /** BMUB51101_DHWState */
  @inherit(r)
  @ext(0x75, 0)
  model BMUB51101HwcState {
    /** flame is on because of either tapping or tank loading */
    value: UCH;
  }

  /** B51000SetPointLoadingPump */
  @inherit(r)
  @ext(0x7b, 0)
  model B51000TempDesiredLoadingPump {
    /** loading pump's setpoint sent via B5 10 00 to the BMU */
    value: D1C;
  }

  /** BMUB51101_BoilerFlowTemp */
  @inherit(r)
  @ext(0x77, 0)
  model BMUB51101BoilerFlowTemp {
    /** current flow temperature inside the BMU */
    value: temp1;
  }

  /** BMUB51101_TankTemp */
  @inherit(r)
  @ext(0x71, 0)
  model BMUB51101StorageTemp {
    /** hot water storage temperature received via eBUS service B5 11 01 */
    value: temp1;
  }

  /** BMUB51101_ErrorStatus */
  @inherit(r)
  @ext(0x70, 0)
  model BMUB51101ErrorStatus {
    /** error state of BMU received via eBUS service B51101 */
    value: UCH;
  }

  /** StarteEepromAktualisierung */
  @inherit(r)
  @ext(0xe, 0)
  model StartEepromUpdate {
    /** update of the EEPROM has to be started */
    value: onoff;
  }

  /** EepromAktualisierungAktiv */
  @inherit(r)
  @ext(0xf, 0)
  model EepromUpdateActive {
    /** update of the EEPROM has been started */
    value: onoff;
  }

  /** ChimneySweepModeActive */
  @inherit(r)
  @ext(0x90, 0)
  model ChimneySweepModeActive {
    /** chimney sweep mode has been enabled by the BMU */
    value: yesno;
  }

  /** DHWLoadingIn430Active */
  @inherit(r)
  @ext(0x93, 0)
  model HwcLoadingIn430Active {
    /** DHW-loading is active in non parallel loading cases */
    value: yesno;
  }

  /** LegioProtectActive */
  @inherit(r)
  @ext(0x73, 0)
  model LegioProtectActive {
    /** legionella protection is active */
    value: yesno;
  }

  /** InstallAssistant */
  @inherit(r)
  @ext(0x5e, 0)
  model InstallAssistant {
    /** install assistant not active (0 = active, 1 = not active) */
    value: onoff;
  }

  /** FactoryTestAktiv */
  @inherit(r)
  @ext(0x10, 0)
  model FactoryTestActive {
    /** Factory Test Pin */
    value: yesno;
  }

  /** CP_LPLast24started */
  @inherit(r)
  @ext(0x83, 0)
  model CPLPLast24started {
    /** circulation respectively loading pump has been started during the last 24h */
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

  /** actoSTOR_OPMode */
  @inherit(r)
  @ext(0x94, 0)
  model actoSTOROPMode {
    /** state diagram actoSTOR control */
    value: UCH;
  }

  /** ClockSwitchSummerWinterDone */
  @inherit(r)
  @ext(0x78, 0)
  model ClockSwitchSummerWinterDone {
    /** automatic switching over to/from daylight saving's time has been done */
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

  /** MonitorCurrent_I_Anteil */
  @inherit(r)
  @ext(0x33, 0)
  model MonitorCurrentIPart {
    /** current i-control value; updated every 3 minutes */
    value: temp;
  }

  /** CountryVariant */
  @inherit(r)
  @ext(0x17, 0)
  model CountryVariant {
    /** country variant (0 = west, 1 = east, 2 = all) */
    value: UCH;
  }

  /** DisplayedRoomTemp */
  @inherit(r)
  @ext(0x80, 0)
  model DisplayedRoomTemp {
    /** displayed room temperature */
    value: temp;
  }

  /** RaumtempIstOben */
  @inherit(r)
  @ext(0xc0, 0)
  model RaumtempIstOben {
    value: tempsensor;
  }

  /** ADCValue_T_above */
  @inherit(r)
  @ext(0x2d, 0)
  model ADCValueTempabove {
    value: UIN;
  }

  /** RaumtempIstUnten */
  @inherit(r)
  @ext(0xc1, 0)
  model RaumtempIstUnten {
    value: tempsensor;
  }

  /** ADCValue_T_below */
  @inherit(r)
  @ext(0x4e, 0)
  model ADCValueTempbelow {
    value: UIN;
  }

  enum values_Hc1OPMode {
    auto: 2,
    on: 3,
    night: 4,
    summer: 5,
  }

  enum values_Hc1SFMode {
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

  enum values_SummerWinterTimeAdjust {
    off: 0,
    auto: 1,
  }

  enum values_LanguageVariant {
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

  enum values_Hc12stepanalogCtrl {
    two_point_control: 0,
    analogue_control: 1,
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

  enum values_StatusDcf {
    nosignal: 0,
    ok: 1,
    sync: 2,
    validDCF: 3,
    validRTC: 4,
  }

  /** included parts */
  union _includes {
    timercc_inc,
    timerhwc_inc,
    timerhc_inc,
    errors_inc,
  }
}
