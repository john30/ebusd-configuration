import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./iotesthp_inc.tsp";
import "./errors_inc.tsp";
import "./hcmode_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x08)
namespace Ehp {
  // ,EHP00,Heat pump AMU,EHP00 172 Boiler

  /** default *uhwc */
  @passive
  @zz(0x25)
  @base(MF, 0x9, 0x29)
  model uhwc {
    @maxLength(2)
    value: IGN;
  }

  /** default *whwc */
  @write
  @zz(0x25)
  @base(MF, 0x9, 0xe)
  model whwc {}

  /** default *wc for user level "control" */
  @write
  @auth("control")
  @base(MF, 0x9, 0xe)
  model wc {}
  // ##### EHP: #####

  /** Compressor_Commutations_DHW: Number of commutations of */
  @ext(0xa8, 0)
  model CompStartsHwc is ReadonlyRegister<cntstarts>;

  /** Compressor_Commutations_CH: Number of commutations of */
  @ext(0xa9, 0)
  model CompStartsHc is ReadonlyRegister<cntstarts>;

  /** Brine_Fan_Commutations: Number of commutations of */
  @ext(0xac, 0)
  model SourceStarts is ReadonlyRegister<cntstarts>;

  /** CH1_P_Commutations: Number of commutations of */
  @ext(0xad, 0)
  model Hc1PumpStarts is ReadonlyRegister<cntstarts>;

  /** DHW_P_Commutations: Number of commutations of */
  @ext(0xae, 0)
  model HwcPumpStarts is ReadonlyRegister<cntstarts>;

  /** Backup_Commutations_DHW: Number of commutations of */
  @ext(0xaf, 0)
  model BackupStartsHwc is ReadonlyRegister<cntstarts>;

  /** Backup_Commutations_CH: Number of commutations of */
  @ext(0xb0, 0)
  model BackupStartsHc is ReadonlyRegister<cntstarts>;

  /** V_DHW_CH_Commutations: Number of commutations of */
  @ext(0xb3, 0)
  model HwcHcValveStarts is ReadonlyRegister<cntstarts>;

  /** Compressor_Cut_HP_No: shows how often the compressor has been stopped by high pressure switch */
  @ext(0xb4, 0)
  model CompCutPressHighCount is ReadonlyRegister<ULG>;

  /** Compressor_Cut_LP_No: shows how often the compressor has been stopped by low pressure switch */
  @ext(0xb5, 0)
  model CompCutPressLowCount is ReadonlyRegister<ULG>;

  /** Compressor_Cut_T_No: shows how often the compressor has been stopped due to outlet temperature exceeding */
  @ext(0xb6, 0)
  model CompCutTempCount is ReadonlyRegister<ULG>;
  // ##### EHP: Measurements Switches Actors IOs #####
  // ***** Heat source *****

  /** EarnedEnvironmentEnergy: sum of earned environmental energy in kWh */
  @ext(0xbc, 0)
  model YieldTotal is ServiceUpdateRegister<energy4>;

  /** T_Brine_Warm: Brine inlet temperature sensor */
  @ext(0xf, 0)
  model SourceTempInput is ReadonlyUpdateRegister<tempsensor>;
  // ***** Heat generator *****

  /** P_Comp_High: High pressure value - Value of high pressure sensor at compressor outlet */
  @ext(0x14, 0)
  model CompPressHigh is ReadonlyUpdateRegister<presssensor>;

  /** P_Comp_Low: Low pressure value - Value of low pressure sensor at compressor inlet */
  @ext(0x15, 0)
  model CompPressLow is ReadonlyUpdateRegister<presssensor>;

  /** superheat of refrigerant circuit */
  @ext(0x8d, 0)
  model Superheat is ReadonlyRegister<temp>;

  /** subcooling of refrigerant circuit */
  @ext(0x8e, 0)
  model Subcooling is ReadonlyRegister<temp>;

  /** actual energy balancing integral */
  @ext(0x80, 0)
  model Integral is ReadonlyRegister<integral>;

  /** T_Inlet: Internal compressor inlet temperature sensor */
  @ext(0x2, 0)
  model TempInput is ReadonlyUpdateRegister<tempsensor>;

  /** T_Outlet: Internal compressor outlet temperature sensor */
  @ext(0x4, 0)
  model TempOutput is ReadonlyUpdateRegister<tempsensor>;

  /** P_Switch: Compressor High/Low pressure switch chain; 1 = switch chain has tripped */
  @ext(0x25, 0)
  model PressSwitch is ReadonlyUpdateRegister<errorok>;

  /** Compressor */
  @ext(0x1d, 0)
  model Comp is ReadonlyUpdateRegister<onoff>;

  /** Backup heater output */
  @ext(0x5f, 0)
  model Backup is ReadonlyUpdateRegister<onoff>;
  // ***** Heat sink heating circuit *****

  /** T_Flow_CH: Internal Flow temperature sensor */
  @ext(0x9, 0)
  model HcFlowTemp is ReadonlyRegister<tempsensor>;

  /** T_Return_CH: Internal return temperature sensor */
  @ext(0xa, 0)
  model HcReturnTemp is ReadonlyUpdateRegister<tempsensor>;

  /** P_CH: Heating Circuit Pressure sensor */
  @ext(0x12, 0)
  model HcPress is ReadonlyRegister<presssensor>;

  /** CH1_P: internal CH pump */
  @ext(0x17, 0)
  model Hc1Pump is ReadonlyUpdateRegister<onoff>;

  /** T_HB_Top: Heat Buffer Top external temperature sensor */
  @ext(1, 0)
  model StorageTempTop is ReadonlyUpdateRegister<tempsensor>;

  /** T_HB_Bottom: External Heat buffer bottom temperature sensor */
  @ext(0x7, 0)
  model StorageTempBottom is ReadonlyUpdateRegister<tempsensor>;

  /** T_Flow_Mixed: External flow temperature sensor - VF2 (flow into the heating system, radiators or floor heating) */
  @ext(0x3, 0)
  model FlowTemp is ReadonlyUpdateRegister<tempsensor>;

  /** Mixer1DutyCycle: Opening/Closing status of mixing valve HK2, -100%...+100% */
  @ext(0xe, 0)
  model Mixer1DutyCycle is ReadonlyRegister<percents>;

  /** CH2_P: external CH pump (HK2P) */
  @ext(0x18, 0)
  model Hc2Pump is ReadonlyRegister<onoff>;
  // ***** Heat sink domestic hot water *****

  /** T_DHW */
  @inherit(r, uhwc)
  @ext(0, 0)
  model HwcTemp {
    /** External DHW temperature sensor */
    value: tempsensor;
  }

  /** CirculationPump: circulation pump */
  @ext(0xc, 0)
  model CirPump is ReadonlyUpdateRegister<onoff>;

  /** V_DHW_CH: UV 1 */
  @ext(0x10, 0)
  model HwcHcValve is ReadonlyUpdateRegister<onoff>;

  /** DHW_Switch: one time circulation switch Main PCB input */
  @ext(0xb, 0)
  model HwcSwitch is ReadonlyRegister<onoff>;
  // ***** Power supply *****

  /** Power_Cut: indicator that EVU has cut the power (according EWD) */
  @ext(0x11, 0)
  model PowerCut is ReadonlyRegister<yesno>;

  /** Phase_Status: 3 flags indicating the statuses of the 3 phases at the 380V input (1= phase is there, 0 = phase is missing) */
  @ext(0x88, 0)
  model PhaseStatus is ReadonlyUpdateRegister<phase>;

  /** Phase_Order: shows the order of the 3 phases; 7=OK */
  @ext(0x57, 1)
  model PhaseOrder is ReadonlyUpdateRegister<phaseok>;

  /** ICL_Out: inrush current limiter */
  @ext(0x3f, 0)
  model ICLOut is ReadonlyUpdateRegister<onoff>;
  // ***** Other I/Os *****

  /** T_Outside: External outside temperature sensor */
  @ext(0x6, 0)
  model OutsideTemp is ReadonlyRegister<tempsensor>;

  /** ActualEnvironmentPower: only for graphic display: the environmental power that is actually displayed in kW */
  @ext(0xba, 0)
  model ActualEnvironmentPower is ReadonlyUpdateRegister<power>;

  /** ActualEnvironmentPowerPercentage: only for graphic display: amount of filling of the big energy arrow */
  @ext(0xbb, 0)
  model ActualEnvironmentPowerPercentage is ReadonlyUpdateRegister<percent0>;

  /** Fan_Brine_Port: port feedback; only needed by UI in actuator test */
  @ext(0x37, 1)
  model SourcePort is ReadonlyRegister<onoff>;

  /** CH1_P_Port: port feedback; only needed by UI in actuator test */
  @ext(0x38, 1)
  model Hc1PumpPort is ReadonlyRegister<onoff>;

  /** Injection */
  @ext(0x1f, 0)
  model Injection is ReadonlyRegister<onoff>;
  // ##### EHP: Parameters and information #####
  // ***** Basic data *****

  /** Actual Date */
  @ext(0x29, 0)
  model Date is ReadonlyRegister<date>;

  /** Compressor_Demand: shows that regulation wants to start the heat source */
  @ext(0x54, 0)
  model CompDemand is ReadonlyRegister<yesno>;

  /** Actual Weekday */
  @ext(0x2a, 0)
  model Weekday is ReadonlyRegister<bday>;

  /** Actual Time */
  @ext(0x28, 0)
  model Time is ReadonlyRegister<time>;

  /** Heat_Pump_Status: contains the status of the heatpump shown to the installer. Values do not fit here. Please ask R&D for values. */
  @ext(0xd0, 0)
  model HeatPumpStatus is ReadonlyUpdateRegister<hpstatus>;
  // ***** Backup heater *****

  /** Ext_Backup: Configuration of backup heater installation location */
  @ext(0x92, 0)
  model BackupType is InstallRegister<backtype>;

  /** Bivalent_Temperature: outside temperature must be lower than this temperature in order to use backup heater for CH */
  @ext(0x65, 0)
  model BivalentTemp is InstallRegister<temp>;

  /** Backup_Hysteresis: difference between actual flow temperature and setpoit at which backup heater should start */
  @ext(0x7e, 0)
  model BackupHysteresis is InstallRegister<temp>;

  /** Integral_Backup_Start: integral at which backup heater should start */
  @ext(0x7f, 0)
  model BackupIntegral is InstallRegister<integral>;

  /** Backup_Heater_Mode_CH: backup heater mode for CH: no backup, comfort or backup only */
  @ext(0x63, 0)
  model BackupModeHc is InstallRegister<backmode>;

  /** Backup_Heater_Mode_DHW: backup heater mode for DHW: no backup, comfort or backup only */
  @ext(0x64, 0)
  model BackupModeHwc is InstallRegister<backmode>;

  /** Backup_Power_Cut: This enables the backup heater to run while power cuts as compressor replacement, only applicable if electrical scheme is two. */
  @ext(0x86, 0)
  model BackupPowerCut is ServiceRegister<yesno>;
  // ***** Compressor settings *****

  /** Compressor_Hysteresis: difference between actual flow temperature and setpoit at which compressor should start */
  @ext(0x7d, 0)
  model CompHysteresis is InstallRegister<temp>;

  /** Integral_Comp_Start: integral at which compressor should start */
  @ext(0x7c, 0)
  model CompIntegral is InstallRegister<integral>;

  /** Number_Comp_Starts: maximum number of compressor starts per hour */
  @ext(0x74, 0)
  model NumberCompStarts is InstallRegister<UCH>;

  /** Max_Return_Temperature: if return temperature is higher than this, compressor stops or might not restart */
  @ext(0x73, 0)
  model ReturnTempMax is InstallRegister<temp>;
  // ***** Heat source geothermal energy *****
  // ***** Heat sink heating circuit *****
  // ***** Operating data ****

  /** Compressor_Hours_CH: operating hours of compressor for CH mode */
  @ext(0x9b, 0)
  model CompHoursHc is ReadonlyRegister<hoursum>;

  /** Compressor_Hours: operating hours of compressor (overall) */
  @ext(0x9a, 0)
  model CompHours is ReadonlyRegister<hoursum>;

  /** Compressor_Hours_DHW: operating hours of compressor for DHW mode */
  @ext(0x9c, 0)
  model CompHoursHwc is ReadonlyRegister<hoursum>;

  /** Compressor_Commutations: Number of commutations of compressor */
  @ext(0xaa, 0)
  model CompStarts is ReadonlyRegister<cntstarts>;

  /** Backup_Hours: operating hours of Backup Heater */
  @ext(0xa1, 0)
  model BackupHours is ReadonlyRegister<hoursum>;

  /** Backup_Hours_CH: operating hours of Backup Heater for CH */
  @ext(0xa2, 0)
  model BackupHoursHc is ReadonlyRegister<hoursum>;

  /** Backup_Hours_DHW: operating hours of Backup Heater for DHW */
  @ext(0xa3, 0)
  model BackupHoursHwc is ReadonlyRegister<hoursum>;

  /** Backup_Commutations: Number of commutations of backup heater */
  @ext(0xb1, 0)
  model BackupStarts is ReadonlyRegister<cntstarts>;
  // ***** Cooling operation *****
  // ***** Installation menu *****

  /** Appliance_Code: appliance code */
  @ext(0x43, 1)
  model ApplianceCode is InstallUpdateRegister<UCH>;

  /** heatpump type */
  @inherit(r)
  @ext(0x76, 1)
  model HeatpumpType {
    /** heatpump type */
    @values(Values_HeatpumpType)
    value: UCH;
  }

  /** Electric_Wiring_Diagram: represents the electrical installation (plan 1...3) */
  @ext(0x87, 0)
  model ElectricWiringDiagram is ServiceUpdateRegister<UCH>;
  // ***** Miscellaneous *****

  /** State_Software_Code: contains several detail information about the actual status of the heatpump for the developer */
  @ext(0xcf, 0)
  model StateSoftwareCode is ReadonlyUpdateRegister<ULG>;

  /** Acceleration_Test_Mode: initiates/indicates acceleration of several internal timings */
  @ext(0x66, 0)
  model AccelerationTestMode is InstallUpdateRegister<yesno>;

  /** Code1: together with code 2, this enables/disables several sw features, in hex format */
  @ext(0x97, 0)
  model Code1 is InstallRegister<code>;

  /** Code2: together with code 1, this enables/disables several sw features, in hex format */
  @ext(0x98, 0)
  model Code2 is InstallRegister<code>;

  /** Code1Code2Valid: changes of Code 1 /2 have to be commited by setting this flag */
  @ext(0x24, 0)
  model Code1Code2Valid is InstallRegister<yesno>;

  /** Hzdraulic plan */
  @inherit(r, wc)
  @ext(0x60, 0)
  model HydraulicScheme {
    /** Hydraulic Schematic */
    value: UCH;
  }

  /** DhwLaggingTime: Backup heater use for CH */
  @ext(0x61, 0)
  model HwcLaggingTime is ReadonlyRegister<UCH>;

  /** DhwLoadingDelay: Backup heater use for DHW */
  @ext(0x62, 0)
  model HwcLoadingDelay is ReadonlyRegister<UCH>;

  /** Brine_Fan_Hours: operating hours of Fan_Brine */
  @ext(0x9d, 0)
  model SourceHours is ReadonlyRegister<hoursum>;

  /** Brine2_P_Hours: operating hours of Sk2P */
  @ext(0x9e, 0)
  model Source2PumpHours is ReadonlyRegister<hoursum>;

  /** SoftwareCode: 4 Bytes holding several software status info */
  @ext(0x18, 1)
  model SoftwareCode is ReadonlyRegister<UCH>;

  /** CH1_P_Hours: operating hours of CH1P */
  @ext(0x9f, 0)
  model Hc1PumpHours is ReadonlyRegister<hoursum>;

  /** CH2_P_Hours: operating hours of HK2P */
  @ext(0xa0, 0)
  model Hc2PumpHours is ReadonlyRegister<hoursum>;

  /** CH_Mode_Demand_Hours: total time EHP was in CH mode (energy manager) */
  @ext(0xa4, 0)
  model HcModeDemandHours is ReadonlyRegister<hoursum>;

  /** CH_Mode_Fulfilled_Hours: total time EHP was in CH mode AND compr. Or backup heater was running */
  @ext(0xa5, 0)
  model HcModeFulfilledHours is ReadonlyRegister<hoursum>;

  /** DHW_Mode_Demand_Hours: total time EHP was in DHW mode (energy manager) */
  @ext(0xa6, 0)
  model HwcModeDemandHours is ReadonlyRegister<hoursum>;

  /** DHW_Mode_Fulfilled_Hours: total time EHP was in DHW mode AND compr. Or backup heater was running */
  @ext(0xa7, 0)
  model HwcModeFulfilledHours is ReadonlyRegister<hoursum>;

  /** CompressorState: compressor and ICL state machine status number */
  @ext(0xe4, 0)
  model CompState is ReadonlyRegister<UCH>;

  /** MinTimeCompressorOn: minimum time that compressor must run in 0,5s steps */
  @ext(0xe6, 0)
  model TimeCompOnMin is ReadonlyRegister<seconds>;

  /** MinTimeCompressorOff: minimum time the compressor must be off before restart in 0,5s steps */
  @ext(0xe7, 0)
  model TimeCompOffMin is ReadonlyRegister<seconds>;

  /** MinTimeBetweenTwoCompressorStarts: calculated from menu item "compressor starts per hour" in 0,5s steps */
  @ext(0xe8, 0)
  model TimeBetweenTwoCompStartsMin is ReadonlyRegister<seconds>;

  /** CompressorControlState: number of status of compressor control state machine */
  @ext(0xe9, 0)
  model CompControlState is ReadonlyRegister<UCH>;

  /** RebootCounter: number of appliance starts */
  @ext(0xf5, 0)
  model RebootCounter is ReadonlyRegister<UIN>;

  /** T19_Max_To_Compressor_Off: limit on compressor outlet temp that leads to an overpressure situation */
  @ext(0x2b, 1)
  model T19MaxToCompOff is ReadonlyRegister<temp>;

  @ext(0xd1, 0)
  model EnergyBalancingRelease is Register<onoff>;

  @ext(0xd3, 0)
  model TimeOfNextPredictedPowerCut is ReadonlyUpdateRegister<time>;

  @inherit(r, whwc)
  @ext(0xf4, 0)
  model PowerCutPreloading {
    value: onoff;
  }
  // ***** for high efficiency pumps only *****
  // ***** VWL-S only *****

  /** HcParallelTankFillingEnabled: BMR: indicates that heating circuits can keep running at dhw loading; for heatpumps, this is 1 if there is a heat buffer, 0 otherwise */
  @ext(0x55, 0)
  model HcParallelStorageFillingEnabled is ReadonlyRegister<yesno>;
  // ##### EHP: Sensor calibration #####

  /** T_Outside_Offset: Offset for calibrating temperature sensor */
  @ext(0xc3, 0)
  model OutsideTempOffset is InstallRegister<calibration>;

  /** T_Brine_Warm_Offset: Offset for calibrating temperature sensor */
  @ext(0xcd, 0)
  model SourceTempInputOffset is InstallRegister<calibration>;

  /** T_DHW_Offset: Offset for calibrating temperature sensor */
  @ext(0xc4, 0)
  model HwcTempOffset is InstallRegister<calibration>;

  /** T_Flow_CH_Offset: Offset for calibrating temperature sensor */
  @ext(0xca, 0)
  model HcFlowTempOffset is InstallRegister<calibration>;

  /** T_Flow_Mixed_Offset: Offset for calibrating temperature sensor */
  @ext(0xc5, 0)
  model FlowTempOffset is InstallRegister<calibration>;

  /** T_Inlet_Offset: Offset for calibrating temperature sensor */
  @ext(0xc6, 0)
  model TempInputOffset is InstallRegister<calibration>;

  /** T_Outlet_Offset: Offset for calibrating temperature sensor */
  @ext(0xc7, 0)
  model TempOutputOffset is InstallRegister<calibration>;

  /** T_Return_CH_Offset: Offset for calibrating temperature sensor */
  @ext(0xcb, 0)
  model HcReturnTempOffset is InstallRegister<calibration>;

  /** T_HB_Bottom_Offset: Offset for calibrating temperature sensor */
  @ext(0x34, 1)
  model StorageTempBottomOffset is InstallRegister<calibration>;

  /** T_HB_Top_Offset: Offset for calibrating temperature sensor */
  @ext(0x33, 1)
  model StorageTempTopOffset is InstallRegister<calibration>;
  // ##### EHP: Sensor Check #####

  enum Values_HeatpumpType {
    airtowater: 1,
    brinetowater: 2,
    watertowater: 3,
    indirectwatertowater: 4,
    airtobrinetowater: 5,
  }
  @condition(HeatpumpType.value, "3")
  namespace Watertowater {
    /** OutletTemperature: heat source outlet temperature for water to water machines */
    @ext(0x8, 0)
    model SourceTempOutput is ReadonlyUpdateRegister<tempsensor>;

    /** HeatSourcePump WW: Brine_Pump WW */
    @ext(0x19, 0)
    model Source is ReadonlyUpdateRegister<onoff>;

    /** Brine2_P: external Brine or water pump */
    @ext(0x1a, 0)
    model Source2Pump is ReadonlyRegister<onoff>;

    /** FlowSwitch: water flow switch; 1 = switch has tripped */
    @ext(0x26, 0)
    model SourceSwitch is ReadonlyUpdateRegister<errorok>;

    /** T_Condensor_WW: Condensor temperature sensor WW */
    @ext(0xd, 0)
    model CondensorTemp is ReadonlyUpdateRegister<tempsensor>;

    /** Overpressure_WW: limit for compressor high pressure which is considered an overpressure situation (for Water/Water machines) */
    @ext(0x77, 1)
    model OverpressureThreshold is ServiceRegister<pressm>;

    /** Delta_T6_T7_WW: Maximum temperature difference between heat source outlet and inlet - WW */
    @ext(0x6e, 0)
    model DeltaTempT6T7 is InstallRegister<temp>;

    /** HS_Pump_Prerun_WW: Heat source pump prerun in heat source circuit - WW */
    @ext(0x76, 0)
    model SourcePumpPrerunTime is InstallRegister<minutes>;

    /** OutletTemperature: Offset for heat source outlet temperature sensor - WW */
    @ext(0xc9, 0)
    model SourceTempOutputOffset is InstallRegister<calibration>;

    /** T_Condensor_WW: Condensor temperature sensor WW */
    @ext(0x5, 0)
    model EvaporatorTemp is ReadonlyRegister<temp>;
  }
  @condition(HeatpumpType.value, "2")
  namespace Brinetowater {
    /** BrineOutlet: heat source outlet temperature for brine to water machines */
    @ext(0x8, 0)
    model SourceTempOutput is ReadonlyUpdateRegister<tempsensor>;

    /** P_Brine: Brine pressure sensor */
    @ext(0x16, 0)
    model SourcePress is ReadonlyRegister<presssensor>;

    /** HeatSourcePump BW: Brine Pump BW */
    @ext(0x19, 0)
    model Source is ReadonlyUpdateRegister<onoff>;

    /** BrineSwitch: brine pressure switch; 1 = switch has tripped */
    @ext(0x26, 0)
    model SourceSwitch is ReadonlyUpdateRegister<errorok>;

    /** T_Condensor_BW: Condensor temperature sensor BW */
    @ext(0xd, 0)
    model CondensorTemp is ReadonlyUpdateRegister<tempsensor>;

    /** Overpressure_BW: limit for compressor high pressure which is considered an overpressure situation (for Brine/Water machines) */
    @ext(0x77, 1)
    model OverpressureThreshold is ServiceRegister<pressm>;

    /** Delta_T6_T7_BW: Maximum temperature difference between heat source outlet and inlet - BW */
    @ext(0x6e, 0)
    model DeltaTempT6T7 is InstallRegister<temp>;

    /** Einfrierschutz: Minimum heat source outlet temperature BW (equal to WW) */
    @ext(0x7a, 1)
    model SourceTempOutputT8Min is InstallRegister<temps>;

    /** HS_Pump_Prerun_BW: Heat source pump prerun in heat source circuit - BW */
    @ext(0x76, 0)
    model SourcePumpPrerunTime is InstallRegister<minutes>;

    /** MinFlowtempCooling: flow temperature that must be exceeded to start cooling */
    @ext(0x74, 1)
    model FlowtempCoolingMin is InstallRegister<temp0>;

    /** Initiates and indicates the bleeding function */
    @ext(0x13, 0)
    model Bleeding is InstallUpdateRegister<yesno>;

    /** BrineOutlet: Offset for heat source outlet temperature sensor - BW */
    @ext(0xc9, 0)
    model SourceTempOutputOffset is InstallRegister<calibration>;
  }
  @condition(HeatpumpType.value, "1")
  namespace Airtowater {
    /** AirOutlet: heat source outlet temperature for air to water machines */
    @ext(0x8, 0)
    model SourceTempOutput is ReadonlyUpdateRegister<tempsensor>;

    /** Fan AW */
    @ext(0x19, 0)
    model Source is ReadonlyUpdateRegister<onoff>;

    /** FanContact: Fan overheat thermostat; 1 = switch has tripped */
    @ext(0x26, 0)
    model SourceSwitch is ReadonlyUpdateRegister<errorok>;

    /** T_Evaporator: Internal evaporator temperature sensor */
    @ext(0x5, 0)
    model EvaporatorTemp is ReadonlyRegister<tempsensor>;

    /** V_Cool: Refrigerant circuit reversion valve */
    @ext(0x1c, 0)
    model CoolValve is ReadonlyRegister<onoff>;

    /** Overpressure_Threshold_AW: limit for high pressure when Overpressure should be indicated on A/W machines */
    @ext(0xfa, 0)
    model OverpressureThreshold is ServiceRegister<pressm>;

    /** Start_Deicing: initiates/indicates a manual deicing process */
    @ext(0x71, 0)
    model StartDeicing is InstallRegister<yesno>;

    /** Time_Before_Next_Deicing: Time until next deicing in 0.5 secs */
    @ext(0x70, 0)
    model TimeBeforeNextDeicing is ReadonlyRegister<seconds>;

    /** AirOutlet: Offset for air outlet temperature sensor */
    @ext(0xc9, 0)
    model SourceTempOutputOffset is InstallRegister<calibration>;
  }
  @condition(HeatpumpType.value, "5")
  namespace Airtobrinetowater {
    /** BrineOutlet: heat source outlet temperature for brine to water machines */
    @ext(0x8, 0)
    model SourceTempOutput is ReadonlyUpdateRegister<tempsensor>;

    /** P_Brine: Brine pressure sensor */
    @ext(0x16, 0)
    model SourcePress is ReadonlyRegister<presssensor>;

    /** HeatSourcePump BW: Brine Pump BW */
    @ext(0x19, 0)
    model Source is ReadonlyUpdateRegister<onoff>;

    /** BrineSwitch: brine pressure switch; 1 = switch has tripped */
    @ext(0x26, 0)
    model SourceSwitch is ReadonlyUpdateRegister<errorok>;

    /** T_Condensor_BW: Condensor temperature sensor BW */
    @ext(0xd, 0)
    model CondensorTemp is ReadonlyUpdateRegister<tempsensor>;

    /** Overpressure_BW: limit for compressor high pressure which is considered an overpressure situation (for Brine/Water machines) */
    @ext(0x77, 1)
    model OverpressureThreshold is ServiceRegister<pressm>;

    /** Delta_T6_T7_BW: Maximum temperature difference between heat source outlet and inlet - BW */
    @ext(0x6e, 0)
    model DeltaTempT6T7 is InstallRegister<temp>;

    /** HS_Pump_Prerun_BW: Heat source pump prerun in heat source circuit - BW */
    @ext(0x76, 0)
    model SourcePumpPrerunTime is InstallRegister<minutes>;

    /** Initiates and indicates the bleeding function */
    @ext(0x13, 0)
    model Bleeding is InstallUpdateRegister<yesno>;

    /** Start Defrosting */
    @ext(0x71, 0)
    model StartDeicing is InstallRegister<yesno>;

    /** BrineOutlet: Offset for heat source outlet temperature sensor - BW */
    @ext(0xc9, 0)
    model SourceTempOutputOffset is InstallRegister<calibration>;
  }
  @condition(Id.Id.sw, "=350-400")
  namespace Sw_350_400 {
    /** CompressorRestartTimer: Delay until next compressor start, only updated and displayed in UI if compressor demanded but locked by runtime conditions. */
    @ext(0x9c, 1)
    model CompRestartTimer is ReadonlyRegister<minutes>;
  }
  @condition(Id.Id.sw, ">=403")
  namespace Sw_ge403 {
    /** CompressorRestartTimer: Delay until next compressor start, only updated and displayed in UI if compressor demanded but locked by runtime conditions. */
    @ext(0xc5, 1)
    model CompRestartTimer is ReadonlyRegister<minutes>;
  }
  @condition(Id.Id.sw, ">=414")
  namespace Sw_ge414 {
    /** hysteresis_time_delay: defined time delay until backup heater hysteresis becomes valid */
    @ext(0xe0, 1)
    model HysteresisTimeDelay is InstallRegister<minutes0>;

    /** ActualEnvironmentPowerFine */
    @inherit(r, u)
    @ext(0xe2, 1)
    model ActualEnvironmentPowerFine {
      /** environment power in higher resolution (100W) */
      @unit("hW")
      value: UCH;
    }

    /** BivalentMode: reserved for special bivalent setting */
    @ext(0xe3, 1)
    model BivalentMode is InstallRegister<UCH>;
  }
  @condition(Id.Id.sw, ">=415")
  namespace Sw_ge415 {
    /** BrineLimitAtMaxFlow: lowest allowed brine temperature to achieve max. flow temperature */
    @ext(0xe4, 1)
    model SourceLimitAtMaxFlow is ServiceRegister<SCH>;

    /** HysteresisTimerCountdown: backup heater countdown timer */
    @ext(0xe7, 1)
    model HysteresisTimerCountdown is ReadonlyRegister<UCH>;

    /** BrineLimitSlope: Slope to calculate pressure switchpoint below lowest brine temperature */
    @ext(0xe5, 1)
    model SourceLimitSlope is ServiceRegister<UCH>;

    /** maxNDPressure: max. allowed low pressure for compressor protection */
    @ext(0xe9, 1)
    model MaxNDPressure is ServiceRegister<ULG>;
  }
  @condition(HeatpumpType.value, "5")
  @condition(Id.Id.sw, ">=400")
  namespace Airtobrinetowater_sw_ge400 {
    /** Einfrierschutz: Minimum heat source outlet temperature VWLS */
    @ext(0xb0, 1)
    model SourceTempOutputT8Min is InstallRegister<temps>;
  }
  @condition(HeatpumpType.value, "1")
  @condition(Id.Id.sw, "=350-400")
  namespace Airtowater_sw_350_400 {
    /** AW_Fan_Prerun_Time: Prerun time of the fan in s */
    @ext(0x9d, 1)
    model FanPrerunTime is InstallRegister<seconds>;

    /** AW_CH1P_Prerun_Time: Prerun time of the internal heat circuit pump in s. Relative to the fan prerun time. */
    @ext(0x9e, 1)
    model Hc1PumpPrerunTime is InstallRegister<seconds>;
  }
  @condition(HeatpumpType.value, "1")
  @condition(Id.Id.sw, ">=403")
  namespace Airtowater_sw_ge403 {
    /** AW_Fan_Prerun_Time: Prerun time of the fan in s */
    @ext(0xc6, 1)
    model FanPrerunTime is InstallRegister<seconds>;

    /** AW_CH1P_Prerun_Time: Prerun time of the internal heat circuit pump in s. Relative to the fan prerun time. */
    @ext(0xc7, 1)
    model Hc1PumpPrerunTime is InstallRegister<seconds>;
  }
  @condition(Id.Id.sw, ">=370")
  namespace Sw_ge370 {
    /** FirstCHEnergySavingPumpOffTime: CH pump off time for pump switch off during heating operation with direct heating circuits. Function is off from factory but can be activated in service menus via Code1. */
    @ext(0x99, 1)
    model FirstHcEnergySavingPumpOffTime is InstallRegister<minutes0>;
  }
  @condition(HeatpumpType.value, "2")
  @condition(Id.Id.sw, "=350-400")
  namespace Brinetowater_sw_350_400 {
    /** BW_WW_CH1P_Prerun_Time: Prerun time of the internal heat circuit pump in s. Relative to the heat source pump prerun time. */
    @ext(0x9f, 1)
    model Hc1PumpPrerunTime is InstallRegister<seconds>;
  }
  @condition(HeatpumpType.value, "2")
  @condition(Id.Id.sw, ">=403")
  namespace Brinetowater_sw_ge403 {
    /** BW_WW_CH1P_Prerun_Time: Prerun time of the internal heat circuit pump in s. Relative to the heat source pump prerun time. */
    @ext(0xc8, 1)
    model Hc1PumpPrerunTime is InstallRegister<seconds>;
  }
  @condition(HeatpumpType.value, "5")
  @condition(Id.Id.sw, ">=403")
  namespace Airtobrinetowater_sw_ge403 {
    /** BW_WW_CH1P_Prerun_Time: Prerun time of the internal heat circuit pump in s. Relative to the heat source pump prerun time. */
    @ext(0xc9, 1)
    model Hc1PumpPrerunTime is InstallRegister<seconds>;
  }
  @condition(HeatpumpType.value, "2")
  @condition(Id.Id.sw, ">=350")
  namespace Brinetowater_sw_ge350 {
    /** Brine_P_Cooling_Hours: Brine pump run time during cooling */
    @ext(0x7d, 1)
    model SourcePumpCoolingHours is ReadonlyRegister<hoursum>;
  }
  @condition(Id.Id.sw, ">=407")
  namespace Sw_ge407 {
    /** BrinePumpStatus: 0=HEP_ok: 1= HEP_error; >=2=noHEP */
    @ext(0xb8, 1)
    model SourcePumpStatus is ReadonlyUpdateRegister<UCH>;

    /** BrinePumpPWM: actual speed of brine pump (7%=off) */
    @ext(0xac, 1)
    model SourcePumpPWM is ReadonlyRegister<percent0>;

    /** BrinePumpSpeedControlHeating: brine pump speed setpoint when compressor=on */
    @ext(0xae, 1)
    model SourcePumpSpeedControlHeating is InstallRegister<percent0>;

    /** BrinePumpSpeedControlDefrost: brine pump speed setpoint while defrosting */
    @ext(0xcc, 1)
    model SourcePumpSpeedControlDefrost is InstallRegister<percent0>;
  }
  @condition(HeatpumpType.value, "5")
  @condition(Id.Id.sw, ">=407")
  namespace Airtobrinetowater_sw_ge407 {
    /** DeicingActive: ODU is in defrosting mode */
    @ext(0xce, 1)
    model DeicingActive is ReadonlyRegister<yesno>;

    /** selftest adjustable steps: 0=off; 1=StartSelfTest, 30=bleeding (Entlüftung brine circuit) */
    @ext(0xd0, 1)
    model Selftest is ServiceRegister<UCH>;

    /** BivalentPoint2_Temperature: temperature to force backup heater even if it is disabled */
    @ext(0xbc, 1)
    model BivalentPoint2Temp is InstallRegister<temp>;

    /** VWLS_NoiseReduction: noise reduction is activated by time schedule */
    @ext(0xa9, 1)
    model NoiseReduction is Register<yesno>;

    /** NoiseReductionFactor: amount of noise reduction when activated by time schedule */
    @ext(0x24, 1)
    model NoiseReductionFactor is Register<percent0>;

    /** VWLS_FanError: fan error OMU 1 */
    @ext(0xa1, 1)
    model FanError is ReadonlyRegister<yesno>;

    /** VWLS_FanError_OMU2: fan error OMU 2 */
    @ext(0xb6, 1)
    model FanErrorOMU2 is ReadonlyRegister<yesno>;

    /** VWLS_STBError: defroster STB error OMU 1 */
    @ext(0xa2, 1)
    model STBError is ReadonlyRegister<yesno>;

    /** VWLS_STBError_OMU2: defroster STB error OMU 2 */
    @ext(0xb7, 1)
    model STBErrorOMU2 is ReadonlyRegister<yesno>;

    /** VWLS_BadWeather: ambient too cold OMU 1 */
    @ext(0xa4, 1)
    model BadWeather is ReadonlyRegister<yesno>;

    /** VWLS_BadWeather_OMU2: ambient too cold OMU 2 */
    @ext(0xb9, 1)
    model BadWeatherOMU2 is ReadonlyUpdateRegister<yesno>;

    /** VWLS_HotSummer: ambient too hot OMU 1 */
    @ext(0xb5, 1)
    model HotSummer is ReadonlyRegister<yesno>;

    /** VWLS_HotSummer_OMU2: ambient too hot OMU 2 */
    @ext(0xb8, 1)
    model HotSummerOMU2 is ReadonlyUpdateRegister<yesno>;
  }

  /** included parts */
  union _includes {
    Iotesthp_inc,
    Errors_inc,
    Hcmode_inc,
  }
}
