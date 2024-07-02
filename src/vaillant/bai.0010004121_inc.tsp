import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
import "./service_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010004121_inc {
  // ,BAI00,ecoTEC/4 eGAS,0010004121 209

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

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x9, 0xe)
  model ws {}
  // ##### dia level 1 #####

  /** Statenumber_DK */
  @inherit(r)
  @ext(0xab, 0)
  model Statenumber {
    /** status number */
    value: UCH;
  }

  /** StatusList_DK */
  @inherit(r)
  @ext(0x11, 1)
  model StatusList {
    /** Statustexte ergänzen */
    @maxLength(10)
    value: HEX;
  }

  /** d.00 heating partload */
  @inherit(r, wi)
  @ext(0x7, 0x4)
  model PartloadHcKW {
    /** Heating part load */
    value: power;
  }

  /** d.01 central heating overruntime */
  @inherit(r, wi)
  @ext(0xf7, 0x3)
  model WPPostrunTime {
    /** water pump overrun time for heating mode */
    value: minutes0;
  }

  /** d.02 Max blocking time CH */
  @inherit(r, wi)
  @ext(0x9, 0x4)
  model BlockTimeHcMax {
    /** max. burner anti cycling period at 20°C Flow temperature setpoint */
    value: minutes0;
  }

  /** d.03 Temp DHW */
  @inherit(r)
  @ext(0x16, 0)
  model HwcTemp {
    /** hot water flow temperature (combination boiler only) */
    value: tempsensor;
  }

  /** d.04 Temp storage / she */
  @inherit(r)
  @ext(0x17, 0)
  model StorageTemp {
    /** current temperature for warm start sensor (combination boiler only) Current storage tank sensor (system boiler only) */
    value: tempsensor;
  }

  /** d.05 flow/return setpoint */
  @inherit(r)
  @ext(0x39, 0)
  model FlowTempDesired {
    /** Flow temperature target value or return target value when return regulation is set */
    value: temp;
  }

  /** d.07 Storage setpoint */
  @inherit(r)
  @ext(0x4, 0)
  model StorageTempDesired {
    /** Warm start temperature value (combination boiler plus only), Storage temperature target value (system boiler only) */
    value: temp;
  }

  /** d.08 Room thermostat 230 V */
  @inherit(r)
  @ext(0x2a, 0)
  model ACRoomthermostat {
    /** External controls heat demand (Clamp 3-4) */
    value: onoff;
  }

  /** d.09 ext flowsetpoint */
  @inherit(r)
  @ext(0x6e, 0x4)
  model ExtFlowTempDesiredMin {
    /** minimum out of Kl.7 and eBus flow setpoint */
    value: temp;
  }

  /** d.10 Central heating pump */
  @inherit(r)
  @ext(0x44, 0)
  model WP {
    /** internal heating pump */
    value: onoff;
  }

  /** d.11 external pump */
  @inherit(r)
  @ext(0x3f, 0)
  model ExtWP {
    /** External heating pump */
    value: onoff;
  }

  /** d.12 storage load pump */
  @inherit(r)
  @ext(0x9e, 0)
  model Storageloadpump {
    /** tank load pump demand */
    value: percent0;
  }

  /** d.13 Circulation pump */
  @inherit(r)
  @ext(0x7b, 0)
  model CirPump {
    /** Hot water circulation pump (via external module) */
    value: onoff;
  }

  /** d.15 WP_PWMPower_DK */
  @inherit(r)
  @ext(0x73, 0)
  model WPPWMPower {
    /** actual PWM-Powerrate of electronic-pump */
    value: UCH;
  }

  /** d.22 DHW demand */
  @inherit(r)
  @ext(0x58, 0)
  model HwcDemand {
    /** domestic hot water (tapping or tank contact) demand */
    value: yesno;
  }

  /** d.23 operation mode */
  @inherit(r)
  @ext(0xf2, 0x3)
  model HeatingSwitch {
    /** Wintermode active */
    value: onoff;
  }

  /** d.24 AirPressure_DK */
  @inherit(r)
  @ext(0xff, 0)
  model SourcePressure {
    /** value of airpressure-sensor */
    @unit("Pa")
    value: UIN;
  }

  /** d.25 DHW demand enabled */
  @inherit(r)
  @ext(0x47, 0x4)
  model StoragereleaseClock {
    /** hot water release (tank storage) via eBus Control */
    value: yesno;
  }

  /** d.29 PrimaryCircuitFlowRate_DK */
  @inherit(r)
  @ext(0xfb, 0)
  model PrimaryCircuitFlowrate {
    /** value of flowrate */
    @unit("l/h")
    value: UIN;
  }

  /** d.30 Gasvalve */
  @inherit(r)
  @ext(0xbb, 0)
  model Gasvalve {
    /** Gasvalve activation signal */
    @values(Values_Gasvalve)
    value: UCH;
  }

  /** d.33 Target fan speed */
  @inherit(r)
  @ext(0x24, 0)
  model TargetFanSpeed {
    /** Fan speed setpoint */
    @unit("1/min")
    value: UIN;
  }

  /** d.34 Actual fan speed */
  @inherit(r)
  @ext(0x83, 0)
  model FanSpeed {
    /** fan speed actual value */
    @unit("1/min")
    value: UIN;
  }

  /** d.35 Position TWV */
  @inherit(r)
  @ext(0x54, 0)
  model PositionValveSet {
    /** Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position */
    value: UCH;
  }

  /** d.40 TFT_DK */
  @inherit(r)
  @ext(0x18, 0)
  model FlowTemp {
    /** Flow temperature */
    value: tempsensor;
  }

  /** d.41 Temp heating return */
  @inherit(r)
  @ext(0x98, 0)
  model ReturnTemp {
    /** return temperature */
    value: tempmirrorsensor;
  }

  /** d.44 Dig. ionisation voltage */
  @inherit(r)
  @ext(0xa4, 0)
  model IonisationVoltageLevel {
    /** digital ionisation voltage> 80 no flame< 40 good flame */
    @divisor(10)
    value: SIN;
  }

  /** d.47 Temp outside */
  @inherit(r)
  @ext(0x76, 0)
  model OutdoorstempSensor {
    /** Outside temperature (uncorrected value) */
    value: tempsensor;
  }

  /** d.67 Remaining burner block time */
  @inherit(r)
  @ext(0x38, 0)
  model RemainingBoilerblocktime {
    /** Remaining burner anti cycling time */
    value: minutes0;
  }

  /** d.90 Digital control recognized */
  @inherit(r)
  @ext(0, 0x4)
  model EBusHeatcontrol {
    /** Digital regulator status */
    value: yesno;
  }

  /** d.91 Status DCF 77 */
  @inherit(r)
  @ext(0x69, 0)
  model DcfState {
    /** dcfStatus */
    value: dcfstate;
  }
  // ##### expert level #####

  /** e.04 SMGV_CorrFactorLow_Offset_DK */
  @inherit(r)
  @ext(0xf, 1)
  model SMGVCorrFactorLowOffset {
    /** CO2 offset-value low-load */
    value: percents;
  }

  /** e.05 SMGV_CorrFactorHigh_Offset_DK */
  @inherit(r)
  @ext(0x10, 1)
  model SMGVCorrFactorHighOffset {
    /** CO2 offset-value high-load */
    value: percents;
  }

  /** e.06 SD_CO_Concentration_DK */
  @inherit(r)
  @ext(0x6, 1)
  model COConcentration {
    /** calculated CO-concentration */
    @unit("ppm")
    value: UIN;
  }

  /** e.07 SD_CO_Rsens_DK */
  @inherit(r)
  @ext(0x5, 1)
  model CORsens {
    /** actual CO-sensor resistance */
    @unit("kOhm")
    value: UIN;
  }

  /** e.08 SD_CO_R0_DK */
  @inherit(r)
  @ext(0x4, 1)
  model COR0 {
    /** CO-sensor resistance at 0ppm CO */
    @unit("kOhm")
    value: UIN;
  }

  /** e.09 SD_CO_PTC_ActualTemp_DK */
  @inherit(r)
  @ext(0x9, 1)
  model COPTCActualTemp {
    /** actual heater-temperature */
    value: temp;
  }

  /** e.10 CO_PTC_MeasureTemp_DK */
  @inherit(r)
  @ext(0x7, 1)
  model COPTCMeasureTemp {
    /** heater-temperature during burner operation */
    value: temp;
  }

  /** e.11 CO_CorrFactor_Offset_DK */
  @inherit(r)
  @ext(0xe, 1)
  model COCorrFactorOffset {
    /** CO2 offset value for gas-adaptive correction-factor */
    value: percents;
  }

  /** e.12 CO_CorrFactor_DK */
  @inherit(r)
  @ext(1, 1)
  model COCorrFactor {
    /** calculated gas-adaptive correction-factor */
    value: percent0;
  }

  /** e.13 SMGV_CorrFactorLow_DK */
  @inherit(r)
  @ext(0x2, 1)
  model SMGVCorrFactorLow {
    /** calculated correction-factor low-load */
    value: percent0;
  }

  /** e.14 SMGV_CorrFactorHigh_DK */
  @inherit(r)
  @ext(0x3, 1)
  model SMGVCorrFactorHigh {
    /** calculated correction-factor high-load */
    value: percent0;
  }

  /** e.18 CO_LastError_DK */
  @inherit(r)
  @ext(0xa, 1)
  model COLastError {
    /** CO-sensor failure number */
    value: UCH;
  }

  /** e.19 FluePipeFactor_DK */
  @inherit(r)
  @ext(0xb, 1)
  model FluePipeFactor {
    /** calculated fluepipe-factor */
    value: UCH;
  }

  /** DHW impellor switch */
  @inherit(r)
  @ext(0x57, 0)
  model HwcImpellorSwitch {
    /** domestic hot water (tapping) demand */
    value: yesno;
  }

  /** SD_CO_PTC_TargetTemp_DK */
  @inherit(r)
  @ext(0x8, 1)
  model COPTCTargetTemp {
    /** target heater-temperature */
    value: temp;
  }

  /** BoilerType_2_DK */
  @inherit(r)
  @ext(0xc, 1)
  model BoilerType2 {
    value: ULG;
  }

  /** TTM_MaxTime_DK */
  @inherit(r)
  @ext(0x18, 1)
  model TMMaxTimeTemp {
    /** maximum time for calibration-routine */
    @unit("sec")
    value: UIN;
  }

  /** TTM_AverageTime_sum_DK */
  @inherit(r)
  @ext(0x19, 1)
  model TMAverageTimeSumTemp {
    /** average time for calibration-routine */
    @unit("_1S * 100")
    value: UIN;
  }

  /** CO_CorrFactor_max_DK */
  @inherit(r)
  @ext(0x1a, 1)
  model COCorrFactorMax {
    /** maximum value of calculated gas-adaptive correction-factor */
    @unit("%")
    value: UIN;
  }

  /** CO_CorrFactor_sum_DK */
  @inherit(r)
  @ext(0x1b, 1)
  model COCorrFactorSum {
    /** average value of calculated gas-adaptive correction-factor */
    @unit("% * 100")
    value: UIN;
  }

  /** SMGV_CorrFactorLow_sum_DK */
  @inherit(r)
  @ext(0x1c, 1)
  model SMGVCorrFactorLowSum {
    /** average value of calculated correction-factor low-load */
    @unit("% * 100")
    value: UIN;
  }

  /** SMGV_CorrFactorHigh_sum_DK */
  @inherit(r)
  @ext(0x1d, 1)
  model SMGVCorrFactorHighSum {
    /** average value of calculated correction-factor high-load */
    @unit("% * 100")
    value: UIN;
  }

  /** CO_PTC_ADC1_DK */
  @inherit(r)
  @ext(0x1e, 1)
  model COPTCADC1 {
    value: UIN;
  }

  /** CO_PTC_ADC2_DK */
  @inherit(r)
  @ext(0x1f, 1)
  model COPTCADC2 {
    value: UIN;
  }

  /** CO_PTC_PWM_Test_DK */
  @inherit(r)
  @ext(0x20, 1)
  model COPTCPWMTest {
    value: UIN;
  }

  /** CO_PTC_CalParms */
  @inherit(r)
  @ext(0x21, 1)
  model COPTCCalParms {
    value: UCH;
  }

  /** TTM_Done_DK */
  @inherit(r)
  @ext(0x22, 1)
  model CalibrationDone {
    /** calibration-routine after burner start finished */
    value: onoff;
  }

  /** TTM_RecalDone_DK */
  @inherit(r)
  @ext(0x23, 1)
  model CalibrationRecalDone {
    /** calibration-routine during burner operation finished */
    value: onoff;
  }

  /** TTL_Done_DK */
  @inherit(r)
  @ext(0x24, 1)
  model CalibrationLowDone {
    /** calibration-routine low-load after burner start finished */
    value: onoff;
  }

  /** TTL_RecalDone_DK */
  @inherit(r)
  @ext(0x25, 1)
  model CalibrationLowRecalDone {
    /** calibration-routine low-load during burner operation finished */
    value: onoff;
  }

  /** TTH_Done_DK */
  @inherit(r)
  @ext(0x26, 1)
  model CalibrationHighDone {
    /** calibration-routine high-load after burner start finished */
    value: onoff;
  }

  /** TTH_RecalDone_DK */
  @inherit(r)
  @ext(0x27, 1)
  model CalibrationHighRecalDone {
    /** calibration-routine high-load during burner operation finished */
    value: onoff;
  }

  /** Wind_Off_DK */
  @inherit(r)
  @ext(0x28, 1)
  model WindOff {
    /** Wind-function not active */
    value: onoff;
  }

  /** COmon_Off_DK */
  @inherit(r)
  @ext(0x29, 1)
  model COmonOff {
    /** CO-monitoring not active */
    value: onoff;
  }

  /** FlameLoss_Off_DK */
  @inherit(r)
  @ext(0x2a, 1)
  model FlameLossOff {
    /** Flame-loss-function not active */
    value: onoff;
  }

  /** SD_ForcedR0_Trigger_DK */
  @inherit(r)
  @ext(0x2b, 1)
  model ForcedR0Trigger {
    /** forced-R0-mode active */
    value: onoff;
  }

  /** StartPeak_Enable_DK */
  @inherit(r)
  @ext(0x2c, 1)
  model StartPeakEnable {
    value: onoff;
  }

  /** CO_PTC_U1_DK */
  @inherit(r)
  @ext(0x2d, 1)
  model COPTCU1 {
    value: UIN;
  }

  /** CO_PTC_U2_DK */
  @inherit(r)
  @ext(0x2e, 1)
  model COPTCU2 {
    value: UIN;
  }

  /** MinThresholdWaterpressure_DK */
  @inherit(r)
  @ext(0x12, 1)
  model ThresholdWaterpressureMin {
    @unit("bar")
    value: UIN;
  }

  /** MaxThresholdWaterpressure_DK */
  @inherit(r)
  @ext(0x13, 1)
  model ThresholdWaterpressureMax {
    @unit("bar")
    value: UIN;
  }

  /** MeasuredFluePipeFactor_DK */
  @inherit(r)
  @ext(0x34, 1)
  model MeasuredFluePipeFactor {
    value: UCH;
  }

  /** VortexFlowCheckEnabled_DK */
  @inherit(r)
  @ext(0x49, 1)
  model VortexFlowCheckEnabled {
    value: onoff;
  }

  /** VortexSensorFault_DK */
  @inherit(r)
  @ext(0x4a, 1)
  model VortexSensorFault {
    value: onoff;
  }

  /** VortexSensorFaultCounter_DK */
  @inherit(r)
  @ext(0x4b, 1)
  model VortexSensorFaultCounter {
    value: UCH;
  }

  /** VortexFlowCheckFault_DK */
  @inherit(r)
  @ext(0x4c, 1)
  model VortexFlowCheckFault {
    value: onoff;
  }

  /** VortexFlowCheckFaultCounter_DK */
  @inherit(r)
  @ext(0x4d, 1)
  model VortexFlowCheckFaultCounter {
    value: UCH;
  }

  /** SMGV_CurrentPos_DK */
  @inherit(r)
  @ext(0x7c, 1)
  model SMGVCurrentPos {
    value: SIN;
  }

  /** Pred_AirPressure_RefPressureCounter_DK */
  @inherit(r)
  @ext(0x7f, 1)
  model PredSourcePressureRefPressureCounter {
    value: UCH;
  }

  /** Pred_AirPressure_RefPressureSum_DK */
  @inherit(r)
  @ext(0x80, 1)
  model PredSourcePressureRefPressureSum {
    value: UIN;
  }

  /** SR_FLIDE_Mode_DK */
  @inherit(r, ws)
  @ext(0x81, 1)
  model SRFLIDEMode {
    value: UCH;
  }

  /** CO_Sensor_SNR */
  @inherit(r)
  @ext(0xaf, 1)
  model COSensorSNR {
    @maxLength(7)
    value: HEX;
  }

  /** water pressure */
  @inherit(r)
  @ext(0x2, 0)
  model WaterPressure {
    /** value of waterpressure-sensor */
    value: presssensor;
  }

  /** flame */
  @inherit(r)
  @ext(0x5, 0)
  model Flame {
    /** flame */
    @values(Values_Flame)
    value: UCH;
  }

  /** Changes_DSN_DK */
  @inherit(r)
  @ext(0xc, 0)
  model ChangesDSN {
    /** Numbers adjusting (storing) the DSN */
    value: UCH;
  }

  /** SD_Gasvalve_uC_DK */
  @inherit(r)
  @ext(0xd, 0)
  model GasvalveUC {
    /** Activation signal of the gasvalve (activated via micrcontroller) */
    @values(Values_GasvalveUC)
    value: UCH;
  }

  /** SD_VolatileLockout_DK */
  @inherit(r)
  @ext(0x10, 0)
  model VolatileLockout {
    /** TRUE: STB failures is volatileFALSE: STB failure is not volataile */
    @values(Values_VolatileLockout)
    value: UCH;
  }

  /** Modulationsetpoint_DK */
  @inherit(r)
  @ext(0x2e, 0)
  model ModulationTempDesired {
    /** Modulation set point */
    @unit("%")
    @divisor(10)
    value: SIN;
  }

  /** SD_Flame_Sensing_ASIC_DK */
  @inherit(r)
  @ext(0x2f, 0)
  model FlameSensingASIC {
    /** ioni/adc value from the flame control circuit */
    value: UIN;
  }

  /** HZ_UnderHundred_SwiActi_DK */
  @inherit(r)
  @ext(0x30, 0)
  model HcUnderHundredStarts {
    /** Heat switch cycles under hundred */
    value: UCH;
  }

  /** BW_UnderHundred_SwiActi_DK */
  @inherit(r)
  @ext(0x31, 0)
  model HwcUnderHundredStarts {
    /** DHW switch cycles under hundred */
    value: UCH;
  }

  /** EbusSourceOn_DK */
  @inherit(r)
  @ext(0x34, 0)
  model EbusSourceOn {
    /** Activation signal of the eBus source */
    value: onoff;
  }

  /** Fluegasvalve_DK */
  @inherit(r)
  @ext(0x3c, 0)
  model Fluegasvalve {
    /** flue gasvalve activation signal */
    value: onoff;
  }

  /** External_Faultmessage_DK */
  @inherit(r)
  @ext(0x3e, 0)
  model ExternalFaultmessage {
    /** external fault message */
    value: onoff;
  }

  /** SD_Gasvalve_ASICFeedback_DK */
  @inherit(r)
  @ext(0x47, 0)
  model GasvalveASICFeedback {
    /** feedback gasvalve (from ASIC) */
    @values(Values_GasvalveASICFeedback)
    value: UCH;
  }

  /** SD_Gasvalve_uCFeedback_DK */
  @inherit(r)
  @ext(0x48, 0)
  model GasvalveUCFeedback {
    /** feedback gasvalve (from Microcontroller) */
    @values(Values_GasvalveUCFeedback)
    value: UCH;
  }

  /** SD_Ignitor_DK */
  @inherit(r)
  @ext(0x49, 0)
  model Ignitor {
    /** igniton activated */
    @values(Values_Ignitor)
    value: UCH;
  }

  /** DHW_Types_DK */
  @inherit(r)
  @ext(0x4b, 0)
  model HwcTypes {
    /** DHW type of the appliance */
    value: UCH;
  }

  /** WarmstartDemand */
  @inherit(r)
  @ext(0x3a, 0x4)
  model WarmstartDemand {
    /** aktivation of warmstart */
    value: yesno;
  }

  /** BoilerType_DK */
  @inherit(r)
  @ext(0x5e, 0)
  model BoilerType {
    /** Boiler typ of the bmu */
    value: UCH;
  }

  /** ParamToken_DK */
  @inherit(r)
  @ext(0x60, 0)
  model ParamToken {
    /** token for parameter managment */
    value: UCH;
  }

  /** ReturnTemperature_DK */
  @inherit(r)
  @ext(0x6b, 0)
  model Expertlevel_ReturnTemp {
    /** external return sensor */
    value: tempsensor;
  }

  /** Floor heating contact */
  @inherit(r)
  @ext(0x70, 0)
  model FloorHeatingContact {
    /** Floor heating contact */
    value: onoff;
  }

  /** SD_Temperaturelimiter_DK */
  @inherit(r)
  @ext(0x77, 0)
  model Templimiter {
    /** feedback signal of the temperature limiter */
    @values(Values_Templimiter)
    value: UCH;
  }

  /** EbusVoltage_DK */
  @inherit(r)
  @ext(0x7f, 0)
  model EbusVoltage {
    /** feedback signal of the eBus source */
    value: onoff;
  }

  /** FluegasvalveOpen_DK */
  @inherit(r)
  @ext(0x89, 0)
  model FluegasvalveOpen {
    /** feedback of the flue gas valve */
    value: onoff;
  }

  /** Testbyte_DK */
  @inherit(r)
  @ext(0x99, 0)
  model Testbyte {
    /** Testbyte (relevant for the Tester) */
    value: UCH;
  }

  /** DSN_DK */
  @inherit(r)
  @ext(0x9a, 0)
  model DSN {
    /** DSN: Device Specific number */
    value: UIN;
  }

  /** TargetFan_Speed_Output_DK */
  @inherit(r)
  @ext(0x9f, 0)
  model TargetFanSpeedOutput {
    /** output fan speed */
    @unit("1/min")
    value: UIN;
  }

  /** PowerValue */
  @inherit(r)
  @ext(0xaa, 0)
  model PowerValue {
    /** Power Values of the Boiler (min Power, max Power) */
    @maxLength(6)
    value: HEX;
  }

  /** WaterpressureBranchControlOff_DK */
  @inherit(r)
  @ext(0xaf, 0)
  model WaterpressureBranchControlOff {
    /** water pressure branch controll off */
    value: onoff;
  }

  /** DSN start */
  @inherit(r)
  @ext(0x31, 0x4)
  model DSNStart {
    /** DSN Start adress */
    value: UIN;
  }

  /** ExtTankModulCon_DK */
  @inherit(r)
  @ext(0xbf, 0)
  model ExtStorageModulCon {
    /** external tank modul connected (VR65) */
    value: yesno;
  }

  /** Partnumber_Box */
  @inherit(r)
  @ext(0xc0, 0)
  model PartnumberBox {
    /** part number of the eBox */
    @maxLength(5)
    value: HEX;
  }

  /** WP_SecondStage_DK */
  @inherit(r)
  @ext(0xed, 0)
  model WPSecondStage {
    /** Second stage of the pump activated */
    @values(Values_WPSecondStage)
    value: UCH;
  }

  /** SD_STL_with_NTC */
  @inherit(r)
  @ext(0xd2, 0)
  model TemplimiterWithNTC {
    /** Safety temperature limit concept:1 = safety temp. Limit check with NTC0 = safety temp. Limit check with contact */
    @values(Values_TemplimiterWithNTC)
    value: UCH;
  }

  /** SD_VolatileLockout_IFC_GV_DK */
  @inherit(r)
  @ext(0xd3, 0)
  model VolatileLockoutIFCGV {
    /** all IFC faults are volataile */
    @values(Values_VolatileLockoutIFCGV)
    value: UCH;
  }

  /** VortexFlowSensor_DK */
  @inherit(r)
  @ext(0xd5, 0)
  model VortexFlowSensor {
    /** Predictive Maintenance data, CH water flow */
    value: UIN;
  }

  /** DisplayMode_DK */
  @inherit(r)
  @ext(0xda, 0)
  model DisplayMode {
    /** Display mode of the appliance */
    value: UCH;
  }

  /** SD_Gasvalve3_uC_DK */
  @inherit(r)
  @ext(0xdb, 0)
  model Gasvalve3UC {
    /** Gasvalve activation signal (from Microcontroller) */
    @values(Values_Gasvalve3UC)
    value: UCH;
  }

  /** InitialisationEEPROM */
  @inherit(r)
  @ext(0xdc, 0)
  model InitialisationEEPROM {
    /** Initialisation off all EEPROM values (done in the production) */
    value: yesno;
  }

  /** TimerInputCH_DK */
  @inherit(r)
  @ext(0xde, 0)
  model TimerInputHc {
    /** timer input (block heatdemand) */
    value: onoff;
  }

  /** FanMinSpeedOperation */
  @inherit(r)
  @ext(0xdf, 0)
  model FanMinSpeedOperation {
    /** Minimum Fan speed of the appliance */
    @unit("1/min")
    value: UIN;
  }

  /** FanMaxSpeedOperation */
  @inherit(r)
  @ext(0xe0, 0)
  model FanMaxSpeedOperation {
    /** Maximum Fan speed of the appliance */
    @unit("1/min")
    value: UIN;
  }

  /** ExternGasvalve_DK */
  @inherit(r)
  @ext(0xe4, 0)
  model ExternGasvalve {
    /** external gasvalve activated */
    value: onoff;
  }

  /** DCF_TimeDate_DK */
  @inherit(r)
  @ext(0xe5, 0)
  model DCFTimeDate {
    /** DCF Time / date stamp struct { uchar sec; uchar min; uchar std; uchar tag; uchar mon; uchar wtg; uchar jah; } Tdcf77_time; */
    @maxLength(8)
    value: HEX;
  }

  /** FlowSetPotmeter */
  @inherit(r)
  @ext(0xf0, 0x3)
  model FlowSetPotmeter {
    /** flow setpoint potentiometer */
    value: temp;
  }

  /** DHWSetPotmeter */
  @inherit(r)
  @ext(0xf1, 0x3)
  model HwcSetPotmeter {
    /** DHW setpoint potentiometer */
    value: temp;
  }

  /** ProductionByte */
  @inherit(r)
  @ext(0x3e, 0x4)
  model ProductionByte {
    value: UCH;
  }

  /** SerialNumber */
  @inherit(r)
  @ext(0x3f, 0x4)
  model SerialNumber {
    /** serial number of AI */
    @maxLength(8)
    value: HEX;
  }
  // ##### dia level 2 #####

  /** d.14 WP_PWMPowerDia_DK */
  @inherit(r, wi)
  @ext(0xa1, 0)
  model WPPWMPowerDia {
    /** Set-PWM-Powerrate of electronic-pump */
    value: UCH;
  }

  /** d.17 Return regulation */
  @inherit(r, wi)
  @ext(0xc, 0x4)
  model ReturnRegulation {
    /** heating flow/return regulation activation */
    value: onoff;
  }

  /** d.18 CH pump mode */
  @inherit(r, wi)
  @ext(0x49, 0x4)
  model HcPumpMode {
    /** Pump mode: 0=post run, 1=continous, 2=Winter, 3=intermittend */
    @values(Values_HcPumpMode)
    value: UCH;
  }

  /** d.20 Max value tanksetpoint */
  @inherit(r, wi)
  @ext(0x43, 0x4)
  model HwcTempMax {
    /** Adjustment of maximum tank setpoint range (maximum endposition of potmeter) */
    value: temp;
  }

  /** d.26 OptionRelais_DK */
  @inherit(r, wi)
  @ext(0xb8, 0)
  model OptionRelais {
    /** Option relais function */
    @values(Values_OptionRelais)
    value: UCH;
  }

  /** d.27 Option relais 1 */
  @inherit(r, wi)
  @ext(0x4b, 0x4)
  model AccessoriesOne {
    /** Accesory relay 1 function */
    @values(Values_AccessoriesOne)
    value: UCH;
  }

  /** d.28 Option relais 2 */
  @inherit(r, wi)
  @ext(0x4c, 0x4)
  model AccessoriesTwo {
    /** Accesory relay 2 function */
    @values(Values_AccessoriesTwo)
    value: UCH;
  }

  /** d.50 MinFanSpeedOffset */
  @inherit(r, wi)
  @ext(0x24, 0x4)
  model FanSpeedOffsetMin {
    /** Offset for minimum fan speed */
    @unit("1/min")
    value: SIN;
  }

  /** d.51 MaxFanSpeedOffset */
  @inherit(r, wi)
  @ext(0x25, 0x4)
  model FanSpeedOffsetMax {
    /** Offset for maximum fan speed */
    @unit("1/min")
    value: SIN;
  }

  /** d.60 Number STL cut off */
  @inherit(r)
  @ext(0x20, 0)
  model DeactivationsTemplimiter {
    /** Number of safety temperature limiter cut offs */
    value: UCH;
  }

  /** d.61 Number ignition device cut off */
  @inherit(r)
  @ext(0x1f, 0)
  model DeactivationsIFC {
    /** number of lock outs (unsuccessfull ignitons in the last attempt, flame failure) */
    value: UCH;
  }

  /** d.64 average ignition time */
  @inherit(r)
  @ext(0x2d, 0)
  model AverageIgnitiontime {
    /** average ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** d.65 Max ignition time */
  @inherit(r)
  @ext(0x2c, 0)
  model MaxIgnitiontime {
    /** maximum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** d.68 ignition attempts 1 */
  @inherit(r)
  @ext(0x6e, 0)
  model CounterStartattempts1 {
    /** unsuccessfull ignitions in the first attempt */
    value: temp0;
  }

  /** d.69 ignition attempts 2 */
  @inherit(r)
  @ext(0x6f, 0)
  model CounterStartattempts2 {
    /** unsuccessfull ignitions in the second attempt */
    value: temp0;
  }

  /** d.70 diverter valve position */
  @inherit(r, wi)
  @ext(0x2a, 0x4)
  model ValveMode {
    /** Set diverter valve position 0=normal mode, 1=middle position (GB), 2=permanent CH position */
    value: UCH;
  }

  /** d.71 Max value flow temp */
  @inherit(r, wi)
  @ext(0xe, 0x4)
  model FlowsetHcMax {
    /** Adjustment of maximum central heating setpoint range (maximum endposition of potmeter) */
    value: temp;
  }

  /** d.72 postrun time storage */
  @inherit(r, wi)
  @ext(0x11, 0x4)
  model HwcPostrunTime {
    /** Pump overrun time after charging a storage (charging through C1-C2, external/internal tank with tank sensor) */
    @unit("s")
    @factor(10)
    value: UCH;
  }

  /** d.75 Max load time storage */
  @inherit(r, wi)
  @ext(0x12, 0x4)
  model StorageLoadTimeMax {
    /** Maximum charging time for a storage without own control */
    value: minutes0;
  }

  /** d.77 hot water partload */
  @inherit(r, wi)
  @ext(0x8, 0x4)
  model PartloadHwcKW {
    /** storage part load (storage charging capacity limit) */
    value: power;
  }

  /** d.78 Max value flow temp storage */
  @inherit(r, wi)
  @ext(0xf, 0x4)
  model FlowsetHwcMax {
    /** storage charging temperature limit (target flow temperature in storage mode) */
    value: temp;
  }

  /** d.80 operating hours CH */
  @inherit(r)
  @ext(0x28, 0)
  model HcHours {
    /** central heating operation hours */
    value: hoursum2;
  }

  /** d.81 Operating hours DHW */
  @inherit(r)
  @ext(0x22, 0)
  model HwcHours {
    /** water heating operation hours */
    value: hoursum2;
  }

  /** d.82 Burner starts heating */
  @inherit(r)
  @ext(0x29, 0)
  model HcStarts {
    /** cycles in heating mode */
    @factor(100)
    value: UIN;
  }

  /** d.83 Burner starts DHW */
  @inherit(r)
  @ext(0x23, 0)
  model HwcStarts {
    /** Cycles in hot water operation */
    @factor(100)
    value: UIN;
  }

  /** d.84 Hours till next service */
  @inherit(r, wi)
  @ext(0x20, 0x4)
  model HoursTillService {
    /** Maintenance indicator:Number of hours until the next maintenance */
    value: hoursum2;
  }

  /** d.86 ServiceMode_DK */
  @inherit(r, wi)
  @ext(0xcb, 0)
  model ServiceMode {
    /** Counter-activation for predictive maintenance */
    value: onoff;
  }

  /** d.87 GasType_DK */
  @inherit(r, wi)
  @ext(0xfe, 0)
  model GasType {
    /** 0=natural gas, 1 = liquid gas 50mbar, 2=liquid gas 30mbar */
    value: UCH;
  }

  /** d.89 StartOffset_DK */
  @inherit(r, wi)
  @ext(0xd, 1)
  model StartOffset {
    /** value of gas-offset during ignition */
    value: percents;
  }

  /** d.93 Device specific number */
  @inherit(r, ws)
  @ext(0x30, 0x4)
  model DSNOffset {
    /** DSN aplliance variant setting */
    value: UCH;
  }

  /** d.96 Set factory settings */
  @inherit(r, wi)
  @ext(0x68, 0x4)
  model SetFactoryValues {
    /** Factory settings */
    value: yesno;
  }

  /** Faultlist_DK */
  @inherit(r)
  @ext(0x26, 0)
  model Faultlist {
    @maxLength(10)
    value: HEX;
  }
  // ##### maintenance data #####

  /** Pred_FanPWM_DevThreshold_DK */
  @inherit(r)
  @ext(0x35, 1)
  model PredFanPWMDevThreshold {
    value: UCH;
  }

  /** Pred_FanPWM_SwitchingPoint_DK */
  @inherit(r)
  @ext(0x36, 1)
  model PredFanPWMSwitchingPoint {
    value: UIN;
  }

  /** Pred_FanPWM_RefPWMcounter_DK */
  @inherit(r)
  @ext(0x37, 1)
  model PredFanPWMRefPWMcounter {
    value: UCH;
  }

  /** Pred_FanPWM_RefPWMsum_DK */
  @inherit(r)
  @ext(0x38, 1)
  model PredFanPWMRefPWMsum {
    value: UIN;
  }

  /** Pred_FanPWM_PredCounter_DK */
  @inherit(r)
  @ext(0x39, 1)
  model PredFanPWMPredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_COsensor_SwitchingPoint_DK */
  @inherit(r)
  @ext(0x3a, 1)
  model PredCOsensorSwitchingPoint {
    value: UIN;
  }

  /** Pred_COsensor_PredCounter */
  @inherit(r)
  @ext(0x3b, 1)
  model PredCOsensorPredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_Ignition_SwitchingPoint_DK */
  @inherit(r)
  @ext(0x3c, 1)
  model PredIgnitionSwitchingPoint {
    value: UIN;
  }

  /** Pred_Ignition_PredCounter_DK */
  @inherit(r)
  @ext(0x3d, 1)
  model PredIgnitionPredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_Combustion_DecrementTime_DK */
  @inherit(r)
  @ext(0x3e, 1)
  model PredCombustionDecrementTime {
    value: UCH;
  }

  /** Pred_Combustion_SwitchingPoint_DK */
  @inherit(r)
  @ext(0x3f, 1)
  model PredCombustionSwitchingPoint {
    value: UIN;
  }

  /** Pred_Combustion_PredCounter_DK */
  @inherit(r)
  @ext(0x40, 1)
  model PredCombustionPredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_AirPressure_DevThreshold_DK */
  @inherit(r)
  @ext(0x41, 1)
  model PredSourcePressureDevThreshold {
    value: UCH;
  }

  /** Pred_AirPressure_SwitchingPoint_DK */
  @inherit(r)
  @ext(0x42, 1)
  model PredSourcePressureSwitchingPoint {
    value: UIN;
  }

  /** Pred_AirPressure_PredCounter_DK */
  @inherit(r)
  @ext(0x43, 1)
  model PredSourcePressurePredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_Waterflow_DevThreshold_DK */
  @inherit(r)
  @ext(0x44, 1)
  model PredWaterflowDevThreshold {
    value: UCH;
  }

  /** Pred_Waterflow_SwitchingPoint_DK */
  @inherit(r)
  @ext(0x45, 1)
  model PredWaterflowSwitchingPoint {
    value: UIN;
  }

  /** Pred_Waterpressure_MinPressure_DK */
  @inherit(r)
  @ext(0x46, 1)
  model PredWaterpressureMinPressure {
    value: UIN;
  }

  /** Pred_Waterpressure_MaxPressure_DK */
  @inherit(r)
  @ext(0x47, 1)
  model PredWaterpressureMaxPressure {
    value: UIN;
  }

  /** Pred_Waterpressure_SwitchingPoint_DK */
  @inherit(r)
  @ext(0x48, 1)
  model PredWaterpressureSwitchingPoint {
    value: UIN;
  }

  /** Pred_StatusFlags_DK */
  @inherit(r)
  @ext(0x7d, 1)
  model PredStatusFlags {
    value: ULG;
  }

  /** Pred_ConditionFlags */
  @inherit(r)
  @ext(0x7e, 1)
  model PredConditionFlags {
    value: ULG;
  }

  /** TempGradientFailure_DK */
  @inherit(r)
  @ext(0x11, 0)
  model TempGradientFailure {
    /** Number of cut offs of the boilers cause of to high gradient (S.54) */
    value: temp0;
  }

  /** TempDiffBlock_DK */
  @inherit(r)
  @ext(0x12, 0)
  model TempDiffBlock {
    /** Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures */
    value: temp0;
  }

  /** TempDiffFailure_DK */
  @inherit(r)
  @ext(0x13, 0)
  model TempDiffFailure {
    /** Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures */
    value: temp0;
  }

  /** pump operation hours */
  @inherit(r)
  @ext(0x14, 0)
  model PumpHours {
    /** pump operation hours */
    value: hoursum2;
  }

  /** CH_PumpCommunt_DK */
  @inherit(r)
  @ext(0x15, 0)
  model HcPumpStarts {
    /** pump switchings */
    value: cntstarts2;
  }

  /** TWV_Communt_DK */
  @inherit(r)
  @ext(0x1a, 0)
  model ValveStarts {
    /** commutations of the three way valve */
    value: cntstarts2;
  }

  /** fan operation hours */
  @inherit(r)
  @ext(0x1b, 0)
  model FanHours {
    /** fan operation hours */
    value: hoursum2;
  }

  /** FanCommunt_DK */
  @inherit(r)
  @ext(0x1c, 0)
  model FanStarts {
    /** commutations of the fan */
    value: cntstarts2;
  }

  /** OverflowCounter_DK */
  @inherit(r)
  @ext(0x1e, 0)
  model OverflowCounter {
    /** Predictive Maintenance counter have got an overflow */
    value: yesno;
  }

  /** MaxTempDiffExtTFT_DK */
  @inherit(r)
  @ext(0x27, 0)
  model TempMaxDiffExtTFT {
    /** Predictive maintenance data */
    value: temp;
  }

  /** min_Ignitiontime_DK */
  @inherit(r)
  @ext(0x2b, 0)
  model MinIgnitiontime {
    /** minimum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** Temp DHW max */
  @inherit(r)
  @ext(0x35, 0)
  model Maintenancedata_HwcTempMax {
    /** maximum temperature measured by the domestic hot water outlet sensor */
    value: temp;
  }

  /** Temp storage max */
  @inherit(r)
  @ext(0x36, 0)
  model StorageTempMax {
    /** maximum temperature measured by the external tank sensor */
    value: temp;
  }

  /** TFT_max_DK */
  @inherit(r)
  @ext(0x37, 0)
  model FlowTempMax {
    /** maximum temperature measured by the flow sensor */
    value: temp;
  }

  /** Fan_PWM_Sum_DK */
  @inherit(r)
  @ext(0x3a, 0)
  model FanPWMSum {
    /** Predictive Maintenance data for the fan damage recognition */
    value: UIN;
  }

  /** Fan_PWM_Test_DK */
  @inherit(r)
  @ext(0x3b, 0)
  model FanPWMTest {
    /** Predictive Maintenance data for the fan damage recognition */
    value: UCH;
  }

  /** MaxDeltaFlowReturn_DK */
  @inherit(r)
  @ext(0x3d, 0)
  model DeltaFlowReturnMax {
    /** Predictive maintenance data */
    value: temp;
  }

  /** TankLoadPumpOperationHours_DK */
  @inherit(r)
  @ext(0x4c, 0)
  model StorageLoadPumpHours {
    /** Preditive maintenance data */
    value: hoursum2;
  }

  /** TankloadPumpCommunt_DK */
  @inherit(r)
  @ext(0x4f, 0)
  model StorageloadPumpStarts {
    /** Preditive maintenance data */
    value: cntstarts2;
  }

  /** DHW Waterflow_max_DK */
  @inherit(r)
  @ext(0x56, 0)
  model HwcWaterflowMax {
    /** domestic hot water flow sensor maximum value */
    value: uin100;
  }

  /** CounterStartAttempts3_DK */
  @inherit(r)
  @ext(0x81, 0)
  model CounterStartAttempts3 {
    /** unsuccessfull ignitions in the third attempt */
    value: temp0;
  }

  /** CounterStartAttempts4_DK */
  @inherit(r)
  @ext(0x82, 0)
  model CounterStartAttempts4 {
    /** unsuccessfull ignitions in the fourth attempt */
    value: temp0;
  }

  /** TRT_max_DK */
  @inherit(r)
  @ext(0xbe, 0)
  model ReturnTempMax {
    /** Max_Return_Temperature */
    value: temp;
  }

  /** PumpDHWFlowSum_DK */
  @inherit(r)
  @ext(0xc1, 0)
  model PumpHwcFlowSum {
    /** summed up DHW flow rate */
    value: UIN;
  }

  /** PumpDHWFlowNumber_DK */
  @inherit(r)
  @ext(0xc2, 0)
  model PumpHwcFlowNumber {
    /** number of times DHW flow rate was detected */
    value: UCH;
  }

  /** SHE_MaxFlowTemp_DK */
  @inherit(r)
  @ext(0xc3, 0)
  model SHEMaxFlowTemp {
    /** maximum flow temperature DHW */
    value: temp;
  }

  /** SHE_MaxDeltaFlowDHW_DK */
  @inherit(r)
  @ext(0xc4, 0)
  model SHEMaxDeltaHwcFlow {
    /** maximum difference between flow and DHW outlet temperature */
    value: temp;
  }

  /** PrEnergySumDHW1_DK */
  @inherit(r)
  @ext(0xc5, 0)
  model PrEnergySumHwc1 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergyCountDHW1_DK */
  @inherit(r)
  @ext(0xc6, 0)
  model PrEnergyCountHwc1 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergySumDHW2_DK */
  @inherit(r)
  @ext(0xc7, 0)
  model PrEnergySumHwc2 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergyCountDHW2_DK */
  @inherit(r)
  @ext(0xc8, 0)
  model PrEnergyCountHwc2 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergySumDHW3_DK */
  @inherit(r)
  @ext(0xc9, 0)
  model PrEnergySumHwc3 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergyCountDHW3_DK */
  @inherit(r)
  @ext(0xca, 0)
  model PrEnergyCountHwc3 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** MaxWaterFlowCH_DK */
  @inherit(r)
  @ext(0xd0, 0)
  model WaterHcFlowMax {
    /** Predictive maintenance data */
    value: UIN;
  }

  /** WaterpressureVariantSum_DK */
  @inherit(r)
  @ext(0xf0, 0)
  model WaterpressureVariantSum {
    /** Predictive maintenance data */
    value: pressm2;
  }

  /** WaterpressureMeasureCounter_DK */
  @inherit(r)
  @ext(0xf1, 0)
  model WaterpressureMeasureCounter {
    /** Predictive maintenance data */
    value: UCH;
  }

  /** PrAPSCounter_DK */
  @inherit(r)
  @ext(0xf2, 0)
  model PrAPSCounter {
    /** Predictive maintenance data */
    value: UCH;
  }

  /** PrAPSSum_DK */
  @inherit(r)
  @ext(0xf3, 0)
  model PrAPSSum {
    /** Predictive maintenance data */
    value: seconds2;
  }

  /** PrVortexFlowSensorValue_DK */
  @inherit(r)
  @ext(0xf4, 0)
  model PrVortexFlowSensorValue {
    /** Predictive maintenance data */
    @unit("ADC")
    value: SIN;
  }

  /** PrEnergySumCH1_DK */
  @inherit(r)
  @ext(0xf5, 0)
  model PrEnergySumHc1 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH1_DK */
  @inherit(r)
  @ext(0xf6, 0)
  model PrEnergyCountHc1 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergySumCH2_DK */
  @inherit(r)
  @ext(0xf7, 0)
  model PrEnergySumHc2 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH2_DK */
  @inherit(r)
  @ext(0xf8, 0)
  model PrEnergyCountHc2 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergySumCH3_DK */
  @inherit(r)
  @ext(0xf9, 0)
  model PrEnergySumHc3 {
    /** Predictive maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH3_DK */
  @inherit(r)
  @ext(0xfa, 0)
  model PrEnergyCountHc3 {
    /** Predictive maintenance data */
    value: ULG;
  }

  enum Values_Gasvalve {
    off: 240,
    on: 15,
  }

  enum Values_Flame {
    off: 240,
    on: 15,
  }

  enum Values_GasvalveUC {
    off: 240,
    on: 15,
  }

  enum Values_VolatileLockout {
    no: 240,
    yes: 15,
  }

  enum Values_GasvalveASICFeedback {
    off: 240,
    on: 15,
  }

  enum Values_GasvalveUCFeedback {
    off: 240,
    on: 15,
  }

  enum Values_Ignitor {
    off: 240,
    on: 15,
  }

  enum Values_Templimiter {
    off: 240,
    on: 15,
  }

  enum Values_WPSecondStage {
    off: 240,
    on: 15,
  }

  enum Values_TemplimiterWithNTC {
    no: 240,
    yes: 15,
  }

  enum Values_VolatileLockoutIFCGV {
    no: 240,
    yes: 15,
  }

  enum Values_Gasvalve3UC {
    off: 240,
    on: 15,
  }

  enum Values_HcPumpMode {
    post_run: 0,
    permanent: 1,
    winter: 2,
  }

  enum Values_OptionRelais {
    circulationpump: 1,
    extheatingpump: 2,
    storagechargingpump: 3,
    fluegasflapextractorhood: 4,
    externalgasvalve: 5,
    externalerrormessage: 6,
    solarpump: 7,
    remotecontrol: 8,
  }

  enum Values_AccessoriesOne {
    circulationpump: 1,
    extheatingpump: 2,
    storagechargingpump: 3,
    fluegasflapextractorhood: 4,
    externalgasvalve: 5,
    externalerrormessage: 6,
    solarpump: 7,
    remotecontrol: 8,
  }

  enum Values_AccessoriesTwo {
    circulationpump: 1,
    extheatingpump: 2,
    storagechargingpump: 3,
    fluegasflapextractorhood: 4,
    externalgasvalve: 5,
    externalerrormessage: 6,
    solarpump: 7,
    remotecontrol: 8,
  }

  /** included parts */
  union _includes {
    Errors_inc,
    Service_inc,
  }
}
