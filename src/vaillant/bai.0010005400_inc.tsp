import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
import "./service_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010005400_inc {
  // ,BAI00,ecoCRAFT/3,0010005400 207

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

  /** d.00 heating partload */
  @inherit(r, wi)
  @ext(0xb0, 0)
  model PartloadHcKW {
    /** Heating part load */
    @unit("kW")
    @divisor(10)
    value: SIN;
  }

  /** d.01 central heating overruntime */
  @inherit(r, wi)
  @ext(0x64, 0)
  model WPPostrunTime {
    /** water pump overrun time for heating mode */
    value: minutes0;
  }

  /** d.02 Max blocking time CH */
  @inherit(r, wi)
  @ext(0x21, 0)
  model BlockTimeHcMax {
    /** max. burner anti cycling period at 20°C Flow temperature setpoint */
    value: minutes0;
  }

  /** d.04 Temp storage / she */
  @inherit(r)
  @ext(0x17, 0)
  model StorageTemp {
    /** current storage tank sensor temperature */
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
    /** Storage temperature target value */
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
    /** Output of pwm pump */
    value: percent0;
  }

  /** d.16 room thermostat 24 V */
  @inherit(r)
  @ext(0xe, 0)
  model DCRoomthermostat {
    /** External controls heat demand (Clamp 3-4) */
    value: onoff;
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

  /** d.24 AirPressureSwitch_DK */
  @inherit(r)
  @ext(0x3, 0)
  model SourcePressureSwitch {
    /** contact of the air pressure switch */
    value: yesno;
  }

  /** d.25 DHW demand enabled */
  @inherit(r)
  @ext(0x47, 0x4)
  model StoragereleaseClock {
    /** hot water release (tank storage) via eBus Control */
    value: yesno;
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

  /** d.43 Block_Sensor_DK */
  @inherit(r)
  @ext(0x93, 0)
  model BlockSensor {
    /** boiler block temperature */
    value: tempsensor;
  }

  /** d.47 Temp outside */
  @inherit(r)
  @ext(0x76, 0)
  model OutdoorstempSensor {
    /** Outside temperature (uncorrected value) */
    value: tempsensor;
  }

  /** d.53 FlowHysteresis_ON_DK */
  @inherit(r, wi)
  @ext(0x16, 1)
  model FlowHysteresisON {
    /** Adjustment of the switch on hysteresis */
    value: temp;
  }

  /** d.54 FlowHysteresis_OFF_DK */
  @inherit(r, wi)
  @ext(0x17, 1)
  model FlowHysteresisOff {
    /** Adjustment of the switch off hysteresis */
    value: temp;
  }

  /** d.67 Remaining burner block time */
  @inherit(r)
  @ext(0x38, 0)
  model RemainingBoilerblocktime {
    /** Remaining burner anti cycling time */
    value: minutes0;
  }

  /** d.77 Partload_DHW_KW_DK */
  @inherit(r, wi)
  @ext(0xb1, 0)
  model PartloadHwcKW {
    /** DHW part load */
    @unit("kW")
    @divisor(10)
    value: SIN;
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

  /** d.97 Password_DK */
  @inherit(r, ws)
  @ext(0x49, 0x4)
  model Password {
    /** Password */
    value: UCH;
  }

  /** d.98 PhoneNumber_DK */
  @inherit(r, ws)
  @ext(0x81, 0x4)
  model PhoneNumber {
    /** phone number */
    @maxLength(8)
    value: HEX;
  }

  /** d.99 Language_DK */
  @inherit(r, ws)
  @ext(0x82, 0x4)
  model Language {
    /** language selection */
    value: UCH;
  }
  // ##### dia level 2 #####

  /** d.14 PumpspeedSetpoint */
  @inherit(r)
  @ext(0xa1, 0)
  model PumpspeedDesired {
    /** PWM pump speed */
    value: percent0;
  }

  /** d.17 Return regulation */
  @inherit(r, wi)
  @ext(0xb3, 0)
  model ReturnRegulation {
    /** heating flow/return regulation activation */
    value: onoff;
  }

  /** d.18 CH pump mode */
  @inherit(r, wi)
  @ext(0xb7, 0)
  model HcPumpMode {
    /** Pump mode */
    @values(Values_HcPumpMode)
    value: UCH;
  }

  /** d.20 Max value tanksetpoint */
  @inherit(r, wi)
  @ext(0xd9, 0)
  model HwcTempMax {
    /** Adjustment of maximum tank setpoint range (maximum endposition of potmeter) */
    value: temp;
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

  /** d.71 Max value flow temp */
  @inherit(r, wi)
  @ext(0xa5, 0)
  model FlowsetHcMax {
    /** Adjustment of maximum central heating setpoint range (maximum endposition of potmeter) */
    value: temp;
  }

  /** d.75 Max load time storage */
  @inherit(r, wi)
  @ext(0x66, 0)
  model StorageLoadTimeMax {
    /** Maximum charging time for a storage without own control */
    value: minutes0;
  }

  /** d.76 SD_CodingResistor_DK */
  @inherit(r)
  @ext(0x92, 0)
  model CodingResistor {
    /** boiler identification resistor */
    @maxLength(3)
    value: HEX;
  }

  /** d.78 Max value flow temp storage */
  @inherit(r, wi)
  @ext(0xa6, 0)
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

  /** d.87 Gas type */
  @inherit(r, wi)
  @ext(0xfe, 0)
  model GasType {
    /** setting of gas type 0=Erdgas, 1= Flüssiggas 50mbar, 2= Flüssiggas 30mbar */
    value: UCH;
  }

  /** d.93 Device specific number */
  @inherit(r, ws)
  @ext(0xb5, 0)
  model DSNOffset {
    /** DSN aplliance variant setting */
    value: UCH;
  }

  /** d.96 Set factory settings */
  @inherit(r, wi)
  @ext(0x72, 1)
  model SetFactoryValues {
    /** Factory settings */
    value: yesno;
  }

  /** water pressure */
  @inherit(r)
  @ext(0x2, 0)
  model WaterPressure {
    /** water pressure */
    value: presssensor;
  }
  // ##### maintenance data #####

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

  /** CurrentPartload */
  @inherit(r)
  @ext(0, 1)
  model CurrentPartload {
    /** Current calculated partload */
    @unit("kW")
    value: UIN;
  }

  /** PrVortexFlowSensorValue_DK */
  @inherit(r)
  @ext(0xf4, 0)
  model PrVortexFlowSensorValue {
    /** Predictive maintenance data */
    @unit("ADC")
    value: SIN;
  }

  /** PrEnergyCountCH1_DK */
  @inherit(r)
  @ext(0xf5, 0)
  model PrEnergyCountHc1 {
    /** Predictive maintenance data */
    value: ULG;
  }
  // ##### expert level\Main #####

  /** external flowsetpoint */
  @inherit(r)
  @ext(0x25, 0)
  model ExternalFlowTempDesired {
    /** Flow target temperature from external regulator to terminal 7-8-9 */
    value: temp;
  }

  /** DHWSwitch_DK */
  @inherit(r)
  @ext(0, 0)
  model ExternalHwcSwitch {
    /** Demand external tank (via contact) */
    value: onoff;
  }

  /** flame */
  @inherit(r)
  @ext(0x5, 0)
  model Flame {
    /** flame */
    @values(Values_Flame)
    value: UCH;
  }

  /** SD_IFC_Fault_DK */
  @inherit(r)
  @ext(0x7, 0)
  model IFCFault {
    /** IFC error */
    @values(Values_IFCFault)
    value: UCH;
  }

  /** Changes_DSN_DK */
  @inherit(r)
  @ext(0xc, 0)
  model ChangesDSN {
    /** Numbers adjusting (storing) the DSN */
    value: UCH;
  }

  /** Brennstoffventil */
  @inherit(r)
  @ext(0xd, 0)
  model Brennstoffventil {
    /** Activation signal of the gasvalve (activated via micrcontroller) */
    @values(Values_Brennstoffventil)
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

  /** Rückmeldung Brennstoffventil 1 */
  @inherit(r)
  @ext(0x47, 0)
  model R_ckmeldungBrennstoffventil1 {
    /** feedback gasvalve (from ASIC) */
    @values(Values_R_ckmeldungBrennstoffventil1)
    value: UCH;
  }

  /** Rückmeldung Brennstoffventil 2 */
  @inherit(r)
  @ext(0x48, 0)
  model R_ckmeldungBrennstoffventil2 {
    /** feedback gasvalve (from Microcontroller) */
    @values(Values_R_ckmeldungBrennstoffventil2)
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

  /** Fan_DK */
  @inherit(r)
  @ext(0x4a, 0)
  model Fan {
    /** Fan activation signal */
    value: yesno;
  }

  /** DHW_Types_DK */
  @inherit(r)
  @ext(0x4b, 0)
  model HwcTypes {
    /** DHW type of the appliance */
    value: UCH;
  }

  /** SD_TL_Fault_DK */
  @inherit(r)
  @ext(0x4d, 0)
  model TemplimiterFault {
    /** temperature limiter error */
    @values(Values_TemplimiterFault)
    value: UCH;
  }

  /** SD_ADC_ok_DK */
  @inherit(r)
  @ext(0x4e, 0)
  model ADCOk {
    /** internal electronic error */
    @values(Values_ADCOk)
    value: UCH;
  }

  /** SD_Fan_Fault_DK */
  @inherit(r)
  @ext(0x53, 0)
  model FanFault {
    /** Fan error */
    @values(Values_FanFault)
    value: UCH;
  }

  /** BoilerType_DK */
  @inherit(r)
  @ext(0x5e, 0)
  model BoilerType {
    /** Boiler typ of the bmu */
    value: UCH;
  }

  /** FunctionFlags_DK */
  @inherit(r)
  @ext(0x5f, 0)
  model FunctionFlags {
    /** differrent function flags */
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
  model ExpertlevelMain_ReturnTemp {
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

  /** SR_IFC_EE_FaultCause_DK */
  @inherit(r)
  @ext(0x7a, 0)
  model SRIFCEEFaultCause {
    /** current IFC fault cause */
    value: UCH;
  }

  /** ParamReplication_DK */
  @inherit(r)
  @ext(0x7c, 0)
  model ParamReplication {
    /** activated the parameter managment again */
    value: yesno;
  }

  /** Anode_IN_Feedback_DK */
  @inherit(r)
  @ext(0x7e, 0)
  model AnodeINFeedback {
    /** feedback signal of the anode */
    value: yesno;
  }

  /** EbusVoltage_DK */
  @inherit(r)
  @ext(0x7f, 0)
  model EbusVoltage {
    /** feedback signal of the eBus source */
    value: onoff;
  }

  /** SR_TF_IN_SD_Feedback_DK */
  @inherit(r)
  @ext(0x84, 0)
  model SRTFINSDFeedback {
    /** Thermal fuse error */
    @values(Values_SRTFINSDFeedback)
    value: UCH;
  }

  /** Demand_CirculationPump_DK */
  @inherit(r)
  @ext(0x88, 0)
  model DemandCirPump {
    /** remote control activated accessory circulation pump */
    value: yesno;
  }

  /** FluegasvalveOpen_DK */
  @inherit(r)
  @ext(0x89, 0)
  model FluegasvalveOpen {
    /** feedback of the flue gas valve */
    value: onoff;
  }

  /** Function_Fault_DK */
  @inherit(r)
  @ext(0x95, 0)
  model FunctionFault {
    /** boiler stopped by a internal function fault */
    value: yesno;
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

  /** Statenumber_DK */
  @inherit(r)
  @ext(0xab, 0)
  model Statenumber {
    /** status number */
    value: UCH;
  }

  /** AdvancedPowerValues_DK */
  @inherit(r)
  @ext(0xae, 0)
  model AdvancedPowerValues {
    /** min. / max powervalues */
    @maxLength(9)
    value: HEX;
  }

  /** DSN start */
  @inherit(r)
  @ext(0xbc, 0)
  model DSNStart {
    /** DSN Start adress */
    value: UIN;
  }

  /** Shiftloadtankpump_DK */
  @inherit(r)
  @ext(0xb4, 0)
  model Shiftloadtankpump {
    /** current status of the shift load pump */
    value: yesno;
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

  /** SR_Syphon_IN_SD_Switch_DK */
  @inherit(r)
  @ext(0xcf, 0)
  model SRSyphonINSDSwitch {
    /** feedback of the syphon switch contact */
    @values(Values_SRSyphonINSDSwitch)
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

  /** DisplayMode_DK */
  @inherit(r)
  @ext(0xda, 0)
  model DisplayMode {
    /** Display mode of the aplliance */
    value: UCH;
  }

  /** Rückmeldung Brennstoffventil 3 */
  @inherit(r)
  @ext(0xdb, 0)
  model R_ckmeldungBrennstoffventil3 {
    /** Gasvalve activation signal (from Microcontroller) */
    @values(Values_R_ckmeldungBrennstoffventil3)
    value: UCH;
  }

  /** InitialisationEEPROM */
  @inherit(r)
  @ext(0xdc, 0)
  model InitialisationEEPROM {
    /** Initialisation off all EEPROM values (done in the production) */
    value: yesno;
  }

  /** DefaultSettingEEPROM_DK */
  @inherit(r)
  @ext(0xdd, 0)
  model DefaultSettingEEPROM {
    /** default value setting off all EEPROM values (done in the production) */
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

  /** TR_Manag_EE.Virtual_Partload_Enable_DK */
  @inherit(r, wi)
  @ext(0xe3, 0)
  model RManagEE_VirtualPartloadEnableTemp {
    /** enable the adaptive CH- and or DHW-partload calulation */
    value: UCH;
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

  /** InitialisationSequence_DK */
  @inherit(r)
  @ext(0x9a, 1)
  model InitialisationSequence {
    /** value:0 -> off1-> full initialisation incl. all defaultvalues (done in the production) */
    value: UCH;
  }

  /** FlowSetPotmeter */
  @inherit(r)
  @ext(0x19, 0)
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

  /** DHW_Switch */
  @inherit(r)
  @ext(0xf3, 0x3)
  model HwcSwitch {
    /** DHW on/off */
    value: onoff;
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

  /** BoilerType_2_DK */
  @inherit(r)
  @ext(0xc, 1)
  model BoilerType2 {
    /** second Boiler typ of the bmu */
    value: ULG;
  }

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

  enum Values_Gasvalve {
    off: 240,
    on: 15,
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

  enum Values_Flame {
    off: 240,
    on: 15,
  }

  enum Values_IFCFault {
    off: 240,
    on: 15,
  }

  enum Values_Brennstoffventil {
    off: 240,
    on: 15,
  }

  enum Values_VolatileLockout {
    no: 240,
    yes: 15,
  }

  enum Values_R_ckmeldungBrennstoffventil1 {
    off: 240,
    on: 15,
  }

  enum Values_R_ckmeldungBrennstoffventil2 {
    off: 240,
    on: 15,
  }

  enum Values_Ignitor {
    off: 240,
    on: 15,
  }

  enum Values_TemplimiterFault {
    off: 240,
    on: 15,
  }

  enum Values_ADCOk {
    off: 240,
    on: 15,
  }

  enum Values_FanFault {
    off: 240,
    on: 15,
  }

  enum Values_Templimiter {
    off: 240,
    on: 15,
  }

  enum Values_SRTFINSDFeedback {
    off: 240,
    on: 15,
  }

  enum Values_SRSyphonINSDSwitch {
    no: 240,
    yes: 15,
  }

  enum Values_TemplimiterWithNTC {
    no: 240,
    yes: 15,
  }

  enum Values_VolatileLockoutIFCGV {
    no: 240,
    yes: 15,
  }

  enum Values_R_ckmeldungBrennstoffventil3 {
    off: 240,
    on: 15,
  }

  /** included parts */
  union _includes {
    Errors_inc,
    Service_inc,
  }
}
