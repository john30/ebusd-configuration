import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./yield4445_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x15)
namespace ui {
  // ,UI,CI of VRS 620/3,0020040141 162

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
  // ##### MainPage #####

  /** Aussentemperatur */
  @inherit(r)
  @ext(1, 0)
  model OutsideTemp {
    /** out door temperature */
    value: tempsensor;
  }

  /** system flow temp */
  @inherit(r)
  @ext(0x2, 0)
  model FlowTemp {
    /** system temperature at the hydraulic diverter (VF1) */
    value: tempsensor;
  }

  /** SystemTempGradient */
  @inherit(r)
  @ext(0x8c, 0)
  model SystemTempGradient {
    /** gradient of the system temperature (VF1) */
    value: temp;
  }

  /** SystemDesiredFlowTemp */
  @inherit(r)
  @ext(0x5, 0)
  model FlowTempDesired {
    /** system desired flow temperature */
    value: temp;
  }

  /** StateEM */
  @inherit(r)
  @ext(0x4b, 0)
  model StateEM {
    /** OFF=0, CH=1, DHW=2, DHW-Overrun=3 */
    @values(values_StateEM)
    value: UCH;
  }

  /** SolarHydraulicMap */
  @inherit(r)
  @ext(0x1e, 0)
  model HydraulicMap {
    /** hydraulic scheme (1..9); this parameter has to change at the IO-pcb */
    value: UCH;
  }

  /** PreShutDownTime */
  @inherit(r, w)
  @ext(0x2d, 0)
  model PreShutDownTime {
    value: minutes0;
  }

  /** FrostOverRideTime */
  @inherit(r, w)
  @ext(0x2e, 0)
  model FrostOverRideTime {
    @unit("hour")
    value: UCH;
  }

  /** TempIncrease */
  @inherit(r, w)
  @ext(0x2f, 0)
  model TempIncrease {
    value: temp;
  }

  /** ContinuousHeatingLimit */
  @inherit(r, w)
  @ext(0x64, 0)
  model ContinuousHeatingLimit {
    /** -128=off, (0x80, -128 = off) */
    value: SCH;
  }
  // ##### SystemComponets #####

  /** Mk2Detected */
  @inherit(r)
  @ext(0x18, 0)
  model MixerDetected {
    /** detected VR60 (bit counted) */
    value: UCH;
  }

  /** BkDetected */
  @inherit(r)
  @ext(0x19, 0)
  model BoilerDetected {
    /** detected bus coppler e.g. VR30,31,32 (bit counted) */
    value: UCH;
  }

  /** FbgDetected */
  @inherit(r)
  @ext(0x1a, 0)
  model RemoteDetected {
    /** detected VR80 or VR90 (bit counted) */
    value: UCH;
  }

  /** ActoStorModulDetected */
  @inherit(r)
  @ext(0x5a, 0)
  model ActoStorModulDetected {
    /** detected VLR (bit counted) */
    value: UCH;
  }

  /** AscBigModulDetected */
  @inherit(r)
  @ext(0x7f, 0)
  model AscBigModulDetected {
    /** detected VPM-S (bit counted) */
    value: UCH;
  }

  /** AscSmallModulDetected */
  @inherit(r)
  @ext(0x80, 0)
  model AscSmallModulDetected {
    /** detected VMS (bit counted) */
    value: UCH;
  }

  /** FwsModulDetected */
  @inherit(r)
  @ext(0x81, 0)
  model WaterstationModulDetected {
    /** detected VPM-W (bit counted) */
    value: UCH;
  }

  /** NumberOfBoiler */
  @inherit(r)
  @ext(0x1c, 0)
  model BoilerCount {
    /** active boiler in the system */
    value: UCH;
  }

  /** BoilerSwitchSteps */
  @inherit(r, wi)
  @ext(0x35, 0)
  model BoilerSwitchSteps {
    /** set of the steps from the switching boiler */
    value: UCH;
  }

  /** SourceType */
  @inherit(r)
  @ext(0x4e, 0)
  model SourceType {
    /** noSystem=0, SSR=1, VRC=2, eSys=3, mixedSys=4 */
    @values(values_SourceType)
    value: UCH;
  }
  // ##### controler internal #####

  /** RaumtemperaturIst */
  @inherit(r)
  @ext(0, 0)
  model RoomTemp {
    /** room temperature */
    value: tempsensor;
  }

  /** RaumtemperaturIstOffset */
  @inherit(r, wi)
  @ext(0x1f, 0)
  model RoomTempOffset {
    value: temp;
  }

  /** RaumTempOffsetEigenErwaerm */
  @inherit(r)
  @ext(0x20, 0)
  model RoomTempOffsetSelfWarming {
    value: temp;
  }

  /** OutDoorTempCorr */
  @inherit(r, wi)
  @ext(0x21, 0)
  model OutsideTempOffset {
    value: temp;
  }

  /** RoomSetTempHoliday */
  @inherit(r, w)
  @ext(0x22, 0)
  model RoomTempHoliday {
    value: temp;
  }

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
  @inherit(r, wi)
  @ext(0x2b, 0)
  model ServicePeriod {
    value: date;
  }

  /** aucPhoneNumber_part1 */
  @inherit(r, wi)
  @ext(0x42, 0)
  model PhoneNumberPart1 {
    @maxLength(9)
    value: STR;
  }

  /** aucPhoneNumber_part2 */
  @inherit(r, wi)
  @ext(0x42, 0x8)
  model PhoneNumberPart2 {
    @maxLength(9)
    value: STR;
  }

  /** KeyCodeforConfigMenue */
  @inherit(r, wi)
  @ext(0x2c, 0)
  model KeyCodeforConfigMenu {
    @maxLength(4)
    value: HEX;
  }

  /** TempFailDetectTime */
  @inherit(r, wi)
  @ext(0x33, 0)
  model TempFailDetectTime {
    value: temp0;
  }

  /** LcdContrastPwmValue */
  @inherit(r, wi)
  @ext(0x36, 0)
  model LcdContrastPwmValue {
    /** contrast for the display */
    value: UCH;
  }

  /** time */
  @inherit(r)
  @ext(0x5f, 0)
  model Time {
    value: time;
  }

  /** Day of week */
  @inherit(r)
  @ext(0x60, 0)
  model Day {
    value: bday;
  }

  /** date */
  @inherit(r)
  @ext(0x61, 0)
  model Date {
    value: date;
  }

  /** SummerWinterTimeAdjust */
  @inherit(r, w)
  @ext(0x67, 0)
  model SummerWinterTimeAdjust {
    value: onoff;
  }

  /** ClockSwitchSummerWinterDone */
  @inherit(r)
  @ext(0x68, 0)
  model ClockSwitchSummerWinterDone {
    value: onoff;
  }

  /** InstallationCompleted */
  @inherit(r)
  @ext(0x69, 0)
  model InstallationCompleted {
    /** Installation assistant is done */
    value: yesno;
  }

  /** DisplayTyp */
  @inherit(r)
  @ext(0x8d, 0)
  model DisplayType {
    /** display misubishi=0x07, mtek=0x70 */
    value: UCH;
  }

  /** ScanPrevention */
  @inherit(r)
  @ext(0x84, 0)
  model ScanPrevention {
    /** cyclic scan are started */
    value: onoff;
  }
  // ##### cascade parameter #####

  /** BoilerSwitchHyster */
  @inherit(r, wi)
  @ext(0x23, 0)
  model BoilerSwitchHyster {
    value: temp;
  }

  /** BoilerMaxTemp */
  @inherit(r, wi)
  @ext(0x24, 0)
  model BoilerTempMax {
    value: temp;
  }

  /** BoilerMinTemp */
  @inherit(r, wi)
  @ext(0x25, 0)
  model BoilerTempMin {
    value: temp;
  }

  /** StartPowerVantage */
  @inherit(r, wi)
  @ext(0x28, 0)
  model StartPowerVantage {
    /** start power for DHW loading (x boiler) */
    value: UCH;
  }

  /** SeparationShift */
  @inherit(r, wi)
  @ext(0x2a, 0)
  model SeparationShift {
    value: onoff;
  }

  /** TurnOnDelay */
  @inherit(r, wi)
  @ext(0x30, 0)
  model TurnOnDelay {
    value: UCH;
  }

  /** TurnOffDelay */
  @inherit(r, wi)
  @ext(0x31, 0)
  model TurnOffDelay {
    value: UCH;
  }

  /** BoilerSequence */
  @inherit(r, wi)
  @ext(0x32, 0)
  model BoilerSequence {
    /** activation of boiler sequence */
    value: onoff;
  }

  /** BoilerSequenceChangeTime */
  @inherit(r, wi)
  @ext(0x37, 0)
  model BoilerSequenceChangeTime {
    /** if this xx hours reachred between the first and the last boiler in the actual sequence then the boiler sequensce is new sorted */
    @unit("hour")
    value: UCH;
  }

  /** SequenceOfBoiler */
  @inherit(r)
  @ext(0x66, 0)
  model SequenceOfBoiler {
    /** row of sequence */
    @maxLength(8)
    value: HEX;
  }

  /** BurnerHours_boiler1 */
  @inherit(r)
  @ext(0x4c, 0)
  model BoilerHoursB1 {
    @unit("hour")
    value: ULG;
  }

  /** BurnerHours_boiler2 */
  @inherit(r)
  @ext(0x4c, 0x8)
  model BoilerHoursB2 {
    @unit("hour")
    value: ULG;
  }

  /** BurnerHours_boiler3 */
  @inherit(r)
  @ext(0x4c, 0x10)
  model BoilerHoursB3 {
    @unit("hour")
    value: ULG;
  }

  /** BurnerHours_boiler4 */
  @inherit(r)
  @ext(0x4c, 0x18)
  model BoilerHoursB4 {
    @unit("hour")
    value: ULG;
  }

  /** BurnerHours_boiler5 */
  @inherit(r)
  @ext(0x4c, 0x20)
  model BoilerHoursB5 {
    @unit("hour")
    value: ULG;
  }

  /** BurnerHours_boiler6 */
  @inherit(r)
  @ext(0x4c, 0x28)
  model BoilerHoursB6 {
    @unit("hour")
    value: ULG;
  }

  /** BurnerHours_boiler7 */
  @inherit(r)
  @ext(0x4c, 0x30)
  model BoilerHoursB7 {
    @unit("hour")
    value: ULG;
  }

  /** BurnerHours_boiler8 */
  @inherit(r)
  @ext(0x4c, 0x38)
  model BoilerHoursB8 {
    @unit("hour")
    value: ULG;
  }
  // ##### EM internal #####

  /** SystemModeStream1 */
  @inherit(r)
  @ext(0x6e, 0)
  model SystemModeStream1 {
    /** Off=0, Heating=1, Cooling=2, Dhw=3, DhwDuringCH=4, DhwDuringCooling=5 */
    @values(values_SystemModeStream1)
    value: UCH;
  }

  /** SystemModeStream2 */
  @inherit(r)
  @ext(0x6f, 0)
  model SystemModeStream2 {
    /** Off=0, Heating=1, Cooling=2, Dhw=3, DhwDuringCH=4, DhwDuringCooling=5 */
    @values(values_SystemModeStream2)
    value: UCH;
  }

  /** SystemModeStream3 */
  @inherit(r)
  @ext(0x70, 0)
  model SystemModeStream3 {
    /** Off=0, Heating=1, Cooling=2, Dhw=3, DhwDuringCH=4, DhwDuringCooling=5 */
    @values(values_SystemModeStream3)
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

  /** HcForceMode */
  @inherit(r)
  @ext(0x71, 0)
  model HcForceMode {
    /** ForceComsumDisable=0, ForceComsumNoHeating=1, ForceComsumMaxHeating=2 */
    value: UCH;
  }

  /** DhwRequestAsc */
  @inherit(r)
  @ext(0x72, 0)
  model HwcRequestAsc {
    value: onoff;
  }

  /** ChRequestAsc */
  @inherit(r)
  @ext(0x73, 0)
  model HcRequestAsc {
    value: onoff;
  }

  /** FlowSetpointAscDhw */
  @inherit(r)
  @ext(0x74, 0)
  model FlowTempDesiredAscHwc {
    value: temp;
  }

  /** FlowSetpointAscCh */
  @inherit(r)
  @ext(0x75, 0)
  model FlowTempDesiredAscHc {
    value: temp;
  }

  /** SolarLoadingDelay_Dhw */
  @inherit(r)
  @ext(0x76, 0)
  model SolLoadingDelayHwc {
    value: minutes0;
  }

  /** SolarLoadingDelay_Ch */
  @inherit(r)
  @ext(0x89, 0)
  model SolLoadingDelayHc {
    value: minutes0;
  }

  /** BufferFlowThreshold_On */
  @inherit(r)
  @ext(0x77, 0)
  model BufferFlowThresholdOn {
    value: temp;
  }

  /** BufferFlowThreshold_Off */
  @inherit(r)
  @ext(0x78, 0)
  model BufferFlowThresholdOff {
    value: temp;
  }

  /** OffsetFlowSetpointBufToBoiler */
  @inherit(r)
  @ext(0x79, 0)
  model OffsetFlowTempDesiredBufToBoiler {
    value: temp;
  }

  /** ASC_Status */
  @inherit(r)
  @ext(0x7a, 0)
  model ASCStatus {
    /** ASC_OFF=0, ASC_CH=1, ASC_DHW=2 */
    @values(values_ASCStatus)
    value: UCH;
  }

  /** TankSensorAbove */
  @inherit(r)
  @ext(0x7b, 0)
  model StorageSensorTop {
    value: temp;
  }

  /** TankSensorMittel */
  @inherit(r)
  @ext(0x7c, 0)
  model StorageSensorMiddle {
    value: temp;
  }

  /** TankSensorBottom */
  @inherit(r)
  @ext(0x7d, 0)
  model StorageSensorBottom {
    value: temp;
  }
  // ##### boiler output #####

  /** DesiredFlowTempBoiler_1 */
  @inherit(r)
  @ext(0x48, 0x8)
  model FlowTempDesiredB1 {
    value: temp0;
  }

  /** DesiredFlowTempBoiler_2 */
  @inherit(r)
  @ext(0x48, 0x10)
  model FlowTempDesiredB2 {
    value: temp0;
  }

  /** DesiredFlowTempBoiler_3 */
  @inherit(r)
  @ext(0x48, 0x18)
  model FlowTempDesiredB3 {
    value: temp0;
  }

  /** DesiredFlowTempBoiler_4 */
  @inherit(r)
  @ext(0x48, 0x20)
  model FlowTempDesiredB4 {
    value: temp0;
  }

  /** DesiredFlowTempBoiler_5 */
  @inherit(r)
  @ext(0x48, 0x28)
  model FlowTempDesiredB5 {
    value: temp0;
  }

  /** DesiredFlowTempBoiler_6 */
  @inherit(r)
  @ext(0x48, 0x30)
  model FlowTempDesiredB6 {
    value: temp0;
  }

  /** DesiredFlowTempBoiler_7 */
  @inherit(r)
  @ext(0x48, 0x38)
  model FlowTempDesiredB7 {
    value: temp0;
  }

  /** DesiredFlowTempBoiler_8 */
  @inherit(r)
  @ext(0x48, 0x40)
  model FlowTempDesiredB8 {
    value: temp0;
  }

  /** DesiredDegreeBoiler_1 */
  @inherit(r)
  @ext(0x49, 0x8)
  model DesiredDegreeB1 {
    /** modulation in percent */
    value: percent0;
  }

  /** DesiredDegreeBoiler_2 */
  @inherit(r)
  @ext(0x49, 0x10)
  model DesiredDegreeB2 {
    /** modulation in percent */
    value: percent0;
  }

  /** DesiredDegreeBoiler_3 */
  @inherit(r)
  @ext(0x49, 0x18)
  model DesiredDegreeB3 {
    /** modulation in percent */
    value: percent0;
  }

  /** DesiredDegreeBoiler_4 */
  @inherit(r)
  @ext(0x49, 0x20)
  model DesiredDegreeB4 {
    /** modulation in percent */
    value: percent0;
  }

  /** DesiredDegreeBoiler_5 */
  @inherit(r)
  @ext(0x49, 0x28)
  model DesiredDegreeB5 {
    /** modulation in percent */
    value: percent0;
  }

  /** DesiredDegreeBoiler_6 */
  @inherit(r)
  @ext(0x49, 0x30)
  model DesiredDegreeB6 {
    /** modulation in percent */
    value: percent0;
  }

  /** DesiredDegreeBoiler_7 */
  @inherit(r)
  @ext(0x49, 0x38)
  model DesiredDegreeB7 {
    /** modulation in percent */
    value: percent0;
  }

  /** DesiredDegreeBoiler_8 */
  @inherit(r)
  @ext(0x49, 0x40)
  model DesiredDegreeB8 {
    /** modulation in percent */
    value: percent0;
  }

  /** DesiredStateBoiler_1 */
  @inherit(r)
  @ext(0x4a, 0x8)
  model DesiredStateB1 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(values_DesiredStateB1)
    value: UCH;
  }

  /** DesiredStateBoiler_2 */
  @inherit(r)
  @ext(0x4a, 0x10)
  model DesiredStateB2 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(values_DesiredStateB2)
    value: UCH;
  }

  /** DesiredStateBoiler_3 */
  @inherit(r)
  @ext(0x4a, 0x18)
  model DesiredStateB3 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(values_DesiredStateB3)
    value: UCH;
  }

  /** DesiredStateBoiler_4 */
  @inherit(r)
  @ext(0x4a, 0x20)
  model DesiredStateB4 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(values_DesiredStateB4)
    value: UCH;
  }

  /** DesiredStateBoiler_5 */
  @inherit(r)
  @ext(0x4a, 0x28)
  model DesiredStateB5 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(values_DesiredStateB5)
    value: UCH;
  }

  /** DesiredStateBoiler_6 */
  @inherit(r)
  @ext(0x4a, 0x30)
  model DesiredStateB6 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(values_DesiredStateB6)
    value: UCH;
  }

  /** DesiredStateBoiler_7 */
  @inherit(r)
  @ext(0x4a, 0x38)
  model DesiredStateB7 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(values_DesiredStateB7)
    value: UCH;
  }

  /** DesiredStateBoiler_8 */
  @inherit(r)
  @ext(0x4a, 0x40)
  model DesiredStateB8 {
    /** service B5 10 00: 0=auto, 1=force_off, 2=force_ch, 3=forced_dhwservice 05 01: 0=off, 85(0x55)=dhw, 170(0xAA)=ch, 238(0xEE)=modulation */
    @values(values_DesiredStateB8)
    value: UCH;
  }

  /** LoadingPumpBoiler_1 */
  @inherit(r)
  @ext(0x85, 0x8)
  model LoadingPumpB1 {
    /** Off=0, On=100 */
    value: UCH;
  }

  /** LoadingPumpBoiler_2 */
  @inherit(r)
  @ext(0x85, 0x10)
  model LoadingPumpB2 {
    /** Off=0, On=100 */
    value: UCH;
  }

  /** LoadingPumpBoiler_3 */
  @inherit(r)
  @ext(0x85, 0x18)
  model LoadingPumpB3 {
    /** Off=0, On=100 */
    value: UCH;
  }

  /** LoadingPumpBoiler_4 */
  @inherit(r)
  @ext(0x85, 0x20)
  model LoadingPumpB4 {
    /** Off=0, On=100 */
    value: UCH;
  }

  /** LoadingPumpBoiler_5 */
  @inherit(r)
  @ext(0x85, 0x28)
  model LoadingPumpB5 {
    /** Off=0, On=100 */
    value: UCH;
  }

  /** LoadingPumpBoiler_6 */
  @inherit(r)
  @ext(0x85, 0x30)
  model LoadingPumpB6 {
    /** Off=0, On=100 */
    value: UCH;
  }

  /** LoadingPumpBoiler_7 */
  @inherit(r)
  @ext(0x85, 0x38)
  model LoadingPumpB7 {
    /** Off=0, On=100 */
    value: UCH;
  }

  /** LoadingPumpBoiler_8 */
  @inherit(r)
  @ext(0x85, 0x40)
  model LoadingPumpB8 {
    /** Off=0, On=100 */
    value: UCH;
  }

  /** ChPumpBoiler_1 */
  @inherit(r)
  @ext(0x86, 0x8)
  model HcPumpB1 {
    /** Off=0, On=1 */
    value: UCH;
  }

  /** ChPumpBoiler_2 */
  @inherit(r)
  @ext(0x86, 0x10)
  model HcPumpB2 {
    /** Off=0, On=1 */
    value: UCH;
  }

  /** ChPumpBoiler_3 */
  @inherit(r)
  @ext(0x86, 0x18)
  model HcPumpB3 {
    /** Off=0, On=1 */
    value: UCH;
  }

  /** ChPumpBoiler_4 */
  @inherit(r)
  @ext(0x86, 0x20)
  model HcPumpB4 {
    /** Off=0, On=1 */
    value: UCH;
  }

  /** ChPumpBoiler_5 */
  @inherit(r)
  @ext(0x86, 0x28)
  model HcPumpB5 {
    /** Off=0, On=1 */
    value: UCH;
  }

  /** ChPumpBoiler_6 */
  @inherit(r)
  @ext(0x86, 0x30)
  model HcPumpB6 {
    /** Off=0, On=1 */
    value: UCH;
  }

  /** ChPumpBoiler_7 */
  @inherit(r)
  @ext(0x86, 0x38)
  model HcPumpB7 {
    /** Off=0, On=1 */
    value: UCH;
  }

  /** ChPumpBoiler_8 */
  @inherit(r)
  @ext(0x86, 0x40)
  model HcPumpB8 {
    /** Off=0, On=1 */
    value: UCH;
  }

  /** FlagsBoiler_1 */
  @inherit(r)
  @ext(0x87, 0x8)
  model FlagsB1 {
    value: UCH;
  }

  /** FlagsBoiler_2 */
  @inherit(r)
  @ext(0x87, 0x10)
  model FlagsB2 {
    value: UCH;
  }

  /** FlagsBoiler_3 */
  @inherit(r)
  @ext(0x87, 0x18)
  model FlagsB3 {
    value: UCH;
  }

  /** FlagsBoiler_4 */
  @inherit(r)
  @ext(0x87, 0x20)
  model FlagsB4 {
    value: UCH;
  }

  /** FlagsBoiler_5 */
  @inherit(r)
  @ext(0x87, 0x28)
  model FlagsB5 {
    value: UCH;
  }

  /** FlagsBoiler_6 */
  @inherit(r)
  @ext(0x87, 0x30)
  model FlagsB6 {
    value: UCH;
  }

  /** FlagsBoiler_7 */
  @inherit(r)
  @ext(0x87, 0x38)
  model FlagsB7 {
    value: UCH;
  }

  /** FlagsBoiler_8 */
  @inherit(r)
  @ext(0x87, 0x40)
  model FlagsB8 {
    value: UCH;
  }
  // ##### heating circuit name #####

  /** aaucHcNames_1 */
  @inherit(r, w)
  @ext(0x41, 0)
  model HcName1 {
    /** name of heating circuit No 1 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_2 */
  @inherit(r, w)
  @ext(0x41, 0x8)
  model HcName2 {
    /** name of heating circuit No 2 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_3 */
  @inherit(r, w)
  @ext(0x41, 0x10)
  model HcName3 {
    /** name of heating circuit No 3 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_4 */
  @inherit(r, w)
  @ext(0x41, 0x18)
  model HcName4 {
    /** name of heating circuit No 4 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_5 */
  @inherit(r, w)
  @ext(0x41, 0x20)
  model HcName5 {
    /** name of heating circuit No 5 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_6 */
  @inherit(r, w)
  @ext(0x41, 0x28)
  model HcName6 {
    /** name of heating circuit No 6 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_7 */
  @inherit(r, w)
  @ext(0x41, 0x30)
  model HcName7 {
    /** name of heating circuit No 7 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_8 */
  @inherit(r, w)
  @ext(0x41, 0x38)
  model HcName8 {
    /** name of heating circuit No 8 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_9 */
  @inherit(r, w)
  @ext(0x41, 0x40)
  model HcName9 {
    /** name of heating circuit No 9 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_10 */
  @inherit(r, w)
  @ext(0x41, 0x48)
  model HcName10 {
    /** name of heating circuit No 10 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_11 */
  @inherit(r, w)
  @ext(0x41, 0x50)
  model HcName11 {
    /** name of heating circuit No 11 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_12 */
  @inherit(r, w)
  @ext(0x41, 0x58)
  model HcName12 {
    /** name of heating circuit No 12 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_13 */
  @inherit(r, w)
  @ext(0x41, 0x60)
  model HcName13 {
    /** name of heating circuit No 13 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_14 */
  @inherit(r, w)
  @ext(0x41, 0x68)
  model HcName14 {
    /** name of heating circuit No 14 */
    @maxLength(11)
    value: STR;
  }

  /** aaucHcNames_15 */
  @inherit(r, w)
  @ext(0x41, 0x70)
  model HcName15 {
    /** name of heating circuit No 15 */
    @maxLength(11)
    value: STR;
  }

  enum values_StateEM {
    off: 0,
    heat: 1,
    water: 2,
    wateroverrun: 3,
  }

  enum values_SourceType {
    noSystem: 0,
    SSR: 1,
    VRC: 2,
    eSys: 3,
    mixedSys: 4,
  }

  enum values_SystemModeStream1 {
    off: 0,
    heat: 1,
    cool: 2,
    water: 3,
    waterduringheat: 4,
    waterduringcool: 5,
  }

  enum values_SystemModeStream2 {
    off: 0,
    heat: 1,
    cool: 2,
    water: 3,
    waterduringheat: 4,
    waterduringcool: 5,
  }

  enum values_SystemModeStream3 {
    off: 0,
    heat: 1,
    cool: 2,
    water: 3,
    waterduringheat: 4,
    waterduringcool: 5,
  }

  enum values_ASCStatus {
    off: 0,
    heat: 1,
    water: 2,
  }

  enum values_DesiredStateB1 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum values_DesiredStateB2 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum values_DesiredStateB3 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum values_DesiredStateB4 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum values_DesiredStateB5 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum values_DesiredStateB6 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum values_DesiredStateB7 {
    off_auto: 0,
    forceoff: 1,
    forceheat: 2,
    forcewater: 3,
    water: 85,
    heat: 170,
    modulation: 238,
  }

  enum values_DesiredStateB8 {
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
    @condition(id.id.sw, ">=400")
    yield4445_inc,

    errors_inc,
  }
}
