import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./service_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010018461_inc {
  // ,BAI00,ecoTEC exclusive VC 256/5-7 (E-PL),0010018461 208
  // Built from an exhaustive B5 09 register scan of a real appliance
  // (1280 addresses probed, pages 00-04; the appliance answers 555 of them).
  // Only registers actually present on this appliance are defined here.
  // Note: five CO-sensor registers on page 01 reply with the value followed
  // by its bitwise-negated copy (integrity check) - modelled with an
  // ignored trailing field.

  /** DHWSwitch_DK: Demand external tank (via contact) */
  @ext(0, 0)
  model ExternalHwcSwitch is ReadonlyRegister<onoff>;

  /** d.03 Temp DHW: Hot water flow temperature */
  @ext(1, 0)
  model HwcTemp is ReadonlyRegister<temp>;

  /** d.24 SD_AircontrolOk_DK: Air pressure switch */
  @ext(0x3, 0)
  model AircontrolOk is ReadonlyRegister<onoff2>;

  /** Flame */
  @ext(0x5, 0)
  model Flame is ReadonlyRegister<onoff2>;

  /** d.42 TSB_DK: Temperature of tank bottom */
  @ext(0x6, 0)
  model SBTemp is ReadonlyRegister<tempsensor>;

  /** SD_IFC_Fault_DK: IFC error */
  @ext(0x7, 0)
  model IFCFault is ReadonlyRegister<onoff2>;

  /** d.126 Storage charge delay: Delay of the storage charge */
  @ext(0x9, 0)
  model StorageDelay is ReadonlyRegister<minutes0>;

  /** Changes_DSN_DK: Numbers adjusting (storing) the DSN */
  @ext(0xc, 0)
  model ChangesDSN is ReadonlyRegister<UCH>;

  /** SD_Gasvalve_uC_DK: Activation signal of the gasvalve (activated via micrcontroller) */
  @ext(0xd, 0)
  model GasvalveUC is ReadonlyRegister<onoff2>;

  /** d.16 room thermostat 24 V: External controls heat demand (Clamp 3'-4') */
  @ext(0xe, 0)
  model DCRoomthermostat is ReadonlyRegister<onoff>;

  /** SD_VolatileLockout_DK: TRUE: STB failures is volatileFALSE: STB failure is not volataile */
  @ext(0x10, 0)
  model VolatileLockout is ReadonlyRegister<yesno2>;

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

  /** d.04 Temp storage / she: current temperature for warm start sensor (combinations boiler only) Current storage tank sensor (system boiler only) */
  @ext(0x17, 0)
  model StorageTemp is ReadonlyRegister<tempsensor>;

  /** d.40 TFT_DK: flow temperature */
  @ext(0x18, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

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

  /** d.60 Number STL cut off: Number of safety temperature limiter cut offs */
  @ext(0x20, 0)
  model DeactivationsTemplimiter is ReadonlyRegister<UCH>;

  /** d.02 Max blocking time CH: max. burner anti cycling period at 20°C Flow temperature setpoint */
  @ext(0x21, 0)
  model BlockTimeHcMax is InstallRegister<minutes0>;

  /** d.81 Operating hours DHW: water heating operation hours */
  @ext(0x22, 0)
  model HwcHours is ReadonlyRegister<hoursum2>;

  /** d.83 Burner starts DHW */
  @inherit(r)
  @ext(0x23, 0)
  model HwcStarts {
    /** Cycles in hot water operation */
    @factor(100)
    value: UIN;
  }

  /** d.33 Target fan speed */
  @ext(0x24, 0)
  model TargetFanSpeed is ReadonlyRegister<fanspeed>;

  /** Faultlist_DK */
  @inherit(r)
  @ext(0x26, 0)
  model Faultlist {
    @maxLength(10)
    value: HEX;
  }

  /** MaxTempDiffExtTFT_DK: Predictive maintenance data */
  @ext(0x27, 0)
  model TempMaxDiffExtTFT is ReadonlyRegister<temp>;

  /** d.80 operating hours CH: central heating operation hours */
  @ext(0x28, 0)
  model HcHours is ReadonlyRegister<hoursum2>;

  /** d.82 Burner starts heating */
  @inherit(r)
  @ext(0x29, 0)
  model HcStarts {
    /** cycles in heating mode */
    @factor(100)
    value: UIN;
  }

  /** d.08 Room thermostat 230 V: External controls heat demand (Clamp 3-4) */
  @ext(0x2a, 0)
  model ACRoomthermostat is ReadonlyRegister<onoff>;

  /** min_Ignitiontime_DK */
  @inherit(r)
  @ext(0x2b, 0)
  model MinIgnitiontime {
    /** minimum ignition time */
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

  /** d.64 average ignition time */
  @inherit(r)
  @ext(0x2d, 0)
  model AverageIgnitiontime {
    /** average ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** Modulationsetpoint_DK */
  @inherit(r)
  @ext(0x2e, 0)
  model ModulationDesired {
    /** Modulation set point */
    @unit("%")
    @divisor(10)
    value: SIN;
  }

  /** HZ_UnderHundred_SwiActi_DK: Heat switch cycles under hundred */
  @ext(0x30, 0)
  model HcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** BW_UnderHundred_SwiActi_DK: DHW switch cycles under hundred */
  @ext(0x31, 0)
  model HwcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** d.49 SD_TAA_DK: Exhaust sensor (outside the flue pipe) */
  @ext(0x32, 0)
  model AATemp is ReadonlyRegister<tempmirrorsensor>;

  /** d.48 SD_TAI_DK: Exhaust sensor (inside the flue pipe) */
  @ext(0x33, 0)
  model AITemp is ReadonlyRegister<tempmirrorsensor>;

  /** EbusSourceOn_DK: Activation signal of the eBus source */
  @ext(0x34, 0)
  model EbusSourceOn is ReadonlyRegister<onoff>;

  /** Temp DHW max: maximum temperature measured by the domestic hot water outlet sensor */
  @ext(0x35, 0)
  model Maintenancedata_HwcTempMax is ReadonlyRegister<temp>;

  /** Temp storage max: maximum temperature measured by the external tank sensor */
  @ext(0x36, 0)
  model StorageTempMax is ReadonlyRegister<temp>;

  /** TFT_max_DK: maximum temperature measured by the flow sensor */
  @ext(0x37, 0)
  model FlowTempMax is ReadonlyRegister<temp>;

  /** d.67 Remaining burner block time: Remaining burner anti cycling time */
  @ext(0x38, 0)
  model RemainingBoilerblocktime is ReadonlyRegister<minutes0>;

  /** d.05 flow/return setpoint: Flow temperature target value or return target value when return regulation is set */
  @ext(0x39, 0)
  model FlowTempDesired is ReadonlyRegister<temp>;

  /** Fan_PWM_Sum_DK: Predictive Maintenance data for the fan damage recognition */
  @ext(0x3a, 0)
  model FanPWMSum is ReadonlyRegister<UIN>;

  /** Fan_PWM_Test_DK: Predictive Maintenance data for the fan damage recognition */
  @ext(0x3b, 0)
  model FanPWMTest is ReadonlyRegister<UCH>;

  /** Fluegasvalve_DK: flue gasvalve activation signal */
  @ext(0x3c, 0)
  model Fluegasvalve is ReadonlyRegister<onoff>;

  /** MaxDeltaFlowReturn_DK: Predictive Maintenance data */
  @ext(0x3d, 0)
  model DeltaFlowReturnMax is ReadonlyRegister<temp>;

  /** External_Faultmessage_DK: external fault message */
  @ext(0x3e, 0)
  model ExternalFaultmessage is ReadonlyRegister<onoff>;

  /** d.11 external pump: External heating pump */
  @ext(0x3f, 0)
  model ExtWP is ReadonlyRegister<onoff>;

  /** d.23 Heating demand */
  @ext(0x40, 0)
  model HeatingDemand is ReadonlyRegister<yesno>;

  /** d.10 Central heating pump: internal heating pump */
  @ext(0x44, 0)
  model WP is ReadonlyRegister<onoff>;

  /** SD_Gasvalve_ASICFeedback_DK: feedback gasvalve (from ASIC) */
  @ext(0x47, 0)
  model GasvalveASICFeedback is ReadonlyRegister<onoff2>;

  /** SD_Ignitor_DK: igniton activated */
  @ext(0x49, 0)
  model Ignitor is ReadonlyRegister<onoff2>;

  /** Fan_DK: Fan activation signal */
  @ext(0x4a, 0)
  model Fan is ReadonlyRegister<yesno>;

  /** DHW_Types_DK: DHW type of the appliance */
  @ext(0x4b, 0)
  model HwcTypes is ReadonlyRegister<UCH>;

  /** TankLoadPumpOperationHours_DK: Preditive maintenance data */
  @ext(0x4c, 0)
  model StorageLoadPumpHours is ReadonlyRegister<hoursum2>;

  /** SD_TL_Fault_DK: temperature limiter error */
  @ext(0x4d, 0)
  model TemplimiterFault is ReadonlyRegister<onoff2>;

  /** SD_ADC_ok_DK: internal electronic error */
  @ext(0x4e, 0)
  model ADCOk is ReadonlyRegister<onoff2>;

  /** TankloadPumpCommunt_DK: Preditive maintenance data */
  @ext(0x4f, 0)
  model StorageloadPumpStarts is ReadonlyRegister<cntstarts2>;

  /** d.125 Storage output temperature: Current storage output temperature */
  @ext(0x50, 0)
  model StorageExitTemp is ReadonlyRegister<tempsensor>;

  /** SD_Fan_Fault_DK: Fan error */
  @ext(0x53, 0)
  model FanFault is ReadonlyRegister<onoff2>;

  /** d.36 DHW waterflow: domestic hot water flow sensor */
  @ext(0x55, 0)
  model HwcWaterflow is ReadonlyRegister<uin100>;

  /** DHW Waterflow_max_DK: domestic hot water flow sensor maximum value */
  @ext(0x56, 0)
  model HwcWaterflowMax is ReadonlyRegister<uin100>;

  /** DHW impellor switch: domestic hot water (tapping) demand */
  @ext(0x57, 0)
  model HwcImpellorSwitch is ReadonlyRegister<yesno>;

  /** d.22 DHW demand: domestic hot water (tapping or tank contact) demand */
  @ext(0x58, 0)
  model HwcDemand is ReadonlyRegister<yesno>;

  /** d.66 Warmstart Enable: 0 = Warmstart activated 1 = Warmstart de-activated */
  @ext(0x5b, 0)
  model WarmstartEnable is ServiceRegister<onoff>;

  /** BoilerType_DK: Boiler typ of the bmu */
  @ext(0x5e, 0)
  model BoilerType is ReadonlyRegister<UCH>;

  /** FunctionFlags_DK: differrent function flags */
  @ext(0x5f, 0)
  model FunctionFlags is ReadonlyRegister<UCH>;

  /** ParamToken_DK: token for parameter managment */
  @ext(0x60, 0)
  model ParamToken is ReadonlyRegister<UCH>;

  /** d.92 APC_ComStatus_DK: actoSTORE communication status */
    @ext(0x62, 0)
    model APCComStatus is ReadonlyRegister<UCH>;

  /** d.72 PumpOverrun: setting range: 2…60min; default setting: 5 min */
  @ext(0x63, 0)
  model PumpOverrun is InstallRegister<minutes0>;

  /** d.01 central heating overruntime: water pump overrun time for heating mode */
  @ext(0x64, 0)
  model WPPostrunTime is InstallRegister<minutes0>;

  /** d.75 Max load time storage: Maximum charging time for a storage without own control */
  @ext(0x66, 0)
  model StorageLoadTimeMax is InstallRegister<minutes0>;

  /** d.91 Status DCF 77: DCF status */
  @ext(0x69, 0)
  model DcfState is ReadonlyRegister<dcfstate>;

  /** ReturnTemperature_DK: external return sensor */
  @ext(0x6b, 0)
  model Expertlevel_ReturnTemp is ReadonlyRegister<tempsensor>;

  /** d.00 heating partload: Heating part load */
  @ext(0x6c, 0)
  model PartloadHcKW is InstallRegister<power>;

  /** d.68 ignition attempts 1: unsuccessfull ignitions in the first attempt */
  @ext(0x6e, 0)
  model CounterStartAttempts1 is ReadonlyRegister<UCH>;

  /** d.69 ignition attempts 2: unsuccessfull ignitions in the second attempt */
  @ext(0x6f, 0)
  model CounterStartAttempts2 is ReadonlyRegister<UCH>;

  /** Floor heating contact */
  @ext(0x70, 0)
  model FloorHeatingContact is ReadonlyRegister<onoff>;

  /** d.25 DHW demand enabled: hot water release (tank storage) via eBus Control */
  @ext(0x71, 0)
  model StoragereleaseClock is ReadonlyRegister<yesno>;

  /** d.15 WP_PWMPower_DK: Output of pwm pump */
  @ext(0x73, 0)
  model WPPWMPower is ReadonlyRegister<percent0>;

  /** d.90 Digital control recognized: Digital regulator status */
  @ext(0x74, 0)
  model EBusHeatcontrol is ReadonlyRegister<yesno>;

  /** d.47 Temp outside: Outside temperature (uncorrected value) */
  @ext(0x76, 0)
  model OutdoorstempSensor is ReadonlyRegister<tempsensor>;

  /** SD_Temperaturelimiter_DK: feedback signal of the temperature limiter */
  @ext(0x77, 0)
  model Templimiter is ReadonlyRegister<onoff2>;

  /** SR_IFC_EE_FaultCause_DK: current IFC fault cause */
  @ext(0x7a, 0)
  model SRIFCEEFaultCause is ReadonlyRegister<UCH>;

  /** d.13 Circulation pump: Hot water circulation pump (via external module) */
  @ext(0x7b, 0)
  model CirPump is ReadonlyRegister<onoff>;

  /** ParamReplication_DK: activated the parameter managment again */
  @ext(0x7c, 0)
  model ParamReplication is ReadonlyRegister<yesno>;

  /** SolarPump_DK: Modulation of solarpump */
  @ext(0x7d, 0)
  model SolPump is ReadonlyRegister<percent0>;

  /** Anode_IN_Feedback_DK: feedback signal of the anode */
  @ext(0x7e, 0)
  model AnodeINFeedback is ReadonlyRegister<yesno>;

  /** EbusVoltage_DK: feedback signal of the eBus source */
  @ext(0x7f, 0)
  model EbusVoltage is ReadonlyRegister<onoff>;

  /** CounterStartAttempts3_DK: unsuccessfull ignitions in the third attempt */
  @ext(0x81, 0)
  model CounterStartAttempts3 is ReadonlyRegister<UCH>;

  /** CounterStartAttempts4_DK: unsuccessfull ignitions in the fourth attempt */
  @ext(0x82, 0)
  model CounterStartAttempts4 is ReadonlyRegister<UCH>;

  /** SR_TF_IN_SD_Feedback_DK: Thermal fuse error */
  @ext(0x84, 0)
  model SRTFINSDFeedback is ReadonlyRegister<onoff2>;

  /** Demand_CirculationPump_DK: remote control activated accessory circulation pump */
  @ext(0x88, 0)
  model DemandCirPump is ReadonlyRegister<yesno>;

  /** FluegasvalveOpen_DK: feedback of the flue gas valve */
  @ext(0x89, 0)
  model FluegasvalveOpen is ReadonlyRegister<onoff>;

  /** d.76 SD_CodingResistor_DK */
  @inherit(r)
  @ext(0x92, 0)
  model CodingResistor {
    /** boiler identification resistor */
    @maxLength(3)
    value: HEX;
  }

  /** d.43 Block_Sensor_DK: boiler block temperature */
  @ext(0x93, 0)
  model BlockSensor is ReadonlyRegister<tempsensor>;

  /** d.41 Temp heating return: return temperature */
  @ext(0x98, 0)
  model ReturnTemp is ReadonlyRegister<tempmirrorsensor>;

  /** Testbyte_DK: Testbyte (relevant for the Tester) */
  @ext(0x99, 0)
  model Testbyte is ReadonlyRegister<UCH>;

  /** d.63 exhaust way block counter: numbers the exhaust way was blocked */
  @ext(0x9c, 0)
  model ExhaustWayBlockCounter is ReadonlyRegister<UCH>;

  /** d.12 storage load pump: tank load pump demand */
  @ext(0x9e, 0)
  model Storageloadpump is ReadonlyRegister<percent0>;

  /** TargetFan_Speed_Output_DK: output fan speed */
  @ext(0x9f, 0)
  model TargetFanSpeedOutput is ReadonlyRegister<fanspeed>;

  /** d.14 Desired heating pump power */
  @inherit(r, wi)
  @ext(0xa1, 0)
  model PumpPowerDesired {
    /** PWM-Desired central heating pump power */
    @unit("%")
    @values(Values_PumpPowerDesired)
    value: UCH;
  }

  /** d.44 Dig. ionisation voltage */
  @inherit(r)
  @ext(0xa4, 0)
  model IonisationVoltageLevel {
    /** digital ionisation voltage> 80 no flame< 40 good flame */
    @divisor(10)
    value: SIN;
  }

  /** d.71 Max value flow temp: Adjustment of maximum central heating setpoint range (maximum endposition of potmeter) */
  @ext(0xa5, 0)
  model FlowsetHcMax is InstallRegister<temp>;

  /** d.78 Max value flow temp storage: storage charging temperature limit (target flow temperature in storage mode) */
  @ext(0xa6, 0)
  model FlowsetHwcMax is InstallRegister<temp>;

  /** d.50 MinFanSpeedOffset: Offset for minimum fan speed */
  @ext(0xa7, 0)
  model FanSpeedOffsetMin is InstallRegister<fanspeedoffset>;

  /** d.51 MaxFanSpeedOffset: Offset for maximum fan speed */
  @ext(0xa8, 0)
  model FanSpeedOffsetMax is InstallRegister<fanspeedoffset>;

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

  /** d.84 Hours till next service: Maintenance indicator:Number of hours until the next maintenance */
  @ext(0xac, 0)
  model HoursTillService is InstallRegister<hoursum2>;

  /** WaterpressureBranchControlOff_DK: water pressure branch controll off */
  @ext(0xaf, 0)
  model WaterpressureBranchControlOff is ReadonlyRegister<onoff>;

  /** d.17 Return regulation: heating flow/return regulation activation */
  @ext(0xb3, 0)
  model ReturnRegulation is InstallRegister<onoff>;

  /** d.93 Device specific number: DSN aplliance variant setting */
  @ext(0xb5, 0)
  model DSNOffset is ServiceRegister<UCH>;

  /** d.18 CH pump mode */
  @inherit(r, wi)
  @ext(0xb7, 0)
  model HcPumpMode {
    /** Pump mode */
    @values(Values_HcPumpMode)
    value: UCH;
  }

  /** d.26 OptionalRelais_DK */
  @inherit(r, wi)
  @ext(0xb8, 0)
  model OptionalRelais {
    /** Option relais function */
    @values(Values_OptionalRelais)
    value: UCH;
  }

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

  /** d.30 Gasvalve: Gasvalve activation signal */
  @ext(0xbb, 0)
  model Gasvalve is ReadonlyRegister<onoff2>;

  /** DSN Start adress */
  @ext(0xbc, 0)
  model DSNStart is ReadonlyRegister<UIN>;

  /** TRT_max_DK: max. return temperature */
  @ext(0xbe, 0)
  model ReturnTempMax is ReadonlyRegister<temp>;

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

  /** d.86 ServiceMode_DK: Counter-activation for predictive maintenance */
  @ext(0xcb, 0)
  model ServiceMode is InstallRegister<onoff>;

  /** MaxWaterFlowCH_DK: Predictive Maintenance data */
  @ext(0xd0, 0)
  model WaterHcFlowMax is ReadonlyRegister<UIN>;

  /** SD_STL_with_NTC: Safety temperature limit concept:1 = safety temp. Limit check with NTC0 = safety temp. Limit check with contact */
  @ext(0xd2, 0)
  model TemplimiterWithNTC is ReadonlyRegister<yesno2>;

  /** SD_VolatileLockout_IFC_GV_DK: all IFC faults are volataile */
  @ext(0xd3, 0)
  model VolatileLockoutIFCGV is ReadonlyRegister<yesno2>;

  /** d.20 Max value tanksetpoint: Adjustment of maximum tank setpoint range (maximum endposition of potmeter) */
  @ext(0xd9, 0)
  model HwcTempMax is InstallRegister<temp>;

  /** DisplayMode_DK: Display mode of the aplliance */
  @ext(0xda, 0)
  model DisplayMode is ReadonlyRegister<UCH>;

  /** SD_Gasvalve3_uC_DK: Gasvalve activation signal (from Microcontroller) */
  @ext(0xdb, 0)
  model Gasvalve3UC is ReadonlyRegister<onoff2>;

  /** InitialisationEEPROM: Initialisation off all EEPROM values (done in the production) */
  @ext(0xdc, 0)
  model InitialisationEEPROM is ReadonlyRegister<yesno>;

  /** DefaultSettingEEPROM_DK: default value setting off all EEPROM values (done in the production) */
  @ext(0xdd, 0)
  model DefaultSettingEEPROM is ReadonlyRegister<yesno>;

  /** TimerInputCH_DK: timer input (block heatdemand) */
  @ext(0xde, 0)
  model TimerInputHc is ReadonlyRegister<onoff>;

  /** FanMinSpeedOperation: Minimum Fan speed of the appliance */
  @ext(0xdf, 0)
  model FanMinSpeedOperation is ReadonlyRegister<fanspeed>;

  /** FanMaxSpeedOperation: Maximum Fan speed of the appliance */
  @ext(0xe0, 0)
  model FanMaxSpeedOperation is ReadonlyRegister<fanspeed>;

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

  /** d.85 Minimal power to avoid condensation */
  @ext(0xec, 0)
  model AntiCondensValue is InstallRegister<power>;

  /** WP_SecondStage_DK: Second stage of the pump activated */
  @ext(0xed, 0)
  model WPSecondStage is ReadonlyRegister<onoff>;

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

  /** d.29 Primary circuit flow rate */
  @ext(0xfb, 0)
  model PrimaryCircuitFlowrate is ReadonlyRegister<flowrate100>;

  /** e.12 CO_CorrFactor_DK: calculated gas-adaptive correction-factor */
  @ext(1, 1)
  model COCorrFactor is ReadonlyRegister<percent0>;

  /** e.13 SMGV_CorrFactorLow_DK: calculated correction-factor low-load */
  @ext(0x2, 1)
  model SMGVCorrFactorLow is ReadonlyRegister<percent0>;

  /** e.14 SMGV_CorrFactorHigh_DK: calculated correction-factor high-load */
  @ext(0x3, 1)
  model SMGVCorrFactorHigh is ReadonlyRegister<percent0>;

  /** e.08 CO-sensor resistance at 0 ppm CO (reply carries value + bitwise-negated copy) */
  @ext(0x4, 0x1)
  @inherit(r)
  model COR0 {
    value: UIN;
    @maxLength(2) ign: IGN;
  }

  /** e.07 actual CO-sensor resistance (reply carries value + bitwise-negated copy) */
  @ext(0x5, 0x1)
  @inherit(r)
  model CORsens {
    value: UIN;
    @maxLength(2) ign: IGN;
  }

  /** e.06 calculated CO-concentration (reply carries value + bitwise-negated copy) */
  @ext(0x6, 0x1)
  @inherit(r)
  model COConcentration {
    value: UIN;
    @maxLength(2) ign: IGN;
  }

  /** e.10 CO_PTC_MeasureTemp_DK: heater-temperature during burner operation */
  @ext(0x7, 1)
  model COPTCMeasureTemp is ReadonlyRegister<temp>;

  /** target heater-temperature of the CO sensor (reply carries value + bitwise-negated copy) */
  @ext(0x8, 0x1)
  @inherit(r)
  model COPTCTargetTemp {
    value: D2C;
    @maxLength(2) ign: IGN;
  }

  /** e.09 actual heater-temperature of the CO sensor (reply carries value + bitwise-negated copy) */
  @ext(0x9, 0x1)
  @inherit(r)
  model COPTCActualTemp {
    value: D2C;
    @maxLength(2) ign: IGN;
  }

  /** e.18 CO_LastError_DK: CO-sensor failure number */
  @ext(0xa, 1)
  model COLastError is ReadonlyRegister<UCH>;

  /** e.19 FluePipeFactor_DK: calculated fluepipe-factor */
  @ext(0xb, 1)
  model FluePipeFactor is ReadonlyRegister<UCH>;

  /** d.89 StartOffset_DK: value of gas-offset during ignition */
  @ext(0xd, 1)
  model StartOffset is InstallRegister<percents>;

  /** e.11 CO_CorrFactor_Offset_DK: CO2 offset value for gas-adaptive correction-factor */
  @ext(0xe, 1)
  model COCorrFactorOffset is ReadonlyRegister<percents>;

  /** e.04 SMGV_CorrFactorLow_Offset_DK: CO2 offset-value low-load */
  @ext(0xf, 1)
  model SMGVCorrFactorLowOffset is ReadonlyRegister<percents>;

  /** e.05 SMGV_CorrFactorHigh_Offset_DK: CO2 offset-value high-load */
  @ext(0x10, 1)
  model SMGVCorrFactorHighOffset is ReadonlyRegister<percents>;

  /** TTM_MaxTime_DK: maximum time for calibration-routine */
  @ext(0x18, 1)
  model TMMaxTime is ReadonlyRegister<seconds2>;

  /** TTM_AverageTime_sum_DK */
  @inherit(r)
  @ext(0x19, 1)
  model TMAverageTimeSum {
    /** average time for calibration-routine */
    // @unit("_1S * 100") //todo unclear what that means, maybe 100/s
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
    @unit("%")
    @divisor(100)
    value: UIN;
  }

  /** SMGV_CorrFactorLow_sum_DK */
  @inherit(r)
  @ext(0x1c, 1)
  model SMGVCorrFactorLowSum {
    /** average value of calculated correction-factor low-load */
    @unit("%")
    @divisor(100)
    value: UIN;
  }

  /** SMGV_CorrFactorHigh_sum_DK */
  @inherit(r)
  @ext(0x1d, 1)
  model SMGVCorrFactorHighSum {
    /** average value of calculated correction-factor high-load */
    @unit("%")
    @divisor(100)
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

  /** d.96 Set factory settings */
  @ext(0x72, 1)
  model SetFactoryValues is InstallRegister<yesno>;

  /** SR_FLIDE_Mode_DK */
  @ext(0x81, 1)
  model SRFLIDEMode is ServiceRegister<UCH>;

  /** d.23 operation mode: Wintermode active */
  @ext(0xf2, 0x3)
  model HeatingSwitch is ReadonlyRegister<onoff>;

  /** DHWSwitch: DHW on/off */
  @ext(0xf3, 0x3)
  model HwcSwitch is ReadonlyRegister<onoff>;

  /** WarmstartDemand: aktivation of warmstart */
  @ext(0x3a, 0x4)
  model WarmstartDemand is ReadonlyRegister<yesno>;

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

  /** d.98 PhoneNumber_DK */
  @inherit(r, ws)
  @ext(0x81, 0x4)
  model PhoneNumber {
    /** phone number */
    @maxLength(8)
    value: HEX;
  }

  /** d.99 Language_DK: language selection */
  @ext(0x82, 0x4)
  model Language is ServiceRegister<UCH>;

  /** d.09 ext flowsetpoint: minimum out of Kl.7 and eBus flow setpoint */
  @ext(0xf3, 0x4)
  model ExtFlowTempDesiredMin is ReadonlyRegister<temp>;

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

  enum Values_HcPumpMode {
    post_run: 0,
    permanent: 1,
    winter: 2,
  }

  enum Values_OptionalRelais {
    circulationpump: 1,
    extheatingpump: 2,
    storagechargingpump: 3,
    fluegasflapextractorhood: 4,
    externalgasvalve: 5,
    externalerrormessage: 6,
    solarpump: 7,
    remotecontrol: 8,
  }

  enum Values_PumpPowerDesired {
    auto: 0,
    _53: 1,
    _60: 2,
    _70: 3,
    _85: 4,
    _100: 5,
  }

}
