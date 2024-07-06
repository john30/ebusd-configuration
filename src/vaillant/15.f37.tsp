import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./timercc_inc.tsp";
import "./timerhwc_inc.tsp";
import "./timerhc_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace F37 {
  // ,F3700,VRT 370f,F37 260
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

  /** DHW_DesiredTemp: setpoint of domestic hot water circuit */
  @ext(0x44, 0)
  model HwcTempDesired is Register<temp1>;

  /** aaucHcNames_HK1: labelling of the first heating circuit (only A-Z,0-9,blank) */
  @ext(0x3f, 0)
  model HcName1 is Register<hcname>;

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

  /** HC1_2stepanalogCtrl */
  @inherit(r, wi)
  @ext(0x36, 0)
  model Hc12stepanalogCtrl {
    /** two-point / analogue control */
    @values(Values_Hc12stepanalogCtrl)
    value: UCH;
  }

  /** HC1_LineMatchingAdaption: adjustment of closed loop control */
  @ext(0x37, 0)
  model Hc1LineMatchingAdaption is InstallRegister<SCH>;

  /** CircuPumpRunning: circulation pump's state */
  @ext(0x81, 0)
  model CirPump is ReadonlyRegister<yesno>;

  /** HC1ActualFlowSetPoint: current flow temperature setpoint of the first heating circuit */
  @ext(0x3e, 0)
  model Hc1ActualFlowTempDesired is ReadonlyRegister<temp1>;

  /** DHW_CircuitActive: domestic hot water circuit is enabled */
  @ext(0x4b, 0)
  model HwcCircuitActive is InstallRegister<yesno>;

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

  /** ACTOstorDetected: indicates that an ACTOstor has been detected */
  @ext(0x6f, 0)
  model ACTOstorDetected is ReadonlyRegister<yesno>;
  // ##### developer's info #####

  /** HydraulicMap: hydraulic map (0 = H1, 3 = H4, 11 = A1, 12 = A2, 14 = A5, 15 = S1, 16 = S3a, 17 = S3b) */
  @ext(0x18, 0)
  model HydraulicMap is ReadonlyRegister<UCH>;

  /** ActualRoomTempSetpointHC1: current room setpoint considering all basic conditions passed to the control algorithms */
  @ext(0x63, 0)
  model ActualRoomTempDesiredHc1 is ReadonlyRegister<temp>;

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

  /** TestVarActivateFunction: 0=All SF_OFF11/2=1DayHolON/OFF13/4=1DayBankON/OFF19/10=1xDHWLoadON/OFF11/12=QVetoON/OFF115/16=PartyON/OFF119/20=Ventil.ON/OFF123/24=SystemOff_ON/OFF */
  @ext(0xb, 0)
  model TestVarActivateFunction is ReadonlyRegister<UCH>;

  /** DHW_OPMode: operation mode of the domestic hot water circuit set implicitly (0 = off, 1 = on, 2 = auto, 3 = auto sunday, 4 = party, 6 = one time tank loading, 7 = holiday) */
  @ext(0x42, 0)
  model HwcOPMode is ReadonlyRegister<UCH>;

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
  model StartEepromUpdate is ReadonlyRegister<onoff>;

  /** EepromAktualisierungAktiv: update of the EEPROM has been started */
  @ext(0xf, 0)
  model EepromUpdateActive is ReadonlyRegister<onoff>;

  /** ChimneySweepModeActive: chimney sweep mode has been enabled by the BMU */
  @ext(0x90, 0)
  model ChimneySweepModeActive is ReadonlyRegister<yesno>;

  /** DHWLoadingIn430Active: DHW-loading is active in non parallel loading cases */
  @ext(0x93, 0)
  model HwcLoadingIn430Active is ReadonlyRegister<yesno>;

  /** LegioProtectActive: legionella protection is active */
  @ext(0x73, 0)
  model LegioProtectActive is ReadonlyRegister<yesno>;

  /** InstallAssistant: install assistant not active (0 = active, 1 = not active) */
  @ext(0x5e, 0)
  model InstallAssistant is ReadonlyRegister<onoff>;

  /** FactoryTestAktiv: Factory Test Pin */
  @ext(0x10, 0)
  model FactoryTestActive is ReadonlyRegister<yesno>;

  /** CP_LPLast24started: circulation respectively loading pump has been started during the last 24h */
  @ext(0x83, 0)
  model CPLPLast24started is ReadonlyRegister<yesno>;

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

  /** RaumtempIstOben */
  @ext(0xc0, 0)
  model RaumtempIstOben is ReadonlyRegister<tempsensor>;

  /** ADCValue_T_above */
  @ext(0x2d, 0)
  model ADCValueTempabove is ReadonlyRegister<UIN>;

  /** RaumtempIstUnten */
  @ext(0xc1, 0)
  model RaumtempIstUnten is ReadonlyRegister<tempsensor>;

  /** ADCValue_T_below */
  @ext(0x4e, 0)
  model ADCValueTempbelow is ReadonlyRegister<UIN>;

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

  enum Values_Hc12stepanalogCtrl {
    two_point_control: 0,
    analogue_control: 1,
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

  /** included parts */
  union _includes {
    Timercc_inc,
    Timerhwc_inc,
    Timerhc_inc,
    Errors_inc,
  }
}
