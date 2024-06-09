import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./iotesthp_inc.tsp";
import "./errors_inc.tsp";
import "./hcmode_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x08)
namespace ehp {
  // ,EHP00,Heat pump AMU,EHP00 172 Boiler

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *u */
  @passive
  @base(MF, 0x9, 0x29)
  model u {
    @maxLength(2)
    value: IGN;
  }

  /** default *uhwc */
  @passive
  @zz(0x25)
  @base(MF, 0x9, 0x29)
  model uhwc {
    @maxLength(2)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *whwc */
  @write
  @zz(0x25)
  @base(MF, 0x9, 0xe)
  model whwc {}

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

  /** default *wc for user level "control" */
  @write
  @auth("control")
  @base(MF, 0x9, 0xe)
  model wc {}
  // ##### EHP: #####

  /** Compressor_Commutations_DHW */
  @inherit(r)
  @ext(0xa8, 0)
  model CompStartsHwc {
    /** Number of commutations of */
    value: cntstarts;
  }

  /** Compressor_Commutations_CH */
  @inherit(r)
  @ext(0xa9, 0)
  model CompStartsHc {
    /** Number of commutations of */
    value: cntstarts;
  }

  /** Brine_Fan_Commutations */
  @inherit(r)
  @ext(0xac, 0)
  model SourceStarts {
    /** Number of commutations of */
    value: cntstarts;
  }

  /** CH1_P_Commutations */
  @inherit(r)
  @ext(0xad, 0)
  model Hc1PumpStarts {
    /** Number of commutations of */
    value: cntstarts;
  }

  /** DHW_P_Commutations */
  @inherit(r)
  @ext(0xae, 0)
  model HwcPumpStarts {
    /** Number of commutations of */
    value: cntstarts;
  }

  /** Backup_Commutations_DHW */
  @inherit(r)
  @ext(0xaf, 0)
  model BackupStartsHwc {
    /** Number of commutations of */
    value: cntstarts;
  }

  /** Backup_Commutations_CH */
  @inherit(r)
  @ext(0xb0, 0)
  model BackupStartsHc {
    /** Number of commutations of */
    value: cntstarts;
  }

  /** V_DHW_CH_Commutations */
  @inherit(r)
  @ext(0xb3, 0)
  model HwcHcValveStarts {
    /** Number of commutations of */
    value: cntstarts;
  }

  /** Compressor_Cut_HP_No */
  @inherit(r)
  @ext(0xb4, 0)
  model CompCutPressHighCount {
    /** shows how often the compressor has been stopped by high pressure switch */
    value: ULG;
  }

  /** Compressor_Cut_LP_No */
  @inherit(r)
  @ext(MF, 0)
  model CompCutPressLowCount {
    /** shows how often the compressor has been stopped by low pressure switch */
    value: ULG;
  }

  /** Compressor_Cut_T_No */
  @inherit(r)
  @ext(0xb6, 0)
  model CompCutTempCount {
    /** shows how often the compressor has been stopped due to outlet temperature exceeding */
    value: ULG;
  }
  // ##### EHP: Measurements Switches Actors IOs #####
  // ***** Heat source *****

  /** EarnedEnvironmentEnergy */
  @inherit(r, ws, u)
  @ext(0xbc, 0)
  model YieldTotal {
    /** sum of earned environmental energy in kWh */
    value: energy4;
  }

  /** T_Brine_Warm */
  @inherit(r, u)
  @ext(0xf, 0)
  model SourceTempInput {
    /** Brine inlet temperature sensor */
    value: tempsensor;
  }

  @condition(HeatpumpType.value, "3")
  namespace watertowater {
    /** OutletTemperature */
    @inherit(r, u)
    @ext(0x8, 0)
    model SourceTempOutput {
      /** heat source outlet temperature for water to water machines */
      value: tempsensor;
    }
  }

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** BrineOutlet */
    @inherit(r, u)
    @ext(0x8, 0)
    model SourceTempOutput {
      /** heat source outlet temperature for brine to water machines */
      value: tempsensor;
    }
  }

  @condition(HeatpumpType.value, "1")
  namespace airtowater {
    /** AirOutlet */
    @inherit(r, u)
    @ext(0x8, 0)
    model SourceTempOutput {
      /** heat source outlet temperature for air to water machines */
      value: tempsensor;
    }
  }

  @condition(HeatpumpType.value, "5")
  namespace airtobrinetowater {
    /** BrineOutlet */
    @inherit(r, u)
    @ext(0x8, 0)
    model SourceTempOutput {
      /** heat source outlet temperature for brine to water machines */
      value: tempsensor;
    }
  }

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** P_Brine */
    @inherit(r)
    @ext(0x16, 0)
    model SourcePress {
      /** Brine pressure sensor */
      value: presssensor;
    }
  }

  @condition(HeatpumpType.value, "5")
  namespace airtobrinetowater {
    /** P_Brine */
    @inherit(r)
    @ext(0x16, 0)
    model SourcePress {
      /** Brine pressure sensor */
      value: presssensor;
    }
  }

  @condition(HeatpumpType.value, "1")
  namespace airtowater {
    /** Fan */
    @inherit(r, u)
    @ext(0x19, 0)
    model Source {
      /** Fan AW */
      value: onoff;
    }
  }

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** HeatSourcePump BW */
    @inherit(r, u)
    @ext(0x19, 0)
    model Source {
      /** Brine Pump BW */
      value: onoff;
    }
  }

  @condition(HeatpumpType.value, "5")
  namespace airtobrinetowater {
    /** HeatSourcePump BW */
    @inherit(r, u)
    @ext(0x19, 0)
    model Source {
      /** Brine Pump BW */
      value: onoff;
    }
  }

  @condition(HeatpumpType.value, "3")
  namespace watertowater {
    /** HeatSourcePump WW */
    @inherit(r, u)
    @ext(0x19, 0)
    model Source {
      /** Brine_Pump WW */
      value: onoff;
    }
  }

  @condition(HeatpumpType.value, "3")
  namespace watertowater {
    /** Brine2_P */
    @inherit(r)
    @ext(0x1a, 0)
    model Source2Pump {
      /** external Brine or water pump */
      value: onoff;
    }
  }

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** BrineSwitch */
    @inherit(r, u)
    @ext(0x26, 0)
    model SourceSwitch {
      /** brine pressure switch; 1 = switch has tripped */
      value: errorok;
    }
  }

  @condition(HeatpumpType.value, "1")
  namespace airtowater {
    /** FanContact */
    @inherit(r, u)
    @ext(0x26, 0)
    model SourceSwitch {
      /** Fan overheat thermostat; 1 = switch has tripped */
      value: errorok;
    }
  }

  @condition(HeatpumpType.value, "5")
  namespace airtobrinetowater {
    /** BrineSwitch */
    @inherit(r, u)
    @ext(0x26, 0)
    model SourceSwitch {
      /** brine pressure switch; 1 = switch has tripped */
      value: errorok;
    }
  }

  @condition(HeatpumpType.value, "3")
  namespace watertowater {
    /** FlowSwitch */
    @inherit(r, u)
    @ext(0x26, 0)
    model SourceSwitch {
      /** water flow switch; 1 = switch has tripped */
      value: errorok;
    }
  }
  // ***** Heat generator *****

  /** P_Comp_High */
  @inherit(r, u)
  @ext(0x14, 0)
  model CompPressHigh {
    /** High pressure value - Value of high pressure sensor at compressor outlet */
    value: presssensor;
  }

  /** P_Comp_Low */
  @inherit(r, u)
  @ext(0x15, 0)
  model CompPressLow {
    /** Low pressure value - Value of low pressure sensor at compressor inlet */
    value: presssensor;
  }

  /** Superheat */
  @inherit(r)
  @ext(0x8d, 0)
  model Superheat {
    /** superheat of refrigerant circuit */
    value: temp;
  }

  /** Subcooling */
  @inherit(r)
  @ext(0x8e, 0)
  model Subcooling {
    /** subcooling of refrigerant circuit */
    value: temp;
  }

  /** Integral */
  @inherit(r)
  @ext(0x80, 0)
  model Integral {
    /** actual energy balancing integral */
    value: integral;
  }

  /** T_Inlet */
  @inherit(r, u)
  @ext(0x2, 0)
  model TempInput {
    /** Internal compressor inlet temperature sensor */
    value: tempsensor;
  }

  /** T_Outlet */
  @inherit(r, u)
  @ext(0x4, 0)
  model TempOutput {
    /** Internal compressor outlet temperature sensor */
    value: tempsensor;
  }

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** T_Condensor_BW */
    @inherit(r, u)
    @ext(0xd, 0)
    model CondensorTemp {
      /** Condensor temperature sensor BW */
      value: tempsensor;
    }
  }

  @condition(HeatpumpType.value, "3")
  namespace watertowater {
    /** T_Condensor_WW */
    @inherit(r, u)
    @ext(0xd, 0)
    model CondensorTemp {
      /** Condensor temperature sensor WW */
      value: tempsensor;
    }
  }

  @condition(HeatpumpType.value, "1")
  namespace airtowater {
    /** T_Evaporator */
    @inherit(r)
    @ext(0x5, 0)
    model EvaporatorTemp {
      /** Internal evaporator temperature sensor */
      value: tempsensor;
    }
  }

  @condition(HeatpumpType.value, "5")
  namespace airtobrinetowater {
    /** T_Condensor_BW */
    @inherit(r, u)
    @ext(0xd, 0)
    model CondensorTemp {
      /** Condensor temperature sensor BW */
      value: tempsensor;
    }
  }

  /** P_Switch */
  @inherit(r, u)
  @ext(0x25, 0)
  model PressSwitch {
    /** Compressor High/Low pressure switch chain; 1 = switch chain has tripped */
    value: errorok;
  }

  /** compressor */
  @inherit(r, u)
  @ext(0x1d, 0)
  model Comp {
    /** compressor */
    value: onoff;
  }

  /** Backup */
  @inherit(r, u)
  @ext(0x5f, 0)
  model Backup {
    /** Backup heater output */
    value: onoff;
  }

  @condition(HeatpumpType.value, "1")
  namespace airtowater {
    /** V_Cool */
    @inherit(r)
    @ext(0x1c, 0)
    model CoolValve {
      /** Refrigerant circuit reversion valve */
      value: onoff;
    }
  }
  // ***** Heat sink heating circuit *****

  /** T_Flow_CH */
  @inherit(r)
  @ext(0x9, 0)
  model HcFlowTemp {
    /** Internal Flow temperature sensor */
    value: tempsensor;
  }

  /** T_Return_CH */
  @inherit(r, u)
  @ext(0xa, 0)
  model HcReturnTemp {
    /** Internal return temperature sensor */
    value: tempsensor;
  }

  /** P_CH */
  @inherit(r)
  @ext(0x12, 0)
  model HcPress {
    /** Heating Circuit Pressure sensor */
    value: presssensor;
  }

  /** CH1_P */
  @inherit(r, u)
  @ext(0x17, 0)
  model Hc1Pump {
    /** internal CH pump */
    value: onoff;
  }

  /** T_HB_Top */
  @inherit(r, u)
  @ext(1, 0)
  model StorageTempTop {
    /** Heat Buffer Top external temperature sensor */
    value: tempsensor;
  }

  /** T_HB_Bottom */
  @inherit(r, u)
  @ext(0x7, 0)
  model StorageTempBottom {
    /** External Heat buffer bottom temperature sensor */
    value: tempsensor;
  }

  /** T_Flow_Mixed */
  @inherit(r, u)
  @ext(0x3, 0)
  model FlowTemp {
    /** External flow temperature sensor - VF2 (flow into the heating system, radiators or floor heating) */
    value: tempsensor;
  }

  /** Mixer1DutyCycle */
  @inherit(r)
  @ext(0xe, 0)
  model Mixer1DutyCycle {
    /** Opening/Closing status of mixing valve HK2, -100%...+100% */
    value: percents;
  }

  /** CH2_P */
  @inherit(r)
  @ext(0x18, 0)
  model Hc2Pump {
    /** external CH pump (HK2P) */
    value: onoff;
  }
  // ***** Heat sink domestic hot water *****

  /** T_DHW */
  @inherit(r, uhwc)
  @ext(0, 0)
  model HwcTemp {
    /** External DHW temperature sensor */
    value: tempsensor;
  }

  /** circulation pump */
  @inherit(r, u)
  @ext(0xc, 0)
  model CirPump {
    /** circulation pump */
    value: onoff;
  }

  /** V_DHW_CH */
  @inherit(r, u)
  @ext(0x10, 0)
  model HwcHcValve {
    /** UV 1 */
    value: onoff;
  }

  /** DHW_Switch */
  @inherit(r)
  @ext(0xb, 0)
  model HwcSwitch {
    /** one time circulation switch Main PCB input */
    value: onoff;
  }
  // ***** Power supply *****

  /** Power_Cut */
  @inherit(r)
  @ext(0x11, 0)
  model PowerCut {
    /** indicator that EVU has cut the power (according EWD) */
    value: yesno;
  }

  /** Phase_Status */
  @inherit(r, u)
  @ext(0x88, 0)
  model PhaseStatus {
    /** 3 flags indicating the statuses of the 3 phases at the 380V input (1= phase is there, 0 = phase is missing) */
    value: phase;
  }

  /** Phase_Order */
  @inherit(r, u)
  @ext(0x57, 1)
  model PhaseOrder {
    /** shows the order of the 3 phases; 7=OK */
    value: phaseok;
  }

  /** ICL_Out */
  @inherit(r, u)
  @ext(0x3f, 0)
  model ICLOut {
    /** inrush current limiter */
    value: onoff;
  }
  // ***** Other I/Os *****

  /** T_Outside */
  @inherit(r)
  @ext(0x6, 0)
  model OutsideTemp {
    /** External outside temperature sensor */
    value: tempsensor;
  }

  /** ActualEnvironmentPower */
  @inherit(r, u)
  @ext(0xba, 0)
  model ActualEnvironmentPower {
    /** only for graphic display: the environmental power that is actually displayed in kW */
    value: power;
  }

  /** ActualEnvironmentPowerPercentage */
  @inherit(r, u)
  @ext(0xbb, 0)
  model ActualEnvironmentPowerPercentage {
    /** only for graphic display: amount of filling of the big energy arrow */
    value: percent0;
  }

  /** Fan_Brine_Port */
  @inherit(r)
  @ext(0x37, 1)
  model SourcePort {
    /** port feedback; only needed by UI in actuator test */
    value: onoff;
  }

  /** CH1_P_Port */
  @inherit(r)
  @ext(0x38, 1)
  model Hc1PumpPort {
    /** port feedback; only needed by UI in actuator test */
    value: onoff;
  }

  /** injection */
  @inherit(r)
  @ext(0x1f, 0)
  model Injection {
    /** injection */
    value: onoff;
  }
  // ##### EHP: Parameters and information #####
  // ***** Basic data *****

  /** date */
  @inherit(r)
  @ext(0x29, 0)
  model Date {
    /** Actual Date */
    value: date;
  }

  /** Compressor_Demand */
  @inherit(r)
  @ext(0x54, 0)
  model CompDemand {
    /** shows that regulation wants to start the heat source */
    value: yesno;
  }

  /** weekday */
  @inherit(r)
  @ext(0x2a, 0)
  model Weekday {
    /** Actual Weekday */
    value: bday;
  }

  /** time */
  @inherit(r)
  @ext(0x28, 0)
  model Time {
    /** Actual Time */
    value: time;
  }

  /** Heat_Pump_Status */
  @inherit(r, u)
  @ext(0xd0, 0)
  model HeatPumpStatus {
    /** contains the status of the heatpump shown to the installer. Values do not fit here. Please ask R&D for values. */
    value: hpstatus;
  }

  @condition(id.id.sw, "=350-400")
  namespace sw_350_400 {
    /** CompressorRestartTimer */
    @inherit(r)
    @ext(0x9c, 1)
    model CompRestartTimer {
      /** Delay until next compressor start, only updated and displayed in UI if compressor demanded but locked by runtime conditions. */
      value: minutes;
    }
  }

  @condition(id.id.sw, ">=403")
  namespace sw__403 {
    /** CompressorRestartTimer */
    @inherit(r)
    @ext(0xc5, 1)
    model CompRestartTimer {
      /** Delay until next compressor start, only updated and displayed in UI if compressor demanded but locked by runtime conditions. */
      value: minutes;
    }
  }
  // ***** Backup heater *****

  /** Ext_Backup */
  @inherit(r, wi)
  @ext(0x92, 0)
  model BackupType {
    /** Configuration of backup heater installation location */
    value: backtype;
  }

  /** Bivalent_Temperature */
  @inherit(r, wi)
  @ext(0x65, 0)
  model BivalentTemp {
    /** outside temperature must be lower than this temperature in order to use backup heater for CH */
    value: temp;
  }

  /** Backup_Hysteresis */
  @inherit(r, wi)
  @ext(0x7e, 0)
  model BackupHysteresis {
    /** difference between actual flow temperature and setpoit at which backup heater should start */
    value: temp;
  }

  @condition(id.id.sw, ">=414")
  namespace sw__414 {
    /** hysteresis_time_delay */
    @inherit(r, wi)
    @ext(0xe0, 1)
    model hysteresisTimeDelay {
      /** defined time delay until backup heater hysteresis becomes valid */
      value: minutes0;
    }
  }

  @condition(id.id.sw, ">=415")
  namespace sw__415 {
    /** BrineLimitAtMaxFlow */
    @inherit(r, ws)
    @ext(0xe4, 1)
    model SourceLimitAtMaxFlow {
      /** lowest allowed brine temperature to achieve max. flow temperature */
      value: SCH;
    }
  }

  /** Integral_Backup_Start */
  @inherit(r, wi)
  @ext(0x7f, 0)
  model BackupIntegral {
    /** integral at which backup heater should start */
    value: integral;
  }

  /** Backup_Heater_Mode_CH */
  @inherit(r, wi)
  @ext(0x63, 0)
  model BackupModeHc {
    /** backup heater mode for CH: no backup, comfort or backup only */
    value: backmode;
  }

  /** Backup_Heater_Mode_DHW */
  @inherit(r, wi)
  @ext(0x64, 0)
  model BackupModeHwc {
    /** backup heater mode for DHW: no backup, comfort or backup only */
    value: backmode;
  }

  /** Backup_Power_Cut */
  @inherit(r, ws)
  @ext(0x86, 0)
  model BackupPowerCut {
    /** This enables the backup heater to run while power cuts as compressor replacement, only applicable if electrical scheme is two. */
    value: yesno;
  }
  // ***** Compressor settings *****

  /** Compressor_Hysteresis */
  @inherit(r, wi)
  @ext(0x7d, 0)
  model CompHysteresis {
    /** difference between actual flow temperature and setpoit at which compressor should start */
    value: temp;
  }

  /** Integral_Comp_Start */
  @inherit(r, wi)
  @ext(0x7c, 0)
  model CompIntegral {
    /** integral at which compressor should start */
    value: integral;
  }

  /** Number_Comp_Starts */
  @inherit(r, wi)
  @ext(0x74, 0)
  model NumberCompStarts {
    /** maximum number of compressor starts per hour */
    value: UCH;
  }

  /** Max_Return_Temperature */
  @inherit(r, wi)
  @ext(0x73, 0)
  model ReturnTempMax {
    /** if return temperature is higher than this, compressor stops or might not restart */
    value: temp;
  }

  @condition(HeatpumpType.value, "5")
  namespace airtobrinetowater {
    /** Overpressure_BW */
    @inherit(r, ws)
    @ext(0x77, 1)
    model OverpressureThreshold {
      /** limit for compressor high pressure which is considered an overpressure situation (for Brine/Water machines) */
      value: pressm;
    }
  }
  // ***** Heat source geothermal energy *****

  @condition(HeatpumpType.value, "1")
  namespace airtowater {
    /** Overpressure_Threshold_AW */
    @inherit(r, ws)
    @ext(0xfa, 0)
    model OverpressureThreshold {
      /** limit for high pressure when Overpressure should be indicated on A/W machines */
      value: pressm;
    }
  }

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** Overpressure_BW */
    @inherit(r, ws)
    @ext(0x77, 1)
    model OverpressureThreshold {
      /** limit for compressor high pressure which is considered an overpressure situation (for Brine/Water machines) */
      value: pressm;
    }
  }

  @condition(HeatpumpType.value, "3")
  namespace watertowater {
    /** Overpressure_WW */
    @inherit(r, ws)
    @ext(0x77, 1)
    model OverpressureThreshold {
      /** limit for compressor high pressure which is considered an overpressure situation (for Water/Water machines) */
      value: pressm;
    }
  }

  @condition(HeatpumpType.value, "5")
  namespace airtobrinetowater {
    /** Delta_T6_T7_BW */
    @inherit(r, wi)
    @ext(0x6e, 0)
    model DeltaTempT6T7 {
      /** Maximum temperature difference between heat source outlet and inlet - BW */
      value: temp;
    }
  }

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** Delta_T6_T7_BW */
    @inherit(r, wi)
    @ext(0x6e, 0)
    model DeltaTempT6T7 {
      /** Maximum temperature difference between heat source outlet and inlet - BW */
      value: temp;
    }
  }

  @condition(HeatpumpType.value, "3")
  namespace watertowater {
    /** Delta_T6_T7_WW */
    @inherit(r, wi)
    @ext(0x6e, 0)
    model DeltaTempT6T7 {
      /** Maximum temperature difference between heat source outlet and inlet - WW */
      value: temp;
    }
  }

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** Einfrierschutz */
    @inherit(r, wi)
    @ext(0x7a, 1)
    model SourceTempOutputT8Min {
      /** Minimum heat source outlet temperature BW (equal to WW) */
      value: temps;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=400")
  namespace airtobrinetowater_sw__400 {
    /** Einfrierschutz */
    @inherit(r, wi)
    @ext(0xb0, 1)
    model SourceTempOutputT8Min {
      /** Minimum heat source outlet temperature VWLS */
      value: temps;
    }
  }

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** HS_Pump_Prerun_BW */
    @inherit(r, wi)
    @ext(0x76, 0)
    model SourcePumpPrerunTime {
      /** Heat source pump prerun in heat source circuit - BW */
      value: minutes;
    }
  }

  @condition(HeatpumpType.value, "5")
  namespace airtobrinetowater {
    /** HS_Pump_Prerun_BW */
    @inherit(r, wi)
    @ext(0x76, 0)
    model SourcePumpPrerunTime {
      /** Heat source pump prerun in heat source circuit - BW */
      value: minutes;
    }
  }

  @condition(HeatpumpType.value, "3")
  namespace watertowater {
    /** HS_Pump_Prerun_WW */
    @inherit(r, wi)
    @ext(0x76, 0)
    model SourcePumpPrerunTime {
      /** Heat source pump prerun in heat source circuit - WW */
      value: minutes;
    }
  }

  @condition(HeatpumpType.value, "1")
  @condition(id.id.sw, "=350-400")
  namespace airtowater_sw_350_400 {
    /** AW_Fan_Prerun_Time */
    @inherit(r, wi)
    @ext(0x9d, 1)
    model FanPrerunTime {
      /** Prerun time of the fan in s */
      value: seconds;
    }
  }

  @condition(HeatpumpType.value, "1")
  @condition(id.id.sw, ">=403")
  namespace airtowater_sw__403 {
    /** AW_Fan_Prerun_Time */
    @inherit(r, wi)
    @ext(0xc6, 1)
    model FanPrerunTime {
      /** Prerun time of the fan in s */
      value: seconds;
    }
  }
  // ***** Heat sink heating circuit *****

  @condition(id.id.sw, ">=370")
  namespace sw__370 {
    /** FirstCHEnergySavingPumpOffTime */
    @inherit(r, wi)
    @ext(0x99, 1)
    model FirstHcEnergySavingPumpOffTime {
      /** CH pump off time for pump switch off during heating operation with direct heating circuits. Function is off from factory but can be activated in service menus via Code1. */
      value: minutes0;
    }
  }

  @condition(HeatpumpType.value, "1")
  @condition(id.id.sw, "=350-400")
  namespace airtowater_sw_350_400 {
    /** AW_CH1P_Prerun_Time */
    @inherit(r, wi)
    @ext(0x9e, 1)
    model Hc1PumpPrerunTime {
      /** Prerun time of the internal heat circuit pump in s. Relative to the fan prerun time. */
      value: seconds;
    }
  }

  @condition(HeatpumpType.value, "2")
  @condition(id.id.sw, "=350-400")
  namespace brinetowater_sw_350_400 {
    /** BW_WW_CH1P_Prerun_Time */
    @inherit(r, wi)
    @ext(0x9f, 1)
    model Hc1PumpPrerunTime {
      /** Prerun time of the internal heat circuit pump in s. Relative to the heat source pump prerun time. */
      value: seconds;
    }
  }

  @condition(HeatpumpType.value, "1")
  @condition(id.id.sw, ">=403")
  namespace airtowater_sw__403 {
    /** AW_CH1P_Prerun_Time */
    @inherit(r, wi)
    @ext(0xc7, 1)
    model Hc1PumpPrerunTime {
      /** Prerun time of the internal heat circuit pump in s. Relative to the fan prerun time. */
      value: seconds;
    }
  }

  @condition(HeatpumpType.value, "2")
  @condition(id.id.sw, ">=403")
  namespace brinetowater_sw__403 {
    /** BW_WW_CH1P_Prerun_Time */
    @inherit(r, wi)
    @ext(0xc8, 1)
    model Hc1PumpPrerunTime {
      /** Prerun time of the internal heat circuit pump in s. Relative to the heat source pump prerun time. */
      value: seconds;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=403")
  namespace airtobrinetowater_sw__403 {
    /** BW_WW_CH1P_Prerun_Time */
    @inherit(r, wi)
    @ext(0xc9, 1)
    model Hc1PumpPrerunTime {
      /** Prerun time of the internal heat circuit pump in s. Relative to the heat source pump prerun time. */
      value: seconds;
    }
  }
  // ***** Operating data ****

  /** Compressor_Hours_CH */
  @inherit(r)
  @ext(0x9b, 0)
  model CompHoursHc {
    /** operating hours of compressor for CH mode */
    value: hoursum;
  }

  /** Compressor_Hours */
  @inherit(r)
  @ext(0x9a, 0)
  model CompHours {
    /** operating hours of compressor (overall) */
    value: hoursum;
  }

  /** Compressor_Hours_DHW */
  @inherit(r)
  @ext(0x9c, 0)
  model CompHoursHwc {
    /** operating hours of compressor for DHW mode */
    value: hoursum;
  }

  /** Compressor_Commutations */
  @inherit(r)
  @ext(0xaa, 0)
  model CompStarts {
    /** Number of commutations of compressor */
    value: cntstarts;
  }

  /** Backup_Hours */
  @inherit(r)
  @ext(0xa1, 0)
  model BackupHours {
    /** operating hours of Backup Heater */
    value: hoursum;
  }

  /** Backup_Hours_CH */
  @inherit(r)
  @ext(0xa2, 0)
  model BackupHoursHc {
    /** operating hours of Backup Heater for CH */
    value: hoursum;
  }

  /** Backup_Hours_DHW */
  @inherit(r)
  @ext(0xa3, 0)
  model BackupHoursHwc {
    /** operating hours of Backup Heater for DHW */
    value: hoursum;
  }

  /** Backup_Commutations */
  @inherit(r)
  @ext(0xb1, 0)
  model BackupStarts {
    /** Number of commutations of backup heater */
    value: cntstarts;
  }
  // ***** Cooling operation *****

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** MinFlowtempCooling */
    @inherit(r, wi)
    @ext(0x74, 1)
    model FlowtempCoolingMin {
      /** flow temperature that must be exceeded to start cooling */
      value: temp0;
    }
  }

  @condition(HeatpumpType.value, "2")
  @condition(id.id.sw, ">=350")
  namespace brinetowater_sw__350 {
    /** Brine_P_Cooling_Hours */
    @inherit(r)
    @ext(0x7d, 1)
    model SourcePumpCoolingHours {
      /** Brine pump run time during cooling */
      value: hoursum;
    }
  }
  // ***** Installation menu *****

  /** appliance code */
  @inherit(r, wi, u)
  @ext(0x43, 1)
  model ApplianceCode {
    /** appliance code */
    value: UCH;
  }

  /** heatpump type */
  @inherit(r)
  @ext(0x76, 1)
  model HeatpumpType {
    /** heatpump type */
    @values(values_HeatpumpType)
    value: UCH;
  }

  /** Electric_Wiring_Diagram */
  @inherit(r, ws, u)
  @ext(0x87, 0)
  model ElectricWiringDiagram {
    /** represents the electrical installation (plan 1...3) */
    value: UCH;
  }
  // ***** Miscellaneous *****

  /** State_Software_Code */
  @inherit(r, u)
  @ext(0xcf, 0)
  model StateSoftwareCode {
    /** contains several detail information about the actual status of the heatpump for the developer */
    value: ULG;
  }

  /** Acceleration_Test_Mode */
  @inherit(r, wi, u)
  @ext(0x66, 0)
  model AccelerationTestMode {
    /** initiates/indicates acceleration of several internal timings */
    value: yesno;
  }

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** Bleeding */
    @inherit(r, wi, u)
    @ext(0x13, 0)
    model Bleeding {
      /** Initiates and indicates the bleeding function */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "1")
  namespace airtowater {
    /** Start_Deicing */
    @inherit(r, wi)
    @ext(0x71, 0)
    model StartDeicing {
      /** initiates/indicates a manual deicing process */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "1")
  namespace airtowater {
    /** Time_Before_Next_Deicing */
    @inherit(r)
    @ext(0x70, 0)
    model TimeBeforeNextDeicing {
      /** Time until next deicing in 0.5 secs */
      value: seconds;
    }
  }

  /** Code1 */
  @inherit(r, wi)
  @ext(0x97, 0)
  model Code1 {
    /** together with code 2, this enables/disables several sw features, in hex format */
    value: code;
  }

  /** Code2 */
  @inherit(r, wi)
  @ext(0x98, 0)
  model Code2 {
    /** together with code 1, this enables/disables several sw features, in hex format */
    value: code;
  }

  /** Code1Code2Valid */
  @inherit(r, wi)
  @ext(0x24, 0)
  model Code1Code2Valid {
    /** changes of Code 1 /2 have to be commited by setting this flag */
    value: yesno;
  }

  @condition(id.id.sw, ">=415")
  namespace sw__415 {
    /** HysteresisTimerCountdown */
    @inherit(r)
    @ext(0xe7, 1)
    model HysteresisTimerCountdown {
      /** backup heater countdown timer */
      value: UCH;
    }
  }

  /** Hzdraulic plan */
  @inherit(r, wc)
  @ext(0x60, 0)
  model HydraulicScheme {
    /** Hydraulic Schematic */
    value: UCH;
  }

  /** DhwLaggingTime */
  @inherit(r)
  @ext(0x61, 0)
  model HwcLaggingTime {
    /** Backup heater use for CH */
    value: UCH;
  }

  /** DhwLoadingDelay */
  @inherit(r)
  @ext(0x62, 0)
  model HwcLoadingDelay {
    /** Backup heater use for DHW */
    value: UCH;
  }

  /** Brine_Fan_Hours */
  @inherit(r)
  @ext(0x9d, 0)
  model SourceHours {
    /** operating hours of Fan_Brine */
    value: hoursum;
  }

  /** Brine2_P_Hours */
  @inherit(r)
  @ext(0x9e, 0)
  model Source2PumpHours {
    /** operating hours of Sk2P */
    value: hoursum;
  }

  /** SoftwareCode */
  @inherit(r)
  @ext(0x18, 1)
  model SoftwareCode {
    /** 4 Bytes holding several software status info */
    value: UCH;
  }

  @condition(id.id.sw, ">=414")
  namespace sw__414 {
    /** ActualEnvironmentPowerFine */
    @inherit(r, u)
    @ext(0xe2, 1)
    model ActualEnvironmentPowerFine {
      /** environment power in higher resolution (100W) */
      @unit("hW")
      value: UCH;
    }
  }

  /** CH1_P_Hours */
  @inherit(r)
  @ext(0x9f, 0)
  model Hc1PumpHours {
    /** operating hours of CH1P */
    value: hoursum;
  }

  /** CH2_P_Hours */
  @inherit(r)
  @ext(0xa0, 0)
  model Hc2PumpHours {
    /** operating hours of HK2P */
    value: hoursum;
  }

  /** CH_Mode_Demand_Hours */
  @inherit(r)
  @ext(0xa4, 0)
  model HcModeDemandHours {
    /** total time EHP was in CH mode (energy manager) */
    value: hoursum;
  }

  /** CH_Mode_Fulfilled_Hours */
  @inherit(r)
  @ext(0xa5, 0)
  model HcModeFulfilledHours {
    /** total time EHP was in CH mode AND compr. Or backup heater was running */
    value: hoursum;
  }

  /** DHW_Mode_Demand_Hours */
  @inherit(r)
  @ext(0xa6, 0)
  model HwcModeDemandHours {
    /** total time EHP was in DHW mode (energy manager) */
    value: hoursum;
  }

  /** DHW_Mode_Fulfilled_Hours */
  @inherit(r)
  @ext(0xa7, 0)
  model HwcModeFulfilledHours {
    /** total time EHP was in DHW mode AND compr. Or backup heater was running */
    value: hoursum;
  }

  /** CompressorState */
  @inherit(r)
  @ext(0xe4, 0)
  model CompState {
    /** compressor and ICL state machine status number */
    value: UCH;
  }

  /** MinTimeCompressorOn */
  @inherit(r)
  @ext(0xe6, 0)
  model TimeCompOnMin {
    /** minimum time that compressor must run in 0,5s steps */
    value: seconds;
  }

  /** MinTimeCompressorOff */
  @inherit(r)
  @ext(0xe7, 0)
  model TimeCompOffMin {
    /** minimum time the compressor must be off before restart in 0,5s steps */
    value: seconds;
  }

  /** MinTimeBetweenTwoCompressorStarts */
  @inherit(r)
  @ext(0xe8, 0)
  model TimeBetweenTwoCompStartsMin {
    /** calculated from menu item "compressor starts per hour" in 0,5s steps */
    value: seconds;
  }

  /** CompressorControlState */
  @inherit(r)
  @ext(0xe9, 0)
  model CompControlState {
    /** number of status of compressor control state machine */
    value: UCH;
  }

  /** RebootCounter */
  @inherit(r)
  @ext(0xf5, 0)
  model RebootCounter {
    /** number of appliance starts */
    value: UIN;
  }

  /** T19_Max_To_Compressor_Off */
  @inherit(r)
  @ext(0x2b, 1)
  model T19MaxToCompOff {
    /** limit on compressor outlet temp that leads to an overpressure situation */
    value: temp;
  }

  @inherit(r, w)
  @ext(0xd1, 0)
  model EnergyBalancingRelease {
    value: onoff;
  }

  @inherit(r, u)
  @ext(0xd3, 0)
  model TimeOfNextPredictedPowerCut {
    value: time;
  }

  @inherit(r, whwc)
  @ext(0xf4, 0)
  model PowerCutPreloading {
    value: onoff;
  }
  // ***** for high efficiency pumps only *****

  @condition(id.id.sw, ">=407")
  namespace sw__407 {
    /** BrinePumpStatus */
    @inherit(r, u)
    @ext(0xb8, 1)
    model SourcePumpStatus {
      /** 0=HEP_ok: 1= HEP_error; >=2=noHEP */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=407")
  namespace sw__407 {
    /** BrinePumpPWM */
    @inherit(r)
    @ext(0xac, 1)
    model SourcePumpPWM {
      /** actual speed of brine pump (7%=off) */
      value: percent0;
    }
  }

  @condition(HeatpumpType.value, "5")
  namespace airtobrinetowater {
    /** Bleeding */
    @inherit(r, wi, u)
    @ext(0x13, 0)
    model Bleeding {
      /** Initiates and indicates the bleeding function */
      value: yesno;
    }
  }

  @condition(id.id.sw, ">=407")
  namespace sw__407 {
    /** BrinePumpSpeedControlHeating */
    @inherit(r, wi)
    @ext(0xae, 1)
    model SourcePumpSpeedControlHeating {
      /** brine pump speed setpoint when compressor=on */
      value: percent0;
    }
  }
  // ***** VWL-S only *****

  @condition(id.id.sw, ">=407")
  namespace sw__407 {
    /** BrinePumpSpeedControlDefrost */
    @inherit(r, wi)
    @ext(0xcc, 1)
    model SourcePumpSpeedControlDefrost {
      /** brine pump speed setpoint while defrosting */
      value: percent0;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** DeicingActive */
    @inherit(r)
    @ext(0xce, 1)
    model DeicingActive {
      /** ODU is in defrosting mode */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** Selftest */
    @inherit(r, ws)
    @ext(0xd0, 1)
    model Selftest {
      /** selftest adjustable steps: 0=off; 1=StartSelfTest, 30=bleeding (Entlüftung brine circuit) */
      value: UCH;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** BivalentPoint2_Temperature */
    @inherit(r, wi)
    @ext(0xbc, 1)
    model BivalentPoint2Temp {
      /** temperature to force backup heater even if it is disabled */
      value: temp;
    }
  }

  @condition(id.id.sw, ">=414")
  namespace sw__414 {
    /** BivalentMode */
    @inherit(r, wi)
    @ext(0xe3, 1)
    model BivalentMode {
      /** reserved for special bivalent setting */
      value: UCH;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** VWLS_NoiseReduction */
    @inherit(r, w)
    @ext(0xa9, 1)
    model NoiseReduction {
      /** noise reduction is activated by time schedule */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** NoiseReductionFactor */
    @inherit(r, w)
    @ext(0x24, 1)
    model NoiseReductionFactor {
      /** amount of noise reduction when activated by time schedule */
      value: percent0;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** VWLS_FanError */
    @inherit(r)
    @ext(0xa1, 1)
    model FanError {
      /** fan error OMU 1 */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** VWLS_FanError_OMU2 */
    @inherit(r)
    @ext(0xb6, 1)
    model FanErrorOMU2 {
      /** fan error OMU 2 */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** VWLS_STBError */
    @inherit(r)
    @ext(0xa2, 1)
    model STBError {
      /** defroster STB error OMU 1 */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** VWLS_STBError_OMU2 */
    @inherit(r)
    @ext(0xb7, 1)
    model STBErrorOMU2 {
      /** defroster STB error OMU 2 */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** VWLS_BadWeather */
    @inherit(r)
    @ext(0xa4, 1)
    model BadWeather {
      /** ambient too cold OMU 1 */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** VWLS_BadWeather_OMU2 */
    @inherit(r, u)
    @ext(0xb9, 1)
    model BadWeatherOMU2 {
      /** ambient too cold OMU 2 */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** VWLS_HotSummer */
    @inherit(r)
    @ext(MF, 1)
    model HotSummer {
      /** ambient too hot OMU 1 */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "5")
  @condition(id.id.sw, ">=407")
  namespace airtobrinetowater_sw__407 {
    /** VWLS_HotSummer_OMU2 */
    @inherit(r, u)
    @ext(0xb8, 1)
    model HotSummerOMU2 {
      /** ambient too hot OMU 2 */
      value: yesno;
    }
  }

  @condition(HeatpumpType.value, "5")
  namespace airtobrinetowater {
    /** Start Defrosting */
    @inherit(r, wi)
    @ext(0x71, 0)
    model StartDeicing {
      value: yesno;
    }
  }

  @condition(id.id.sw, ">=415")
  namespace sw__415 {
    /** BrineLimitSlope */
    @inherit(r, ws)
    @ext(0xe5, 1)
    model SourceLimitSlope {
      /** Slope to calculate pressure switchpoint below lowest brine temperature */
      value: UCH;
    }
  }

  @condition(id.id.sw, ">=415")
  namespace sw__415 {
    /** maxNDPressure */
    @inherit(r, ws)
    @ext(0xe9, 1)
    model maxNDPressure {
      /** max. allowed low pressure for compressor protection */
      value: ULG;
    }
  }

  /** HcParallelTankFillingEnabled */
  @inherit(r)
  @ext(0x55, 0)
  model HcParallelStorageFillingEnabled {
    /** BMR: indicates that heating circuits can keep running at dhw loading; for heatpumps, this is 1 if there is a heat buffer, 0 otherwise */
    value: yesno;
  }
  // ##### EHP: Sensor calibration #####

  @condition(HeatpumpType.value, "5")
  namespace airtobrinetowater {
    /** BrineOutlet */
    @inherit(r, wi)
    @ext(0xc9, 0)
    model SourceTempOutputOffset {
      /** Offset for heat source outlet temperature sensor - BW */
      value: calibration;
    }
  }

  /** T_Outside_Offset */
  @inherit(r, wi)
  @ext(0xc3, 0)
  model OutsideTempOffset {
    /** Offset for calibrating temperature sensor */
    value: calibration;
  }

  /** T_Brine_Warm_Offset */
  @inherit(r, wi)
  @ext(0xcd, 0)
  model SourceTempInputOffset {
    /** Offset for calibrating temperature sensor */
    value: calibration;
  }

  @condition(HeatpumpType.value, "1")
  namespace airtowater {
    /** AirOutlet */
    @inherit(r, wi)
    @ext(0xc9, 0)
    model SourceTempOutputOffset {
      /** Offset for air outlet temperature sensor */
      value: calibration;
    }
  }

  @condition(HeatpumpType.value, "2")
  namespace brinetowater {
    /** BrineOutlet */
    @inherit(r, wi)
    @ext(0xc9, 0)
    model SourceTempOutputOffset {
      /** Offset for heat source outlet temperature sensor - BW */
      value: calibration;
    }
  }

  @condition(HeatpumpType.value, "3")
  namespace watertowater {
    /** OutletTemperature */
    @inherit(r, wi)
    @ext(0xc9, 0)
    model SourceTempOutputOffset {
      /** Offset for heat source outlet temperature sensor - WW */
      value: calibration;
    }
  }

  /** T_DHW_Offset */
  @inherit(r, wi)
  @ext(0xc4, 0)
  model HwcTempOffset {
    /** Offset for calibrating temperature sensor */
    value: calibration;
  }

  /** T_Flow_CH_Offset */
  @inherit(r, wi)
  @ext(0xca, 0)
  model HcFlowTempOffset {
    /** Offset for calibrating temperature sensor */
    value: calibration;
  }

  /** T_Flow_Mixed_Offset */
  @inherit(r, wi)
  @ext(0xc5, 0)
  model FlowTempOffset {
    /** Offset for calibrating temperature sensor */
    value: calibration;
  }

  /** T_Inlet_Offset */
  @inherit(r, wi)
  @ext(0xc6, 0)
  model TempInputOffset {
    /** Offset for calibrating temperature sensor */
    value: calibration;
  }

  /** T_Outlet_Offset */
  @inherit(r, wi)
  @ext(0xc7, 0)
  model TempOutputOffset {
    /** Offset for calibrating temperature sensor */
    value: calibration;
  }

  /** T_Return_CH_Offset */
  @inherit(r, wi)
  @ext(0xcb, 0)
  model HcReturnTempOffset {
    /** Offset for calibrating temperature sensor */
    value: calibration;
  }

  /** T_HB_Bottom_Offset */
  @inherit(r, wi)
  @ext(0x34, 1)
  model StorageTempBottomOffset {
    /** Offset for calibrating temperature sensor */
    value: calibration;
  }

  /** T_HB_Top_Offset */
  @inherit(r, wi)
  @ext(0x33, 1)
  model StorageTempTopOffset {
    /** Offset for calibrating temperature sensor */
    value: calibration;
  }
  // ##### EHP: Sensor Check #####

  @condition(HeatpumpType.value, "3")
  namespace watertowater {
    /** T_Condensor_WW */
    @inherit(r)
    @ext(0x5, 0)
    model EvaporatorTemp {
      /** Condensor temperature sensor WW */
      value: temp;
    }
  }

  enum values_HeatpumpType {
    airtowater: 1,
    brinetowater: 2,
    watertowater: 3,
    indirectwatertowater: 4,
    brinetowater_1: 5,
  }

  /** included parts */
  union _includes {
    iotesthp_inc,
    errors_inc,
    hcmode_inc,
  }
}
