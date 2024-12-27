import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
import "./service_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010007508_inc {
  // ,BAI00,ecoVIT pneumatic/4,0010007508 207
  // ##### dia level 1 #####

  /** d.00 heating partload */
  @inherit(r, wi)
  @ext(0xb0, 0)
  model PartloadHcKW {
    /** Heating part load */
    @unit("kW")
    @divisor(10)
    value: SIN;
  }

  /** d.01 central heating overruntime: water pump overrun time for heating mode */
  @ext(0x64, 0)
  model WPPostrunTime is InstallRegister<minutes0>;

  /** d.02 Max blocking time CH: max. burner anti cycling period at 20°C Flow temperature setpoint */
  @ext(0x21, 0)
  model BlockTimeHcMax is InstallRegister<minutes0>;

  /** d.03 Temp DHW: actoSTOR inletsensor temperature */
  @ext(0x16, 0)
  model HwcTemp is ReadonlyRegister<tempsensor>;

  /** d.04 Temp storage / she: current storage tank sensor temperature */
  @ext(0x17, 0)
  model StorageTemp is ReadonlyRegister<tempsensor>;

  /** d.05 flow/return setpoint: Flow temperature target value or return target value when return regulation is set */
  @ext(0x39, 0)
  model FlowTempDesired is ReadonlyRegister<temp>;

  /** d.07 Storage setpoint: Storage temperature target value */
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

  /** d.15 WP_PWMPower_DK: Output of pwm pump */
  @ext(0x73, 0)
  model WPPWMPower is ReadonlyRegister<percent0>;

  /** d.22 DHW demand: domestic hot water (tapping or tank contact) demand */
  @ext(0x58, 0)
  model HwcDemand is ReadonlyRegister<yesno>;

  /** d.23 operation mode: Wintermode active */
  @ext(0xf2, 0x3)
  model HeatingSwitch is ReadonlyRegister<onoff>;

  /** d.25 DHW demand enabled: hot water release (tank storage) via eBus Control */
  @ext(0x47, 0x4)
  model StoragereleaseClock is ReadonlyRegister<yesno>;

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

  /** d.40 TFT_DK: flow temperature */
  @ext(0x18, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** d.41 Temp heating return: return temperature */
  @ext(0x98, 0)
  model ReturnTemp is ReadonlyRegister<tempmirrorsensor>;

  /** d.47 Temp outside: Outside temperature (uncorrected value) */
  @ext(0x76, 0)
  model OutdoorstempSensor is ReadonlyRegister<tempsensor>;

  /** d.54 FlowHysteresis_ON_DK: Adjustment of the switch on hysteresis */
  @ext(0x16, 1)
  model FlowHysteresisON is InstallRegister<temp>;

  /** d.55 FlowHysteresis_OFF_DK: Adjustment of the switch off hysteresis */
  @ext(0x17, 1)
  model FlowHysteresisOff is InstallRegister<temp>;

  /** d.67 Remaining burner block time: Remaining burner anti cycling time */
  @ext(0x38, 0)
  model RemainingBoilerblocktime is ReadonlyRegister<minutes0>;

  /** d.77 Partload_DHW_KW_DK */
  @inherit(r, wi)
  @ext(0xb1, 0)
  model PartloadHwcKW {
    /** DHW part load */
    @unit("kW")
    @divisor(10)
    value: SIN;
  }

  /** d.90 Digital control recognized: Digital regulator status */
  @ext(0, 0x4)
  model EBusHeatcontrol is ReadonlyRegister<yesno>;

  /** d.91 Status DCF 77: DCF status */
  @ext(0x69, 0)
  model DcfState is ReadonlyRegister<dcfstate>;

  /** d.97 Password_DK */
  @ext(0x49, 0x4)
  model Password is ServiceRegister<UCH>;

  /** d.98 PhoneNumber_DK */
  @inherit(r, wi)
  @ext(0x81, 0x4)
  model PhoneNumber {
    /** phone number */
    @maxLength(8)
    value: HEX;
  }

  /** d.99 Language_DK: language selection */
  @ext(0x82, 0x4)
  model Language is ServiceRegister<UCH>;
  // ##### dia level 2 #####

  /** d.14 PumpspeedSetpoint: PWM pump speed */
  @ext(0xa1, 0)
  model PumpspeedDesired is ReadonlyRegister<percent0>;

  /** d.17 Return regulation: heating flow/return regulation activation */
  @ext(0xb3, 0)
  model ReturnRegulation is InstallRegister<onoff>;

  /** d.18 CH pump mode */
  @inherit(r, wi)
  @ext(0xb7, 0)
  model HcPumpMode {
    /** Pump mode */
    @values(Values_HcPumpMode)
    value: UCH;
  }

  /** d.20 Max value tanksetpoint: Adjustment of maximum tank setpoint range (maximum endposition of potmeter) */
  @ext(0xd9, 0)
  model HwcTempMax is InstallRegister<temp>;

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

  /** d.44 Dig. ionisation voltage */
  @inherit(r)
  @ext(0xa4, 0)
  model IonisationVoltageLevel {
    /** digital ionisation voltage> 80 no flame< 40 good flame */
    @divisor(10)
    value: SIN;
  }

  /** d.50 MinFanSpeedOffset */
  @inherit(r, wi)
  @ext(0xa7, 0)
  model FanSpeedOffsetMin {
    /** Offset for minimum fan speed */
    @unit("1/min")
    value: SIN;
  }

  /** d.51 MaxFanSpeedOffset */
  @inherit(r, wi)
  @ext(0xa8, 0)
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

  /** d.71 Max value flow temp: Adjustment of maximum central heating setpoint range (maximum endposition of potmeter) */
  @ext(0xa5, 0)
  model FlowsetHcMax is InstallRegister<temp>;

  /** d.72 PumpOverrun: setting range: 2…60min; default setting: 5 min */
  @ext(0x63, 0)
  model PumpOverrun is InstallRegister<minutes0>;

  /** d.73 Tankloadoffset: setting range:0 … 25k */
  @ext(0xb4, 1)
  model Storageloadoffset is InstallRegister<temp>;

  /** d.75 Max load time storage: Maximum charging time for a storage without own control */
  @ext(0x66, 0)
  model StorageLoadTimeMax is InstallRegister<minutes0>;

  /** d.76 SD_CodingResistor_DK */
  @inherit(r)
  @ext(0x92, 0)
  model CodingResistor {
    /** boiler identification resistor */
    @maxLength(3)
    value: HEX;
  }

  /** d.78 Max value flow temp storage: storage charging temperature limit (target flow temperature in storage mode) */
  @ext(0xa6, 0)
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

  /** d.87 Gas type: setting of gas type 0=Erdgas, 1= Flüssiggas 50mbar, 2= Flüssiggas 30mbar */
  @ext(0xfe, 0)
  model GasType is InstallRegister<UCH>;

  /** d.93 Device specific number: DSN aplliance variant setting */
  @ext(0xb5, 0)
  model DSNOffset is ServiceRegister<UCH>;

  /** d.96 Set factory settings */
  @ext(0x72, 1)
  model SetFactoryValues is InstallRegister<yesno>;

  /** Waterpressure: water pressure */
  @ext(0x2, 0)
  model WaterPressure is ReadonlyRegister<presssensor>;
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

  /** MaxDeltaFlowReturn_DK: Predictive Maintenance data */
  @ext(0x3d, 0)
  model DeltaFlowReturnMax is ReadonlyRegister<temp>;

  /** TankLoadPumpOperationHours_DK: Preditive maintenance data */
  @ext(0x4c, 0)
  model StorageLoadPumpHours is ReadonlyRegister<hoursum2>;

  /** TankloadPumpCommunt_DK: Preditive maintenance data */
  @ext(0x4f, 0)
  model StorageloadPumpStarts is ReadonlyRegister<cntstarts2>;

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

  /** CurrentPartload */
  @inherit(r)
  @ext(0, 1)
  model CurrentPartload {
    /** Current calculated partload */
    @unit("kW")
    value: UIN;
  }

  /** WaterpressureVariantSum_DK: Predictive Maintenance data */
  @ext(0xf0, 0)
  model WaterpressureVariantSum is ReadonlyRegister<pressm2>;

  /** WaterpressureMeasureCounter_DK: Predictive Maintenance data */
  @ext(0xf1, 0)
  model WaterpressureMeasureCounter is ReadonlyRegister<UCH>;

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
  // ##### expert level\Main #####

  /** external flowsetpoint: Flow target temperature from external regulator to terminal 7-8-9 */
  @ext(0x25, 0)
  model ExternalFlowTempDesired is ReadonlyRegister<temp>;

  /** DHWSwitch_DK: Demand external tank (via contact) */
  @ext(0, 0)
  model ExternalHwcSwitch is ReadonlyRegister<onoff>;

  /** Flame */
  @ext(0x5, 0)
  model Flame is ReadonlyRegister<onoff2>;

  /** SD_IFC_Fault_DK: IFC error */
  @ext(0x7, 0)
  model IFCFault is ReadonlyRegister<onoff2>;

  /** Changes_DSN_DK: Numbers adjusting (storing) the DSN */
  @ext(0xc, 0)
  model ChangesDSN is ReadonlyRegister<UCH>;

  /** Brennstoffventil: Activation signal of the gasvalve (activated via micrcontroller) */
  @ext(0xd, 0)
  model Brennstoffventil is ReadonlyRegister<onoff2>;

  /** SD_VolatileLockout_DK: TRUE: STB failures is volatileFALSE: STB failure is not volataile */
  @ext(0x10, 0)
  model VolatileLockout is ReadonlyRegister<yesno2>;

  /** Faultlist_DK */
  @inherit(r)
  @ext(0x26, 0)
  model Faultlist {
    /** last 10 fault codes */
    @maxLength(10)
    value: HEX;
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

  /** Rückmeldung Brennstoffventil 1: feedback gasvalve (from ASIC) */
  @ext(0x47, 0)
  model RueckmeldungBrennstoffventil1 is ReadonlyRegister<onoff2>;

  /** Rückmeldung Brennstoffventil 2: feedback gasvalve (from Microcontroller) */
  @ext(0x48, 0)
  model RueckmeldungBrennstoffventil2 is ReadonlyRegister<onoff2>;

  /** SD_Ignitor_DK: igniton activated */
  @ext(0x49, 0)
  model Ignitor is ReadonlyRegister<onoff2>;

  /** Fan_DK: Fan activation signal */
  @ext(0x4a, 0)
  model Fan is ReadonlyRegister<yesno>;

  /** DHW_Types_DK: DHW type of the appliance */
  @ext(0x4b, 0)
  model HwcTypes is ReadonlyRegister<UCH>;

  /** SD_TL_Fault_DK: temperature limiter error */
  @ext(0x4d, 0)
  model TemplimiterFault is ReadonlyRegister<onoff2>;

  /** SD_ADC_ok_DK: internal electronic error */
  @ext(0x4e, 0)
  model ADCOk is ReadonlyRegister<onoff2>;

  /** SD_Fan_Fault_DK: Fan error */
  @ext(0x53, 0)
  model FanFault is ReadonlyRegister<onoff2>;

  /** BoilerType_DK: Boiler typ of the bmu */
  @ext(0x5e, 0)
  model BoilerType is ReadonlyRegister<UCH>;

  /** FunctionFlags_DK: differrent function flags */
  @ext(0x5f, 0)
  model FunctionFlags is ReadonlyRegister<UCH>;

  /** ParamToken_DK: token for parameter managment */
  @ext(0x60, 0)
  model ParamToken is ReadonlyRegister<UCH>;

  /** ReturnTemperature_DK: external return sensor */
  @ext(0x6b, 0)
  model ExpertlevelMain_ReturnTemp is ReadonlyRegister<tempsensor>;

  /** Floor heating contact */
  @ext(0x70, 0)
  model FloorHeatingContact is ReadonlyRegister<onoff>;

  /** SD_Temperaturelimiter_DK: feedback signal of the temperature limiter */
  @ext(0x77, 0)
  model Templimiter is ReadonlyRegister<onoff2>;

  /** SR_IFC_EE_FaultCause_DK: current IFC fault cause */
  @ext(0x7a, 0)
  model SRIFCEEFaultCause is ReadonlyRegister<UCH>;

  /** ParamReplication_DK: activated the parameter managment again */
  @ext(0x7c, 0)
  model ParamReplication is ReadonlyRegister<yesno>;

  /** Anode_IN_Feedback_DK: feedback signal of the anode */
  @ext(0x7e, 0)
  model AnodeINFeedback is ReadonlyRegister<yesno>;

  /** EbusVoltage_DK: feedback signal of the eBus source */
  @ext(0x7f, 0)
  model EbusVoltage is ReadonlyRegister<onoff>;

  /** SR_TF_IN_SD_Feedback_DK: Thermal fuse error */
  @ext(0x84, 0)
  model SRTFINSDFeedback is ReadonlyRegister<onoff2>;

  /** Demand_CirculationPump_DK: remote control activated accessory circulation pump */
  @ext(0x88, 0)
  model DemandCirPump is ReadonlyRegister<yesno>;

  /** FluegasvalveOpen_DK: feedback of the flue gas valve */
  @ext(0x89, 0)
  model FluegasvalveOpen is ReadonlyRegister<onoff>;

  /** Function_Fault_DK: boiler stopped by a internal function fault */
  @ext(0x95, 0)
  model FunctionFault is ReadonlyRegister<yesno>;

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

  /** Statenumber_DK: status number */
  @ext(0xab, 0)
  model Statenumber is ReadonlyRegister<UCH>;

  /** AdvancedPowerValues_DK */
  @inherit(r)
  @ext(0xae, 0)
  model AdvancedPowerValues {
    /** min. / max powervalues */
    @maxLength(9)
    value: HEX;
  }

  /** DSN Start adress */
  @ext(0xbc, 0)
  model DSNStart is ReadonlyRegister<UIN>;

  /** Shiftloadtankpump_DK: current status of the shift load pump */
  @ext(0xb4, 0)
  model Shiftloadtankpump is ReadonlyRegister<yesno>;

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

  /** SR_Syphon_IN_SD_Switch_DK: feedback of the syphon switch contact */
  @ext(0xcf, 0)
  model SRSyphonINSDSwitch is ReadonlyRegister<yesno2>;

  /** SD_STL_with_NTC: Safety temperature limit concept:1 = safety temp. Limit check with NTC0 = safety temp. Limit check with contact */
  @ext(0xd2, 0)
  model TemplimiterWithNTC is ReadonlyRegister<yesno2>;

  /** SD_VolatileLockout_IFC_GV_DK: all IFC faults are volataile */
  @ext(0xd3, 0)
  model VolatileLockoutIFCGV is ReadonlyRegister<yesno2>;

  /** DisplayMode_DK: Display mode of the aplliance */
  @ext(0xda, 0)
  model DisplayMode is ReadonlyRegister<UCH>;

  /** Rückmeldung Brennstoffventil 3: Gasvalve activation signal (from Microcontroller) */
  @ext(0xdb, 0)
  model RueckmeldungBrennstoffventil3 is ReadonlyRegister<onoff2>;

  /** InitialisationEEPROM: Initialisation off all EEPROM values (done in the production) */
  @ext(0xdc, 0)
  model InitialisationEEPROM is ReadonlyRegister<yesno>;

  /** DefaultSettingEEPROM_DK: default value setting off all EEPROM values (done in the production) */
  @ext(0xdd, 0)
  model DefaultSettingEEPROM is ReadonlyRegister<yesno>;

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

  /** TR_Manag_EE.Virtual_CH_Partload_Enable_DK: enable the adaptive CH-partload calulation */
  @ext(0xe3, 0)
  model RManagEE_VirtualHcPartloadEnableDTemp is ReadonlyRegister<onoff>;

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

  /** actoSTOR_EE_PreventiveCounter_DK */
  @inherit(r)
  @ext(0xec, 0)
  model ActoSTOREEPreventiveCounter {
    /** Predictive maintenance date of the actoSTOR */
    uin: UIN;

    uin_1: UIN;
    uin_2: UIN;
  }

  /** InitialisationSequence_DK: value:0 -> off1-> full initialisation incl. all defaultvalues (done in the production) */
  @ext(0x9a, 1)
  model InitialisationSequence is ReadonlyRegister<UCH>;

  /** FlowSetPotmeter: flow setpoint potentiometer */
  @ext(0xf0, 0x3)
  model FlowSetPotmeter is ReadonlyRegister<temp>;

  /** DHWSetPotmeter: DHW setpoint potentiometer */
  @ext(0xf1, 0x3)
  model HwcSetPotmeter is ReadonlyRegister<temp>;

  /** DHWSwitch: DHW on/off */
  @ext(0xf3, 0x3)
  model HwcSwitch is ReadonlyRegister<onoff>;

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

  /** BoilerType_2_DK: second Boiler typ of the bmu */
  @ext(0xc, 1)
  model BoilerType2 is ReadonlyRegister<ULG>;

  /** StatusList_DK */
  @inherit(r)
  @ext(0x11, 1)
  model StatusList {
    /** List of the last 10 status numbers */
    @maxLength(10)
    value: HEX;
  }

  /** LimpHomeMode_EE_History_List_DK */
  @inherit(r)
  @ext(0x8b, 1)
  model LimpHomeModeEEHistoryList {
    /** history of the last 5 limp home modes */
    uin: UIN;

    uin_1: UIN;
    uin_2: UIN;
    uin_3: UIN;
    uin_4: UIN;
  }
  // ##### expert level\icoVIT #####

  /** AWPC_EE_MinThreshold_DK */
  @inherit(r, wi)
  @ext(0x12, 1)
  model AWPCEEMinThreshold {
    /** minimum waterpressure threshold */
    @unit("bar/10")
    @divisor(10)
    value: SIN;
  }

  /** AWPC_EE_MaxThreshold_DK */
  @inherit(r, wi)
  @ext(0x13, 1)
  model AWPCEEMaxThreshold {
    /** maximum waterpressure threshold */
    @unit("bar/10")
    @divisor(10)
    value: SIN;
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
