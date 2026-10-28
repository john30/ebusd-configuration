import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./bai.0010011701_inc.tsp";
using Ebus;
using Ebus.Num;
namespace Vaillant;

/**
 * ecoBLOCK plus VMW IT 256/5-5, product 0010011694.
 * Derived from bai.0010011701_inc, selected previously through the HW5502 fallback.
 * Tested identification: BAI00 SW0602/HW5502.
 * Except for the read-only D.018 override below, entries are inherited unchanged;
 * inheritance is not a claim that every register or write has been validated.
 * Observed reads: HcPumpMode=1 (Comfort), FlowsetHcMax=40 degrees C.
 * Eco=3 is documented, but was not changed/read during the test; no B700 write was attempted.
 * Vaillant manual 0020129674_04: product identification p.7, D.018 values p.41.
 * https://www.vaillant.it/downloads/vgoa-vaillant-it-doc/istruzioni-installazione/murali-condensing-4/nuovi-libretti-febbraio-2014/installazione-ecoblock-plus-2014-432827.pdf
 */
namespace Bai._0010011694_inc {
  model PartloadHcKW is Bai._0010011701_inc.PartloadHcKW;
  model WPPostrunTime is Bai._0010011701_inc.WPPostrunTime;
  model BlockTimeHcMax is Bai._0010011701_inc.BlockTimeHcMax;
  model HwcTemp is Bai._0010011701_inc.HwcTemp;
  model StorageTemp is Bai._0010011701_inc.StorageTemp;
  model FlowTempDesired is Bai._0010011701_inc.FlowTempDesired;
  model HwcTempDesired is Bai._0010011701_inc.HwcTempDesired;
  model StorageTempDesired is Bai._0010011701_inc.StorageTempDesired;
  model ACRoomthermostat is Bai._0010011701_inc.ACRoomthermostat;
  model ExtFlowTempDesiredMin is Bai._0010011701_inc.ExtFlowTempDesiredMin;
  model WP is Bai._0010011701_inc.WP;
  model ExtWP is Bai._0010011701_inc.ExtWP;
  model Storageloadpump is Bai._0010011701_inc.Storageloadpump;
  model CirPump is Bai._0010011701_inc.CirPump;
  model WPPWMPower is Bai._0010011701_inc.WPPWMPower;
  model DCRoomthermostat is Bai._0010011701_inc.DCRoomthermostat;
  model HwcDemand is Bai._0010011701_inc.HwcDemand;
  model HeatingSwitch is Bai._0010011701_inc.HeatingSwitch;
  model StoragereleaseClock is Bai._0010011701_inc.StoragereleaseClock;
  model Gasvalve is Bai._0010011701_inc.Gasvalve;
  model TargetFanSpeed is Bai._0010011701_inc.TargetFanSpeed;
  model FanSpeed is Bai._0010011701_inc.FanSpeed;
  model PositionValveSet is Bai._0010011701_inc.PositionValveSet;
  model HwcWaterflow is Bai._0010011701_inc.HwcWaterflow;
  model FlowTemp is Bai._0010011701_inc.FlowTemp;
  model ReturnTemp is Bai._0010011701_inc.ReturnTemp;
  model IonisationVoltageLevel is Bai._0010011701_inc.IonisationVoltageLevel;
  model OutdoorstempSensor is Bai._0010011701_inc.OutdoorstempSensor;
  model RemainingBoilerblocktime
    is Bai._0010011701_inc.RemainingBoilerblocktime;
  model EBusHeatcontrol is Bai._0010011701_inc.EBusHeatcontrol;
  model DcfState is Bai._0010011701_inc.DcfState;
  model ExternalFlowTempDesired is Bai._0010011701_inc.ExternalFlowTempDesired;
  model ExternalHwcSwitch is Bai._0010011701_inc.ExternalHwcSwitch;
  model WaterPressure is Bai._0010011701_inc.WaterPressure;
  model Flame is Bai._0010011701_inc.Flame;
  model ChangesDSN is Bai._0010011701_inc.ChangesDSN;
  model GasvalveUC is Bai._0010011701_inc.GasvalveUC;
  model VolatileLockout is Bai._0010011701_inc.VolatileLockout;
  model ModulationDesired is Bai._0010011701_inc.ModulationDesired;
  model FlameSensingASIC is Bai._0010011701_inc.FlameSensingASIC;
  model HcUnderHundredStarts is Bai._0010011701_inc.HcUnderHundredStarts;
  model HwcUnderHundredStarts is Bai._0010011701_inc.HwcUnderHundredStarts;
  model EbusSourceOn is Bai._0010011701_inc.EbusSourceOn;
  model Fluegasvalve is Bai._0010011701_inc.Fluegasvalve;
  model ExternalFaultmessage is Bai._0010011701_inc.ExternalFaultmessage;
  model GasvalveASICFeedback is Bai._0010011701_inc.GasvalveASICFeedback;
  model GasvalveUCFeedback is Bai._0010011701_inc.GasvalveUCFeedback;
  model Ignitor is Bai._0010011701_inc.Ignitor;
  model HwcTypes is Bai._0010011701_inc.HwcTypes;
  model HwcImpellorSwitch is Bai._0010011701_inc.HwcImpellorSwitch;
  model WarmstartDemand is Bai._0010011701_inc.WarmstartDemand;
  model BoilerType is Bai._0010011701_inc.BoilerType;
  model ParamToken is Bai._0010011701_inc.ParamToken;
  model Expertlevel_ReturnTemp is Bai._0010011701_inc.Expertlevel_ReturnTemp;
  model FloorHeatingContact is Bai._0010011701_inc.FloorHeatingContact;
  model Templimiter is Bai._0010011701_inc.Templimiter;
  model EbusVoltage is Bai._0010011701_inc.EbusVoltage;
  model FluegasvalveOpen is Bai._0010011701_inc.FluegasvalveOpen;
  model Testbyte is Bai._0010011701_inc.Testbyte;
  model DSN is Bai._0010011701_inc.DSN;
  model TargetFanSpeedOutput is Bai._0010011701_inc.TargetFanSpeedOutput;
  model PowerValue is Bai._0010011701_inc.PowerValue;
  model Statenumber is Bai._0010011701_inc.Statenumber;
  model WaterpressureBranchControlOff
    is Bai._0010011701_inc.WaterpressureBranchControlOff;
  model DSNStart is Bai._0010011701_inc.DSNStart;
  model ExtStorageModulCon is Bai._0010011701_inc.ExtStorageModulCon;
  model PartnumberBox is Bai._0010011701_inc.PartnumberBox;
  model WPSecondStage is Bai._0010011701_inc.WPSecondStage;
  model TemplimiterWithNTC is Bai._0010011701_inc.TemplimiterWithNTC;
  model VolatileLockoutIFCGV is Bai._0010011701_inc.VolatileLockoutIFCGV;
  model VortexFlowSensor is Bai._0010011701_inc.VortexFlowSensor;
  model DisplayMode is Bai._0010011701_inc.DisplayMode;
  model Gasvalve3UC is Bai._0010011701_inc.Gasvalve3UC;
  model InitialisationEEPROM is Bai._0010011701_inc.InitialisationEEPROM;
  model TimerInputHc is Bai._0010011701_inc.TimerInputHc;
  model FanMinSpeedOperation is Bai._0010011701_inc.FanMinSpeedOperation;
  model FanMaxSpeedOperation is Bai._0010011701_inc.FanMaxSpeedOperation;
  model ExternGasvalve is Bai._0010011701_inc.ExternGasvalve;
  model DCFTimeDate is Bai._0010011701_inc.DCFTimeDate;
  model FlowSetPotmeter is Bai._0010011701_inc.FlowSetPotmeter;
  model HwcSetPotmeter is Bai._0010011701_inc.HwcSetPotmeter;
  model HwcSwitch is Bai._0010011701_inc.HwcSwitch;
  model ProductionByte is Bai._0010011701_inc.ProductionByte;
  model SerialNumber is Bai._0010011701_inc.SerialNumber;
  model PumpspeedDesired is Bai._0010011701_inc.PumpspeedDesired;
  model ReturnRegulation is Bai._0010011701_inc.ReturnRegulation;
  /** d.18 CH pump mode: only reading Comfort has been observed on this product. */
  @inherit(r)
  @ext(0xb7, 0)
  @Ebus.example(
    "Observed Comfort; the old 0d4904 request returned an empty reply",
    "3108b509030db700",
    "0101"
  )
  model HcPumpMode {
    /** Pump mode; values documented in Vaillant manual 0020129674_04, page 41. */
    @values(Values_HcPumpMode)
    value: UCH;
  }

  model SecondPumpMode is Bai._0010011701_inc.SecondPumpMode;
  model HwcTempMax is Bai._0010011701_inc.HwcTempMax;
  model AccessoriesOne is Bai._0010011701_inc.AccessoriesOne;
  model AccessoriesTwo is Bai._0010011701_inc.AccessoriesTwo;
  model FanSpeedOffsetMin is Bai._0010011701_inc.FanSpeedOffsetMin;
  model FanSpeedOffsetMax is Bai._0010011701_inc.FanSpeedOffsetMax;
  model SolPostHeat is Bai._0010011701_inc.SolPostHeat;
  model DeactivationsTemplimiter
    is Bai._0010011701_inc.DeactivationsTemplimiter;
  model DeactivationsIFC is Bai._0010011701_inc.DeactivationsIFC;
  model AverageIgnitiontime is Bai._0010011701_inc.AverageIgnitiontime;
  model MaxIgnitiontime is Bai._0010011701_inc.MaxIgnitiontime;
  model CounterStartAttempts1 is Bai._0010011701_inc.CounterStartAttempts1;
  model CounterStartAttempts2 is Bai._0010011701_inc.CounterStartAttempts2;
  model ValveMode is Bai._0010011701_inc.ValveMode;
  model FlowsetHcMax is Bai._0010011701_inc.FlowsetHcMax;
  model HwcPostrunTime is Bai._0010011701_inc.HwcPostrunTime;
  model WarmstartOffset is Bai._0010011701_inc.WarmstartOffset;
  model StorageLoadTimeMax is Bai._0010011701_inc.StorageLoadTimeMax;
  model PartloadHwcKW is Bai._0010011701_inc.PartloadHwcKW;
  model FlowsetHwcMax is Bai._0010011701_inc.FlowsetHwcMax;
  model HcHours is Bai._0010011701_inc.HcHours;
  model HwcHours is Bai._0010011701_inc.HwcHours;
  model HcStarts is Bai._0010011701_inc.HcStarts;
  model HwcStarts is Bai._0010011701_inc.HwcStarts;
  model HoursTillService is Bai._0010011701_inc.HoursTillService;
  model DSNOffset is Bai._0010011701_inc.DSNOffset;
  model SetFactoryValues is Bai._0010011701_inc.SetFactoryValues;
  model TempGradientFailure is Bai._0010011701_inc.TempGradientFailure;
  model TempDiffBlock is Bai._0010011701_inc.TempDiffBlock;
  model TempDiffFailure is Bai._0010011701_inc.TempDiffFailure;
  model PumpHours is Bai._0010011701_inc.PumpHours;
  model HcPumpStarts is Bai._0010011701_inc.HcPumpStarts;
  model ValveStarts is Bai._0010011701_inc.ValveStarts;
  model FanHours is Bai._0010011701_inc.FanHours;
  model FanStarts is Bai._0010011701_inc.FanStarts;
  model OverflowCounter is Bai._0010011701_inc.OverflowCounter;
  model TempMaxDiffExtTFT is Bai._0010011701_inc.TempMaxDiffExtTFT;
  model MinIgnitiontime is Bai._0010011701_inc.MinIgnitiontime;
  model Maintenancedata_HwcTempMax
    is Bai._0010011701_inc.Maintenancedata_HwcTempMax;
  model StorageTempMax is Bai._0010011701_inc.StorageTempMax;
  model FlowTempMax is Bai._0010011701_inc.FlowTempMax;
  model FanPWMSum is Bai._0010011701_inc.FanPWMSum;
  model FanPWMTest is Bai._0010011701_inc.FanPWMTest;
  model DeltaFlowReturnMax is Bai._0010011701_inc.DeltaFlowReturnMax;
  model StorageLoadPumpHours is Bai._0010011701_inc.StorageLoadPumpHours;
  model StorageloadPumpStarts is Bai._0010011701_inc.StorageloadPumpStarts;
  model HwcWaterflowMax is Bai._0010011701_inc.HwcWaterflowMax;
  model CounterStartAttempts3 is Bai._0010011701_inc.CounterStartAttempts3;
  model CounterStartAttempts4 is Bai._0010011701_inc.CounterStartAttempts4;
  model ReturnTempMax is Bai._0010011701_inc.ReturnTempMax;
  model PumpHwcFlowSum is Bai._0010011701_inc.PumpHwcFlowSum;
  model PumpHwcFlowNumber is Bai._0010011701_inc.PumpHwcFlowNumber;
  model SHEMaxFlowTemp is Bai._0010011701_inc.SHEMaxFlowTemp;
  model SHEMaxDeltaHwcFlow is Bai._0010011701_inc.SHEMaxDeltaHwcFlow;
  model PrEnergySumHwc1 is Bai._0010011701_inc.PrEnergySumHwc1;
  model PrEnergyCountHwc1 is Bai._0010011701_inc.PrEnergyCountHwc1;
  model PrEnergySumHwc2 is Bai._0010011701_inc.PrEnergySumHwc2;
  model PrEnergyCountHwc2 is Bai._0010011701_inc.PrEnergyCountHwc2;
  model PrEnergySumHwc3 is Bai._0010011701_inc.PrEnergySumHwc3;
  model PrEnergyCountHwc3 is Bai._0010011701_inc.PrEnergyCountHwc3;
  model WaterHcFlowMax is Bai._0010011701_inc.WaterHcFlowMax;
  model WaterpressureVariantSum is Bai._0010011701_inc.WaterpressureVariantSum;
  model WaterpressureMeasureCounter
    is Bai._0010011701_inc.WaterpressureMeasureCounter;
  model PrAPSCounter is Bai._0010011701_inc.PrAPSCounter;
  model PrAPSSum is Bai._0010011701_inc.PrAPSSum;
  model PrVortexFlowSensorValue is Bai._0010011701_inc.PrVortexFlowSensorValue;
  model PrEnergySumHc1 is Bai._0010011701_inc.PrEnergySumHc1;
  model PrEnergyCountHc1 is Bai._0010011701_inc.PrEnergyCountHc1;
  model PrEnergySumHc2 is Bai._0010011701_inc.PrEnergySumHc2;
  model PrEnergyCountHc2 is Bai._0010011701_inc.PrEnergyCountHc2;
  model PrEnergySumHc3 is Bai._0010011701_inc.PrEnergySumHc3;
  model PrEnergyCountHc3 is Bai._0010011701_inc.PrEnergyCountHc3;

  enum Values_HcPumpMode {
    comfort: 1,
    eco: 3,
  }
}
