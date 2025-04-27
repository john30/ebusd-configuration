import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./yield4445_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace Ui {
  // ,UI,CI of VRS 620/3,0020040141 162
  // ##### MainPage #####

  /** Aussentemperatur: out door temperature */
  @ext(1, 0)
  model OutsideTemp is ReadonlyRegister<tempsensor>;

  /** SystemFlowTemp: system temperature at the hydraulic diverter (VF1) */
  @ext(0x2, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** SystemTempGradient: gradient of the system temperature (VF1) */
  @ext(0x8c, 0)
  model SystemTempGradient is ReadonlyRegister<temp>;

  /** SystemDesiredFlowTemp: system desired flow temperature */
  @ext(0x5, 0)
  model FlowTempDesired is ReadonlyRegister<temp>;

  /** StateEM */
  @inherit(r)
  @ext(0x4b, 0)
  model StateEM {
    /** OFF=0, CH=1, DHW=2, DHW-Overrun=3 */
    @values(Values_StateEM)
    value: UCH;
  }

  /** SolarHydraulicMap: hydraulic scheme (1..9); this parameter has to change at the IO-pcb */
  @ext(0x1e, 0)
  model HydraulicMap is ReadonlyRegister<UCH>;

  /** PreShutDownTime */
  @ext(0x2d, 0)
  model PreShutDownTime is Register<minutes0>;

  /** FrostOverRideTime */
  @ext(0x2e, 0)
  model FrostOverRideTime is Register<hours>;

  /** TempIncrease */
  @ext(0x2f, 0)
  model TempIncrease is Register<temp>;

  /** ContinuousHeatingLimit: -128=off, (0x80, -128 = off) */
  @ext(0x64, 0)
  model ContinuousHeatingLimit is Register<SCH>;
  // ##### SystemComponets #####

  /** Mk2Detected: detected VR60 (bit counted) */
  @ext(0x18, 0)
  model MixerDetected is ReadonlyRegister<UCH>;

  /** BkDetected: detected bus coppler e.g. VR30,31,32 (bit counted) */
  @ext(0x19, 0)
  model BoilerDetected is ReadonlyRegister<UCH>;

  /** FbgDetected: detected VR80 or VR90 (bit counted) */
  @ext(0x1a, 0)
  model RemoteDetected is ReadonlyRegister<UCH>;

  /** ActoStorModulDetected: detected VLR (bit counted) */
  @ext(0x5a, 0)
  model ActoStorModulDetected is ReadonlyRegister<UCH>;

  /** AscBigModulDetected: detected VPM-S (bit counted) */
  @ext(0x7f, 0)
  model AscBigModulDetected is ReadonlyRegister<UCH>;

  /** AscSmallModulDetected: detected VMS (bit counted) */
  @ext(0x80, 0)
  model AscSmallModulDetected is ReadonlyRegister<UCH>;

  /** FwsModulDetected: detected VPM-W (bit counted) */
  @ext(0x81, 0)
  model WaterstationModulDetected is ReadonlyRegister<UCH>;

  /** NumberOfBoiler: active boiler in the system */
  @ext(0x1c, 0)
  model BoilerCount is ReadonlyRegister<UCH>;

  /** BoilerSwitchSteps: set of the steps from the switching boiler */
  @ext(0x35, 0)
  model BoilerSwitchSteps is InstallRegister<UCH>;

  /** SourceType */
  @inherit(r)
  @ext(0x4e, 0)
  model SourceType {
    /** noSystem=0, SSR=1, VRC=2, eSys=3, mixedSys=4 */
    @values(Values_SourceType)
    value: UCH;
  }
  // ##### controler internal #####

  /** RaumtemperaturIst: room temperature */
  @ext(0, 0)
  model RoomTemp is ReadonlyRegister<tempsensor>;

  /** RaumtemperaturIstOffset */
  @ext(0x1f, 0)
  model RoomTempOffset is InstallRegister<temp>;

  /** RaumTempOffsetEigenErwaerm */
  @ext(0x20, 0)
  model RoomTempOffsetSelfWarming is ReadonlyRegister<temp>;

  /** OutDoorTempCorr */
  @ext(0x21, 0)
  model OutsideTempOffset is InstallRegister<temp>;

  /** RoomSetTempHoliday */
  @ext(0x22, 0)
  model RoomTempHoliday is Register<temp>;

  /** HolidayPeriod */
  @inherit(r, w)
  @ext(0x43, 0)
  model HolidayPeriod {
    hfrom: hfrom;
    hto: hto;
    hfrom_1: hfrom;
    hto_1: hto;
  }

  /** ServicePeriod */
  @ext(0x2b, 0)
  model ServicePeriod is InstallRegister<date>;

  /** aucPhoneNumber_part1 */
  @ext(0x42, 0)
  model PhoneNumberPart1 is InstallRegister<phone>;

  /** aucPhoneNumber_part2 */
  @ext(0x42, 0x8)
  model PhoneNumberPart2 is InstallRegister<phone>;

  /** KeyCodeforConfigMenue */
  @inherit(r, wi)
  @ext(0x2c, 0)
  model KeyCodeforConfigMenu {
    @maxLength(4)
    value: HEX;
  }

  /** TempFailDetectTime */
  @ext(0x33, 0)
  model TempFailDetectTime is InstallRegister<temp0>;

  /** LcdContrastPwmValue: contrast for the display */
  @ext(0x36, 0)
  model LcdContrastPwmValue is InstallRegister<UCH>;

  /** time */
  @ext(0x5f, 0)
  model Time is ReadonlyRegister<time>;

  /** Day of week */
  @ext(0x60, 0)
  model Day is ReadonlyRegister<bday>;

  /** date */
  @ext(0x61, 0)
  model Date is ReadonlyRegister<date>;

  /** SummerWinterTimeAdjust */
  @ext(0x67, 0)
  model SummerWinterTimeAdjust is Register<onoff>;

  /** ClockSwitchSummerWinterDone */
  @ext(0x68, 0)
  model ClockSwitchSummerWinterDone is ReadonlyRegister<onoff>;

  /** InstallationCompleted: Installation assistant is done */
  @ext(0x69, 0)
  model InstallationCompleted is ReadonlyRegister<yesno>;

  /** DisplayTyp: display misubishi=0x07, mtek=0x70 */
  @ext(0x8d, 0)
  model DisplayType is ReadonlyRegister<UCH>;

  /** ScanPrevention: cyclic scan are started */
  @ext(0x84, 0)
  model ScanPrevention is ReadonlyRegister<onoff>;
  // ##### cascade parameter #####

  /** BoilerSwitchHyster */
  @ext(0x23, 0)
  model BoilerSwitchHyster is InstallRegister<temp>;

  /** BoilerMaxTemp */
  @ext(0x24, 0)
  model BoilerTempMax is InstallRegister<temp>;

  /** BoilerMinTemp */
  @ext(0x25, 0)
  model BoilerTempMin is InstallRegister<temp>;

  /** StartPowerVantage: start power for DHW loading (x boiler) */
  @ext(0x28, 0)
  model StartPowerVantage is InstallRegister<UCH>;

  /** SeparationShift */
  @ext(0x2a, 0)
  model SeparationShift is InstallRegister<onoff>;

  /** TurnOnDelay */
  @ext(0x30, 0)
  model TurnOnDelay is InstallRegister<UCH>;

  /** TurnOffDelay */
  @ext(0x31, 0)
  model TurnOffDelay is InstallRegister<UCH>;

  /** BoilerSequence: activation of boiler sequence */
  @ext(0x32, 0)
  model BoilerSequence is InstallRegister<onoff>;

  /** BoilerSequenceChangeTime: if this xx hours reachred between the first and the last boiler in the actual sequence then the boiler sequensce is new sorted */
  @ext(0x37, 0)
  model BoilerSequenceChangeTime is InstallRegister<hours>;

  /** SequenceOfBoiler */
  @inherit(r)
  @ext(0x66, 0)
  model SequenceOfBoiler {
    /** row of sequence */
    @maxLength(8)
    value: HEX;
  }

  /** BurnerHours_boiler1 */
  @ext(0x4c, 0)
  model BoilerHoursB1 is ReadonlyRegister<hoursum>;

  /** BurnerHours_boiler2 */
  @ext(0x4c, 0x8)
  model BoilerHoursB2 is ReadonlyRegister<hoursum>;

  /** BurnerHours_boiler3 */
  @ext(0x4c, 0x10)
  model BoilerHoursB3 is ReadonlyRegister<hoursum>;

  /** BurnerHours_boiler4 */
  @ext(0x4c, 0x18)
  model BoilerHoursB4 is ReadonlyRegister<hoursum>;

  /** BurnerHours_boiler5 */
  @ext(0x4c, 0x20)
  model BoilerHoursB5 is ReadonlyRegister<hoursum>;

  /** BurnerHours_boiler6 */
  @ext(0x4c, 0x28)
  model BoilerHoursB6 is ReadonlyRegister<hoursum>;

  /** BurnerHours_boiler7 */
  @ext(0x4c, 0x30)
  model BoilerHoursB7 is ReadonlyRegister<hoursum>;

  /** BurnerHours_boiler8 */
  @ext(0x4c, 0x38)
  model BoilerHoursB8 is ReadonlyRegister<hoursum>;
  // ##### EM internal #####

  /** SystemModeStream1 */
  @inherit(r)
  @ext(0x6e, 0)
  model SystemModeStream1 {
    /** Off=0, Heating=1, Cooling=2, Dhw=3, DhwDuringCH=4, DhwDuringCooling=5 */
    @values(Values_SystemModeStream1)
    value: UCH;
  }

  /** SystemModeStream2 */
  @inherit(r)
  @ext(0x6f, 0)
  model SystemModeStream2 {
    /** Off=0, Heating=1, Cooling=2, Dhw=3, DhwDuringCH=4, DhwDuringCooling=5 */
    @values(Values_SystemModeStream2)
    value: UCH;
  }

  /** SystemModeStream3 */
  @inherit(r)
  @ext(0x70, 0)
  model SystemModeStream3 {
    /** Off=0, Heating=1, Cooling=2, Dhw=3, DhwDuringCH=4, DhwDuringCooling=5 */
    @values(Values_SystemModeStream3)
    value: UCH;
  }

  /** SystemDemand1 */
  @inherit(r)
  @ext(0x88, 0)
  model SystemDemand1 {
    /** Struct[TIte DesFlowTemp, Mode, CoolingReq]Mode: Off=0, Ch=1, Dhw=2, BoilerOverrun=3, BoilerPrerun=4CoolingReq: Off=0, On=1 */
    @maxLength(4)
    value: HEX;
  }

  /** HcForceMode: ForceComsumDisable=0, ForceComsumNoHeating=1, ForceComsumMaxHeating=2 */
  @ext(0x71, 0)
  model HcForceMode is ReadonlyRegister<UCH>;

  /** DhwRequestAsc */
  @ext(0x72, 0)
  model HwcRequestAsc is ReadonlyRegister<onoff>;

  /** ChRequestAsc */
  @ext(0x73, 0)
  model HcRequestAsc is ReadonlyRegister<onoff>;

  /** FlowSetpointAscDhw */
  @ext(0x74, 0)
  model FlowTempDesiredAscHwc is ReadonlyRegister<temp>;

  /** FlowSetpointAscCh */
  @ext(0x75, 0)
  model FlowTempDesiredAscHc is ReadonlyRegister<temp>;

  /** SolarLoadingDelay_Dhw */
  @ext(0x76, 0)
  model SolLoadingDelayHwc is ReadonlyRegister<minutes0>;

  /** SolarLoadingDelay_Ch */
  @ext(0x89, 0)
  model SolLoadingDelayHc is ReadonlyRegister<minutes0>;

  /** BufferFlowThreshold_On */
  @ext(0x77, 0)
  model BufferFlowThresholdOn is ReadonlyRegister<temp>;

  /** BufferFlowThreshold_Off */
  @ext(0x78, 0)
  model BufferFlowThresholdOff is ReadonlyRegister<temp>;

  /** OffsetFlowSetpointBufToBoiler */
  @ext(0x79, 0)
  model OffsetFlowTempDesiredBufToBoiler is ReadonlyRegister<temp>;

  /** ASC_Status */
  @inherit(r)
  @ext(0x7a, 0)
  model ASCStatus {
    /** ASC_OFF=0, ASC_CH=1, ASC_DHW=2 */
    @values(Values_ASCStatus)
    value: UCH;
  }

  /** TankSensorAbove */
  @ext(0x7b, 0)
  model StorageSensorTop is ReadonlyRegister<temp>;

  /** TankSensorMittel */
  @ext(0x7c, 0)
  model StorageSensorMiddle is ReadonlyRegister<temp>;

  /** TankSensorBottom */
  @ext(0x7d, 0)
  model StorageSensorBottom is ReadonlyRegister<temp>;
  // ##### boiler output #####

  /** DesiredFlowTempBoiler_1 */
  @ext(0x48, 0x8)
  model FlowTempDesiredB1 is ReadonlyRegister<temp0>;

  /** DesiredFlowTempBoiler_2 */
  @ext(0x48, 0x10)
  model FlowTempDesiredB2 is ReadonlyRegister<temp0>;

  /** DesiredFlowTempBoiler_3 */
  @ext(0x48, 0x18)
  model FlowTempDesiredB3 is ReadonlyRegister<temp0>;

  /** DesiredFlowTempBoiler_4 */
  @ext(0x48, 0x20)
  model FlowTempDesiredB4 is ReadonlyRegister<temp0>;

  /** DesiredFlowTempBoiler_5 */
  @ext(0x48, 0x28)
  model FlowTempDesiredB5 is ReadonlyRegister<temp0>;

  /** DesiredFlowTempBoiler_6 */
  @ext(0x48, 0x30)
  model FlowTempDesiredB6 is ReadonlyRegister<temp0>;

  /** DesiredFlowTempBoiler_7 */
  @ext(0x48, 0x38)
  model FlowTempDesiredB7 is ReadonlyRegister<temp0>;

  /** DesiredFlowTempBoiler_8 */
  @ext(0x48, 0x40)
  model FlowTempDesiredB8 is ReadonlyRegister<temp0>;

  /** DesiredDegreeBoiler_1: modulation in percent */
  @ext(0x49, 0x8)
  model DesiredDegreeB1 is ReadonlyRegister<percent0>;

  /** DesiredDegreeBoiler_2: modulation in percent */
  @ext(0x49, 0x10)
  model DesiredDegreeB2 is ReadonlyRegister<percent0>;

  /** DesiredDegreeBoiler_3: modulation in percent */
  @ext(0x49, 0x18)
  model DesiredDegreeB3 is ReadonlyRegister<percent0>;

  /** DesiredDegreeBoiler_4: modulation in percent */
  @ext(0x49, 0x20)
  model DesiredDegreeB4 is ReadonlyRegister<percent0>;

  /** DesiredDegreeBoiler_5: modulation in percent */
  @ext(0x49, 0x28)
  model DesiredDegreeB5 is ReadonlyRegister<percent0>;

  /** DesiredDegreeBoiler_6: modulation in percent */
  @ext(0x49, 0x30)
  model DesiredDegreeB6 is ReadonlyRegister<percent0>;

  /** DesiredDegreeBoiler_7: modulation in percent */
  @ext(0x49, 0x38)
  model DesiredDegreeB7 is ReadonlyRegister<percent0>;

  /** DesiredDegreeBoiler_8: modulation in percent */
  @ext(0x49, 0x40)
  model DesiredDegreeB8 is ReadonlyRegister<percent0>;

  /** DesiredStateBoiler_1 */
  @inherit(r)
  @ext(0x4a, 0x8)
  model DesiredStateB1 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(Values_DesiredStateB1)
    value: UCH;
  }

  /** DesiredStateBoiler_2 */
  @inherit(r)
  @ext(0x4a, 0x10)
  model DesiredStateB2 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(Values_DesiredStateB2)
    value: UCH;
  }

  /** DesiredStateBoiler_3 */
  @inherit(r)
  @ext(0x4a, 0x18)
  model DesiredStateB3 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(Values_DesiredStateB3)
    value: UCH;
  }

  /** DesiredStateBoiler_4 */
  @inherit(r)
  @ext(0x4a, 0x20)
  model DesiredStateB4 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(Values_DesiredStateB4)
    value: UCH;
  }

  /** DesiredStateBoiler_5 */
  @inherit(r)
  @ext(0x4a, 0x28)
  model DesiredStateB5 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(Values_DesiredStateB5)
    value: UCH;
  }

  /** DesiredStateBoiler_6 */
  @inherit(r)
  @ext(0x4a, 0x30)
  model DesiredStateB6 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(Values_DesiredStateB6)
    value: UCH;
  }

  /** DesiredStateBoiler_7 */
  @inherit(r)
  @ext(0x4a, 0x38)
  model DesiredStateB7 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(Values_DesiredStateB7)
    value: UCH;
  }

  /** DesiredStateBoiler_8 */
  @inherit(r)
  @ext(0x4a, 0x40)
  model DesiredStateB8 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(Values_DesiredStateB8)
    value: UCH;
  }

  /** LoadingPumpBoiler_1: Off=0, On=100 */
  @ext(0x85, 0x8)
  model LoadingPumpB1 is ReadonlyRegister<UCH>;

  /** LoadingPumpBoiler_2: Off=0, On=100 */
  @ext(0x85, 0x10)
  model LoadingPumpB2 is ReadonlyRegister<UCH>;

  /** LoadingPumpBoiler_3: Off=0, On=100 */
  @ext(0x85, 0x18)
  model LoadingPumpB3 is ReadonlyRegister<UCH>;

  /** LoadingPumpBoiler_4: Off=0, On=100 */
  @ext(0x85, 0x20)
  model LoadingPumpB4 is ReadonlyRegister<UCH>;

  /** LoadingPumpBoiler_5: Off=0, On=100 */
  @ext(0x85, 0x28)
  model LoadingPumpB5 is ReadonlyRegister<UCH>;

  /** LoadingPumpBoiler_6: Off=0, On=100 */
  @ext(0x85, 0x30)
  model LoadingPumpB6 is ReadonlyRegister<UCH>;

  /** LoadingPumpBoiler_7: Off=0, On=100 */
  @ext(0x85, 0x38)
  model LoadingPumpB7 is ReadonlyRegister<UCH>;

  /** LoadingPumpBoiler_8: Off=0, On=100 */
  @ext(0x85, 0x40)
  model LoadingPumpB8 is ReadonlyRegister<UCH>;

  /** ChPumpBoiler_1 */
  @ext(0x86, 0x8)
  model HcPumpB1 is ReadonlyRegister<onoff>;

  /** ChPumpBoiler_2 */
  @ext(0x86, 0x10)
  model HcPumpB2 is ReadonlyRegister<onoff>;

  /** ChPumpBoiler_3 */
  @ext(0x86, 0x18)
  model HcPumpB3 is ReadonlyRegister<onoff>;

  /** ChPumpBoiler_4 */
  @ext(0x86, 0x20)
  model HcPumpB4 is ReadonlyRegister<onoff>;

  /** ChPumpBoiler_5 */
  @ext(0x86, 0x28)
  model HcPumpB5 is ReadonlyRegister<onoff>;

  /** ChPumpBoiler_6 */
  @ext(0x86, 0x30)
  model HcPumpB6 is ReadonlyRegister<onoff>;

  /** ChPumpBoiler_7 */
  @ext(0x86, 0x38)
  model HcPumpB7 is ReadonlyRegister<onoff>;

  /** ChPumpBoiler_8 */
  @ext(0x86, 0x40)
  model HcPumpB8 is ReadonlyRegister<onoff>;

  /** FlagsBoiler_1 */
  @ext(0x87, 0x8)
  model FlagsB1 is ReadonlyRegister<UCH>;

  /** FlagsBoiler_2 */
  @ext(0x87, 0x10)
  model FlagsB2 is ReadonlyRegister<UCH>;

  /** FlagsBoiler_3 */
  @ext(0x87, 0x18)
  model FlagsB3 is ReadonlyRegister<UCH>;

  /** FlagsBoiler_4 */
  @ext(0x87, 0x20)
  model FlagsB4 is ReadonlyRegister<UCH>;

  /** FlagsBoiler_5 */
  @ext(0x87, 0x28)
  model FlagsB5 is ReadonlyRegister<UCH>;

  /** FlagsBoiler_6 */
  @ext(0x87, 0x30)
  model FlagsB6 is ReadonlyRegister<UCH>;

  /** FlagsBoiler_7 */
  @ext(0x87, 0x38)
  model FlagsB7 is ReadonlyRegister<UCH>;

  /** FlagsBoiler_8 */
  @ext(0x87, 0x40)
  model FlagsB8 is ReadonlyRegister<UCH>;
  // ##### heating circuit name #####

  /** aaucHcNames_1: name of heating circuit No 1 */
  @ext(0x41, 0)
  model HcName1 is Register<hcname>;

  /** aaucHcNames_2: name of heating circuit No 2 */
  @ext(0x41, 0x8)
  model HcName2 is Register<hcname>;

  /** aaucHcNames_3: name of heating circuit No 3 */
  @ext(0x41, 0x10)
  model HcName3 is Register<hcname>;

  /** aaucHcNames_4: name of heating circuit No 4 */
  @ext(0x41, 0x18)
  model HcName4 is Register<hcname>;

  /** aaucHcNames_5: name of heating circuit No 5 */
  @ext(0x41, 0x20)
  model HcName5 is Register<hcname>;

  /** aaucHcNames_6: name of heating circuit No 6 */
  @ext(0x41, 0x28)
  model HcName6 is Register<hcname>;

  /** aaucHcNames_7: name of heating circuit No 7 */
  @ext(0x41, 0x30)
  model HcName7 is Register<hcname>;

  /** aaucHcNames_8: name of heating circuit No 8 */
  @ext(0x41, 0x38)
  model HcName8 is Register<hcname>;

  /** aaucHcNames_9: name of heating circuit No 9 */
  @ext(0x41, 0x40)
  model HcName9 is Register<hcname>;

  /** aaucHcNames_10: name of heating circuit No 10 */
  @ext(0x41, 0x48)
  model HcName10 is Register<hcname>;

  /** aaucHcNames_11: name of heating circuit No 11 */
  @ext(0x41, 0x50)
  model HcName11 is Register<hcname>;

  /** aaucHcNames_12: name of heating circuit No 12 */
  @ext(0x41, 0x58)
  model HcName12 is Register<hcname>;

  /** aaucHcNames_13: name of heating circuit No 13 */
  @ext(0x41, 0x60)
  model HcName13 is Register<hcname>;

  /** aaucHcNames_14: name of heating circuit No 14 */
  @ext(0x41, 0x68)
  model HcName14 is Register<hcname>;

  /** aaucHcNames_15: name of heating circuit No 15 */
  @ext(0x41, 0x70)
  model HcName15 is Register<hcname>;

  enum Values_StateEM {
    off: 0,
    heat: 1,
    water: 2,
    wateroverrun: 3,
  }

  enum Values_SourceType {
    noSystem: 0,
    SSR: 1,
    VRC: 2,
    eSys: 3,
    mixedSys: 4,
  }

  enum Values_SystemModeStream1 {
    off: 0,
    heat: 1,
    cool: 2,
    water: 3,
    waterduringheat: 4,
    waterduringcool: 5,
  }

  enum Values_SystemModeStream2 {
    off: 0,
    heat: 1,
    cool: 2,
    water: 3,
    waterduringheat: 4,
    waterduringcool: 5,
  }

  enum Values_SystemModeStream3 {
    off: 0,
    heat: 1,
    cool: 2,
    water: 3,
    waterduringheat: 4,
    waterduringcool: 5,
  }

  enum Values_ASCStatus {
    off: 0,
    heat: 1,
    water: 2,
  }

  enum Values_DesiredStateB1 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum Values_DesiredStateB2 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum Values_DesiredStateB3 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum Values_DesiredStateB4 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum Values_DesiredStateB5 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum Values_DesiredStateB6 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum Values_DesiredStateB7 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum Values_DesiredStateB8 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  /** included parts */
  union _includes {
    @condition(Id.Id.sw, ">=400")
    Yield4445_inc,

    Errors_inc,
  }
}
