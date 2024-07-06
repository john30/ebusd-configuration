import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace _700 {
  // ,70000,VRC 700,700 110
  // ##### Generell #####

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

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x24, 0x2, 1, 0, 0)
  model wi_1 {}

  /** continuos heating */
  @inherit(r_1, w_1)
  @ext(0x2, 0)
  model ContinuosHeating {
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

  /** Manual cooling */
  @inherit(r_1, w_1)
  @ext(0x6, 0)
  model ManualCooling {
    /** number of days of manual cooling (max. 99, 0=off, set temp via z1CoolingTemp) */
    value: UIN;
  }

  /** Global System OFF */
  @inherit(r_1, wi_1)
  @ext(0x7, 0)
  model GlobalSystemOff {
    /** For switching system off */
    value: yesno;
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
    /** Sperrzeit WW-Bedarf */
    value: minutes2;
  }

  /** pump additional time */
  @inherit(r_1, w_1)
  @ext(0x1b, 0)
  model PumpAdditionalTime {
    /** Ladepumpe Nachlaufzeit */
    value: minutes2;
  }

  /** hysteresis cylinder charge */
  @inherit(r_1, w_1)
  @ext(0x27, 0)
  model CylinderChargeHyst {
    /** Hysterese Speicherladung */
    value: calibrationv;
  }

  /** offset cylinder charge */
  @inherit(r_1, w_1)
  @ext(0x29, 0)
  model CylinderChargeOffset {
    /** Speicherlad. Offset */
    value: calibrationv;
  }

  /** next maintenance */
  @inherit(r_1, w_1)
  @ext(0x2c, 0)
  model MaintenanceDate {
    /** Datum nächste Wartung */
    value: date;
  }

  /** date */
  @inherit(r_1, w_1)
  @ext(0x34, 0)
  model Date {
    /** Aktuelles Datum */
    value: date;
  }

  /** time */
  @inherit(r_1, w_1)
  @ext(0x35, 0)
  model Time {
    /** Aktuelle Uhrzeit */
    value: HTI;
  }

  /** Systemschema */
  @inherit(r_1, w_1)
  @ext(0x36, 0)
  model HydraulicScheme {
    /** Systemschema */
    value: UIN;
  }
  // r;w,Unknown38,(constant 21),3800,tempv,unknown value

  /** water pressure */
  @inherit(r_1)
  @ext(0x39, 0)
  model WaterPressure {
    /** Wasserdruck */
    value: pressv;
  }

  /** total solar yield */
  @inherit(r_1, w_1)
  @ext(0x3d, 0)
  model SolarYieldTotal {
    /** Solarertrag gesamt */
    value: energy4;
  }

  /** total environmental yield */
  @inherit(r_1, w_1)
  @ext(0x3e, 0)
  model YieldTotal {
    /** Umweltertrag gesamt */
    value: energy4;
  }

  /** day ventilation speed */
  @inherit(r_1, w_1)
  @ext(0x42, 0)
  model VentilationDay {
    /** Ventilation speed during day */
    value: UIN;
  }

  /** night ventilation */
  @inherit(r_1, w_1)
  @ext(0x43, 0)
  model VentilationNight {
    /** Ventilation speed during night */
    value: UIN;
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
    /** Systemvorlauf */
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
    /** Aktueller Monat Brennstoffverbrauch Heizung */
    value: energy4;
  }

  /** this months energy consumption heating */
  @inherit(r_1, w_1)
  @ext(0x4f, 0)
  model PrEnergySumHcThisMonth {
    /** Aktueller Monat Stromverbrauch Heizung */
    value: energy4;
  }

  /** this months energy consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x50, 0)
  model PrEnergySumHwcThisMonth {
    /** Aktueller Monat Stromverbrauch hot water */
    value: energy4;
  }

  /** this months fuel consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x51, 0)
  model PrFuelSumHwcThisMonth {
    /** Aktueller Monat Brennstoffverbrauch hot water */
    value: energy4;
  }

  /** last months fuel consumption heating */
  @inherit(r_1, w_1)
  @ext(0x52, 0)
  model PrFuelSumHcLastMonth {
    /** Letzter Monat Brennstoffverbrauch Heizung */
    value: energy4;
  }

  /** last months energy consumption heating */
  @inherit(r_1, w_1)
  @ext(0x53, 0)
  model PrEnergySumHcLastMonth {
    /** Letzter Monat Stromverbrauch Heizung */
    value: energy4;
  }

  /** last months energy consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x54, 0)
  model PrEnergySumHwcLastMonth {
    /** Letzter Monat Stromverbrauch hot water */
    value: energy4;
  }

  /** last months fuel consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x55, 0)
  model PrFuelSumHwcLastMonth {
    /** Letzter Monat Brennstoffverbrauch hot water */
    value: energy4;
  }

  /** total fuel consumption heating */
  @inherit(r_1, w_1)
  @ext(0x56, 0)
  model PrFuelSumHc {
    /** Brennstoffverbrauch Heizung gesamt */
    value: energy4;
  }

  /** total energy consumption heating */
  @inherit(r_1, w_1)
  @ext(0x57, 0)
  model PrEnergySumHc {
    /** Stromverbrauch Heizung gesamt */
    value: energy4;
  }

  /** total energy consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x58, 0)
  model PrEnergySumHwc {
    /** Stromverbrauch hot water gesamt */
    value: energy4;
  }

  /** total fuel consumption hot water */
  @inherit(r_1, w_1)
  @ext(0x59, 0)
  model PrFuelSumHwc {
    /** Brennstoffverbrauch hot water gesamt */
    value: energy4;
  }

  /** total energy consumption */
  @inherit(r_1, w_1)
  @ext(0x5c, 0)
  model PrEnergySum {
    /** Dieses Jahr Stromverbrauch gesamt */
    value: energy4;
  }

  /** total fuel consumption */
  @inherit(r_1, w_1)
  @ext(0x5d, 0)
  model PrFuelSum {
    /** Dieses Jahr Brennstoffverbrauch gesamt */
    value: energy4;
  }
  // r;w,Unknown67,(VR70 konfig 1),6700,tempv,unknown value
  // r;w,Unknown68,(VR70 konfig 1),6800,tempv,unknown value

  /** OpModeEffect */
  @inherit(r_1, w_1)
  @ext(0x69, 0)
  model OpModeEffect {
    /** selection which heating circuit is affected by changing parameters in the basic display */
    value: zonesel;
  }

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

  /** holiday start period */
  @inherit(r_1, w_1)
  @ext(0x71, 0)
  model HolidayStartPeriod {
    /** start date of holidays */
    value: hfrom;
  }

  /** holiday end period */
  @inherit(r_1, w_1)
  @ext(0x72, 0)
  model HolidayEndPeriod {
    /** end date of holidays */
    value: hto;
  }

  /** outside temperature */
  @inherit(r_1)
  @ext(0x73, 0)
  model DisplayedOutsideTemp {
    /** Außentemperatur */
    value: tempv;
  }

  /** SF mode */
  @inherit(r_1, w_1)
  @ext(0x74, 0)
  model SFMode {
    value: sfmode;
  }

  /** code for installer menu */
  @inherit(r_1, w_1)
  @ext(0x76, 0)
  model KeyCodeforConfigMenu {
    /** 000-999; code for the installer's menues */
    value: UIN;
  }

  /** Operation mode */
  @inherit(r_1, w_1)
  @ext(0x7b, 0)
  model OpMode {
    /** operation mode of all/configured zone(s) matching OpModeEffect */
    value: opmode;
  }

  /** operation mode for cooling */
  @inherit(r_1, w_1)
  @ext(0x7c, 0)
  model OpModeCooling {
    /** operation mode for cooling of all/configured zone(s) */
    value: opmode;
  }

  /** operation mode for ventilation */
  @inherit(r_1, w_1)
  @ext(0x16, 0)
  model OpModeVentilation {
    /** operation mode for ventilation of all/configured zone(s) */
    value: opmode;
  }

  /** holiday temperature */
  @inherit(r_1, w_1)
  @ext(0x82, 0)
  model HolidayTemp {
    /** holiday setpoint */
    value: tempv;
  }

  /** bank holiday start period */
  @inherit(r_1, w_1)
  @ext(0x83, 0)
  model BankHolidayStartPeriod {
    /** start date of bank holidays */
    value: hfrom;
  }

  /** bank holiday end period */
  @inherit(r_1, w_1)
  @ext(0x84, 0)
  model BankHolidayEndPeriod {
    /** end date of bank holidays */
    value: hto;
  }
  // r;w,Unknown85,(constant 0/inf),8500,tempv,unknown value

  /** average outside temperature */
  @inherit(r_1, w_1)
  @ext(0x95, 0)
  model OutsideTempAvg {
    /** gerundete mittlere Außentemperatur (alle 3h aktualisiert) */
    value: tempv;
  }

  /** maintenance due */
  @inherit(r_1)
  @ext(0x96, 0)
  model MaintenanceDue {
    /** zeigt an ob die Wartung fällig ist */
    value: yesno;
  }

  /** hwc storage temperature top */
  @inherit(r_1)
  @ext(0x9d, 0)
  model HwcStorageTempTop {
    /** Temp.fühler WW, oben */
    value: tempv;
  }

  /** storage temperature bottom */
  @inherit(r_1)
  @ext(0x9e, 0)
  model HwcStorageTempBottom {
    /** Temp.fühler WW, unten */
    value: tempv;
  }

  /** hc storage temperature top */
  @inherit(r_1)
  @ext(0x9f, 0)
  model HcStorageTempTop {
    /** Temp.fühler Hz, oben */
    value: tempv;
  }

  /** hc storage temperature bottom */
  @inherit(r_1)
  @ext(0xa0, 0)
  model HcStorageTempBottom {
    /** Temp.fühler Hz, unten */
    value: tempv;
  }
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

  /** hwc operation mode */
  @inherit(r_2, w_2)
  @ext(0x3, 0)
  model HwcOpMode {
    /** operation mode of Hwc */
    value: opmode;
  }

  /** hwc temperature desired */
  @inherit(r_2, w_2)
  @ext(0x4, 0)
  model HwcTempDesired {
    /** setpoint of domestic hot water circuit */
    value: tempv;
  }

  /** hwc storage temperature */
  @inherit(r_2)
  @ext(0x5, 0)
  model HwcStorageTemp {
    /** Speicheristtemperatur */
    value: tempv;
  }

  /** hwc flow temperature */
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

  /** hwc bank holiday start period */
  @inherit(r_2, w_2)
  @ext(0xb, 0)
  model HwcBankHolidayStartPeriod {
    /** start date of bank holidays */
    value: hfrom;
  }

  /** hwc bank holiday end period */
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

  /** CircuitType heating circuit 1 */
  @inherit(r_3)
  @ext(0x2, 0)
  model Hc1CircuitType {
    mctype: mctype;
    @maxLength(1) ign: IGN;
  }
  // r;w,Hc1Unknown04,(constant 30) temperature heating circuit 1,0400,tempv,unknown value for Hc1

  /** ActualFlowTempDesired heating circuit 1 */
  @inherit(r_3)
  @ext(0x7, 0)
  model Hc1ActualFlowTempDesired {
    /** current flow temperature setpoint of Hc1 */
    value: tempv;
  }

  /** FlowTemp heating circuit 1 */
  @inherit(r_3)
  @ext(0x8, 0)
  model Hc1FlowTemp {
    /** current flow temperature of Hc1 */
    value: tempv;
  }
  // r;w,Hc1Unknown09,(constant 60) temperature,0900,tempv,unknown value for Hc1

  /** ExcessTemp heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xb, 0)
  model Hc1ExcessTemp {
    /** excess temperature of Hc1 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }
  // r;w,Hc1Unknown0c,(constant 65) temperature heating circuit 1,0C00,tempv,unknown value for Hc1
  // r;w,Hc1Unknown0d,(constant 65) temperature heating circuit 1,0D00,tempv,unknown value for Hc1

  /** AutoOffMode heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xe, 0)
  model Hc1AutoOffMode {
    /** operation of Hc1 during the lowering time; no influence if room temperature modulation is set to thermostat */
    value: offmode;
  }

  /** HeatCurve heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0xf, 0)
  model Hc1HeatCurve {
    /** heating curve of Hc1 */
    value: EXP;
  }

  /** MaxFlowTempDesired heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x10, 0)
  model Hc1MaxFlowTempDesired {
    /** maximum flow temperature setpoint (end emphasis) of Hc1 */
    value: tempv;
  }
  // r;w,Hc1Unknown11,(constant 20) temperature heating circuit 1,1100,tempv,unknown value for Hc1

  /** MinFlowTempDesired heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x12, 0)
  model Hc1MinFlowTempDesired {
    /** minimum flow temperature setpoint (end emphasis) of Hc1 */
    value: tempv;
  }

  /** summer outside switchoff temperature heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x14, 0)
  model Hc1SummerTempLimit {
    /** if outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempSwitchOn heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x15, 0)
  model Hc1RoomTempSwitchOn {
    /** room temperature modulation of Hc1 */
    value: rcmode;
  }

  /** MixerMovement heating circuit 1 */
  @inherit(r_3)
  @ext(0x1a, 0)
  model Hc1MixerMovement {
    /** status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** HeatCurveAdaption heating circuit 1 */
  @inherit(r_3)
  @ext(0x1c, 0)
  model Hc1HeatCurveAdaption {
    /** adaption applied to heating curve of Hc1 */
    value: EXP;
  }

  /** Status heating circuit 1 */
  @inherit(r_3, w_3)
  @ext(0x1b, 0)
  model Hc1Status {
    /** status of zone 1 */
    value: UCH;
  }

  /** PumpStatus heating circuit 1 */
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

  /** CircuitType heating circuit 2 */
  @inherit(r_4)
  @ext(0x2, 0)
  model Hc2CircuitType {
    mctype: mctype;
    @maxLength(1) ign: IGN;
  }
  // r;w,Hc2Unknown04,(constant 30) temperature heating circuit 2,0400,tempv,unknown value for Hc2

  /** ActualFlowTempDesired heating circuit 2 */
  @inherit(r_4)
  @ext(0x7, 0)
  model Hc2ActualFlowTempDesired {
    /** current flow temperature setpoint of Hc2 */
    value: tempv;
  }

  /** FlowTemp heating circuit 2 */
  @inherit(r_4)
  @ext(0x8, 0)
  model Hc2FlowTemp {
    /** current flow temperature of Hc2 */
    value: tempv;
  }
  // r;w,Hc2Unknown09,(constant 60) temperature,0900,tempv,unknown value for Hc2

  /** ExcessTemp heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xb, 0)
  model Hc2ExcessTemp {
    /** excess temperature of Hc2 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }
  // r;w,Hc2Unknown0c,(constant 65) temperature heating circuit 2,0C00,tempv,unknown value for Hc2
  // r;w,Hc2Unknown0d,(constant 65) temperature heating circuit 2,0D00,tempv,unknown value for Hc2

  /** AutoOffMode heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xe, 0)
  model Hc2AutoOffMode {
    /** operation of Hc2 during the lowering time; no influence if room temperature modulation is set to thermostat */
    value: offmode;
  }

  /** HeatCurve heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0xf, 0)
  model Hc2HeatCurve {
    /** heating curve of Hc2 */
    value: EXP;
  }

  /** MaxFlowTempDesired heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x10, 0)
  model Hc2MaxFlowTempDesired {
    /** maximum flow temperature setpoint (end emphasis) of Hc2 */
    value: tempv;
  }
  // r;w,Hc2Unknown11,(constant 20) temperature heating circuit 2,1100,tempv,unknown value for Hc2

  /** MinFlowTempDesired heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x12, 0)
  model Hc2MinFlowTempDesired {
    /** minimum flow temperature setpoint (end emphasis) of Hc2 */
    value: tempv;
  }

  /** summer outside switchoff temperature heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x14, 0)
  model Hc2SummerTempLimit {
    /** if outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempSwitchOn heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x15, 0)
  model Hc2RoomTempSwitchOn {
    /** room temperature modulation of Hc2 */
    value: rcmode;
  }

  /** MixerMovement heating circuit 2 */
  @inherit(r_4)
  @ext(0x1a, 0)
  model Hc2MixerMovement {
    /** status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** HeatCurveAdaption heating circuit 2 */
  @inherit(r_4)
  @ext(0x1c, 0)
  model Hc2HeatCurveAdaption {
    /** adaption applied to heating curve of Hc2 */
    value: EXP;
  }

  /** Status heating circuit 2 */
  @inherit(r_4, w_4)
  @ext(0x1b, 0)
  model Hc2Status {
    /** status of zone 2 */
    value: UCH;
  }

  /** PumpStatus heating circuit 2 */
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

  /** CircuitType heating circuit 3 */
  @inherit(r_5)
  @ext(0x2, 0)
  model Hc3CircuitType {
    mctype: mctype;
    @maxLength(1) ign: IGN;
  }
  // r;w,Hc3Unknown04,(constant 30) temperature heating circuit 3,0400,tempv,unknown value for Hc3

  /** ActualFlowTempDesired heating circuit 3 */
  @inherit(r_5)
  @ext(0x7, 0)
  model Hc3ActualFlowTempDesired {
    /** current flow temperature setpoint of Hc3 */
    value: tempv;
  }

  /** FlowTemp heating circuit 3 */
  @inherit(r_5)
  @ext(0x8, 0)
  model Hc3FlowTemp {
    /** current flow temperature of Hc3 */
    value: tempv;
  }
  // r;w,Hc3Unknown09,(constant 60) temperature,0900,tempv,unknown value for Hc3

  /** ExcessTemp heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xb, 0)
  model Hc3ExcessTemp {
    /** excess temperature of Hc3 (flow temperature's setpoint is increased by this value to keep the mixing valve in its control range) */
    value: calibrationv;
  }
  // r;w,Hc3Unknown0c,(constant 65) temperature heating circuit 3,0C00,tempv,unknown value for Hc3
  // r;w,Hc3Unknown0d,(constant 65) temperature heating circuit 3,0D00,tempv,unknown value for Hc3

  /** AutoOffMode heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xe, 0)
  model Hc3AutoOffMode {
    /** operation of Hc3 during the lowering time; no influence if room temperature modulation is set to thermostat */
    value: offmode;
  }

  /** HeatCurve heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0xf, 0)
  model Hc3HeatCurve {
    /** heating curve of Hc3 */
    value: EXP;
  }

  /** MaxFlowTempDesired heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x10, 0)
  model Hc3MaxFlowTempDesired {
    /** maximum flow temperature setpoint (end emphasis) of Hc3 */
    value: tempv;
  }
  // r;w,Hc3Unknown11,(constant 20) temperature heating circuit 3,1100,tempv,unknown value for Hc3

  /** MinFlowTempDesired heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x12, 0)
  model Hc3MinFlowTempDesired {
    /** minimum flow temperature setpoint (end emphasis) of Hc3 */
    value: tempv;
  }

  /** summer outside switchoff temperature heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x14, 0)
  model Hc3SummerTempLimit {
    /** if outside temperature > summer limit => heating is OFF;applies to comfort and night setback setpoint */
    value: tempv;
  }

  /** RoomTempSwitchOn heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x15, 0)
  model Hc3RoomTempSwitchOn {
    /** room temperature modulation of Hc3 */
    value: rcmode;
  }

  /** MixerMovement heating circuit 3 */
  @inherit(r_5)
  @ext(0x1a, 0)
  model Hc3MixerMovement {
    /** status of mixer (<0 closing, >0 opening) */
    value: EXP;
  }

  /** HeatCurveAdaption heating circuit 3 */
  @inherit(r_5)
  @ext(0x1c, 0)
  model Hc3HeatCurveAdaption {
    /** adaption applied to heating curve of Hc3 */
    value: EXP;
  }

  /** Status heating circuit 3 */
  @inherit(r_5, w_5)
  @ext(0x1b, 0)
  model Hc3Status {
    /** status of zone 2 */
    value: UCH;
  }

  /** PumpStatus heating circuit 3 */
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

  /** cooling operation mode zone 1 */
  @inherit(r_6, w_6)
  @ext(1, 0)
  model Z1OpModeCooling {
    /** operation mode for cooling of zone 1 */
    value: opmode;
  }

  /** cooling setpoint zone 1 */
  @inherit(r_6, w_6)
  @ext(0x2, 0)
  model Z1CoolingTemp {
    /** desired cooling setpoint for zone 1 */
    value: tempv;
  }

  /** holiday period start zone 1 */
  @inherit(r_6, w_6)
  @ext(0x3, 0)
  model Z1HolidayStartPeriod {
    /** start date of holidays for zone 1 */
    value: hfrom;
  }

  /** holiday period end zone 1 */
  @inherit(r_6, w_6)
  @ext(0x4, 0)
  model Z1HolidayEndPeriod {
    /** end date of holidays for zone 1 */
    value: hto;
  }

  /** room setpoint holiday period zone 1 */
  @inherit(r_6, w_6)
  @ext(0x5, 0)
  model Z1HolidayTemp {
    /** holiday setpoint for zone 1 */
    value: tempv;
  }

  /** operation mode zone 1 */
  @inherit(r_6, w_6)
  @ext(0x6, 0)
  model Z1OpMode {
    /** operation mode of zone 1 */
    value: opmode;
  }

  /** desired temperature zone 1 */
  @inherit(r_6, w_6)
  @ext(0x7, 0)
  model Z1DayTemp {
    /** day setpoint for zone 1 */
    value: tempv;
  }

  /** quick veto temperature zone 1 */
  @inherit(r_6, w_6)
  @ext(0x8, 0)
  model Z1QuickVetoTemp {
    /** manual override setpoint for zone 1 */
    value: tempv;
  }

  /** night temperature zone 1 */
  @inherit(r_6, w_6)
  @ext(0x9, 0)
  model Z1NightTemp {
    /** night setpoint for zone 1 */
    value: tempv;
  }

  /** bank holiday start zone 1 */
  @inherit(r_6, w_6)
  @ext(0xc, 0)
  model Z1BankHolidayStartPeriod {
    /** start date of bank holidays for zone 1 */
    value: hfrom;
  }

  /** bank holiday end zone 1 */
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

  /** room temperature zone 1 */
  @inherit(r_6)
  @ext(0xf, 0)
  model Z1RoomTemp {
    /** current room temperature in zone 1 */
    value: tempv;
  }

  /** valve status zone 1 */
  @inherit(r_6, w_6)
  @ext(0x12, 0)
  model Z1ValveStatus {
    /** valve status of zone 1 */
    value: UCH;
  }

  /** room zone mapping zone 1 */
  @inherit(r_6, w_6)
  @ext(0x13, 0)
  model Z1RoomZoneMapping {
    /** configures which room temperature is assigned to zone 1 */
    value: zmapping;
  }

  /** room temperature desired zone 1 */
  @inherit(r_6, w_6)
  @ext(0x14, 0)
  model Z1ActualRoomTempDesired {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    value: tempv;
  }
  // r;w,z1Unknown15Temp,(in noise reduction 24 otherwise 99 - max.air level?) temperature zone 1,1500,tempv,unknown value for zone 1

  /** Kurzbezeichnung zone 1 */
  @inherit(r_6, w_6)
  @ext(0x16, 0)
  model Z1Shortname {
    /** short name of zone 1 */
    value: shortname;
  }

  /** zone 1 label (first part) */
  @inherit(r_6, w_6)
  @ext(0x17, 0)
  model Z1Name1 {
    /** name of zone 1 */
    value: zname;
  }

  /** zone 1 label (second part) */
  @inherit(r_6, w_6)
  @ext(0x18, 0)
  model Z1Name2 {
    /** name of zone 1 */
    value: zname;
  }
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

  /** cooling operation mode zone 2 */
  @inherit(r_7, w_7)
  @ext(1, 0)
  model Z2OpModeCooling {
    /** operation mode for cooling of zone 2 */
    value: opmode;
  }

  /** cooling setpoint zone 2 */
  @inherit(r_7, w_7)
  @ext(0x2, 0)
  model Z2CoolingTemp {
    /** desired cooling setpoint for zone 2 */
    value: tempv;
  }

  /** holiday period start zone 2 */
  @inherit(r_7, w_7)
  @ext(0x3, 0)
  model Z2HolidayStartPeriod {
    /** start date of holidays for zone 2 */
    value: hfrom;
  }

  /** holiday period end zone 2 */
  @inherit(r_7, w_7)
  @ext(0x4, 0)
  model Z2HolidayEndPeriod {
    /** end date of holidays for zone 2 */
    value: hto;
  }

  /** room setpoint holiday period zone 2 */
  @inherit(r_7, w_7)
  @ext(0x5, 0)
  model Z2HolidayTemp {
    /** holiday setpoint for zone 2 */
    value: tempv;
  }

  /** operation mode zone 2 */
  @inherit(r_7, w_7)
  @ext(0x6, 0)
  model Z2OpMode {
    /** operation mode of zone 2 */
    value: opmode;
  }

  /** desired temperature zone 2 */
  @inherit(r_7, w_7)
  @ext(0x7, 0)
  model Z2DayTemp {
    /** day setpoint for zone 2 */
    value: tempv;
  }

  /** quick veto temperature zone 2 */
  @inherit(r_7, w_7)
  @ext(0x8, 0)
  model Z2QuickVetoTemp {
    /** manual override setpoint for zone 2 */
    value: tempv;
  }

  /** night temperature zone 2 */
  @inherit(r_7, w_7)
  @ext(0x9, 0)
  model Z2NightTemp {
    /** night setpoint for zone 2 */
    value: tempv;
  }

  /** bank holiday start zone 2 */
  @inherit(r_7, w_7)
  @ext(0xc, 0)
  model Z2BankHolidayStartPeriod {
    /** start date of bank holidays for zone 2 */
    value: hfrom;
  }

  /** bank holiday end zone 2 */
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

  /** room temperature zone 2 */
  @inherit(r_7)
  @ext(0xf, 0)
  model Z2RoomTemp {
    /** current room temperature in zone 2 */
    value: tempv;
  }

  /** valve status zone 2 */
  @inherit(r_7, w_7)
  @ext(0x12, 0)
  model Z2ValveStatus {
    /** valve status of zone 2 */
    value: UCH;
  }

  /** room zone mapping zone 2 */
  @inherit(r_7, w_7)
  @ext(0x13, 0)
  model Z2RoomZoneMapping {
    /** configures which room temperature is assigned to zone 2 */
    value: zmapping;
  }

  /** room temperature desired zone 2 */
  @inherit(r_7, w_7)
  @ext(0x14, 0)
  model Z2ActualRoomTempDesired {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    value: tempv;
  }
  // r;w,z2Unknown15Temp,(in noise reduction 24 otherwise 99 - max.air level?) temperature zone 2,1500,tempv,unknown value for zone 2

  /** Kurzbezeichnung zone 2 */
  @inherit(r_7, w_7)
  @ext(0x16, 0)
  model Z2Shortname {
    /** short name of zone 2 */
    value: shortname;
  }

  /** zone 2 label (first part) */
  @inherit(r_7, w_7)
  @ext(0x17, 0)
  model Z2Name1 {
    /** name of zone 2 */
    value: zname;
  }

  /** zone 2 label (second part) */
  @inherit(r_7, w_7)
  @ext(0x18, 0)
  model Z2Name2 {
    /** name of zone 2 */
    value: zname;
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

  /** cooling operation mode zone 3 */
  @inherit(r_8, w_8)
  @ext(1, 0)
  model Z3OpModeCooling {
    /** operation mode for cooling of zone 3 */
    value: opmode;
  }

  /** cooling setpoint zone 3 */
  @inherit(r_8, w_8)
  @ext(0x2, 0)
  model Z3CoolingTemp {
    /** desired cooling setpoint for zone 3 */
    value: tempv;
  }

  /** holiday period start zone 3 */
  @inherit(r_8, w_8)
  @ext(0x3, 0)
  model Z3HolidayStartPeriod {
    /** start date of holidays for zone 3 */
    value: hfrom;
  }

  /** holiday period end zone 3 */
  @inherit(r_8, w_8)
  @ext(0x4, 0)
  model Z3HolidayEndPeriod {
    /** end date of holidays for zone 3 */
    value: hto;
  }

  /** room setpoint holiday period zone 3 */
  @inherit(r_8, w_8)
  @ext(0x5, 0)
  model Z3HolidayTemp {
    /** holiday setpoint for zone 3 */
    value: tempv;
  }

  /** operation mode zone 3 */
  @inherit(r_8, w_8)
  @ext(0x6, 0)
  model Z3OpMode {
    /** operation mode of zone 3 */
    value: opmode;
  }

  /** desired temperature zone 3 */
  @inherit(r_8, w_8)
  @ext(0x7, 0)
  model Z3DayTemp {
    /** day setpoint for zone 3 */
    value: tempv;
  }

  /** quick veto temperature zone 3 */
  @inherit(r_8, w_8)
  @ext(0x8, 0)
  model Z3QuickVetoTemp {
    /** manual override setpoint for zone 3 */
    value: tempv;
  }

  /** night temperature zone 3 */
  @inherit(r_8, w_8)
  @ext(0x9, 0)
  model Z3NightTemp {
    /** night setpoint for zone 3 */
    value: tempv;
  }

  /** bank holiday start zone 3 */
  @inherit(r_8, w_8)
  @ext(0xc, 0)
  model Z3BankHolidayStartPeriod {
    /** start date of bank holidays for zone 3 */
    value: hfrom;
  }

  /** bank holiday end zone 3 */
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

  /** room temperature zone 3 */
  @inherit(r_8)
  @ext(0xf, 0)
  model Z3RoomTemp {
    /** current room temperature in zone 3 */
    value: tempv;
  }

  /** valve status zone 3 */
  @inherit(r_8, w_8)
  @ext(0x12, 0)
  model Z3ValveStatus {
    /** valve status of zone 3 */
    value: UCH;
  }

  /** room zone mapping zone 3 */
  @inherit(r_8, w_8)
  @ext(0x13, 0)
  model Z3RoomZoneMapping {
    /** configures which room temperature is assigned to zone 3 */
    value: zmapping;
  }

  /** room temperature desired zone 3 */
  @inherit(r_8, w_8)
  @ext(0x14, 0)
  model Z3ActualRoomTempDesired {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    value: tempv;
  }
  // r;w,z3Unknown15Temp,(in noise reduction 24 otherwise 99 - max.air level?) temperature zone 3,1500,tempv,unknown value for zone 3

  /** shortlabel zone 3 */
  @inherit(r_8, w_8)
  @ext(0x16, 0)
  model Z3Shortname {
    /** short name of zone 3 */
    value: shortname;
  }

  /** label zone 3 part 1 */
  @inherit(r_8, w_8)
  @ext(0x17, 0)
  model Z3Name1 {
    /** name of zone 3 */
    value: zname;
  }

  /** label zone 3 part 2 */
  @inherit(r_8, w_8)
  @ext(0x18, 0)
  model Z3Name2 {
    /** name of zone 3 */
    value: zname;
  }
  // ##### timers #####
  // air

  /** default *r */
  @base(MF, 0x24, 0x3, 0, 0, 1)
  model r_9 {
    /** whether timeslot is valid */
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x4, 0, 0, 1)
  model w_9 {}

  /** timer air monday */
  @inherit(r_9, w_9)
  @ext(0)
  model VentilationTimer_Monday {
    value: slot1_3;
  }

  /** timer air tuesday */
  @inherit(r_9, w_9)
  @ext(1)
  model VentilationTimer_Tuesday {
    value: slot1_3;
  }

  /** timer air wednesday */
  @inherit(r_9, w_9)
  @ext(0x2)
  model VentilationTimer_Wednesday {
    value: slot1_3;
  }

  /** timer air thursday */
  @inherit(r_9, w_9)
  @ext(0x3)
  model VentilationTimer_Thursday {
    value: slot1_3;
  }

  /** timer air friday */
  @inherit(r_9, w_9)
  @ext(0x4)
  model VentilationTimer_Friday {
    value: slot1_3;
  }

  /** timer air saturday */
  @inherit(r_9, w_9)
  @ext(0x5)
  model VentilationTimer_Saturday {
    value: slot1_3;
  }

  /** timer air sunday */
  @inherit(r_9, w_9)
  @ext(0x6)
  model VentilationTimer_Sunday {
    value: slot1_3;
  }
  // noise reduction

  /** default *r */
  @base(MF, 0x24, 0x3, 0, 0, 0x2)
  model r_10 {
    /** whether timeslot is valid */
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x4, 0, 0, 0x2)
  model w_10 {}

  /** timer noise reduction monday */
  @inherit(r_10, w_10)
  @ext(0)
  model NoiseReductionTimer_Monday {
    value: slot1_3;
  }

  /** timer noise reduction tuesday */
  @inherit(r_10, w_10)
  @ext(1)
  model NoiseReductionTimer_Tuesday {
    value: slot1_3;
  }

  /** timer noise reduction wednesday */
  @inherit(r_10, w_10)
  @ext(0x2)
  model NoiseReductionTimer_Wednesday {
    value: slot1_3;
  }

  /** timer noise reduction thursday */
  @inherit(r_10, w_10)
  @ext(0x3)
  model NoiseReductionTimer_Thursday {
    value: slot1_3;
  }

  /** timer noise reduction friday */
  @inherit(r_10, w_10)
  @ext(0x4)
  model NoiseReductionTimer_Friday {
    value: slot1_3;
  }

  /** timer noise reduction saturday */
  @inherit(r_10, w_10)
  @ext(0x5)
  model NoiseReductionTimer_Saturday {
    value: slot1_3;
  }

  /** timer noise reduction sunday */
  @inherit(r_10, w_10)
  @ext(0x6)
  model NoiseReductionTimer_Sunday {
    value: slot1_3;
  }
  // tariff

  /** default *r */
  @base(MF, 0x24, 0x3, 0, 0, 0x3)
  model r_11 {
    /** whether timeslot is valid */
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x4, 0, 0, 0x3)
  model w_11 {}

  /** timer tariff monday */
  @inherit(r_11, w_11)
  @ext(0)
  model TariffTimer_Monday {
    value: slot1_3;
  }

  /** timer tariff tuesday */
  @inherit(r_11, w_11)
  @ext(1)
  model TariffTimer_Tuesday {
    value: slot1_3;
  }

  /** timer tariff wednesday */
  @inherit(r_11, w_11)
  @ext(0x2)
  model TariffTimer_Wednesday {
    value: slot1_3;
  }

  /** timer tariff thursday */
  @inherit(r_11, w_11)
  @ext(0x3)
  model TariffTimer_Thursday {
    value: slot1_3;
  }

  /** timer tariff friday */
  @inherit(r_11, w_11)
  @ext(0x4)
  model TariffTimer_Friday {
    value: slot1_3;
  }

  /** timer tariff saturday */
  @inherit(r_11, w_11)
  @ext(0x5)
  model TariffTimer_Saturday {
    value: slot1_3;
  }

  /** timer tariff sunday */
  @inherit(r_11, w_11)
  @ext(0x6)
  model TariffTimer_Sunday {
    value: slot1_3;
  }
  // timers hot water

  /** default *r */
  @base(MF, 0x24, 0x3, 1, 0, 1)
  model r_12 {
    /** whether timeslot is valid */
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x4, 1, 0, 1)
  model w_12 {}

  /** timer hwc monday */
  @inherit(r_12, w_12)
  @ext(0)
  model HwcTimer_Monday {
    value: slot1_3;
  }

  /** timer hwc tuesday */
  @inherit(r_12, w_12)
  @ext(1)
  model HwcTimer_Tuesday {
    value: slot1_3;
  }

  /** timer hwc wednesday */
  @inherit(r_12, w_12)
  @ext(0x2)
  model HwcTimer_Wednesday {
    value: slot1_3;
  }

  /** timer hwc thursday */
  @inherit(r_12, w_12)
  @ext(0x3)
  model HwcTimer_Thursday {
    value: slot1_3;
  }

  /** timer hwc friday */
  @inherit(r_12, w_12)
  @ext(0x4)
  model HwcTimer_Friday {
    value: slot1_3;
  }

  /** timer hwc saturday */
  @inherit(r_12, w_12)
  @ext(0x5)
  model HwcTimer_Saturday {
    value: slot1_3;
  }

  /** timer hwc sunday */
  @inherit(r_12, w_12)
  @ext(0x6)
  model HwcTimer_Sunday {
    value: slot1_3;
  }
  // Zeitprogramm circulation pump

  /** default *r */
  @base(MF, 0x24, 0x3, 1, 0, 0x2)
  model r_13 {
    /** whether timeslot is valid */
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x4, 1, 0, 0x2)
  model w_13 {}

  /** timer cc monday */
  @inherit(r_13, w_13)
  @ext(0)
  model CcTimer_Monday {
    value: slot1_3;
  }

  /** timer cc tuesday */
  @inherit(r_13, w_13)
  @ext(1)
  model CcTimer_Tuesday {
    value: slot1_3;
  }

  /** timer cc wednesday */
  @inherit(r_13, w_13)
  @ext(0x2)
  model CcTimer_Wednesday {
    value: slot1_3;
  }

  /** timer cc thursday */
  @inherit(r_13, w_13)
  @ext(0x3)
  model CcTimer_Thursday {
    value: slot1_3;
  }

  /** timer cc friday */
  @inherit(r_13, w_13)
  @ext(0x4)
  model CcTimer_Friday {
    value: slot1_3;
  }

  /** timer cc saturday */
  @inherit(r_13, w_13)
  @ext(0x5)
  model CcTimer_Saturday {
    value: slot1_3;
  }

  /** timer cc sunday */
  @inherit(r_13, w_13)
  @ext(0x6)
  model CcTimer_Sunday {
    value: slot1_3;
  }
  // timers zone 1

  /** default *r */
  @base(MF, 0x24, 0x3, 0x3, 0, 0x2)
  model r_14 {
    /** whether timeslot is valid */
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x4, 0x3, 0, 0x2)
  model w_14 {}

  /** timer heating monday */
  @inherit(r_14, w_14)
  @ext(0)
  model Z1Timer_Monday {
    value: slot1_3;
  }

  /** timer heating tuesday */
  @inherit(r_14, w_14)
  @ext(1)
  model Z1Timer_Tuesday {
    value: slot1_3;
  }

  /** timer heating wednesday */
  @inherit(r_14, w_14)
  @ext(0x2)
  model Z1Timer_Wednesday {
    value: slot1_3;
  }

  /** timer heating thursday */
  @inherit(r_14, w_14)
  @ext(0x3)
  model Z1Timer_Thursday {
    value: slot1_3;
  }

  /** timer heating friday */
  @inherit(r_14, w_14)
  @ext(0x4)
  model Z1Timer_Friday {
    value: slot1_3;
  }

  /** timer heating saturday */
  @inherit(r_14, w_14)
  @ext(0x5)
  model Z1Timer_Saturday {
    value: slot1_3;
  }

  /** timer heating sunday */
  @inherit(r_14, w_14)
  @ext(0x6)
  model Z1Timer_Sunday {
    value: slot1_3;
  }

  /** default *r */
  @base(MF, 0x24, 0x3, 0x3, 0, 1)
  model r_15 {
    /** whether timeslot is valid */
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x4, 0x3, 0, 1)
  model w_15 {}

  /** timer cooling monday */
  @inherit(r_15, w_15)
  @ext(0)
  model Z1CoolingTimer_Monday {
    value: slot1_3;
  }

  /** timer cooling tuesday */
  @inherit(r_15, w_15)
  @ext(1)
  model Z1CoolingTimer_Tuesday {
    value: slot1_3;
  }

  /** timer cooling wednesday */
  @inherit(r_15, w_15)
  @ext(0x2)
  model Z1CoolingTimer_Wednesday {
    value: slot1_3;
  }

  /** timer cooling thursday */
  @inherit(r_15, w_15)
  @ext(0x3)
  model Z1CoolingTimer_Thursday {
    value: slot1_3;
  }

  /** timer cooling friday */
  @inherit(r_15, w_15)
  @ext(0x4)
  model Z1CoolingTimer_Friday {
    value: slot1_3;
  }

  /** timer cooling saturday */
  @inherit(r_15, w_15)
  @ext(0x5)
  model Z1CoolingTimer_Saturday {
    value: slot1_3;
  }

  /** timer cooling sunday */
  @inherit(r_15, w_15)
  @ext(0x6)
  model Z1CoolingTimer_Sunday {
    value: slot1_3;
  }
  // timers zone 2

  /** default *r */
  @base(MF, 0x24, 0x3, 0x3, 1, 0x2)
  model r_16 {
    /** whether timeslot is valid */
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x4, 0x3, 1, 0x2)
  model w_16 {}

  /** timer heating monday */
  @inherit(r_16, w_16)
  @ext(0)
  model Z2Timer_Monday {
    value: slot1_3;
  }

  /** timer heating tuesday */
  @inherit(r_16, w_16)
  @ext(1)
  model Z2Timer_Tuesday {
    value: slot1_3;
  }

  /** timer heating wednesday */
  @inherit(r_16, w_16)
  @ext(0x2)
  model Z2Timer_Wednesday {
    value: slot1_3;
  }

  /** timer heating thursday */
  @inherit(r_16, w_16)
  @ext(0x3)
  model Z2Timer_Thursday {
    value: slot1_3;
  }

  /** timer heating friday */
  @inherit(r_16, w_16)
  @ext(0x4)
  model Z2Timer_Friday {
    value: slot1_3;
  }

  /** timer heating saturday */
  @inherit(r_16, w_16)
  @ext(0x5)
  model Z2Timer_Saturday {
    value: slot1_3;
  }

  /** timer heating sunday */
  @inherit(r_16, w_16)
  @ext(0x6)
  model Z2Timer_Sunday {
    value: slot1_3;
  }

  /** default *r */
  @base(MF, 0x24, 0x3, 0x3, 1, 1)
  model r_17 {
    /** whether timeslot is valid */
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x4, 0x3, 1, 1)
  model w_17 {}

  /** timer cooling monday */
  @inherit(r_17, w_17)
  @ext(0)
  model Z2CoolingTimer_Monday {
    value: slot1_3;
  }

  /** timer cooling tuesday */
  @inherit(r_17, w_17)
  @ext(1)
  model Z2CoolingTimer_Tuesday {
    value: slot1_3;
  }

  /** timer cooling wednesday */
  @inherit(r_17, w_17)
  @ext(0x2)
  model Z2CoolingTimer_Wednesday {
    value: slot1_3;
  }

  /** timer cooling thursday */
  @inherit(r_17, w_17)
  @ext(0x3)
  model Z2CoolingTimer_Thursday {
    value: slot1_3;
  }

  /** timer cooling friday */
  @inherit(r_17, w_17)
  @ext(0x4)
  model Z2CoolingTimer_Friday {
    value: slot1_3;
  }

  /** timer cooling saturday */
  @inherit(r_17, w_17)
  @ext(0x5)
  model Z2CoolingTimer_Saturday {
    value: slot1_3;
  }

  /** timer cooling sunday */
  @inherit(r_17, w_17)
  @ext(0x6)
  model Z2CoolingTimer_Sunday {
    value: slot1_3;
  }
  // timers zone 3

  /** default *r */
  @base(MF, 0x24, 0x3, 0x3, 0x2, 0x2)
  model r_18 {
    /** whether timeslot is valid */
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x4, 0x3, 0x2, 0x2)
  model w_18 {}

  /** timer heating monday */
  @inherit(r_18, w_18)
  @ext(0)
  model Z3Timer_Monday {
    value: slot1_3;
  }

  /** timer heating tuesday */
  @inherit(r_18, w_18)
  @ext(1)
  model Z3Timer_Tuesday {
    value: slot1_3;
  }

  /** timer heating wednesday */
  @inherit(r_18, w_18)
  @ext(0x2)
  model Z3Timer_Wednesday {
    value: slot1_3;
  }

  /** timer heating thursday */
  @inherit(r_18, w_18)
  @ext(0x3)
  model Z3Timer_Thursday {
    value: slot1_3;
  }

  /** timer heating friday */
  @inherit(r_18, w_18)
  @ext(0x4)
  model Z3Timer_Friday {
    value: slot1_3;
  }

  /** timer heating saturday */
  @inherit(r_18, w_18)
  @ext(0x5)
  model Z3Timer_Saturday {
    value: slot1_3;
  }

  /** timer heating sunday */
  @inherit(r_18, w_18)
  @ext(0x6)
  model Z3Timer_Sunday {
    value: slot1_3;
  }

  /** default *r */
  @base(MF, 0x24, 0x3, 0x3, 0x2, 1)
  model r_19 {
    /** whether timeslot is valid */
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x4, 0x3, 0x2, 1)
  model w_19 {}

  /** timer cooling monday */
  @inherit(r_19, w_19)
  @ext(0)
  model Z3CoolingTimer_Monday {
    value: slot1_3;
  }

  /** timer cooling tuesday */
  @inherit(r_19, w_19)
  @ext(1)
  model Z3CoolingTimer_Tuesday {
    value: slot1_3;
  }

  /** timer cooling wednesday */
  @inherit(r_19, w_19)
  @ext(0x2)
  model Z3CoolingTimer_Wednesday {
    value: slot1_3;
  }

  /** timer cooling thursday */
  @inherit(r_19, w_19)
  @ext(0x3)
  model Z3CoolingTimer_Thursday {
    value: slot1_3;
  }

  /** timer cooling friday */
  @inherit(r_19, w_19)
  @ext(0x4)
  model Z3CoolingTimer_Friday {
    value: slot1_3;
  }

  /** timer cooling saturday */
  @inherit(r_19, w_19)
  @ext(0x5)
  model Z3CoolingTimer_Saturday {
    value: slot1_3;
  }

  /** timer cooling sunday */
  @inherit(r_19, w_19)
  @ext(0x6)
  model Z3CoolingTimer_Sunday {
    value: slot1_3;
  }
  // includes

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
