import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010008045_inc {
  // ,BAI00,Panther,25KOV v.19
  // ##### dia level 1 #####

  /** d.00 heating partload: Heating part load */
  @ext(0x6c, 0)
  model PartloadHcKW is InstallRegister<power>;

  /** d.01 central heating overruntime: water pump overrun time for heating mode */
  @ext(0x64, 0)
  model WPPostrunTime is InstallRegister<minutes0>;

  /** d.02 Max blocking time CH: max. burner anti cycling period at 20°C Flow temperature setpoint */
  @ext(0x21, 0)
  model BlockTimeHcMax is InstallRegister<minutes0>;

  /** d.03 Temp DHW: Hot water flow temperature */
  @ext(1, 0)
  model HwcTemp is ReadonlyRegister<temp>;

  /** d.04 Storage temperature: Current temperature for warm start sensor (combi boiler) / Current storage tank sensor (system boiler only) */
  @ext(0x17, 0)
  model StorageTemp is ReadonlyRegister<tempsensor>;

  /** d.08 Room thermostat 230 V: External controls heat demand (Clamp 3-4) */
  @ext(0x2a, 0)
  model ACRoomthermostat is ReadonlyRegister<onoff>;

  /** d.09 ext flowsetpoint: minimum out of Kl.7 and eBus flow setpoint */
  @ext(0x39, 0)
  model ExtFlowTempDesiredMin is ReadonlyRegister<temp>;

  /** d.10 Central heating pump: internal heating pump */
  @ext(0x44, 0)
  model WP is ReadonlyRegister<onoff>;

  /** d.11 external pump: External heating pump */
  @ext(0x3f, 0)
  model ExtWP is ReadonlyRegister<onoff>;

  /** d.13 Circulation pump: Hot water circulation pump (via external module) */
  @ext(0x7b, 0)
  model CirPump is ReadonlyRegister<onoff>;

  /** d.16 room thermostat 24 V: External controls heat demand (Clamp 3'-4') */
  @ext(0xe, 0)
  model DCRoomthermostat is ReadonlyRegister<onoff>;
  // r,Warmstart,d.21 Warmstart function,5B00,onoff,Warmstart function : this parameter indicate if the function is enabled and allowed

  /** d.22 DHW demand: domestic hot water (tapping or tank contact) demand */
  @ext(0x58, 0)
  model HwcDemand is ReadonlyRegister<yesno>;

  /** d.23 Heating demand */
  @ext(0x40, 0)
  model HeatingDemand is ReadonlyRegister<yesno>;

  /** d.25 DHW demand enabled: hot water release (tank storage) via eBus Control */
  @ext(0x71, 0)
  model StoragereleaseClock is ReadonlyRegister<yesno>;

  /** d.29 PrimaryCircuitFlowRate_DK: primary circuit water flow rate */
  @ext(0xfb, 0)
  model PrimaryCircuitFlowRate is ReadonlyRegister<uin100>;

  /** d.30 Gasvalve: Gasvalve activation signal */
  @ext(0xbb, 0)
  model Gasvalve is ReadonlyRegister<onoff2>;

  /** d.35 Position TWV: Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position */
  @ext(0x54, 0)
  model PositionValveSet is ReadonlyRegister<UCH>;

  /** d.36 DHW waterflow: domestic hot water flow sensor */
  @ext(0x55, 0)
  model HwcWaterflow is ReadonlyRegister<uin100>;

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

  /** d.62 Night-time offset */
  @inherit(r, wi)
  @ext(0x3f, 0x4)
  model NightTimeOffset {
    /** Night-time offset (Specific function for Belgium and NL: RT does not stop the burner but change the set-point. Do not use in other countries) */
    @maxLength(7) ign: IGN;

    uch: UCH;
  }

  /** d.67 Remaining burner block time: Remaining burner anti cycling time */
  @ext(0x38, 0)
  model RemainingBoilerblocktime is ReadonlyRegister<minutes0>;

  /** d.90 Digital control recognized: Digital regulator status */
  @ext(0x74, 0)
  model EBusHeatcontrol is ReadonlyRegister<yesno>;
  // ##### dia level 2 #####

  /** d.17 Return regulation: heating flow/return regulation activation */
  @ext(0xb3, 0)
  model ReturnRegulation is ServiceRegister<onoff>;

  /** d.18 CH pump mode */
  @inherit(r, wi)
  @ext(0xb7, 0)
  model HcPumpMode {
    /** Pump mode */
    @values(Values_HcPumpMode)
    value: UCH;
  }

  /** d.19 Mode of 2 speed pump: Operating mode of the two-stage heating pump0: burner mode = 2, pre/post-run = 1; 1: CH + post-run = 1, DHW = 2, 2: as 1 but rotation speed in CH is dependent of heating part load, (defaultsetting)3: always stage 2 */
  @ext(0xa0, 0)
  model SecondPumpMode is InstallRegister<UCH>;

  /** d.20 Max value tanksetpoint: Adjustment of maximum tank setpoint range (maximum endposition of potmeter) */
  @ext(0xd9, 0)
  model HwcTempMax is InstallRegister<temp>;

  /** d.24 SD_AircontrolOk_DK: Air pressure switch */
  @ext(0x3, 0)
  model AircontrolOk is ReadonlyRegister<onoff2>;

  /** d.27 Option relais 1 */
  @inherit(r, wi)
  @ext(0xb9, 0)
  model AccessoriesOne {
    /** Accesory relay 1 function */
    @values(Values_AccessoriesOne)
    value: UCH;
  }

  /** d.28 Option relais 2 */
  @inherit(r, wi)
  @ext(0xba, 0)
  model AccessoriesTwo {
    /** Accesory relay 2 function */
    @values(Values_AccessoriesTwo)
    value: UCH;
  }

  /** d.52 Offset for minimum steppermotor position: Pmin adjustment . To adjust, see Gas conversion */
  @ext(0xe9, 0)
  model GasvalveMinPowPos is ServiceRegister<UCH>;

  /** d.53 Offset for maximum steppermotor position: Pmax adjustment . To adjust, see Gas conversion */
  @ext(0xea, 0)
  model GasvalveMaxPowPos is ServiceRegister<SCH>;

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

  /** d.66 Warmstart Enable: 0 = Warmstart activated 1 = Warmstart de-activated */
  @ext(0x5b, 0)
  model WarmstartEnable is ServiceRegister<onoff>;

  /** d.68 ignition attempts 1: unsuccessfull ignitions in the first attempt */
  @ext(0x6e, 0)
  model CounterStartattempts1 is ReadonlyRegister<temp0>;

  /** d.69 ignition attempts 2: unsuccessfull ignitions in the second attempt */
  @ext(0x6f, 0)
  model CounterStartattempts2 is ReadonlyRegister<temp0>;

  /** d.71 Max value flow temp: Adjustment of maximum central heating setpoint range (maximum endposition of potmeter) */
  @ext(0xa5, 0)
  model FlowsetHcMax is InstallRegister<temp>;

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

  /** d.85 Minimal power to avoid condensation */
  @ext(0xec, 0)
  model AntiCondensValue is InstallRegister<power>;

  /** d.88 SpecialAdj: switching on threshold for recognition of water tapping0 = 1,5 l/min and no delay, 1 = 3,7 l/min and 2s delay */
  @ext(0xeb, 0)
  model SpecialAdj is InstallRegister<UCH>;

  /** d.93 Device specific number: DSN aplliance variant setting */
  @ext(0x30, 0x4)
  model DSNOffset is ServiceRegister<UCH>;

  /** d.96 Set factory settings */
  @ext(0x68, 0x4)
  model SetFactoryValues is ServiceRegister<yesno>;
  // ##### maintenance data #####

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
  // ##### expert level #####

  /** external flowsetpoint: Flow target temperature from external regulator to terminal 7-8-9 */
  @ext(0x25, 0)
  model ExternalFlowTempDesired is ReadonlyRegister<temp>;

  /** DHWSwitch_DK: Demand external tank (via contact) */
  @ext(0, 0)
  model ExternalHwcSwitch is ReadonlyRegister<onoff>;

  /** Waterpressure: water pressure */
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

  /** DHW impellor switch: domestic hot water (tapping) demand */
  @ext(0x57, 0)
  model HwcImpellorSwitch is ReadonlyRegister<yesno>;

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

  /** Statenumber_DK: status number */
  @ext(0xab, 0)
  model Statenumber is ReadonlyRegister<UCH>;

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
  model WPSecondStage is ReadonlyRegister<onoff>;

  /** SD_STL_with_NTC: Safety temperature limit concept:1 = safety temp. Limit check with NTC0 = safety temp. Limit check with contact */
  @ext(0xd2, 0)
  model TemplimiterWithNTC is ReadonlyRegister<yesno2>;

  /** SD_VolatileLockout_IFC_GV_DK: all IFC faults are volataile */
  @ext(0xd3, 0)
  model VolatileLockoutIFCGV is ReadonlyRegister<yesno2>;

  /** VortexFlowSensor_DK: Predictive Maintenance data, CH water flow */
  @ext(0xd5, 0)
  model VortexFlowSensor is ReadonlyRegister<UIN>;

  /** DisplayMode_DK: Display mode of the aplliance */
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
  model FlowSetPotmeter is Register<temp>;

  /** DHWSetPotmeter: DHW setpoint potentiometer */
  @ext(0xf1, 0x3)
  model HwcSetPotmeter is Register<temp>;

  /** Heating Switch: Wintermode active */
  @ext(0xf2, 0x3)
  model HeatingSwitch is Register<onoff>;

  /** DHWSwitch: DHW on/off */
  @ext(0xf3, 0x3)
  model HwcSwitch is Register<onoff>;

  /** ProductionByte */
  @ext(0x3e, 0x4)
  model ProductionByte is ReadonlyRegister<UCH>;

  enum Values_HcPumpMode {
    post_run: 0,
    permanent: 1,
    winter: 2,
    eco: 3,
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
  }
}
