import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
import "./service_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010024646_inc {
  // ,BAI00,Vaillant ecoTEC,0010024646

  /** Statenumber_DK: status number */
  @ext(0xab, 0)
  model Statenumber is ReadonlyRegister<UCH>;

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

  /** d.67 Remaining burner block time: Remaining burner anti cycling time */
  @ext(0x38, 0)
  model RemainingBoilerblocktime is ReadonlyRegister<minutes0>;

  /** d.68 ignition attempts 1: unsuccessfull ignitions in the first attempt */
  @ext(0x6e, 0)
  model CounterStartattempts1 is ReadonlyRegister<temp0>;

  /** d.69 ignition attempts 2: unsuccessfull ignitions in the second attempt */
  @ext(0x6f, 0)
  model CounterStartattempts2 is ReadonlyRegister<temp0>;

  /** d.90 Digital control recognized: Digital regulator status */
  @ext(0, 0x4)
  model EBusHeatcontrol is ReadonlyRegister<yesno>;

  /** Flame */
  @ext(0x5, 0)
  model Flame is ReadonlyRegister<onoff2>;

  /** Fan operation hours */
  @ext(0x1b, 0)
  model FanHours is ReadonlyRegister<hoursum2>;

  /** FanCommunt_DK: commutations of the fan */
  @ext(0x1c, 0)
  model FanStarts is ReadonlyRegister<cntstarts2>;

  /** CounterStartAttempts3_DK: unsuccessfull ignitions in the third attempt */
  @ext(0x81, 0)
  model CounterStartAttempts3 is ReadonlyRegister<temp0>;

  /** CounterStartAttempts4_DK: unsuccessfull ignitions in the fourth attempt */
  @ext(0x82, 0)
  model CounterStartAttempts4 is ReadonlyRegister<temp0>;

  /** TempDiffBlock_DK: Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures */
  @ext(0x12, 0)
  model TempDiffBlock is ReadonlyRegister<temp0>;

  /** TempDiffFailure_DK: Number of cut offs of the boilers cause of to high/incorrect differences of flow/return temperatures */
  @ext(0x13, 0)
  model TempDiffFailure is ReadonlyRegister<temp0>;

  /** TWV_Communt_DK: commutations of the three way valve */
  @ext(0x1a, 0)
  model ValveStarts is ReadonlyRegister<cntstarts2>;

  /** TemplimiterWithNTC: Safety temperature limit concept */
  @ext(0xd2, 0)
  model TemplimiterWithNTC is ReadonlyRegister<yesno2>;

  /** HcHours: Central heating operation hours */
  @ext(0x38, 1)
  model HcHours is ReadonlyRegister<hoursum>;

  /** HcPumpStarts: Central heating pump starts */
  @ext(0x56, 0x3)
  model HcPumpStarts is ReadonlyRegister<cntstarts3>;

  /** HcStarts: Central heating burner starts */
  @ext(0x38, 0x3)
  model HcStarts is ReadonlyRegister<cntstarts2>;

  /** HwcHours: Hot water operation hours */
  @ext(0x77, 1)
  model HwcHours is ReadonlyRegister<hoursum>;

  /** HwcStarts: Hot water burner starts */
  @ext(0x77, 0x3)
  model HwcStarts is ReadonlyRegister<cntstarts2>;

  /** PumpHours: Pump operation hours */
  @ext(0x56, 1)
  model PumpHours is ReadonlyRegister<hoursum>;

  /** StorageLoadPumpHours: Storage load pump operation hours */
  @ext(0x73, 1)
  model StorageLoadPumpHours is ReadonlyRegister<hoursum>;

  /** StorageloadPumpStarts: Storage load pump starts */
  @ext(0x73, 0x3)
  model StorageloadPumpStarts is ReadonlyRegister<cntstarts2>;

  /** Valve mode */
  @ext(0xf4, 0x3)
  model ValveMode is ReadonlyRegister<UCH>;

  /** HcPumpMode: Heating pump mode */
  @ext(0x4e, 0x4)
  model HcPumpMode is ReadonlyRegister<pumpmode>;

  /** Dodane parametry na podstawie wyników komendy grab */

  /** DisplayMode: Display operation mode */
  @ext(0xda, 0)
  model DisplayMode is ReadonlyRegister<UCH>;

  /** WaterpressureMeasureCounter: Water pressure measurement counter */
  @ext(0xf1, 0)
  model WaterpressureMeasureCounter is ReadonlyRegister<UCH>;

  /** HwcUnderHundredStarts: Hot water starts under hundred counter */
  @ext(0x31, 0)
  model HwcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** HcUnderHundredStarts: Heating starts under hundred counter */
  @ext(0x30, 0)
  model HcUnderHundredStarts is ReadonlyRegister<UCH>;

  /** SHEMaxFlowTemp: Secondary heat exchanger maximum flow temperature */
  @ext(0xc3, 0)
  model SHEMaxFlowTemp is ReadonlyRegister<temp>;

  /** HwcTempMax: Maximum hot water temperature */
  @ext(0x43, 0x4)
  model HwcTempMax is ReadonlyRegister<temp>;
  
  /** Maintenancedata_HwcTempMax: Maximum hot water temperature from maintenance data */
  @ext(0x35, 0)
  model Maintenancedata_HwcTempMax is ReadonlyRegister<temp>;

  /** StorageTempMax: Maximum storage temperature */
  @ext(0x36, 0)
  model StorageTempMax is ReadonlyRegister<temp>;

  /** FlowTempMax: Maximum flow temperature */
  @ext(0x37, 0)
  model FlowTempMax is ReadonlyRegister<temp>;

  /** ReturnTempMax: Maximum return temperature */
  @ext(0xbe, 0)
  model ReturnTempMax is ReadonlyRegister<temp>;

  /** ModulationTempDesired: Desired modulation temperature */
  @ext(0x2e, 0)
  model ModulationTempDesired is ReadonlyRegister<temp>;

  /** PumpPower: Pump power value */
  @ext(0x73, 0)
  model PumpPower is ReadonlyRegister<UCH>;

  /** PumpPowerDesired: Desired pump power */
  @ext(0xa1, 0)
  model PumpPowerDesired is ReadonlyRegister<UCH>;

  /** HwcWaterflow: Hot water flow rate */
  @ext(0x55, 0)
  model HwcWaterflow is ReadonlyRegister<uin100>;

  /** HwcWaterflowMax: Maximum hot water flow rate */
  @ext(0x56, 0)
  model HwcWaterflowMax is ReadonlyRegister<uin100>;

  /** HwcImpellorSwitch: Hot water impellor switch */
  @ext(0x57, 0)
  model HwcImpellorSwitch is ReadonlyRegister<yesno>;

  /** VortexFlowSensor: Vortex flow sensor value */
  @ext(0xd5, 0)
  model VortexFlowSensor is ReadonlyRegister<UIN>;

  /** OverflowCounter: Overflow counter */
  @ext(0x1e, 0)
  model OverflowCounter is ReadonlyRegister<yesno>;

  /** SecondPumpMode: Second pump mode */
  @ext(0xb, 0x4)
  model SecondPumpMode is ReadonlyRegister<UCH>;

  /** ExternalHwcSwitch: External hot water circuit switch */
  @ext(0x0, 0)
  model ExternalHwcSwitch is ReadonlyRegister<onoff>;

  /** HwcTempDesired: Hot water temperature desired value */
  @ext(0xea, 0x3)
  model HwcTempDesired is ReadonlyRegister<temp>;

  /** WarmstartDemand: Warm start demand */
  @ext(0x3a, 0x4)
  model WarmstartDemand is ReadonlyRegister<onoff>;

  /** Templimiter: Temperature limiter status */
  @ext(0x77, 0)
  model Templimiter is ReadonlyRegister<onoff>;

  /** HoursTillService: Hours till next service */
  @ext(0x20, 0x4)
  model HoursTillService is ReadonlyRegister<ULG>;

  /** TimerInputHc: Timer input for heating circuit */
  @ext(0xde, 0)
  model TimerInputHc is ReadonlyRegister<onoff>;

  /** PrEnergySumHwc1: Energy sum hot water circuit 1 */
  @ext(0xc5, 0)
  model PrEnergySumHwc1 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHwc1: Energy count hot water circuit 1 */
  @ext(0xc6, 0)
  model PrEnergyCountHwc1 is ReadonlyRegister<UIN>;

  /** PrEnergySumHwc2: Energy sum hot water circuit 2 */
  @ext(0xc7, 0)
  model PrEnergySumHwc2 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHwc2: Energy count hot water circuit 2 */
  @ext(0xc8, 0)
  model PrEnergyCountHwc2 is ReadonlyRegister<UIN>;

  /** PrEnergySumHwc3: Energy sum hot water circuit 3 */
  @ext(0xc9, 0)
  model PrEnergySumHwc3 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHwc3: Energy count hot water circuit 3 */
  @ext(0xca, 0)
  model PrEnergyCountHwc3 is ReadonlyRegister<UIN>;

  /** PrEnergySumHc1: Energy sum heating circuit 1 */
  @ext(0xf5, 0)
  model PrEnergySumHc1 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHc1: Energy count heating circuit 1 */
  @ext(0xf6, 0)
  model PrEnergyCountHc1 is ReadonlyRegister<UIN>;

  /** PrEnergySumHc2: Energy sum heating circuit 2 */
  @ext(0xf7, 0)
  model PrEnergySumHc2 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHc2: Energy count heating circuit 2 */
  @ext(0xf8, 0)
  model PrEnergyCountHc2 is ReadonlyRegister<UIN>;

  /** PrEnergySumHc3: Energy sum heating circuit 3 */
  @ext(0xf9, 0)
  model PrEnergySumHc3 is ReadonlyRegister<UIN>;

  /** PrEnergyCountHc3: Energy count heating circuit 3 */
  @ext(0xfa, 0)
  model PrEnergyCountHc3 is ReadonlyRegister<UIN>;

  /** PumpHwcFlowSum: Pump hot water flow sum */
  @ext(0xc1, 0)
  model PumpHwcFlowSum is ReadonlyRegister<UIN>;

  /** PumpHwcFlowNumber: Pump hot water flow number */
  @ext(0xc2, 0)
  model PumpHwcFlowNumber is ReadonlyRegister<UIN>;

  /** PrAPSCounter: APS counter */
  @ext(0xf2, 0)
  model PrAPSCounter is ReadonlyRegister<UCH>;

  /** PrVortexFlowSensorValue: Vortex flow sensor value (legacy name) */
  @ext(0xf4, 0)
  model PrVortexFlowSensorValue is ReadonlyRegister<UIN>;

  /** HwcPostrunTime: Hot water pump overrun time */
  @ext(0x11, 0x4)
  model HwcPostrunTime is ReadonlyRegister<minutes0>;

  /** ChangesDSN: Numbers adjusting (storing) the DSN */
  @ext(0x0c, 0)
  model ChangesDSN is ReadonlyRegister<UCH>;

  /** ExternalFlowTempDesired: External flow temperature desired */
  @ext(0x25, 0)
  model ExternalFlowTempDesired is ReadonlyRegister<temp>;

  /** TempMaxDiffExtTFT: Maximum temperature difference */
  @ext(0x27, 0)
  model TempMaxDiffExtTFT is ReadonlyRegister<temp>;

  /** Expertlevel_ReturnTemp: Return temperature expert level */
  @ext(0x6b, 0)
  model Expertlevel_ReturnTemp is ReadonlyRegister<tempmirrorsensor>;

  /** PowerValue: Power value of the boiler */
  @ext(0xaa, 0)
  model PowerValue is ReadonlyRegister<HEX:6>;

  /** Status: System status */
  @ext(0x11, 0x3)
  model Status is ReadonlyRegister<UCH>;

  /** Status01: Status information 1 */
  @ext(0x11, 0x1)
  model Status01 is ReadonlyRegister<HEX:10>;

  /** Status02: Status information 2 */
  @ext(0x11, 0x2)
  model Status02 is ReadonlyRegister<HEX:7>;

  /** Status16: Status information 16 */
  @ext(0x04, 0x16)
  model Status16 is ReadonlyRegister<UCH>;

  /** TempGradientFailure: Number of cut offs of the boilers cause of to high gradient (S.54) */
  @ext(0x11, 0)
  model TempGradientFailure is ReadonlyRegister<temp0>;

  /** included parts */
  union _includes {
    Errors_inc,
    Service_inc,
  }
} 