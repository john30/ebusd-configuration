import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010021961_inc {
  // ,BAI00,ecoCompact (euro),0010015600 296

  /** default *w for user level "NOT_YET_CONFIRMED" */
  @write
  @auth("NOT_YET_CONFIRMED")
  @base(MF, 0x9, 0xe)
  model w_1 {}

  /** default *wi for user level "install_NOT_YET_CONFIRMED" */
  @write
  @auth("install_NOT_YET_CONFIRMED")
  @base(MF, 0x9, 0xe)
  model wi_1 {}

  /** default *ws for user level "service_NOT_YET_CONFIRMED" */
  @write
  @auth("service_NOT_YET_CONFIRMED")
  @base(MF, 0x9, 0xe)
  model ws_1 {}
  // ##### Diagnose Ebene 1 #####

  /** d.00 heating partload */
  @inherit(r, wi_1)
  @ext(0x6c, 0)
  model PartloadHcKW {
    /** Heating part load */
    value: power;
  }

  /** d.01 central heating overrun time */
  @inherit(r, wi_1)
  @ext(0x64, 0)
  model WPPostrunTime {
    /** water pump overrun time for heating mode */
    value: minutes0;
  }

  /** d.02 Max blocking time CH */
  @inherit(r, wi_1)
  @ext(0x21, 0)
  model BlockTimeHcMax {
    /** Maximum burner anti cycling period at 20°C flow temperature set point */
    value: minutes0;
  }

  /** d.03 Temp DHW: Hot water flow temperature */
  @ext(0x16, 0)
  model HwcTemp is ReadonlyRegister<tempsensor>;

  /** d.04 Storage temperature: Current temperature for warm start sensor (combi boiler) / Current storage tank sensor (system boiler only) */
  @ext(0x17, 0)
  model StorageTemp is ReadonlyRegister<tempsensor>;

  /** d.05 flow/return setpoint: Flow temperature target value or return target value when return regulation is set */
  @ext(0x39, 0)
  model FlowTempDesired is ReadonlyRegister<temp>;

  /** d.06 DHW setpoint: Hot water temperature target value */
  @ext(0xea, 0x3)
  model HwcTempDesired is ReadonlyRegister<temp>;

  /** d.07 Storage temperature set point: Warm start temperature value (combi boiler only); Storage temperature target value (system boiler only) */
  @ext(0x4, 0)
  model StorageTempDesired is ReadonlyRegister<temp>;

  /** d.08 Room thermostat 230 V: External controls heat demand (Clamp 3-4) */
  @ext(0x2a, 0)
  model ACRoomthermostat is ReadonlyRegister<onoff>;

  /** d.09 ext flowsetpoint: minimum out of Kl.7 and eBus flow setpoint */
  @ext(0xf3, 0x4)
  model ExtFlowTempDesiredMin is ReadonlyRegister<temp>;

  /** d.10 Central heating pump: Internal central heating pump */
  @ext(0x44, 0)
  model WP is ReadonlyRegister<onoff>;

  /** d.11 External heating pump: External central heating pump */
  @ext(0x3f, 0)
  model ExtWP is ReadonlyRegister<onoff>;

  /** d.12 storage load pump: tank load pump demand */
  @ext(0x9e, 0)
  model Storageloadpump is ReadonlyRegister<percent0>;

  /** d.13 Circulation pump: Hot water circulation pump (via external module) */
  @ext(0x7b, 0)
  model CirPump is ReadonlyRegister<onoff>;

  /** d.14 Desired heating pump power */
  @inherit(r, wi_1)
  @ext(0xa1, 0)
  model PumpPowerDesired {
    /** PWM-Desired central heating pump power */
    @unit("%")
    @values(Values_PumpPowerDesired)
    value: UCH;
  }

  /** d.15 Current heating pump power: Current central heating pump power */
  @ext(0x73, 0)
  model PumpPower is ReadonlyRegister<UCH>;

  /** d.16 Room thermostat 24 V: xternal controls heat demand (Clamp 3-4) */
  @ext(0xe, 0)
  model DCRoomthermostat is ReadonlyRegister<onoff>;

  /** d.22 DHW demand: Domestic hot water demand */
  @ext(0x58, 0)
  model HwcDemand is ReadonlyRegister<yesno>;

  /** d.23 Heating on/off switch */
  @inherit(r, wi_1)
  @ext(0xf2, 0x3)
  model HeatingSwitch {
    /** Central heating on/off switch */
    value: onoff;
  }

  /** d.25 DHW demand enabled: hot water release (tank storage) via eBus Control */
  @ext(0x47, 0x4)
  model StoragereleaseClock is ReadonlyRegister<yesno>;

  /** d.33 Target fan speed */
  @inherit(r)
  @ext(0x24, 0)
  model TargetFanSpeed {
    /** Fan speed setpoint */
    @unit("1/min")
    value: UIN;
  }

  /** d.34 Current fan speed */
  @inherit(r)
  @ext(0x83, 0)
  model FanSpeed {
    /** Current fan speed */
    @unit("1/min")
    value: UIN;
  }

  /** d.35 Position TWV: Position of diverter valve; 100 = DHW, 0 = heating, 40 = middle position */
  @ext(0x54, 0)
  model PositionValveSet is ReadonlyRegister<UCH>;

  /** d.36 DHW waterflow: domestic hot water flow sensor */
  @ext(0x55, 0)
  model HwcWaterflow is ReadonlyRegister<uin100>;

  /** d.40 Supply temperature: CH supply temperature sensor (VF2) */
  @ext(0x18, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** d.41 Return temperature: CH return temperature sensor */
  @ext(0x98, 0)
  model ReturnTemp is ReadonlyRegister<tempmirrorsensor>;

  /** d.44 Ionisation voltage */
  @inherit(r)
  @ext(0xa4, 0)
  model IonisationVoltageLevel {
    /** digital ionisation voltage> 80 no flame< 40 good flame */
    @divisor(10)
    value: SIN;
  }

  /** d.47 Outdoor temperature: Outdoor temperature sensor (uncorrected value) value and status */
  @ext(0x76, 0)
  model OutdoorstempSensor is ReadonlyRegister<tempsensor>;

  /** d.67 Remaining burner block time: Remaining burner anti cycling time */
  @ext(0x38, 0)
  model RemainingBoilerblocktime is ReadonlyRegister<minutes0>;

  /** d.90 Digital control recognized: Digital regulator status */
  @ext(0, 0x4)
  model EBusHeatcontrol is ReadonlyRegister<yesno>;

  /** d.91 DCF Status */
  @ext(0x69, 0)
  model DcfState is ReadonlyRegister<dcfstate>;
  // ##### Expertenebene #####

  /** Demand external HWC tank (via contact) */
  @ext(0, 0)
  model ExternalHwcSwitch is ReadonlyRegister<onoff>;

  /** CH water pressure */
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

  /** SD_VolatileLockout_DK: TRUE: STB errors are locking */
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

  /** SD_Flame_Sensing_ASIC: ioni/adc value from the flame control circuit */
  @ext(0x2f, 0)
  model FlameSensingASIC is ReadonlyRegister<UIN>;

  /** HZ_UnderHundred_SwiActi: Heat switch cycles under hundred */
  @ext(0x30, 0)
  model HcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** BW_UnderHundred_SwiActi: DHW switch cycles under hundred */
  @ext(0x31, 0)
  model HwcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** EbusSourceOn_DK: Activation signal of the eBus source */
  @ext(0x34, 0)
  model EbusSourceOn is ReadonlyRegister<onoff>;

  /** FluegasvalveOpen_DK: Feedback from the flue gas valve */
  @ext(0x3c, 0)
  model Fluegasvalve is ReadonlyRegister<onoff>;

  /** External_Faultmessage_DK: external fault message */
  @ext(0x3e, 0)
  model ExternalFaultmessage is ReadonlyRegister<onoff>;

  /** SD_Gasvalve_ASICFeedback_DK: Gas valve feedback (from ASIC) */
  @ext(0x47, 0)
  model GasvalveASICFeedback is ReadonlyRegister<onoff2>;

  /** SD_Gasvalve_uCFeedback_DK: Gas valve feedback (from micro controller) */
  @ext(0x48, 0)
  model GasvalveUCFeedback is ReadonlyRegister<onoff2>;

  /** SD_Ignitor_DK: Ignition status */
  @ext(0x49, 0)
  model Ignitor is ReadonlyRegister<onoff2>;

  /** DHW_Types_DK: DHW type of the appliance */
  @ext(0x4b, 0)
  model HwcTypes is ReadonlyRegister<UCH>;

  /** DHW impellor switch: DHW demand from impeller switch */
  @ext(0x57, 0)
  model HwcImpellorSwitch is ReadonlyRegister<yesno>;

  /** WarmstartDemand: Status of warmstarr mode */
  @ext(0x3a, 0x4)
  model WarmstartDemand is ReadonlyRegister<yesno>;

  /** BoilerType: Boiler typ of the BMU */
  @ext(0x5e, 0)
  model BoilerType is ReadonlyRegister<UCH>;

  /** ParamToken: Token for parameter managment */
  @ext(0x60, 0)
  model ParamToken is ReadonlyRegister<UCH>;

  /** Ext. return temperature: External return temperature sensor */
  @ext(0x6b, 0)
  model ReturnTempExternal is ReadonlyRegister<tempsensor>;

  /** Floor heating contact */
  @ext(0x70, 0)
  model FloorHeatingContact is ReadonlyRegister<onoff>;

  /** Feedback of the temperature limiter sensor */
  @ext(0x77, 0)
  model Templimiter is ReadonlyRegister<onoff2>;

  /** eBUS voltage feedback */
  @ext(0x7f, 0)
  model EbusVoltage is ReadonlyRegister<onoff>;

  /** Flue flap open: Exhaust (flue) flap open */
  @ext(0x89, 0)
  model FluegasvalveOpen is ReadonlyRegister<onoff>;

  /** Testbyte (relevant for testers) */
  @ext(0x99, 0)
  model Testbyte is ReadonlyRegister<UCH>;

  /** DSN: Device Specific number */
  @ext(0x9a, 0)
  model DSN is ReadonlyRegister<UIN>;

  /** Target fan speed */
  @inherit(r)
  @ext(0x9f, 0)
  model TargetFanSpeedOutput {
    /** Target fan speed */
    @unit("1/min")
    value: UIN;
  }

  /** Power number */
  @inherit(r)
  @ext(0xaa, 0)
  model PowerValue {
    /** Power value of the boiler (minimum and maximum) */
    @maxLength(6)
    value: HEX;
  }

  /** Statenumber: Status number */
  @ext(0xab, 0)
  model Statenumber is ReadonlyRegister<UCH>;

  /** WaterpressureBranchControlOff_DK: Water pressure branch control switch */
  @ext(0xaf, 0)
  model WaterpressureBranchControlOff is ReadonlyRegister<onoff>;

  /** DSN starting address */
  @ext(0x31, 0x4)
  model DSNStart is ReadonlyRegister<UIN>;

  /** VR65 memory module: External memory module (VR65) connected */
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

  /** WP_SecondStage: Second stage of the pump activated */
  @ext(0xed, 0)
  model WPSecondStage is ReadonlyRegister<onoff>;

  /** SD_STL_with_NTC: Temperature limiter (1 = NTC; 0 = switching contact) */
  @ext(0xd2, 0)
  model TemplimiterWithNTC is ReadonlyRegister<yesno2>;

  /** SD_VolatileLockout_IFC_GV: All IFC errors are non-volatile */
  @ext(0xd3, 0)
  model VolatileLockoutIFCGV is ReadonlyRegister<yesno2>;

  /** DisplayMode: Display mode of the appliance */
  @ext(0xda, 0)
  model DisplayMode is ReadonlyRegister<UCH>;

  /** Gasventil 3: Gas valve switching signal (from the processor) */
  @ext(0xdb, 0)
  model Gasvalve3UC is ReadonlyRegister<onoff2>;

  /** InitialisationEEPROM: EEPROM initialization (for production) */
  @ext(0xdc, 0)
  model InitialisationEEPROM is ReadonlyRegister<yesno>;

  /** Eingang Schaltuhr: Timer input (block heatdemand) */
  @ext(0xde, 0)
  model TimerInputHc is ReadonlyRegister<onoff>;

  /** Minimum fan speed */
  @inherit(r)
  @ext(0xdf, 0)
  model FanMinSpeedOperation {
    /** Fan minimum speed */
    @unit("1/min")
    value: UIN;
  }

  /** Maximum fan speed */
  @inherit(r)
  @ext(0xe0, 0)
  model FanMaxSpeedOperation {
    /** Fan maximum speed */
    @unit("1/min")
    value: UIN;
  }

  /** External gas valve: External solenoid valve */
  @ext(0xe4, 0)
  model ExternGasvalve is ReadonlyRegister<onoff>;

  /** DCF date/time */
  @inherit(r)
  @ext(0xe5, 0)
  model DCFTimeDate {
    vti: VTI;
    hda: HDA;
  }

  /** DHW switch */
  @inherit(r, wi_1)
  @ext(0xf3, 0x3)
  model HwcSwitch {
    /** Domestic hot water switch */
    value: onoff;
  }

  /** ProductionByte */
  @ext(0x3e, 0x4)
  model ProductionByte is ReadonlyRegister<UCH>;

  /** SerialNumber */
  @inherit(r)
  @ext(0x3f, 0x4)
  model SerialNumber {
    /** Serial number AI */
    @maxLength(8)
    value: HEX;
  }
  // ##### Diagnose Ebene 2 #####

  /** d.17 Return control */
  @inherit(r, wi_1)
  @ext(0xb3, 0)
  model ReturnRegulation {
    /** Activation of the return control */
    value: onoff;
  }

  /** d.18 CH pump mode */
  @inherit(r, wi_1)
  @ext(0xb7, 0)
  model HcPumpMode {
    /** Pump mode */
    @values(Values_HcPumpMode)
    value: UCH;
  }

  /** d.20 Maximum DHW temperature */
  @inherit(r, wi_1)
  @ext(0xd9, 0)
  model HwcTempMax {
    /** Max. Speichersollwert. Limits the maximum adjustment range of the potentiometer (right stop). */
    value: temp;
  }

  /** d.26 Optional relay */
  @inherit(r, wi_1)
  @ext(0xb8, 0)
  model OptionalRelais {
    /** Function of optional relay */
    @values(Values_OptionalRelais)
    value: UCH;
  }

  /** d.27 Accessory relay 1 */
  @inherit(r, wi_1)
  @ext(0xb9, 0)
  model AccessoriesOne {
    /** Function of accessory relay 1 */
    @values(Values_AccessoriesOne)
    value: UCH;
  }

  /** d.28 Accessory relay 2 */
  @inherit(r, wi_1)
  @ext(0xba, 0)
  model AccessoriesTwo {
    /** Function of accessory relay 2 */
    @values(Values_AccessoriesTwo)
    value: UCH;
  }

  /** d.50 Minimum fan speed offset */
  @inherit(r, wi_1)
  @ext(0xa7, 0)
  model FanSpeedOffsetMin {
    /** Fan minimum speed offset */
    @unit("1/min")
    value: SIN;
  }

  /** d.51 Maximum fan speed offset */
  @inherit(r, wi_1)
  @ext(0xa8, 0)
  model FanSpeedOffsetMax {
    /** Fan maximum speed offset */
    @unit("1/min")
    value: SIN;
  }

  /** d.58 solar function */
  @inherit(r, wi_1)
  @ext(0x73, 0x4)
  model SolPostHeat {
    /** special DHW functions0: solar function deactivated (default)1: solar function activated and DHW setpoint minimum 60°C2: solar function activated and DHW setpoint like combi standard (min 35°)3: DHW setpoint minimum 60°C (poti) */
    value: UCH;
  }

  /** d.60 Shutdowns by the temp limiter: Number of shutdowns by the safety temperature limiter */
  @ext(0x20, 0)
  model DeactivationsTemplimiter is ReadonlyRegister<UCH>;

  /** d.61 Ignition failures: Number of ignition failures (unsuccessful last-run or faulty flame signal) */
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

  /** d.65 Maximum ignition time */
  @inherit(r)
  @ext(0x2c, 0)
  model MaxIgnitiontime {
    /** maximum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** d.68 Failed ignition (1nd attempt): Number of unsuccessful ignition attempts (in the first attempt) */
  @ext(0x6e, 0)
  model CounterStartattempts1 is ReadonlyRegister<temp0>;

  /** d.69 Failed ignition (2nd attempt): Number of unsuccessful ignition attempts (in the second attempt) */
  @ext(0x6f, 0)
  model CounterStartattempts2 is ReadonlyRegister<temp0>;

  /** d.70 diverter valve position */
  @inherit(r, wi_1)
  @ext(0x2a, 0x4)
  model ValveMode {
    /** Set diverter valve position 0=normal mode, 1=middle position (GB), 2=permanent CH position */
    value: UCH;
  }

  /** d.71 CH max flow temperature */
  @inherit(r, wi_1)
  @ext(0xe, 0x4)
  model FlowsetHcMax {
    /** Setting the maximum flow setpoint in heating mode (with left-hand stop of the potentiometer) */
    value: temp;
  }

  /** d.72 postrun time storage */
  @inherit(r, wi_1)
  @ext(0x11, 0x4)
  model HwcPostrunTime {
    /** Pump overrun time after charging a storage (charging through C1-C2, external/internal tank with tank sensor) */
    @unit("s")
    @factor(10)
    value: UCH;
  }

  /** d.73 Warmstart offset */
  @inherit(r, wi_1)
  @ext(0x10, 0x4)
  model WarmstartOffset {
    /** Offset for warm start target value (combination boilers only) */
    value: temp;
  }

  /** d.75 Maximum storage time */
  @inherit(r, wi_1)
  @ext(0x66, 0)
  model StorageLoadTimeMax {
    /** Maximum water storing time for storage without own controls */
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

  /** d.77 hot water partload */
  @inherit(r, wi_1)
  @ext(0x8, 0x4)
  model PartloadHwcKW {
    /** storage part load (storage charging capacity limit) */
    value: power;
  }

  /** d.78 Max value flow temp storage */
  @inherit(r, wi_1)
  @ext(0xa6, 0)
  model FlowsetHwcMax {
    /** storage charging temperature limit (target flow temperature in storage mode) */
    value: temp;
  }

  /** d.80 Hz. Hours in CH mode: Hours of operation in heating mode */
  @ext(0x28, 0)
  model HcHours is ReadonlyRegister<hoursum2>;

  /** d.81 Hours in DHW mode: Hours of DHW operation */
  @ext(0x22, 0)
  model HwcHours is ReadonlyRegister<hoursum2>;

  /** d.82 CH mode starts */
  @inherit(r)
  @ext(0x29, 0)
  model HcStarts {
    /** Number of CH mode starts */
    @factor(100)
    value: UIN;
  }

  /** d.83 DHW mode starts */
  @inherit(r)
  @ext(0x23, 0)
  model HwcStarts {
    /** Number of DHW mode starts */
    @factor(100)
    value: UIN;
  }

  /** d.84 Hours till service */
  @inherit(r, wi_1)
  @ext(0xac, 0)
  model HoursTillService {
    /** Hours left before service is needed */
    value: hoursum2;
  }

  /** d.85 Minimal power to avoid condensation */
  @inherit(r, wi_1)
  @ext(0xec, 0)
  model AntiCondensValue {
    /** Minimal power to avoid condensation */
    @unit("kW / %")
    value: UCH;
  }

  /** d.88 SpecialAdj */
  @inherit(r, wi_1)
  @ext(0x76, 0x4)
  model SpecialAdj {
    /** switching on threshold for recognition of water tapping0 = 1,5 l/min and no delay, 1 = 3,7 l/min and 2s delay */
    value: UCH;
  }

  /** d.93 Hardware ID */
  @inherit(r, ws_1)
  @ext(0x30, 0x4)
  model DSNOffset {
    /** Hardware ID (DSN) */
    value: UCH;
  }

  /** d.96 Reset to defaults */
  @inherit(r, wi_1)
  @ext(0x68, 0x4)
  model SetFactoryValues {
    /** Reset to factory defaults */
    value: yesno;
  }
  // ##### Wartungsdaten #####

  /** Temperature gradient failures: Number of boiler shutdown due to high gradient (S.54) */
  @ext(0x11, 0)
  model TempGradientFailure is ReadonlyRegister<temp0>;

  /** TempDiffBlock: Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures */
  @ext(0x12, 0)
  model TempDiffBlock is ReadonlyRegister<temp0>;

  /** TempDiffFailure: Number of shutdowns due to incorrect difference between supply and return temperatures */
  @ext(0x13, 0)
  model TempDiffFailure is ReadonlyRegister<temp0>;

  /** Betriebsstunden Pumpe: Pump operating hours */
  @ext(0x14, 0)
  model PumpHours is ReadonlyRegister<hoursum2>;

  /** CH_PumpCommunt: Pump times switched on */
  @ext(0x15, 0)
  model HcPumpStarts is ReadonlyRegister<cntstarts2>;

  /** 3WV Schaltspiele: Number of times 3WV value operated */
  @ext(0x1a, 0)
  model ValveStarts is ReadonlyRegister<cntstarts2>;

  /** Fan operating hours: Operating hours of the fan */
  @ext(0x1b, 0)
  model FanHours is ReadonlyRegister<hoursum2>;

  /** Fan number of starts: Number of times fan switched on */
  @ext(0x1c, 0)
  model FanStarts is ReadonlyRegister<cntstarts2>;

  /** Overflow PM counter: Predictive Maintenance counter have got an overflow */
  @ext(0x1e, 0)
  model OverflowCounter is ReadonlyRegister<yesno>;

  /** MaxTempDiffExtTFT: Predictive maintenance data */
  @ext(0x27, 0)
  model TempMaxDiffExtTFT is ReadonlyRegister<temp>;

  /** minimum ignition time */
  @inherit(r)
  @ext(0x2b, 0)
  model MinIgnitiontime {
    /** minimum ignition time */
    @unit("s")
    @divisor(10)
    value: UCH;
  }

  /** Maximum DHW temperature: Maximum temperature measured at the tap water outlet sensor */
  @ext(0x35, 0)
  model Maintenancedata_HwcTempMax is ReadonlyRegister<temp>;

  /** Maximum storage temperature: Maximum storage tank temperature */
  @ext(0x36, 0)
  model StorageTempMax is ReadonlyRegister<temp>;

  /** Maximum CH temperature: Maximum CH flow temperature */
  @ext(0x37, 0)
  model FlowTempMax is ReadonlyRegister<temp>;

  /** Fan_PWM_Sum: Predictive Maintenance data for the fan damage recognition */
  @ext(0x3a, 0)
  model FanPWMSum is ReadonlyRegister<UIN>;

  /** Fan_PWM_Test: Predictive Maintenance data for the fan damage recognition */
  @ext(0x3b, 0)
  model FanPWMTest is ReadonlyRegister<UCH>;

  /** MaxDeltaFlowReturn: Maintenance data */
  @ext(0x3d, 0)
  model DeltaFlowReturnMax is ReadonlyRegister<temp>;

  /** TankLoadPumpOperationHours: Preditive maintenance data */
  @ext(0x4c, 0)
  model StorageLoadPumpHours is ReadonlyRegister<hoursum2>;

  /** TankloadPumpCommunt: Preditive maintenance data */
  @ext(0x4f, 0)
  model StorageloadPumpStarts is ReadonlyRegister<cntstarts2>;

  /** Max. WW Vorlauftemp.: Maximalwert des Warmwassersensors */
  @ext(0x56, 0)
  model HwcWaterflowMax is ReadonlyRegister<uin100>;

  /** Failed ignition (3rd attempt): Number of unsuccessful ignition attempts (in the 3rd attempt) */
  @ext(0x81, 0)
  model CounterStartAttempts3 is ReadonlyRegister<temp0>;

  /** Failed ignition (4th attempt): Number of unsuccessful ignition attempts (in the 4th attempt) */
  @ext(0x82, 0)
  model CounterStartAttempts4 is ReadonlyRegister<temp0>;

  /** Max flow return temperature */
  @ext(0xbe, 0)
  model ReturnTempMax is ReadonlyRegister<temp>;

  /** PumpDHWFlowSum: Summed up DHW flow rate */
  @ext(0xc1, 0)
  model PumpHwcFlowSum is ReadonlyRegister<UIN>;

  /** PumpDHWFlowNumber: Number of times DHW flow rate was detected */
  @ext(0xc2, 0)
  model PumpHwcFlowNumber is ReadonlyRegister<UCH>;

  /** Max. WW Vorlauftemp.: Maximum flow temperature for WW */
  @ext(0xc3, 0)
  model SHEMaxFlowTemp is ReadonlyRegister<temp>;

  /** SHE_MaxDeltaFlowDHW: maximum difference between flow and DHW outlet temperature */
  @ext(0xc4, 0)
  model SHEMaxDeltaHwcFlow is ReadonlyRegister<temp>;

  /** PrEnergySumDHW1 */
  @inherit(r, wi_1)
  @ext(0xc5, 0)
  model PrEnergySumHwc1 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountDHW1 */
  @inherit(r, wi_1)
  @ext(0xc6, 0)
  model PrEnergyCountHwc1 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergySumDHW2 */
  @inherit(r, wi_1)
  @ext(0xc7, 0)
  model PrEnergySumHwc2 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountDHW2 */
  @inherit(r, wi_1)
  @ext(0xc8, 0)
  model PrEnergyCountHwc2 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergySumDHW3 */
  @inherit(r, wi_1)
  @ext(0xc9, 0)
  model PrEnergySumHwc3 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountDHW3 */
  @inherit(r, wi_1)
  @ext(0xca, 0)
  model PrEnergyCountHwc3 {
    /** Maintenance data */
    value: ULG;
  }

  /** MaxWaterFlowCH: v */
  @ext(0xd0, 0)
  model WaterHcFlowMax is ReadonlyRegister<UIN>;

  /** WaterpressureVariantSum: Maintenance data */
  @ext(0xf0, 0)
  model WaterpressureVariantSum is ReadonlyRegister<pressm2>;

  /** WaterpressureMeasureCounter: Maintenance data */
  @ext(0xf1, 0)
  model WaterpressureMeasureCounter is ReadonlyRegister<UCH>;

  /** PrAPSCounter: Maintenance data */
  @ext(0xf2, 0)
  model PrAPSCounter is ReadonlyRegister<UCH>;

  /** PrAPSSum: Maintenance data */
  @ext(0xf3, 0)
  model PrAPSSum is ReadonlyRegister<seconds2>;

  /** PrVortexFlowSensorValue */
  @inherit(r)
  @ext(0xf4, 0)
  model PrVortexFlowSensorValue {
    /** Maintenance data */
    @unit("ADC")
    value: SIN;
  }

  /** PrEnergySumCH1 */
  @inherit(r, wi_1)
  @ext(0xf5, 0)
  model PrEnergySumHc1 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH1 */
  @inherit(r, wi_1)
  @ext(0xf6, 0)
  model PrEnergyCountHc1 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergySumCH2 */
  @inherit(r, wi_1)
  @ext(0xf7, 0)
  model PrEnergySumHc2 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH2 */
  @inherit(r, wi_1)
  @ext(0xf8, 0)
  model PrEnergyCountHc2 {
    /** Wartungsdaten */
    value: ULG;
  }

  /** PrEnergySumCH3 */
  @inherit(r, wi_1)
  @ext(0xf9, 0)
  model PrEnergySumHc3 {
    /** Maintenance data */
    value: ULG;
  }

  /** PrEnergyCountCH3 */
  @inherit(r, wi_1)
  @ext(0xfa, 0)
  model PrEnergyCountHc3 {
    /** Maintenance data */
    value: ULG;
  }

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
  @condition(Id.Id.sw, ">=413")
  namespace SW {
    /** d.92 APC_ComStatus_DK: actoSTORE communication status */
    @ext(0x62, 0)
    model APCComStatus is ReadonlyRegister<UCH>;

    /** d.74 APC_LegioProtection */
    @inherit(r, wi_1)
    @ext(0x97, 0x4)
    model APCLegioProtection {
      /** Legionella protection for internal storage */
      value: UCH;
    }
  }

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
