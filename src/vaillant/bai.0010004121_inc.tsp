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
  // ##### dia level 1 #####

  /** Statenumber_DK: status number */
  @ext(0xab, 0)
  model Statenumber is ReadonlyRegister<UCH>;

  /** StatusList_DK */
  @inherit(r)
  @ext(0x11, 1)
  model StatusList {
    /** Statustexte ergänzen */
    @maxLength(10)
    value: HEX;
  }

  /** d.00 heating partload: Heating part load */
  @ext(0x7, 0x4)
  model PartloadHcKW is InstallRegister<power>;

  /** d.01 central heating overruntime: water pump overrun time for heating mode */
  @ext(0xf7, 0x3)
  model WPPostrunTime is InstallRegister<minutes0>;

  /** d.02 Max blocking time CH: max. burner anti cycling period at 20°C Flow temperature setpoint */
  @ext(0x9, 0x4)
  model BlockTimeHcMax is InstallRegister<minutes0>;

  /** d.03 Temp DHW: hot water flow temperature (combination boiler only) */
  @ext(0x16, 0)
  model HwcTemp is ReadonlyRegister<tempsensor>;

  /** d.04 Temp storage / she: current temperature for warm start sensor (combination boiler only) Current storage tank sensor (system boiler only) */
  @ext(0x17, 0)
  model StorageTemp is ReadonlyRegister<tempsensor>;

  /** d.05 flow/return setpoint: Flow temperature target value or return target value when return regulation is set */
  @ext(0x39, 0)
  model FlowTempDesired is ReadonlyRegister<temp>;

  /** d.07 Storage setpoint: Warm start temperature value (combination boiler plus only), Storage temperature target value (system boiler only) */
  @ext(0x4, 0)
  model StorageTempDesired is ReadonlyRegister<temp>;

  /** d.08 Room thermostat 230 V: External controls heat demand (Clamp 3-4) */
  @ext(0x2a, 0)
  model ACRoomthermostat is ReadonlyRegister<onoff>;

  /** d.09 ext flowsetpoint: minimum out of Kl.7 and eBus flow setpoint */
  @ext(0x6e, 0x4)
  model ExtFlowTempDesiredMin is ReadonlyRegister<temp>;

  /** d.10 Central heating pump: internal heating pump */
  @ext(0x44, 0)
  model WP is ReadonlyRegister<onoff>;

  /** d.11 external pump: External heating pump */
  @ext(0x3f, 0)
  model ExtWP is ReadonlyRegister<onoff>;

  /** d.12 storage load pump: tank load pump demand */
  @ext(0x9e, 0)
  model Storageloadpump is ReadonlyRegister<percent0>;

  /** d.13 Circulation pump: Hot water circulation pump (via external module) */
  @ext(0x7b, 0)
  model CirPump is ReadonlyRegister<onoff>;

  /** d.15 WP_PWMPower_DK: actual PWM-Powerrate of electronic-pump */
  @ext(0x73, 0)
  model WPPWMPower is ReadonlyRegister<UCH>;

  /** d.22 DHW demand: domestic hot water (tapping or tank contact) demand */
  @ext(0x58, 0)
  model HwcDemand is ReadonlyRegister<yesno>;

  /** d.23 operation mode: Wintermode active */
  @ext(0xf2, 0x3)
  model HeatingSwitch is ReadonlyRegister<onoff>;

  /** d.24 AirPressure_DK */
  @inherit(r)
  @ext(0xff, 0)
  model SourcePressure {
    /** value of airpressure-sensor */
    @unit("Pa")
    value: UIN;
  }

  /** d.25 DHW demand enabled: hot water release (tank storage) via eBus Control */
  @ext(0x47, 0x4)
  model StoragereleaseClock is ReadonlyRegister<yesno>;

  /** d.29 PrimaryCircuitFlowrate_DK */
  @inherit(r)
  @ext(0xfb, 0)
  model PrimaryCircuitFlowrate {
    /** value of flowrate */
    @unit("l/h")
    value: UIN;
  }

  /** d.30 Gasvalve: Gasvalve activation signal */
  @ext(0xbb, 0)
  model Gasvalve is ReadonlyRegister<onoff2>;

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

  /** d.35 Position TWV: Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position */
  @ext(0x54, 0)
  model PositionValveSet is ReadonlyRegister<UCH>;

  /** d.40 TFT_DK: flow temperature */
  @ext(0x18, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** d.41 Temp heating return: return temperature */
  @ext(0x98, 0)
  model ReturnTemp is ReadonlyRegister<tempmirrorsensor>;

  /** d.44 Dig. ionisation voltage */
  @inherit(r)
  @ext(0xa4, 0)
  model IonisationVoltageLevel {
    /** digital ionisation voltage> 80 no flame< 40 good flame */
    @divisor(10)
    value: SIN;
  }

  /** d.47 Temp outside: Outside temperature (uncorrected value) */
  @ext(0x76, 0)
  model OutdoorstempSensor is ReadonlyRegister<tempsensor>;

  /** d.67 Remaining burner block time: Remaining burner anti cycling time */
  @ext(0x38, 0)
  model RemainingBoilerblocktime is ReadonlyRegister<minutes0>;

  /** d.90 Digital control recognized: Digital regulator status */
  @ext(0, 0x4)
  model EBusHeatcontrol is ReadonlyRegister<yesno>;

  /** d.91 Status DCF 77: DCF status */
  @ext(0x69, 0)
  model DcfState is ReadonlyRegister<dcfstate>;
  // ##### expert level #####

  /** e.04 SMGV_CorrFactorLow_Offset_DK: CO2 offset-value low-load */
  @ext(0xf, 1)
  model SMGVCorrFactorLowOffset is ReadonlyRegister<percents>;

  /** e.05 SMGV_CorrFactorHigh_Offset_DK: CO2 offset-value high-load */
  @ext(0x10, 1)
  model SMGVCorrFactorHighOffset is ReadonlyRegister<percents>;

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

  /** e.09 SD_CO_PTC_ActualTemp_DK: actual heater-temperature */
  @ext(0x9, 1)
  model COPTCActualTemp is ReadonlyRegister<temp>;

  /** e.10 CO_PTC_MeasureTemp_DK: heater-temperature during burner operation */
  @ext(0x7, 1)
  model COPTCMeasureTemp is ReadonlyRegister<temp>;

  /** e.11 CO_CorrFactor_Offset_DK: CO2 offset value for gas-adaptive correction-factor */
  @ext(0xe, 1)
  model COCorrFactorOffset is ReadonlyRegister<percents>;

  /** e.12 CO_CorrFactor_DK: calculated gas-adaptive correction-factor */
  @ext(1, 1)
  model COCorrFactor is ReadonlyRegister<percent0>;

  /** e.13 SMGV_CorrFactorLow_DK: calculated correction-factor low-load */
  @ext(0x2, 1)
  model SMGVCorrFactorLow is ReadonlyRegister<percent0>;

  /** e.14 SMGV_CorrFactorHigh_DK: calculated correction-factor high-load */
  @ext(0x3, 1)
  model SMGVCorrFactorHigh is ReadonlyRegister<percent0>;

  /** e.18 CO_LastError_DK: CO-sensor failure number */
  @ext(0xa, 1)
  model COLastError is ReadonlyRegister<UCH>;

  /** e.19 FluePipeFactor_DK: calculated fluepipe-factor */
  @ext(0xb, 1)
  model FluePipeFactor is ReadonlyRegister<UCH>;

  /** DHW impellor switch: domestic hot water (tapping) demand */
  @ext(0x57, 0)
  model HwcImpellorSwitch is ReadonlyRegister<yesno>;

  /** SD_CO_PTC_TargetTemp_DK: target heater-temperature */
  @ext(0x8, 1)
  model COPTCTargetTemp is ReadonlyRegister<temp>;

  /** BoilerType_2_DK */
  @ext(0xc, 1)
  model BoilerType2 is ReadonlyRegister<ULG>;

  /** TTM_MaxTime_DK: maximum time for calibration-routine */
  @ext(0x18, 1)
  model TMMaxTimeTemp is ReadonlyRegister<seconds2>;

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
  @ext(0x1e, 1)
  model COPTCADC1 is ReadonlyRegister<UIN>;

  /** CO_PTC_ADC2_DK */
  @ext(0x1f, 1)
  model COPTCADC2 is ReadonlyRegister<UIN>;

  /** CO_PTC_PWM_Test_DK */
  @ext(0x20, 1)
  model COPTCPWMTest is ReadonlyRegister<UIN>;

  /** CO_PTC_CalParms */
  @ext(0x21, 1)
  model COPTCCalParms is ReadonlyRegister<UCH>;

  /** TTM_Done_DK: calibration-routine after burner start finished */
  @ext(0x22, 1)
  model CalibrationDone is ReadonlyRegister<onoff>;

  /** TTM_RecalDone_DK: calibration-routine during burner operation finished */
  @ext(0x23, 1)
  model CalibrationRecalDone is ReadonlyRegister<onoff>;

  /** TTL_Done_DK: calibration-routine low-load after burner start finished */
  @ext(0x24, 1)
  model CalibrationLowDone is ReadonlyRegister<onoff>;

  /** TTL_RecalDone_DK: calibration-routine low-load during burner operation finished */
  @ext(0x25, 1)
  model CalibrationLowRecalDone is ReadonlyRegister<onoff>;

  /** TTH_Done_DK: calibration-routine high-load after burner start finished */
  @ext(0x26, 1)
  model CalibrationHighDone is ReadonlyRegister<onoff>;

  /** TTH_RecalDone_DK: calibration-routine high-load during burner operation finished */
  @ext(0x27, 1)
  model CalibrationHighRecalDone is ReadonlyRegister<onoff>;

  /** Wind_Off_DK: Wind-function not active */
  @ext(0x28, 1)
  model WindOff is ReadonlyRegister<onoff>;

  /** COmon_Off_DK: CO-monitoring not active */
  @ext(0x29, 1)
  model COmonOff is ReadonlyRegister<onoff>;

  /** FlameLoss_Off_DK: Flame-loss-function not active */
  @ext(0x2a, 1)
  model FlameLossOff is ReadonlyRegister<onoff>;

  /** SD_ForcedR0_Trigger_DK: forced-R0-mode active */
  @ext(0x2b, 1)
  model ForcedR0Trigger is ReadonlyRegister<onoff>;

  /** StartPeak_Enable_DK */
  @ext(0x2c, 1)
  model StartPeakEnable is ReadonlyRegister<onoff>;

  /** CO_PTC_U1_DK */
  @ext(0x2d, 1)
  model COPTCU1 is ReadonlyRegister<UIN>;

  /** CO_PTC_U2_DK */
  @ext(0x2e, 1)
  model COPTCU2 is ReadonlyRegister<UIN>;

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
  @ext(0x34, 1)
  model MeasuredFluePipeFactor is ReadonlyRegister<UCH>;

  /** VortexFlowCheckEnabled_DK */
  @ext(0x49, 1)
  model VortexFlowCheckEnabled is ReadonlyRegister<onoff>;

  /** VortexSensorFault_DK */
  @ext(0x4a, 1)
  model VortexSensorFault is ReadonlyRegister<onoff>;

  /** VortexSensorFaultCounter_DK */
  @ext(0x4b, 1)
  model VortexSensorFaultCounter is ReadonlyRegister<UCH>;

  /** VortexFlowCheckFault_DK */
  @ext(0x4c, 1)
  model VortexFlowCheckFault is ReadonlyRegister<onoff>;

  /** VortexFlowCheckFaultCounter_DK */
  @ext(0x4d, 1)
  model VortexFlowCheckFaultCounter is ReadonlyRegister<UCH>;

  /** SMGV_CurrentPos_DK */
  @ext(0x7c, 1)
  model SMGVCurrentPos is ReadonlyRegister<SIN>;

  /** Pred_AirPressure_RefPressureCounter_DK */
  @ext(0x7f, 1)
  model PredSourcePressureRefPressureCounter is ReadonlyRegister<UCH>;

  /** Pred_AirPressure_RefPressureSum_DK */
  @ext(0x80, 1)
  model PredSourcePressureRefPressureSum is ReadonlyRegister<UIN>;

  /** SR_FLIDE_Mode_DK */
  @ext(0x81, 1)
  model SRFLIDEMode is ServiceRegister<UCH>;

  /** CO_Sensor_SNR */
  @inherit(r)
  @ext(0xaf, 1)
  model COSensorSNR {
    @maxLength(7)
    value: HEX;
  }

  /** value of waterpressure-sensor */
  @ext(0x2, 0)
  model WaterPressure is ReadonlyRegister<presssensor>;

  /** Flame */
  @ext(0x5, 0)
  model Flame is ReadonlyRegister<onoff2>;

  /** Changes_DSN_DK: Numbers adjusting (storing) the DSN */
  @ext(0xc, 0)
  model ChangesDSN is ReadonlyRegister<UCH>;

  /** SD_Gasvalve_uC_DK: Activation signal of the gasvalve (activated via micrcontroller) */
  @ext(0xd, 0)
  model GasvalveUC is ReadonlyRegister<onoff2>;

  /** SD_VolatileLockout_DK: TRUE: STB failures is volatileFALSE: STB failure is not volataile */
  @ext(0x10, 0)
  model VolatileLockout is ReadonlyRegister<yesno2>;

  /** Modulationsetpoint_DK */
  @inherit(r)
  @ext(0x2e, 0)
  model ModulationTempDesired {
    /** Modulation set point */
    @unit("%")
    @divisor(10)
    value: SIN;
  }

  /** SD_Flame_Sensing_ASIC_DK: ioni/adc value from the flame control circuit */
  @ext(0x2f, 0)
  model FlameSensingASIC is ReadonlyRegister<UIN>;

  /** HZ_UnderHundred_SwiActi_DK: Heat switch cycles under hundred */
  @ext(0x30, 0)
  model HcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** BW_UnderHundred_SwiActi_DK: DHW switch cycles under hundred */
  @ext(0x31, 0)
  model HwcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** EbusSourceOn_DK: Activation signal of the eBus source */
  @ext(0x34, 0)
  model EbusSourceOn is ReadonlyRegister<onoff>;

  /** Fluegasvalve_DK: flue gasvalve activation signal */
  @ext(0x3c, 0)
  model Fluegasvalve is ReadonlyRegister<onoff>;

  /** External_Faultmessage_DK: external fault message */
  @ext(0x3e, 0)
  model ExternalFaultmessage is ReadonlyRegister<onoff>;

  /** SD_Gasvalve_ASICFeedback_DK: feedback gasvalve (from ASIC) */
  @ext(0x47, 0)
  model GasvalveASICFeedback is ReadonlyRegister<onoff2>;

  /** SD_Gasvalve_uCFeedback_DK: feedback gasvalve (from Microcontroller) */
  @ext(0x48, 0)
  model GasvalveUCFeedback is ReadonlyRegister<onoff2>;

  /** SD_Ignitor_DK: igniton activated */
  @ext(0x49, 0)
  model Ignitor is ReadonlyRegister<onoff2>;

  /** DHW_Types_DK: DHW type of the appliance */
  @ext(0x4b, 0)
  model HwcTypes is ReadonlyRegister<UCH>;

  /** WarmstartDemand: aktivation of warmstart */
  @ext(0x3a, 0x4)
  model WarmstartDemand is ReadonlyRegister<yesno>;

  /** BoilerType_DK: Boiler typ of the bmu */
  @ext(0x5e, 0)
  model BoilerType is ReadonlyRegister<UCH>;

  /** ParamToken_DK: token for parameter managment */
  @ext(0x60, 0)
  model ParamToken is ReadonlyRegister<UCH>;

  /** ReturnTemperature_DK: external return sensor */
  @ext(0x6b, 0)
  model Expertlevel_ReturnTemp is ReadonlyRegister<tempsensor>;

  /** Floor heating contact */
  @ext(0x70, 0)
  model FloorHeatingContact is ReadonlyRegister<onoff>;

  /** SD_Temperaturelimiter_DK: feedback signal of the temperature limiter */
  @ext(0x77, 0)
  model Templimiter is ReadonlyRegister<onoff2>;

  /** EbusVoltage_DK: feedback signal of the eBus source */
  @ext(0x7f, 0)
  model EbusVoltage is ReadonlyRegister<onoff>;

  /** FluegasvalveOpen_DK: feedback of the flue gas valve */
  @ext(0x89, 0)
  model FluegasvalveOpen is ReadonlyRegister<onoff>;

  /** Testbyte_DK: Testbyte (relevant for the Tester) */
  @ext(0x99, 0)
  model Testbyte is ReadonlyRegister<UCH>;

  /** DSN_DK: DSN: Device Specific number */
  @ext(0x9a, 0)
  model DSN is ReadonlyRegister<UIN>;

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

  /** WaterpressureBranchControlOff_DK: water pressure branch controll off */
  @ext(0xaf, 0)
  model WaterpressureBranchControlOff is ReadonlyRegister<onoff>;

  /** DSN Start adress */
  @ext(0x31, 0x4)
  model DSNStart is ReadonlyRegister<UIN>;

  /** ExtTankModulCon_DK: external tank modul connected (VR65) */
  @ext(0xbf, 0)
  model ExtStorageModulCon is ReadonlyRegister<yesno>;

  /** Partnumber_Box */
  @inherit(r)
  @ext(0xc0, 0)
  model PartnumberBox {
    /** part number of the eBox */
    @maxLength(5)
    value: HEX;
  }

  /** WP_SecondStage_DK: Second stage of the pump activated */
  @ext(0xed, 0)
  model WPSecondStage is ReadonlyRegister<onoff2>;

  /** SD_STL_with_NTC: Safety temperature limit concept:1 = safety temp. Limit check with NTC0 = safety temp. Limit check with contact */
  @ext(0xd2, 0)
  model TemplimiterWithNTC is ReadonlyRegister<yesno2>;

  /** SD_VolatileLockout_IFC_GV_DK: all IFC faults are volataile */
  @ext(0xd3, 0)
  model VolatileLockoutIFCGV is ReadonlyRegister<yesno2>;

  /** VortexFlowSensor_DK: Predictive Maintenance data, CH water flow */
  @ext(0xd5, 0)
  model VortexFlowSensor is ReadonlyRegister<UIN>;

  /** DisplayMode_DK: Display mode of the appliance */
  @ext(0xda, 0)
  model DisplayMode is ReadonlyRegister<UCH>;

  /** SD_Gasvalve3_uC_DK: Gasvalve activation signal (from Microcontroller) */
  @ext(0xdb, 0)
  model Gasvalve3UC is ReadonlyRegister<onoff2>;

  /** InitialisationEEPROM: Initialisation off all EEPROM values (done in the production) */
  @ext(0xdc, 0)
  model InitialisationEEPROM is ReadonlyRegister<yesno>;

  /** TimerInputCH_DK: timer input (block heatdemand) */
  @ext(0xde, 0)
  model TimerInputHc is ReadonlyRegister<onoff>;

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

  /** ExternGasvalve_DK: external gasvalve activated */
  @ext(0xe4, 0)
  model ExternGasvalve is ReadonlyRegister<onoff>;

  /** DCF_TimeDate_DK */
  @inherit(r)
  @ext(0xe5, 0)
  model DCFTimeDate {
    btime: btime;
    bdate: bdate;
  }

  /** FlowSetPotmeter: flow setpoint potentiometer */
  @ext(0xf0, 0x3)
  model FlowSetPotmeter is ReadonlyRegister<temp>;

  /** DHWSetPotmeter: DHW setpoint potentiometer */
  @ext(0xf1, 0x3)
  model HwcSetPotmeter is ReadonlyRegister<temp>;

  /** ProductionByte */
  @ext(0x3e, 0x4)
  model ProductionByte is ReadonlyRegister<UCH>;

  /** SerialNumber */
  @inherit(r)
  @ext(0x3f, 0x4)
  model SerialNumber {
    /** serial number of AI */
    @maxLength(8)
    value: HEX;
  }
  // ##### dia level 2 #####

  /** d.14 Desired heating pump power */
  @inherit(r, wi)
  @ext(0xa1, 0)
  model PumpPowerDesired {
    /** PWM-Desired central heating pump power */
    @unit("%")
    @values(Values_PumpPowerDesired)
    value: UCH;
  }

  /** d.17 Return regulation: heating flow/return regulation activation */
  @ext(0xc, 0x4)
  model ReturnRegulation is InstallRegister<onoff>;

  /** d.18 CH pump mode */
  @inherit(r, wi)
  @ext(0x49, 0x4)
  model HcPumpMode {
    /** Pump mode */
    @values(Values_HcPumpMode)
    value: UCH;
  }

  /** d.20 Max value tanksetpoint: Adjustment of maximum tank setpoint range (maximum endposition of potmeter) */
  @ext(0x43, 0x4)
  model HwcTempMax is InstallRegister<temp>;

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

  /** d.60 Number STL cut off: Number of safety temperature limiter cut offs */
  @ext(0x20, 0)
  model DeactivationsTemplimiter is ReadonlyRegister<UCH>;

  /** d.61 Number ignition device cut off: number of lock outs (unsuccessfull ignitons in the last attempt, flame failure) */
  @ext(0x1f, 0)
  model DeactivationsIFC is ReadonlyRegister<UCH>;

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

  /** d.68 ignition attempts 1: unsuccessfull ignitions in the first attempt */
  @ext(0x6e, 0)
  model CounterStartattempts1 is ReadonlyRegister<temp0>;

  /** d.69 ignition attempts 2: unsuccessfull ignitions in the second attempt */
  @ext(0x6f, 0)
  model CounterStartattempts2 is ReadonlyRegister<temp0>;

  /** d.70 diverter valve position: Set diverter valve position 0=normal mode, 1=middle position (GB), 2=permanent CH position */
  @ext(0x2a, 0x4)
  model ValveMode is InstallRegister<UCH>;

  /** d.71 Max value flow temp: Adjustment of maximum central heating setpoint range (maximum endposition of potmeter) */
  @ext(0xe, 0x4)
  model FlowsetHcMax is InstallRegister<temp>;

  /** d.72 postrun time storage */
  @inherit(r, wi)
  @ext(0x11, 0x4)
  model HwcPostrunTime {
    /** Pump overrun time after charging a storage (charging through C1-C2, external/internal tank with tank sensor) */
    @unit("s")
    @factor(10)
    value: UCH;
  }

  /** d.75 Max load time storage: Maximum charging time for a storage without own control */
  @ext(0x12, 0x4)
  model StorageLoadTimeMax is InstallRegister<minutes0>;

  /** d.77 hot water partload: storage part load (storage charging capacity limit) */
  @ext(0x8, 0x4)
  model PartloadHwcKW is InstallRegister<power>;

  /** d.78 Max value flow temp storage: storage charging temperature limit (target flow temperature in storage mode) */
  @ext(0xf, 0x4)
  model FlowsetHwcMax is InstallRegister<temp>;

  /** d.80 operating hours CH: central heating operation hours */
  @ext(0x28, 0)
  model HcHours is ReadonlyRegister<hoursum2>;

  /** d.81 Operating hours DHW: water heating operation hours */
  @ext(0x22, 0)
  model HwcHours is ReadonlyRegister<hoursum2>;

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

  /** d.84 Hours till next service: Maintenance indicator:Number of hours until the next maintenance */
  @ext(0x20, 0x4)
  model HoursTillService is InstallRegister<hoursum2>;

  /** d.86 ServiceMode_DK: Counter-activation for predictive maintenance */
  @ext(0xcb, 0)
  model ServiceMode is InstallRegister<onoff>;

  /** d.87 GasType_DK: 0=natural gas, 1 = liquid gas 50mbar, 2=liquid gas 30mbar */
  @ext(0xfe, 0)
  model GasType is InstallRegister<UCH>;

  /** d.89 StartOffset_DK: value of gas-offset during ignition */
  @ext(0xd, 1)
  model StartOffset is InstallRegister<percents>;

  /** d.93 Device specific number: DSN aplliance variant setting */
  @ext(0x30, 0x4)
  model DSNOffset is ServiceRegister<UCH>;

  /** d.96 Set factory settings */
  @ext(0x68, 0x4)
  model SetFactoryValues is InstallRegister<yesno>;

  /** Faultlist_DK */
  @inherit(r)
  @ext(0x26, 0)
  model Faultlist {
    @maxLength(10)
    value: HEX;
  }
  // ##### maintenance data #####

  /** Pred_FanPWM_DevThreshold_DK */
  @ext(0x35, 1)
  model PredFanPWMDevThreshold is ReadonlyRegister<UCH>;

  /** Pred_FanPWM_SwitchingPoint_DK */
  @ext(0x36, 1)
  model PredFanPWMSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_FanPWM_RefPWMcounter_DK */
  @ext(0x37, 1)
  model PredFanPWMRefPWMcounter is ReadonlyRegister<UCH>;

  /** Pred_FanPWM_RefPWMsum_DK */
  @ext(0x38, 1)
  model PredFanPWMRefPWMsum is ReadonlyRegister<UIN>;

  /** Pred_FanPWM_PredCounter_DK */
  @inherit(r)
  @ext(0x39, 1)
  model PredFanPWMPredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_COsensor_SwitchingPoint_DK */
  @ext(0x3a, 1)
  model PredCOsensorSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_COsensor_PredCounter */
  @inherit(r)
  @ext(0x3b, 1)
  model PredCOsensorPredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_Ignition_SwitchingPoint_DK */
  @ext(0x3c, 1)
  model PredIgnitionSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_Ignition_PredCounter_DK */
  @inherit(r)
  @ext(0x3d, 1)
  model PredIgnitionPredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_Combustion_DecrementTime_DK */
  @ext(0x3e, 1)
  model PredCombustionDecrementTime is ReadonlyRegister<UCH>;

  /** Pred_Combustion_SwitchingPoint_DK */
  @ext(0x3f, 1)
  model PredCombustionSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_Combustion_PredCounter_DK */
  @inherit(r)
  @ext(0x40, 1)
  model PredCombustionPredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_AirPressure_DevThreshold_DK */
  @ext(0x41, 1)
  model PredSourcePressureDevThreshold is ReadonlyRegister<UCH>;

  /** Pred_AirPressure_SwitchingPoint_DK */
  @ext(0x42, 1)
  model PredSourcePressureSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_AirPressure_PredCounter_DK */
  @inherit(r)
  @ext(0x43, 1)
  model PredSourcePressurePredCounter {
    uin: UIN;
    uin_1: UIN;
    uin_2: UIN;
  }

  /** Pred_Waterflow_DevThreshold_DK */
  @ext(0x44, 1)
  model PredWaterflowDevThreshold is ReadonlyRegister<UCH>;

  /** Pred_Waterflow_SwitchingPoint_DK */
  @ext(0x45, 1)
  model PredWaterflowSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_Waterpressure_MinPressure_DK */
  @ext(0x46, 1)
  model PredWaterpressureMinPressure is ReadonlyRegister<UIN>;

  /** Pred_Waterpressure_MaxPressure_DK */
  @ext(0x47, 1)
  model PredWaterpressureMaxPressure is ReadonlyRegister<UIN>;

  /** Pred_Waterpressure_SwitchingPoint_DK */
  @ext(0x48, 1)
  model PredWaterpressureSwitchingPoint is ReadonlyRegister<UIN>;

  /** Pred_StatusFlags_DK */
  @ext(0x7d, 1)
  model PredStatusFlags is ReadonlyRegister<ULG>;

  /** Pred_ConditionFlags */
  @ext(0x7e, 1)
  model PredConditionFlags is ReadonlyRegister<ULG>;

  /** TempGradientFailure_DK: Number of cut offs of the boilers cause of to high gradient (S.54) */
  @ext(0x11, 0)
  model TempGradientFailure is ReadonlyRegister<temp0>;

  /** TempDiffBlock_DK: Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures */
  @ext(0x12, 0)
  model TempDiffBlock is ReadonlyRegister<temp0>;

  /** TempDiffFailure_DK: Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures */
  @ext(0x13, 0)
  model TempDiffFailure is ReadonlyRegister<temp0>;

  /** Pump operation hours */
  @ext(0x14, 0)
  model PumpHours is ReadonlyRegister<hoursum2>;

  /** CH_PumpCommunt_DK: pump switchings */
  @ext(0x15, 0)
  model HcPumpStarts is ReadonlyRegister<cntstarts2>;

  /** TWV_Communt_DK: commutations of the three way valve */
  @ext(0x1a, 0)
  model ValveStarts is ReadonlyRegister<cntstarts2>;

  /** Fan operation hours */
  @ext(0x1b, 0)
  model FanHours is ReadonlyRegister<hoursum2>;

  /** FanCommunt_DK: commutations of the fan */
  @ext(0x1c, 0)
  model FanStarts is ReadonlyRegister<cntstarts2>;

  /** OverflowCounter_DK: Predictive Maintenance counter have got an overflow */
  @ext(0x1e, 0)
  model OverflowCounter is ReadonlyRegister<yesno>;

  /** MaxTempDiffExtTFT_DK: Predictive maintenance data */
  @ext(0x27, 0)
  model TempMaxDiffExtTFT is ReadonlyRegister<temp>;

  /** min_Ignitiontime_DK */
  @inherit(r)
  @ext(0x2b, 0)
  model MinIgnitiontime {
    /** minimum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** Temp DHW max: maximum temperature measured by the domestic hot water outlet sensor */
  @ext(0x35, 0)
  model Maintenancedata_HwcTempMax is ReadonlyRegister<temp>;

  /** Temp storage max: maximum temperature measured by the external tank sensor */
  @ext(0x36, 0)
  model StorageTempMax is ReadonlyRegister<temp>;

  /** TFT_max_DK: maximum temperature measured by the flow sensor */
  @ext(0x37, 0)
  model FlowTempMax is ReadonlyRegister<temp>;

  /** Fan_PWM_Sum_DK: Predictive Maintenance data for the fan damage recognition */
  @ext(0x3a, 0)
  model FanPWMSum is ReadonlyRegister<UIN>;

  /** Fan_PWM_Test_DK: Predictive Maintenance data for the fan damage recognition */
  @ext(0x3b, 0)
  model FanPWMTest is ReadonlyRegister<UCH>;

  /** MaxDeltaFlowReturn_DK: Predictive Maintenance data */
  @ext(0x3d, 0)
  model DeltaFlowReturnMax is ReadonlyRegister<temp>;

  /** TankLoadPumpOperationHours_DK: Preditive maintenance data */
  @ext(0x4c, 0)
  model StorageLoadPumpHours is ReadonlyRegister<hoursum2>;

  /** TankloadPumpCommunt_DK: Preditive maintenance data */
  @ext(0x4f, 0)
  model StorageloadPumpStarts is ReadonlyRegister<cntstarts2>;

  /** DHW Waterflow_max_DK: domestic hot water flow sensor maximum value */
  @ext(0x56, 0)
  model HwcWaterflowMax is ReadonlyRegister<uin100>;

  /** CounterStartAttempts3_DK: unsuccessfull ignitions in the third attempt */
  @ext(0x81, 0)
  model CounterStartAttempts3 is ReadonlyRegister<temp0>;

  /** CounterStartAttempts4_DK: unsuccessfull ignitions in the fourth attempt */
  @ext(0x82, 0)
  model CounterStartAttempts4 is ReadonlyRegister<temp0>;

  /** TRT_max_DK: max. return temperature */
  @ext(0xbe, 0)
  model ReturnTempMax is ReadonlyRegister<temp>;

  /** PumpDHWFlowSum_DK: summed up DHW flow rate */
  @ext(0xc1, 0)
  model PumpHwcFlowSum is ReadonlyRegister<UIN>;

  /** PumpDHWFlowNumber_DK: number of times DHW flow rate was detected */
  @ext(0xc2, 0)
  model PumpHwcFlowNumber is ReadonlyRegister<UCH>;

  /** SHE_MaxFlowTemp_DK: maximum flow temperature DHW */
  @ext(0xc3, 0)
  model SHEMaxFlowTemp is ReadonlyRegister<temp>;

  /** SHE_MaxDeltaFlowDHW_DK: maximum difference between flow and DHW outlet temperature */
  @ext(0xc4, 0)
  model SHEMaxDeltaHwcFlow is ReadonlyRegister<temp>;

  /** PrEnergySumDHW1_DK: Predictive Maintenance data */
  @ext(0xc5, 0)
  model PrEnergySumHwc1 is InstallRegister<ULG>;

  /** PrEnergyCountDHW1_DK: Predictive Maintenance data */
  @ext(0xc6, 0)
  model PrEnergyCountHwc1 is InstallRegister<ULG>;

  /** PrEnergySumDHW2_DK: Predictive Maintenance data */
  @ext(0xc7, 0)
  model PrEnergySumHwc2 is InstallRegister<ULG>;

  /** PrEnergyCountDHW2_DK: Predictive Maintenance data */
  @ext(0xc8, 0)
  model PrEnergyCountHwc2 is InstallRegister<ULG>;

  /** PrEnergySumDHW3_DK: Predictive Maintenance data */
  @ext(0xc9, 0)
  model PrEnergySumHwc3 is InstallRegister<ULG>;

  /** PrEnergyCountDHW3_DK: Predictive Maintenance data */
  @ext(0xca, 0)
  model PrEnergyCountHwc3 is InstallRegister<ULG>;

  /** MaxWaterFlowCH_DK: Predictive Maintenance data */
  @ext(0xd0, 0)
  model WaterHcFlowMax is ReadonlyRegister<UIN>;

  /** WaterpressureVariantSum_DK: Predictive Maintenance data */
  @ext(0xf0, 0)
  model WaterpressureVariantSum is ReadonlyRegister<pressm2>;

  /** WaterpressureMeasureCounter_DK: Predictive Maintenance data */
  @ext(0xf1, 0)
  model WaterpressureMeasureCounter is ReadonlyRegister<UCH>;

  /** PrAPSCounter_DK: Predictive Maintenance data */
  @ext(0xf2, 0)
  model PrAPSCounter is ReadonlyRegister<UCH>;

  /** PrAPSSum_DK: Predictive Maintenance data */
  @ext(0xf3, 0)
  model PrAPSSum is ReadonlyRegister<seconds2>;

  /** PrVortexFlowSensorValue_DK */
  @inherit(r)
  @ext(0xf4, 0)
  model PrVortexFlowSensorValue {
    /** Predictive Maintenance data */
    @unit("ADC")
    value: SIN;
  }

  /** PrEnergySumCH1_DK: Predictive Maintenance data */
  @ext(0xf5, 0)
  model PrEnergySumHc1 is InstallRegister<ULG>;

  /** PrEnergyCountCH1_DK: Predictive Maintenance data */
  @ext(0xf6, 0)
  model PrEnergyCountHc1 is InstallRegister<ULG>;

  /** PrEnergySumCH2_DK: Predictive Maintenance data */
  @ext(0xf7, 0)
  model PrEnergySumHc2 is InstallRegister<ULG>;

  /** PrEnergyCountCH2_DK: Predictive Maintenance data */
  @ext(0xf8, 0)
  model PrEnergyCountHc2 is InstallRegister<ULG>;

  /** PrEnergySumCH3_DK: Predictive Maintenance data */
  @ext(0xf9, 0)
  model PrEnergySumHc3 is InstallRegister<ULG>;

  /** PrEnergyCountCH3_DK: Predictive Maintenance data */
  @ext(0xfa, 0)
  model PrEnergyCountHc3 is InstallRegister<ULG>;

  enum Values_PumpPowerDesired {
    auto: 0,
    _53: 1,
    _60: 2,
    _70: 3,
    _85: 4,
    _100: 5,
  }

  enum Values_HcPumpMode {
    post_run: 0,
    permanent: 1,
    winter: 2,
    eco: 3,
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
