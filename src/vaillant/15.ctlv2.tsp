import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace Ctlv2 {
  // ,CTLV2,sensoCOMFORT VRC 720/2 (SW 0514)
  // ##### General #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0, 0)
  model r_1 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0, 0)
  model w_1 {}

  /** continous heating */
  @inherit(r_1, w_1)
  @ext(0x2, 0)
  model ContinuousHeating {
    /** -26=off, when the outside temperature falls below this threshold temperature the continuous heating function is started (off <=> function is disabled) */
    value: tempv;
  }

  /** frost delay time */
  @inherit(r_1, w_1)
  @ext(0x3, 0)
  model FrostOverRideTime {
    /** delay before frost protection is activated */
    value: hoursum2;
  }

  /** hwc parallel loading */
  @inherit(r_1, w_1)
  @ext(0xa, 0)
  model HwcParallelLoading {
    /** heating and hot water parallel */
    value: onoff;
  }

  /** max room humidity */
  @inherit(r_1, w_1)
  @ext(0xe, 0)
  model MaxRoomHumidity {
    /** maximum room humidity */
    value: UIN;
  }

  /** adaptive heat curve */
  @inherit(r_1, w_1)
  @ext(0x14, 0)
  model AdaptHeatCurve {
    /** automatic correction of configured heat curve */
    value: yesno;
  }

  /** maximale Speicherladezeit */
  @inherit(r_1, w_1)
  @ext(0x17, 0)
  model MaxCylinderChargeTime {
    /** maximum cylinder charging time */
    value: minutes2;
  }

  /** hwc lock time */
  @inherit(r_1, w_1)
  @ext(0x18, 0)
  model HwcLockTime {
    /** Lock time hot water current */
    value: minutes2;
  }

  /** pump additional time */
  @inherit(r_1, w_1)
  @ext(0x1b, 0)
  model PumpAdditionalTime {
    /** chargepump additional operationtime */
    value: minutes2;
  }

  /** hysteresis cylinder charge */
  @inherit(r_1, w_1)
  @ext(0x27, 0)
  model CylinderChargeHyst {
    /** hysteris storage tank loading */
    value: calibrationv;
  }

  /** offset cylinder charge */
  @inherit(r_1, w_1)
  @ext(0x29, 0)
  model CylinderChargeOffset {
    /** storage tank loading. Offset */
    value: calibrationv;
  }

  /** next maintenance */
  @inherit(r_1, w_1)
  @ext(0x2c, 0)
  model MaintenanceDate {
    /** date next maintenance */
    value: date;
  }

  /** date */
  @inherit(r_1, w_1)
  @ext(0x34, 0)
  model Date {
    /** current date */
    value: date;
  }

  /** time */
  @inherit(r_1, w_1)
  @ext(0x35, 0)
  model Time {
    /** current time */
    value: HTI;
  }

  /** Systemschema */
  @inherit(r_1, w_1)
  @ext(0x36, 0)
  model HydraulicScheme {
    /** system scheme */
    value: UIN;
  }
  // r;w,Unknown38,(constant 21),3800,tempv,unknown value

  /** water pressure */
  @inherit(r_1)
  @ext(0x39, 0)
  model WaterPressure {
    /** water pressure */
    value: pressv;
  }

  /** total solar yield */
  @inherit(r_1, w_1)
  @ext(0x3d, 0)
  model SolarYieldTotal {
    /** solar yield total */
    value: energy4;
  }

  /** total environmental yield */
  @inherit(r_1, w_1)
  @ext(0x3e, 0)
  model YieldTotal {
    /** envrionment yield total */
    value: energy4;
  }

  /** hwc max flow temp desired */
  @inherit(r_1, w_1)
  @ext(0x46, 0)
  model HwcMaxFlowTempDesired {
    /** maximum flow temperature setpoint of Hwc */
    value: tempv;
  }

  /** system flow temp */
  @inherit(r_1)
  @ext(0x4b, 0)
  model SystemFlowTemp {
    /** system flow temperature */
    value: tempv;
  }

  /** multifunction relay setting */
  @inherit(r_1, w_1)
  @ext(0x4d, 0)
  model MultiRelaySetting {
    value: mamode;
  }

  /** this months fuel consumption heating */
  @inherit(r_1, w_1)
  @ext(0x4e, 0)
  model PrFuelSumHcThisMonth {
    /** current month fuel consumption heating */
    value: energy4;
  }

  /** this months energy consumption heating */
  @inherit(r_1, w_1)
  @ext(0x4f, 0)
  model PrEnergySumHcThisMonth {
    /** current month electricity consumption heating */
    value: energy4;
  }

  /** this months energy consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x50, 0)
  model PrEnergySumHwcThisMonth {
    /** current month electricity consumption hot water */
    value: energy4;
  }

  /** this months fuel consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x51, 0)
  model PrFuelSumHwcThisMonth {
    /** Current Month fuel consumption hot water */
    value: energy4;
  }

  /** last months fuel consumption heating */
  @inherit(r_1, w_1)
  @ext(0x52, 0)
  model PrFuelSumHcLastMonth {
    /** last month fuel consumption heating */
    value: energy4;
  }

  /** last months energy consumption heating */
  @inherit(r_1, w_1)
  @ext(0x53, 0)
  model PrEnergySumHcLastMonth {
    /** last month electricity consumption heating */
    value: energy4;
  }

  /** last months energy consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x54, 0)
  model PrEnergySumHwcLastMonth {
    /** last month electricity consumption hot water */
    value: energy4;
  }

  /** last months fuel consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x55, 0)
  model PrFuelSumHwcLastMonth {
    /** last month fuel consumption hot water */
    value: energy4;
  }

  /** total fuel consumption heating */
  @inherit(r_1, w_1)
  @ext(0x56, 0)
  model PrFuelSumHc {
    /** total year fuel consumption heating */
    value: energy4;
  }

  /** total energy consumption heating */
  @inherit(r_1, w_1)
  @ext(0x57, 0)
  model PrEnergySumHc {
    /** total year electricity consumption heating */
    value: energy4;
  }

  /** total energy consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x58, 0)
  model PrEnergySumHwc {
    /** total year electricity consumption hot water */
    value: energy4;
  }

  /** total fuel consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x59, 0)
  model PrFuelSumHwc {
    /** total year fuel consumption hot water */
    value: energy4;
  }

  /** total energy consumption */
  @inherit(r_1, w_1)
  @ext(0x5c, 0)
  model PrEnergySum {
    /** total year electricity consumption */
    value: energy4;
  }

  /** total fuel consumption */
  @inherit(r_1, w_1)
  @ext(0x5d, 0)
  model PrFuelSum {
    /** total year fuel consumption */
    value: energy4;
  }
  // r;w,Unknown67,(VR70 konfig 1),6700,tempv,unknown value
  // r;w,Unknown68,(VR70 konfig 1),6800,tempv,unknown value
  // r;w,OpModeEffect,op mode effect (Does not seem to work anymore),6900,zonesel,selection which heating circuit is affected by changing parameters in the basic display

  /** installer name 1 */
  @inherit(r_1, w_1)
  @ext(0x6c, 0)
  model Installer1 {
    /** installer's name */
    value: shortname;
  }

  /** installer name 2 */
  @inherit(r_1, w_1)
  @ext(0x6d, 0)
  model Installer2 {
    /** installer's name */
    value: shortname;
  }

  /** phone number 1 */
  @inherit(r_1, w_1)
  @ext(0x6f, 0)
  model PhoneNumber1 {
    /** installer's telephone number */
    value: shortphone;
  }

  /** phone number 2 */
  @inherit(r_1, w_1)
  @ext(0x70, 0)
  model PhoneNumber2 {
    /** installer's telephone number */
    value: shortphone;
  }
  // r;w,HolidayStartPeriod,holiday start period,7100,hfrom,start date of holidays
  // r;w,HolidayEndPeriod,holiday end period,7200,hto,end date of holidays

  /** outside temperature */
  @inherit(r_1)
  @ext(0x73, 0)
  model DisplayedOutsideTemp {
    /** outside temperature */
    value: tempv;
  }
  // r;w,SFMode,SF mode,7400,sfmode

  /** code for installer menu */
  @inherit(r_1, w_1)
  @ext(0x76, 0)
  model KeyCodeforConfigMenu {
    /** 000-999; code for the installer's menues */
    value: UIN;
  }
  // r;w,OpMode,operation mode,7b00,opmode,operation mode of all/configured zone(s) matching OpModeEffect
  // r;w,HolidayTemp,holiday temperature,8200,tempv,holiday setpoint
  // r;w,BankHolidayStartPeriod,bank holiday start period,8300,hfrom,start date of bank holidays
  // r;w,BankHolidayEndPeriod,bank holiday end period,8400,hto,end date of bank holidays
  // r;w,Unknown85,(constant 0/inf),8500,tempv,unknown value

  /** average outside temperature */
  @inherit(r_1, w_1)
  @ext(0x95, 0)
  model OutsideTempAvg {
    /** rounded average outsidetemperature (updated every 3h) */
    value: tempv;
  }

  /** maintenance due */
  @inherit(r_1)
  @ext(0x96, 0)
  model MaintenanceDue {
    /** shows whether maintenance is due */
    value: yesno;
  }

  /** hwc storage temperature top */
  @inherit(r_1)
  @ext(0x9d, 0)
  model HwcStorageTempTop {
    /** temperature sensor HWC storage top */
    value: tempv;
  }

  /** storage temperature bottom */
  @inherit(r_1)
  @ext(0x9e, 0)
  model HwcStorageTempBottom {
    /** temperature sensor HWC storage bottom */
    value: tempv;
  }

  /** hc storage temperature top */
  @inherit(r_1)
  @ext(0x9f, 0)
  model HcStorageTempTop {
    /** temperature sensor HW storage top */
    value: tempv;
  }

  /** hc storage temperature bottom */
  @inherit(r_1)
  @ext(0xa0, 0)
  model HcStorageTempBottom {
    /** temperature sensor HW storage bottom */
    value: tempv;
  }
  // r,UnknownF8,F800,HEX:5,Unknown value
  // ##### hot water circuit #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 1, 0)
  model r_2 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 1, 0)
  model w_2 {}

  /** HwcOpMode */
  @inherit(r_2, w_2)
  @ext(0x3, 0)
  model HwcOpMode {
    /** operation mode of Hwc */
    value: opmode;
  }

  /** gewünschte Temperatur Warmwasserkreis */
  @inherit(r_2, w_2)
  @ext(0x4, 0)
  model HwcTempDesired {
    /** setpoint of domestic hot water circuit */
    value: tempv;
  }

  /** HwcStorageTemp */
  @inherit(r_2)
  @ext(0x5, 0)
  model HwcStorageTemp {
    /** current hot water storage temperature */
    value: tempv;
  }

  /** HwcFlowTemp */
  @inherit(r_2)
  @ext(0x8, 0)
  model HwcFlowTemp {
    /** desired flow temp for Hwc */
    value: tempv;
  }

  /** hwc holiday start period */
  @inherit(r_2, w_2)
  @ext(0x9, 0)
  model HwcHolidayStartPeriod {
    /** start date of holidays */
    value: hfrom;
  }

  /** hwc holiday end period */
  @inherit(r_2, w_2)
  @ext(0xa, 0)
  model HwcHolidayEndPeriod {
    /** end date of holidays */
    value: hto;
  }

  /** hwc holiday start period */
  @inherit(r_2, w_2)
  @ext(0xb, 0)
  model HwcBankHolidayStartPeriod {
    /** start date of bank holidays */
    value: hfrom;
  }

  /** hwc holiday end period */
  @inherit(r_2, w_2)
  @ext(0xc, 0)
  model HwcBankHolidayEndPeriod {
    /** end date of bank holidays */
    value: hto;
  }

  /** hwc SF mode */
  @inherit(r_2, w_2)
  @ext(0xd, 0)
  model HwcSFMode {
    value: sfmode;
  }
  // r,UnknownValue0f,HwcSFMode,0F00,HEX:6,Unknown value for hwc
  // ##### heating circuit 1 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x2, 0)
  model r_3 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x2, 0)
  model w_3 {}

  /** CircuitType Heizkreis 1 */
  @inherit(r_3)
  @ext(0x2, 0)
  model Hc1CircuitType {
    mctype: mctype;
    @maxLength(1) ign: IGN;
  }
  // r;w,Hc1Unknown04,(konstant 30) Temperatur Heizkreis 1,0400,tempv,unknown value for Hc1
  // r,Hc1Unknown06,600,HEX:5,unknown value for Hc1

  /** ActualFlowTempDesired Heizkreis 1 */
  @inherit(r_3)
  @ext(0x7, 0)
  model Hc1ActualFlowTempDesired {
    /** current flow temperature setpoint of Hc1 */
    value: tempv;
  }

  /** FlowTemp Heizkreis 1 */
  @inherit(r_3)
  @ext(0x8, 0)
  model Hc1FlowTemp {
    /** current flow temperature of Hc1 */
    value: tempv;
  }
  // r;w,Hc1Unknown09,(konstant 60) Temperatur,0900,tempv,unknown value for Hc1

  /** ExcessTemp Heizkreis 1 */
  @inherit(r_3, w_3)
  @ext(0xb, 0)
  model Hc1ExcessTemp {
    /** excess temperature of Hc1 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }
  // r;w,Hc1Unknown0c,(konstant 65) Temperatur Heizkreis 1,0C00,tempv,unknown value for Hc1
  // r;w,Hc1Unknown0d,(konstant 65) Temperatur Heizkreis 1,0D00,tempv,unknown value for Hc1

  /** AutoOffMode Heizkreis 1 */
  @inherit(r_3, w_3)
  @ext(0xe, 0)
  model Hc1AutoOffMode {
    /** operation of Hc1 during the lowering time; no influence if room temperature modulation is set to thermostat */
    value: offmode;
  }

  /** Heizkurve Heizkreis 1 */
  @inherit(r_3, w_3)
  @ext(0xf, 0)
  model Hc1HeatCurve {
    /** heating curve of Hc1 */
    value: EXP;
  }

  /** MaxFlowTempDesired Heizkreis 1 */
  @inherit(r_3, w_3)
  @ext(0x10, 0)
  model Hc1MaxFlowTempDesired {
    /** maximum flow temperature setpoint (end emphasis) of Hc1 */
    value: tempv;
  }

  /** MinCoolingTempDesired Heizkreis 1 */
  @inherit(r_3, w_3)
  @ext(0x11, 0)
  model Hc1MinCoolingTempDesired {
    /** minimum cooling temperature setpoint Hc1 */
    value: tempv;
  }

  /** MinFlowTempDesired Heizkreis 1 */
  @inherit(r_3, w_3)
  @ext(0x12, 0)
  model Hc1MinFlowTempDesired {
    /** minimum flow temperature setpoint (end emphasis) of Hc1 */
    value: tempv;
  }

  /** AT-Abschaltgrenze Heizkreis 1 */
  @inherit(r_3, w_3)
  @ext(0x14, 0)
  model Hc1SummerTempLimit {
    /** if outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempSwitchOn Heizkreis 1 */
  @inherit(r_3, w_3)
  @ext(0x15, 0)
  model Hc1RoomTempSwitchOn {
    /** room temperature modulation of Hc1 */
    value: rcmode;
  }

  /** MixerMovement Heizkreis 1 */
  @inherit(r_3)
  @ext(0x1a, 0)
  model Hc1MixerMovement {
    /** status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** Anpassung Heizkurve Heizkreis 1 */
  @inherit(r_3)
  @ext(0x1c, 0)
  model Hc1HeatCurveAdaption {
    /** adaption applied to heating curve of Hc1 */
    value: EXP;
  }

  /** Status Heizkreis 1 */
  @inherit(r_3, w_3)
  @ext(0x1b, 0)
  model Hc1Status {
    /** status of zone 1 */
    value: UCH;
  }

  /** PumpStatus Heizkreis 1 */
  @inherit(r_3, w_3)
  @ext(0x1e, 0)
  model Hc1PumpStatus {
    /** pump status of zone 1 */
    value: UIN;
  }
  // ##### heating circuit 2 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x2, 1)
  model r_4 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x2, 1)
  model w_4 {}

  /** CircuitType Heizkreis 2 */
  @inherit(r_4)
  @ext(0x2, 0)
  model Hc2CircuitType {
    mctype: mctype;
    @maxLength(1) ign: IGN;
  }
  // r;w,Hc2Unknown04,(konstant 30) Temperatur Heizkreis 2,0400,tempv,unknown value for Hc2
  // r,Hc2Unknown06,600,HEX:5,unknown value for Hc2

  /** ActualFlowTempDesired Heizkreis 2 */
  @inherit(r_4)
  @ext(0x7, 0)
  model Hc2ActualFlowTempDesired {
    /** current flow temperature setpoint of Hc2 */
    value: tempv;
  }

  /** FlowTemp Heizkreis 2 */
  @inherit(r_4)
  @ext(0x8, 0)
  model Hc2FlowTemp {
    /** current flow temperature of Hc2 */
    value: tempv;
  }
  // r;w,Hc2Unknown09,(konstant 60) Temperatur,0900,tempv,unknown value for Hc2

  /** ExcessTemp Heizkreis 2 */
  @inherit(r_4, w_4)
  @ext(0xb, 0)
  model Hc2ExcessTemp {
    /** excess temperature of Hc2 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }
  // r;w,Hc2Unknown0c,(konstant 65) Temperatur Heizkreis 2,0C00,tempv,unknown value for Hc2
  // r;w,Hc2Unknown0d,(konstant 65) Temperatur Heizkreis 2,0D00,tempv,unknown value for Hc2

  /** AutoOffMode Heizkreis 2 */
  @inherit(r_4, w_4)
  @ext(0xe, 0)
  model Hc2AutoOffMode {
    /** operation of Hc2 during the lowering time; no influence if room temperature modulation is set to thermostat */
    value: offmode;
  }

  /** Heizkurve Heizkreis 2 */
  @inherit(r_4, w_4)
  @ext(0xf, 0)
  model Hc2HeatCurve {
    /** heating curve of Hc2 */
    value: EXP;
  }

  /** MaxFlowTempDesired Heizkreis 2 */
  @inherit(r_4, w_4)
  @ext(0x10, 0)
  model Hc2MaxFlowTempDesired {
    /** maximum flow temperature setpoint (end emphasis) of Hc2 */
    value: tempv;
  }

  /** MinCoolingTempDesired Heizkreis 2 */
  @inherit(r_4, w_4)
  @ext(0x11, 0)
  model Hc2MinCoolingTempDesired {
    /** minimum cooling temperature setpoint Hc2 */
    value: tempv;
  }

  /** MinFlowTempDesired Heizkreis 2 */
  @inherit(r_4, w_4)
  @ext(0x12, 0)
  model Hc2MinFlowTempDesired {
    /** minimum flow temperature setpoint (end emphasis) of Hc2 */
    value: tempv;
  }

  /** AT-Abschaltgrenze Heizkreis 2 */
  @inherit(r_4, w_4)
  @ext(0x14, 0)
  model Hc2SummerTempLimit {
    /** if outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempSwitchOn Heizkreis 2 */
  @inherit(r_4, w_4)
  @ext(0x15, 0)
  model Hc2RoomTempSwitchOn {
    /** room temperature modulation of Hc2 */
    value: rcmode;
  }

  /** MixerMovement Heizkreis 2 */
  @inherit(r_4)
  @ext(0x1a, 0)
  model Hc2MixerMovement {
    /** status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** Anpassung Heizkurve Heizkreis 2 */
  @inherit(r_4)
  @ext(0x1c, 0)
  model Hc2HeatCurveAdaption {
    /** adaption applied to heating curve of Hc2 */
    value: EXP;
  }

  /** Status Heizkreis 2 */
  @inherit(r_4, w_4)
  @ext(0x1b, 0)
  model Hc2Status {
    /** status of zone 2 */
    value: UCH;
  }

  /** PumpStatus Heizkreis 2 */
  @inherit(r_4, w_4)
  @ext(0x1e, 0)
  model Hc2PumpStatus {
    /** pump status of zone 2 */
    value: UIN;
  }
  // ##### heating circuit 3 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x2, 0x2)
  model r_5 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x2, 0x2)
  model w_5 {}

  /** CircuitType Heizkreis 3 */
  @inherit(r_5)
  @ext(0x2, 0)
  model Hc3CircuitType {
    mctype: mctype;
    @maxLength(1) ign: IGN;
  }
  // r;w,Hc3Unknown04,(konstant 30) Temperatur Heizkreis 3,0400,tempv,unknown value for Hc3
  // r,Hc3Unknown06,600,HEX:5,unknown value for Hc3

  /** ActualFlowTempDesired Heizkreis 3 */
  @inherit(r_5)
  @ext(0x7, 0)
  model Hc3ActualFlowTempDesired {
    /** current flow temperature setpoint of Hc3 */
    value: tempv;
  }

  /** FlowTemp Heizkreis 3 */
  @inherit(r_5)
  @ext(0x8, 0)
  model Hc3FlowTemp {
    /** current flow temperature of Hc3 */
    value: tempv;
  }
  // r;w,Hc3Unknown09,(konstant 60) Temperatur,0900,tempv,unknown value for Hc3

  /** ExcessTemp Heizkreis 3 */
  @inherit(r_5, w_5)
  @ext(0xb, 0)
  model Hc3ExcessTemp {
    /** excess temperature of Hc3 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }
  // r;w,Hc3Unknown0c,(konstant 65) Temperatur Heizkreis 3,0C00,tempv,unknown value for Hc3
  // r;w,Hc3Unknown0d,(konstant 65) Temperatur Heizkreis 3,0D00,tempv,unknown value for Hc3

  /** AutoOffMode Heizkreis 3 */
  @inherit(r_5, w_5)
  @ext(0xe, 0)
  model Hc3AutoOffMode {
    /** operation of Hc3 during the lowering time; no influence if room temperature modulation is set to thermostat */
    value: offmode;
  }

  /** Heizkurve Heizkreis 3 */
  @inherit(r_5, w_5)
  @ext(0xf, 0)
  model Hc3HeatCurve {
    /** heating curve of Hc3 */
    value: EXP;
  }

  /** MaxFlowTempDesired Heizkreis 3 */
  @inherit(r_5, w_5)
  @ext(0x10, 0)
  model Hc3MaxFlowTempDesired {
    /** maximum flow temperature setpoint (end emphasis) of Hc3 */
    value: tempv;
  }

  /** MinCoolingTempDesired Heizkreis 3 */
  @inherit(r_5, w_5)
  @ext(0x11, 0)
  model Hc3MinCoolingTempDesired {
    /** minimum cooling temperature setpoint Hc3 */
    value: tempv;
  }

  /** MinFlowTempDesired Heizkreis 3 */
  @inherit(r_5, w_5)
  @ext(0x12, 0)
  model Hc3MinFlowTempDesired {
    /** minimum flow temperature setpoint (end emphasis) of Hc3 */
    value: tempv;
  }

  /** AT-Abschaltgrenze Heizkreis 3 */
  @inherit(r_5, w_5)
  @ext(0x14, 0)
  model Hc3SummerTempLimit {
    /** if outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempSwitchOn Heizkreis 3 */
  @inherit(r_5, w_5)
  @ext(0x15, 0)
  model Hc3RoomTempSwitchOn {
    /** room temperature modulation of Hc3 */
    value: rcmode;
  }

  /** MixerMovement Heizkreis 3 */
  @inherit(r_5)
  @ext(0x1a, 0)
  model Hc3MixerMovement {
    /** status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** Anpassung Heizkurve Heizkreis 3 */
  @inherit(r_5)
  @ext(0x1c, 0)
  model Hc3HeatCurveAdaption {
    /** adaption applied to heating curve of Hc3 */
    value: EXP;
  }

  /** Status Heizkreis 3 */
  @inherit(r_5, w_5)
  @ext(0x1b, 0)
  model Hc3Status {
    /** status of zone 2 */
    value: UCH;
  }

  /** PumpStatus Heizkreis 3 */
  @inherit(r_5, w_5)
  @ext(0x1e, 0)
  model Hc3PumpStatus {
    /** pump status of zone 3 */
    value: UIN;
  }
  // ##### zone 1 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x3, 0)
  model r_6 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x3, 0)
  model w_6 {}

  /** Kühlsolltemperatur Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x2, 0)
  model Z1CoolingTemp {
    /** desired cooling setpoint for zone 1 */
    value: tempv;
  }

  /** Ferienzeitraum Start Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x3, 0)
  model Z1HolidayStartPeriod {
    /** start date of holidays for zone 1 */
    value: hfrom;
  }

  /** Ferienzeitraum Ende Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x4, 0)
  model Z1HolidayEndPeriod {
    /** end date of holidays for zone 1 */
    value: hto;
  }

  /** Raumsollwert Ferienbetrieb Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x5, 0)
  model Z1HolidayTemp {
    /** holiday setpoint for zone 1 */
    value: tempv;
  }

  /** Betriebsart Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x6, 0)
  model Z1OpMode {
    /** operation mode of zone 1 */
    value: opmode;
  }

  /** Quick Veto Temperatur Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x8, 0)
  model Z1QuickVetoTemp {
    /** manual override setpoint for zone 1 */
    value: tempv;
  }

  /** Duration of Quick Veto mode Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x26, 0)
  model Z1QuickVetoDuration {
    /** valid values are 0.5-12 in steps of 0.5 and writing enables quick veto mode */
    @unit("h")
    value: EXP;
  }

  /** Quick Veto end time Zone 1 */
  @inherit(r_6)
  @ext(0x1e, 0)
  model Z1QuickVetoEndTime {
    value: HTI;
  }

  /** Quick Veto end date Zone 1 */
  @inherit(r_6)
  @ext(0x24, 0)
  model Z1QuickVetoEndDate {
    value: date;
  }

  /** Absenktemperatur Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x9, 0)
  model Z1NightTemp {
    /** night setpoint for zone 1 */
    value: tempv;
  }

  /** Bank Feiertag Start Zone 1 */
  @inherit(r_6, w_6)
  @ext(0xc, 0)
  model Z1BankHolidayStartPeriod {
    /** start date of bank holidays for zone 1 */
    value: hfrom;
  }

  /** Bank Feiertag Ende Zone 1 */
  @inherit(r_6, w_6)
  @ext(0xd, 0)
  model Z1BankHolidayEndPeriod {
    /** end date of bank holidays for zone 1 */
    value: hto;
  }

  /** SF mode zone 1 */
  @inherit(r_6, w_6)
  @ext(0xe, 0)
  model Z1SFMode {
    value: sfmode;
  }

  /** Raumisttemperatur Zone 1 */
  @inherit(r_6)
  @ext(0xf, 0)
  model Z1RoomTemp {
    /** aktuelle Raumtemperatur in Zone 1 */
    value: tempv;
  }

  /** Ventilstatus Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x12, 0)
  model Z1ValveStatus {
    /** valve status of zone 1 */
    value: UCH;
  }

  /** Raumregler Zuordnung Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x13, 0)
  model Z1RoomZoneMapping {
    /** configures which room temperature is assigned to zone 1 */
    value: zmapping;
  }

  /** Raumsolltemperatur Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x14, 0)
  model Z1ActualRoomTempDesired {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    value: tempv;
  }
  // r;w,z1Unknown15Temp,(in FlüsterBetrieb 24 sonst 99 - max.Lüfterstufe?) Temperatur Zone 1,1500,tempv,unknown value for zone 1

  /** Kurzbezeichnung zone 1 */
  @inherit(r_6, w_6)
  @ext(0x16, 0)
  model Z1Shortname {
    /** short name of zone 1 */
    value: shortname;
  }

  /** Bezeichnung Zone 1 Teil 1 */
  @inherit(r_6, w_6)
  @ext(0x17, 0)
  model Z1Name1 {
    /** name of zone 1 */
    value: zname;
  }

  /** Bezeichnung Zone 1 Teil 2 */
  @inherit(r_6, w_6)
  @ext(0x18, 0)
  model Z1Name2 {
    /** name of zone 1 */
    value: zname;
  }

  /** Solltemperatur Zone 1 */
  @inherit(r_6, w_6)
  @ext(0x22, 0)
  model Z1DayTemp {
    /** day setpoint for zone 1 */
    value: tempv;
  }
  // r,z1Unknown23,Temperatur Unbekannt,2300,IGN:4;tempv
  // ##### zone 2 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x3, 1)
  model r_7 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x3, 1)
  model w_7 {}

  /** Kühlsolltemperatur Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x2, 0)
  model Z2CoolingTemp {
    /** desired cooling setpoint for zone 2 */
    value: tempv;
  }

  /** Ferienzeitraum Start Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x3, 0)
  model Z2HolidayStartPeriod {
    /** start date of holidays for zone 2 */
    value: hfrom;
  }

  /** Ferienzeitraum Ende Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x4, 0)
  model Z2HolidayEndPeriod {
    /** end date of holidays for zone 2 */
    value: hto;
  }

  /** Raumsollwert Ferienbetrieb Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x5, 0)
  model Z2HolidayTemp {
    /** holiday setpoint for zone 2 */
    value: tempv;
  }

  /** Betriebsart Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x6, 0)
  model Z2OpMode {
    /** operation mode of zone 2 */
    value: opmode;
  }

  /** Quick Veto Temperatur Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x8, 0)
  model Z2QuickVetoTemp {
    /** manual override setpoint for zone 2 */
    value: tempv;
  }

  /** Duration of Quick Veto mode Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x26, 0)
  model Z2QuickVetoDuration {
    /** valid values are 0.5-12 in steps of 0.5 and writing enables quick veto mode */
    @unit("h")
    value: EXP;
  }

  /** Quick Veto end time Zone 2 */
  @inherit(r_7)
  @ext(0x1e, 0)
  model Z2QuickVetoEndTime {
    value: HTI;
  }

  /** Quick Veto end date Zone 2 */
  @inherit(r_7)
  @ext(0x24, 0)
  model Z2QuickVetoEndDate {
    value: date;
  }

  /** Absenktemperatur Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x9, 0)
  model Z2NightTemp {
    /** night setpoint for zone 2 */
    value: tempv;
  }

  /** Bank Feiertag Start Zone 2 */
  @inherit(r_7, w_7)
  @ext(0xc, 0)
  model Z2BankHolidayStartPeriod {
    /** start date of bank holidays for zone 2 */
    value: hfrom;
  }

  /** Bank Feiertag Ende Zone 2 */
  @inherit(r_7, w_7)
  @ext(0xd, 0)
  model Z2BankHolidayEndPeriod {
    /** end date of bank holidays for zone 2 */
    value: hto;
  }

  /** SF mode zone 2 */
  @inherit(r_7, w_7)
  @ext(0xe, 0)
  model Z2SFMode {
    value: sfmode;
  }

  /** Raumisttemperatur Zone 2 */
  @inherit(r_7)
  @ext(0xf, 0)
  model Z2RoomTemp {
    /** aktuelle Raumtemperatur in Zone 2 */
    value: tempv;
  }

  /** Ventilstatus Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x12, 0)
  model Z2ValveStatus {
    /** valve status of zone 2 */
    value: UCH;
  }

  /** Raumregler Zuordnung Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x13, 0)
  model Z2RoomZoneMapping {
    /** configures which room temperature is assigned to zone 2 */
    value: zmapping;
  }

  /** Raumsolltemperatur Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x14, 0)
  model Z2ActualRoomTempDesired {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    value: tempv;
  }
  // r;w,z2Unknown15Temp,(in FlüsterBetrieb 24 sonst 99 - max.Lüfterstufe?) Temperatur Zone 2,1500,tempv,unknown value for zone 2

  /** Kurzbezeichnung zone 2 */
  @inherit(r_7, w_7)
  @ext(0x16, 0)
  model Z2Shortname {
    /** short name of zone 2 */
    value: shortname;
  }

  /** Bezeichnung Zone 2 Teil 1 */
  @inherit(r_7, w_7)
  @ext(0x17, 0)
  model Z2Name1 {
    /** name of zone 2 */
    value: zname;
  }

  /** Bezeichnung Zone 2 Teil 2 */
  @inherit(r_7, w_7)
  @ext(0x18, 0)
  model Z2Name2 {
    /** name of zone 2 */
    value: zname;
  }

  /** Solltemperatur Zone 2 */
  @inherit(r_7, w_7)
  @ext(0x22, 0)
  model Z2DayTemp {
    /** day setpoint for zone 2 */
    value: tempv;
  }
  // ##### zone 3 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x3, 0x2)
  model r_8 {
    @maxLength(4)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x3, 0x2)
  model w_8 {}
  // r;w,z3Unknown02,(konstant 24 - Lüfterstufe?) Temperatur Zone 3,0200,tempv,unknown value for zone 3

  /** Ferienzeitraum Start Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x3, 0)
  model Z3HolidayStartPeriod {
    /** start date of holidays for zone 3 */
    value: hfrom;
  }

  /** Ferienzeitraum Ende Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x4, 0)
  model Z3HolidayEndPeriod {
    /** end date of holidays for zone 3 */
    value: hto;
  }

  /** Raumsollwert Ferienbetrieb Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x5, 0)
  model Z3HolidayTemp {
    /** holiday setpoint for zone 3 */
    value: tempv;
  }

  /** Betriebsart Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x6, 0)
  model Z3OpMode {
    /** operation mode of zone 3 */
    value: opmode;
  }

  /** Quick Veto Temperatur Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x8, 0)
  model Z3QuickVetoTemp {
    /** manual override setpoint for zone 3 */
    value: tempv;
  }

  /** Duration of Quick Veto mode Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x26, 0)
  model Z3QuickVetoDuration {
    /** valid values are 0.5-12 in steps of 0.5 and writing enables quick veto mode */
    @unit("h")
    value: EXP;
  }

  /** Quick Veto end time Zone 3 */
  @inherit(r_8)
  @ext(0x1e, 0)
  model Z3QuickVetoEndTime {
    value: HTI;
  }

  /** Quick Veto end date Zone 3 */
  @inherit(r_8)
  @ext(0x24, 0)
  model Z3QuickVetoEndDate {
    value: date;
  }

  /** Absenktemperatur Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x9, 0)
  model Z3NightTemp {
    /** night setpoint for zone 3 */
    value: tempv;
  }

  /** Bank Feiertag Start Zone 3 */
  @inherit(r_8, w_8)
  @ext(0xc, 0)
  model Z3BankHolidayStartPeriod {
    /** start date of bank holidays for zone 3 */
    value: hfrom;
  }

  /** Bank Feiertag Ende Zone 3 */
  @inherit(r_8, w_8)
  @ext(0xd, 0)
  model Z3BankHolidayEndPeriod {
    /** end date of bank holidays for zone 3 */
    value: hto;
  }

  /** SF mode zone 3 */
  @inherit(r_8, w_8)
  @ext(0xe, 0)
  model Z3SFMode {
    value: sfmode;
  }

  /** Raumisttemperatur Zone 3 */
  @inherit(r_8)
  @ext(0xf, 0)
  model Z3RoomTemp {
    /** aktuelle Raumtemperatur in Zone 3 */
    value: tempv;
  }

  /** Ventilstatus Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x12, 0)
  model Z3ValveStatus {
    /** valve status of zone 3 */
    value: UCH;
  }

  /** Raumregler Zuordnung Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x13, 0)
  model Z3RoomZoneMapping {
    /** configures which room temperature is assigned to zone 3 */
    value: zmapping;
  }

  /** Raumsolltemperatur Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x14, 0)
  model Z3ActualRoomTempDesired {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    value: tempv;
  }
  // r;w,z3Unknown15Temp,(in FlüsterBetrieb 24 sonst 99 - max.Lüfterstufe?) Temperatur Zone 3,1500,tempv,unknown value for zone 3

  /** Kurzbezeichnung Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x16, 0)
  model Z3Shortname {
    /** short name of zone 3 */
    value: shortname;
  }

  /** Bezeichnung Zone 3 Teil 1 */
  @inherit(r_8, w_8)
  @ext(0x17, 0)
  model Z3Name1 {
    /** name of zone 3 */
    value: zname;
  }

  /** Bezeichnung Zone 3 Teil 2 */
  @inherit(r_8, w_8)
  @ext(0x18, 0)
  model Z3Name2 {
    /** name of zone 3 */
    value: zname;
  }

  /** Solltemperatur Zone 3 */
  @inherit(r_8, w_8)
  @ext(0x22, 0)
  model Z3DayTemp {
    /** day setpoint for zone 3 */
    value: tempv;
  }
  // ##### timers #####
  // *r
  // r,unknownValue.a0,(3Zones;HWC&CC = constant value. General configuration?),B555,a0,HEX:8,First = Zones maybe? Rest unknown; needs some other configured ctlv2
  // r,unknownValue.a1,(3Zones;HWC&CC = Empty value. air;tariff;etc or Errors?),B555,a1
  // r,unknownValue.a2,(3Zones;HWC&CC = Empty value. air;tariff;etc or Errors?),B555,a2
  // timers hot water

  /** default *r */
  @base(MF, 0x55, 0xa5, 0, 0x2)
  model r_9 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0, 0x2)
  model w_9 {}

  /** timer Configuration(static atm? describes featue set?) */
  @id(MF, 0x55, 0xa3, 0, 0x2)
  model HwcTimer_Config {
    /** Configuration */
    @maxLength(9)
    value: HEX;
  }

  /** timer Anzahl */
  @id(MF, 0x55, 0xa4, 0, 0x2)
  model HwcTimer_Timeframes {
    /** Amount of configured slots per weekday */
    value: slotCountWeek;
  }

  /** timer monday 1 */
  @inherit(r_9)
  @ext(0, 0)
  model HwcTimer_Monday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer monday 2 */
  @inherit(r_9)
  @ext(0, 1)
  model HwcTimer_Monday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer monday 3 */
  @inherit(r_9)
  @ext(0, 0x2)
  model HwcTimer_Monday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer tuesday 1 */
  @inherit(r_9)
  @ext(1, 0)
  model HwcTimer_Tuesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer tuesday 2 */
  @inherit(r_9)
  @ext(1, 1)
  model HwcTimer_Tuesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer tuesday 3 */
  @inherit(r_9)
  @ext(1, 0x2)
  model HwcTimer_Tuesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer wednesday 1 */
  @inherit(r_9)
  @ext(0x2, 0)
  model HwcTimer_Wednesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer wednesday 2 */
  @inherit(r_9)
  @ext(0x2, 1)
  model HwcTimer_Wednesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer wednesday 3 */
  @inherit(r_9)
  @ext(0x2, 0x2)
  model HwcTimer_Wednesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer thursday 1 */
  @inherit(r_9)
  @ext(0x3, 0)
  model HwcTimer_Thursday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer thursday 2 */
  @inherit(r_9)
  @ext(0x3, 1)
  model HwcTimer_Thursday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer thursday 3 */
  @inherit(r_9)
  @ext(0x3, 0x2)
  model HwcTimer_Thursday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer friday 1 */
  @inherit(r_9)
  @ext(0x4, 0)
  model HwcTimer_Friday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer friday 2 */
  @inherit(r_9)
  @ext(0x4, 1)
  model HwcTimer_Friday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer friday 3 */
  @inherit(r_9)
  @ext(0x4, 0x2)
  model HwcTimer_Friday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer saturday 1 */
  @inherit(r_9)
  @ext(0x5, 0)
  model HwcTimer_Saturday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer saturday 2 */
  @inherit(r_9)
  @ext(0x5, 1)
  model HwcTimer_Saturday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer saturday 3 */
  @inherit(r_9)
  @ext(0x5, 0x2)
  model HwcTimer_Saturday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer sunday 1 */
  @inherit(r_9)
  @ext(0x6, 0)
  model HwcTimer_Sunday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer sunday 2 */
  @inherit(r_9)
  @ext(0x6, 1)
  model HwcTimer_Sunday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer sunday 3 */
  @inherit(r_9)
  @ext(0x6, 0x2)
  model HwcTimer_Sunday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer monday */
  @inherit(w_9)
  @ext(0)
  model HwcTimer_Monday {
    value: wTimeSlotWithTemp;
  }

  /** timer tuesday */
  @inherit(w_9)
  @ext(1)
  model HwcTimer_Tuesday {
    value: wTimeSlotWithTemp;
  }

  /** timer wednesday */
  @inherit(w_9)
  @ext(0x2)
  model HwcTimer_Wednesday {
    value: wTimeSlotWithTemp;
  }

  /** timer thursday */
  @inherit(w_9)
  @ext(0x3)
  model HwcTimer_Thursday {
    value: wTimeSlotWithTemp;
  }

  /** timer friday */
  @inherit(w_9)
  @ext(0x4)
  model HwcTimer_Friday {
    value: wTimeSlotWithTemp;
  }

  /** timer saturday */
  @inherit(w_9)
  @ext(0x5)
  model HwcTimer_Saturday {
    value: wTimeSlotWithTemp;
  }

  /** timer sunday */
  @inherit(w_9)
  @ext(0x6)
  model HwcTimer_Sunday {
    value: wTimeSlotWithTemp;
  }
  // timers circulation pump

  /** default *r */
  @base(MF, 0x55, 0xa5, 0, 0x3)
  model r_10 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0, 0x3)
  model w_10 {}

  /** timer Configuration(static atm? describes featue set?) */
  @id(MF, 0x55, 0xa3, 0, 0x3)
  model CcTimer_Config {
    /** Configuration */
    @maxLength(9)
    value: HEX;
  }

  /** timer Anzahl */
  @id(MF, 0x55, 0xa4, 0, 0x3)
  model CcTimer_Timeframes {
    /** Amount of configured slots per weekday */
    value: slotCountWeek;
  }

  /** timer monday 1 */
  @inherit(r_10)
  @ext(0, 0)
  model CcTimer_Monday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer monday 2 */
  @inherit(r_10)
  @ext(0, 1)
  model CcTimer_Monday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer monday 3 */
  @inherit(r_10)
  @ext(0, 0x2)
  model CcTimer_Monday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer tuesday 1 */
  @inherit(r_10)
  @ext(1, 0)
  model CcTimer_Tuesday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer tuesday 2 */
  @inherit(r_10)
  @ext(1, 1)
  model CcTimer_Tuesday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer tuesday 3 */
  @inherit(r_10)
  @ext(1, 0x2)
  model CcTimer_Tuesday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer wednesday 1 */
  @inherit(r_10)
  @ext(0x2, 0)
  model CcTimer_Wednesday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer wednesday 2 */
  @inherit(r_10)
  @ext(0x2, 1)
  model CcTimer_Wednesday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer wednesday 3 */
  @inherit(r_10)
  @ext(0x2, 0x2)
  model CcTimer_Wednesday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer thursday 1 */
  @inherit(r_10)
  @ext(0x3, 0)
  model CcTimer_Thursday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer thursday 2 */
  @inherit(r_10)
  @ext(0x3, 1)
  model CcTimer_Thursday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer thursday 3 */
  @inherit(r_10)
  @ext(0x3, 0x2)
  model CcTimer_Thursday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer friday 1 */
  @inherit(r_10)
  @ext(0x4, 0)
  model CcTimer_Friday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer friday 2 */
  @inherit(r_10)
  @ext(0x4, 1)
  model CcTimer_Friday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer friday 3 */
  @inherit(r_10)
  @ext(0x4, 0x2)
  model CcTimer_Friday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer saturday 1 */
  @inherit(r_10)
  @ext(0x5, 0)
  model CcTimer_Saturday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer saturday 2 */
  @inherit(r_10)
  @ext(0x5, 1)
  model CcTimer_Saturday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer saturday 3 */
  @inherit(r_10)
  @ext(0x5, 0x2)
  model CcTimer_Saturday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer sunday 1 */
  @inherit(r_10)
  @ext(0x6, 0)
  model CcTimer_Sunday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer sunday 2 */
  @inherit(r_10)
  @ext(0x6, 1)
  model CcTimer_Sunday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer sunday 3 */
  @inherit(r_10)
  @ext(0x6, 0x2)
  model CcTimer_Sunday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer monday */
  @inherit(w_10)
  @ext(0)
  model CcTimer_Monday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer tuesday */
  @inherit(w_10)
  @ext(1)
  model CcTimer_Tuesday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer wednesday */
  @inherit(w_10)
  @ext(0x2)
  model CcTimer_Wednesday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer thursday */
  @inherit(w_10)
  @ext(0x3)
  model CcTimer_Thursday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer friday */
  @inherit(w_10)
  @ext(0x4)
  model CcTimer_Friday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer saturday */
  @inherit(w_10)
  @ext(0x5)
  model CcTimer_Saturday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer sunday */
  @inherit(w_10)
  @ext(0x6)
  model CcTimer_Sunday {
    value: wTimeSlotWithoutTemp;
  }
  // timers zone 1

  /** default *r */
  @base(MF, 0x55, 0xa5, 0, 0)
  model r_11 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0, 0)
  model w_11 {}

  /** timer Configuration(static atm? describes featue set?) */
  @id(MF, 0x55, 0xa3, 0, 0)
  model Z1Timer_Config {
    /** Configuration */
    @maxLength(9)
    value: HEX;
  }

  /** timer Anzahl */
  @id(MF, 0x55, 0xa4, 0, 0)
  model Z1Timer_Timeframes {
    /** Amount of configured slots per weekday */
    value: slotCountWeek;
  }

  /** timer heating monday 1 */
  @inherit(r_11)
  @ext(0, 0)
  model Z1Timer_Monday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday 2 */
  @inherit(r_11)
  @ext(0, 1)
  model Z1Timer_Monday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday 3 */
  @inherit(r_11)
  @ext(0, 0x2)
  model Z1Timer_Monday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 1 */
  @inherit(r_11)
  @ext(1, 0)
  model Z1Timer_Tuesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 2 */
  @inherit(r_11)
  @ext(1, 1)
  model Z1Timer_Tuesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 3 */
  @inherit(r_11)
  @ext(1, 0x2)
  model Z1Timer_Tuesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 1 */
  @inherit(r_11)
  @ext(0x2, 0)
  model Z1Timer_Wednesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 2 */
  @inherit(r_11)
  @ext(0x2, 1)
  model Z1Timer_Wednesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 3 */
  @inherit(r_11)
  @ext(0x2, 0x2)
  model Z1Timer_Wednesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 1 */
  @inherit(r_11)
  @ext(0x3, 0)
  model Z1Timer_Thursday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 2 */
  @inherit(r_11)
  @ext(0x3, 1)
  model Z1Timer_Thursday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 3 */
  @inherit(r_11)
  @ext(0x3, 0x2)
  model Z1Timer_Thursday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 1 */
  @inherit(r_11)
  @ext(0x4, 0)
  model Z1Timer_Friday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 2 */
  @inherit(r_11)
  @ext(0x4, 1)
  model Z1Timer_Friday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 3 */
  @inherit(r_11)
  @ext(0x4, 0x2)
  model Z1Timer_Friday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 1 */
  @inherit(r_11)
  @ext(0x5, 0)
  model Z1Timer_Saturday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 2 */
  @inherit(r_11)
  @ext(0x5, 1)
  model Z1Timer_Saturday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 3 */
  @inherit(r_11)
  @ext(0x5, 0x2)
  model Z1Timer_Saturday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 1 */
  @inherit(r_11)
  @ext(0x6, 0)
  model Z1Timer_Sunday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 2 */
  @inherit(r_11)
  @ext(0x6, 1)
  model Z1Timer_Sunday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 3 */
  @inherit(r_11)
  @ext(0x6, 0x2)
  model Z1Timer_Sunday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday */
  @inherit(w_11)
  @ext(0)
  model Z1Timer_Monday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating tuesday */
  @inherit(w_11)
  @ext(1)
  model Z1Timer_Tuesday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating wednesday */
  @inherit(w_11)
  @ext(0x2)
  model Z1Timer_Wednesday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating thursday */
  @inherit(w_11)
  @ext(0x3)
  model Z1Timer_Thursday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating friday */
  @inherit(w_11)
  @ext(0x4)
  model Z1Timer_Friday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating saturday */
  @inherit(w_11)
  @ext(0x5)
  model Z1Timer_Saturday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating sunday */
  @inherit(w_11)
  @ext(0x6)
  model Z1Timer_Sunday {
    value: wTimeSlotWithTemp;
  }
  // timers zone 2

  /** default *r */
  @base(MF, 0x55, 0xa5, 1, 0)
  model r_12 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 1, 0)
  model w_12 {}

  /** timer Configuration(static atm? describes featue set?) */
  @id(MF, 0x55, 0xa3, 1, 0)
  model Z2Timer_Config {
    /** Configuration */
    @maxLength(9)
    value: HEX;
  }

  /** timer Anzahl */
  @id(MF, 0x55, 0xa4, 1, 0)
  model Z2Timer_Timeframes {
    /** Amount of configured slots per weekday */
    value: slotCountWeek;
  }

  /** timer heating monday 1 */
  @inherit(r_12)
  @ext(0, 0)
  model Z2Timer_Monday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday 2 */
  @inherit(r_12)
  @ext(0, 1)
  model Z2Timer_Monday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday 3 */
  @inherit(r_12)
  @ext(0, 0x2)
  model Z2Timer_Monday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 1 */
  @inherit(r_12)
  @ext(1, 0)
  model Z2Timer_Tuesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 2 */
  @inherit(r_12)
  @ext(1, 1)
  model Z2Timer_Tuesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 3 */
  @inherit(r_12)
  @ext(1, 0x2)
  model Z2Timer_Tuesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 1 */
  @inherit(r_12)
  @ext(0x2, 0)
  model Z2Timer_Wednesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 2 */
  @inherit(r_12)
  @ext(0x2, 1)
  model Z2Timer_Wednesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 3 */
  @inherit(r_12)
  @ext(0x2, 0x2)
  model Z2Timer_Wednesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 1 */
  @inherit(r_12)
  @ext(0x3, 0)
  model Z2Timer_Thursday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 2 */
  @inherit(r_12)
  @ext(0x3, 1)
  model Z2Timer_Thursday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 3 */
  @inherit(r_12)
  @ext(0x3, 0x2)
  model Z2Timer_Thursday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 1 */
  @inherit(r_12)
  @ext(0x4, 0)
  model Z2Timer_Friday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 2 */
  @inherit(r_12)
  @ext(0x4, 1)
  model Z2Timer_Friday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 3 */
  @inherit(r_12)
  @ext(0x4, 0x2)
  model Z2Timer_Friday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 1 */
  @inherit(r_12)
  @ext(0x5, 0)
  model Z2Timer_Saturday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 2 */
  @inherit(r_12)
  @ext(0x5, 1)
  model Z2Timer_Saturday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 3 */
  @inherit(r_12)
  @ext(0x5, 0x2)
  model Z2Timer_Saturday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 1 */
  @inherit(r_12)
  @ext(0x6, 0)
  model Z2Timer_Sunday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 2 */
  @inherit(r_12)
  @ext(0x6, 1)
  model Z2Timer_Sunday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 3 */
  @inherit(r_12)
  @ext(0x6, 0x2)
  model Z2Timer_Sunday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday */
  @inherit(w_12)
  @ext(0)
  model Z2Timer_Monday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating tuesday */
  @inherit(w_12)
  @ext(1)
  model Z2Timer_Tuesday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating wednesday */
  @inherit(w_12)
  @ext(0x2)
  model Z2Timer_Wednesday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating thursday */
  @inherit(w_12)
  @ext(0x3)
  model Z2Timer_Thursday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating friday */
  @inherit(w_12)
  @ext(0x4)
  model Z2Timer_Friday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating saturday */
  @inherit(w_12)
  @ext(0x5)
  model Z2Timer_Saturday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating sunday */
  @inherit(w_12)
  @ext(0x6)
  model Z2Timer_Sunday {
    value: wTimeSlotWithTemp;
  }
  // timers zone 3

  /** default *r */
  @base(MF, 0x55, 0xa5, 0x2, 0)
  model r_13 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0x2, 0)
  model w_13 {}

  /** timer Configuration(static atm? describes featue set?) */
  @id(MF, 0x55, 0xa3, 0x2, 0)
  model Z3Timer_Config {
    /** Configuration */
    @maxLength(9)
    value: HEX;
  }

  /** timer Anzahl */
  @id(MF, 0x55, 0xa4, 0x2, 0)
  model Z3Timer_Timeframes {
    /** Amount of configured slots per weekday */
    value: slotCountWeek;
  }

  /** timer heating monday 1 */
  @inherit(r_13)
  @ext(0, 0)
  model Z3Timer_Monday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday 2 */
  @inherit(r_13)
  @ext(0, 1)
  model Z3Timer_Monday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday 3 */
  @inherit(r_13)
  @ext(0, 0x2)
  model Z3Timer_Monday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 1 */
  @inherit(r_13)
  @ext(1, 0)
  model Z3Timer_Tuesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 2 */
  @inherit(r_13)
  @ext(1, 1)
  model Z3Timer_Tuesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 3 */
  @inherit(r_13)
  @ext(1, 0x2)
  model Z3Timer_Tuesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 1 */
  @inherit(r_13)
  @ext(0x2, 0)
  model Z3Timer_Wednesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 2 */
  @inherit(r_13)
  @ext(0x2, 1)
  model Z3Timer_Wednesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 3 */
  @inherit(r_13)
  @ext(0x2, 0x2)
  model Z3Timer_Wednesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 1 */
  @inherit(r_13)
  @ext(0x3, 0)
  model Z3Timer_Thursday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 2 */
  @inherit(r_13)
  @ext(0x3, 1)
  model Z3Timer_Thursday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 3 */
  @inherit(r_13)
  @ext(0x3, 0x2)
  model Z3Timer_Thursday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 1 */
  @inherit(r_13)
  @ext(0x4, 0)
  model Z3Timer_Friday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 2 */
  @inherit(r_13)
  @ext(0x4, 1)
  model Z3Timer_Friday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 3 */
  @inherit(r_13)
  @ext(0x4, 0x2)
  model Z3Timer_Friday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 1 */
  @inherit(r_13)
  @ext(0x5, 0)
  model Z3Timer_Saturday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 2 */
  @inherit(r_13)
  @ext(0x5, 1)
  model Z3Timer_Saturday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 3 */
  @inherit(r_13)
  @ext(0x5, 0x2)
  model Z3Timer_Saturday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 1 */
  @inherit(r_13)
  @ext(0x6, 0)
  model Z3Timer_Sunday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 2 */
  @inherit(r_13)
  @ext(0x6, 1)
  model Z3Timer_Sunday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 3 */
  @inherit(r_13)
  @ext(0x6, 0x2)
  model Z3Timer_Sunday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday */
  @inherit(w_13)
  @ext(0)
  model Z3Timer_Monday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating tuesday */
  @inherit(w_13)
  @ext(1)
  model Z3Timer_Tuesday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating wednesday */
  @inherit(w_13)
  @ext(0x2)
  model Z3Timer_Wednesday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating thursday */
  @inherit(w_13)
  @ext(0x3)
  model Z3Timer_Thursday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating friday */
  @inherit(w_13)
  @ext(0x4)
  model Z3Timer_Friday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating saturday */
  @inherit(w_13)
  @ext(0x5)
  model Z3Timer_Saturday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating sunday */
  @inherit(w_13)
  @ext(0x6)
  model Z3Timer_Sunday {
    value: wTimeSlotWithTemp;
  }
  // includes

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
