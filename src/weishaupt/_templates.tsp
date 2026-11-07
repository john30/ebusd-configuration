import "@ebusd/ebus-typespec";
import "../_templates.tsp";
import "./weishaupt.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Weishaupt;
alias MF = 0x50; // Ebus.Id.Values_manufacturers.Kromschröder

/** temperature */
@unit("°C")
@divisor(10)
scalar temp10 extends UIN;

/** temperature K */
@unit("K")
@divisor(10)
scalar temp10k extends UIN;

/** percent */
@unit("%")
scalar percent extends UIN;

/** seconds */
@unit("s")
scalar seconds extends UIN;

/** minutes */
@unit("min")
scalar minutes extends UIN;

/** hours */
@unit("h")
scalar hours extends UIN;

@unit("U/sec")
scalar speed extends UIN;

/** default *r for register */
@base(0x50, 0x22) // todo 0x00 should rather be crc8 of following bytes, see https://github.com/john30/ebusd/issues/167
model regr {
}

/** default *r for memory */
@base(0x50, 0x00) // todo 0x00 should rather be crc8 of following bytes, see https://github.com/john30/ebusd/issues/167
model memr {
  @maxLength(1) ign: IGN;
}

/** default *w for register */
@write(true)
@base(0x50, 0x23)
model regw {}

/** default *r for memory */
@write(true)
@base(0x50, 0x01) // todo 0x00 should rather be crc8 of following bytes, see https://github.com/john30/ebusd/issues/167
model memw {
}

/** default passive *r for register */
@base(0x09, 0x02)
@passive
model sregr {}

/** default passive *w for register */
@write()
@passive
@base(0x09, 0x03)
model sregw {}

/** read/write sregister */
@inherit(regr, regw) //todo first byte of ext always 0x0 on write
model Register<T> {
  value: T;
}

@inherit(memr, memw) //todo first byte of ext always 0x0 on write
model Memory<T = UCH> {
  value: T;
}

/** read only register */
@inherit(regr)
model ReadonlyRegister<T> {
  value: T;
}

@inherit(memr)
model ReadonlyMemory<T = UCH> {
  value: T;
}

enum ErrorType {
  Fault:0x00,
  Warning:0x01
}

@inherit(memr)
model FaultHistory {
    ErrorCode:BI0_7;
    @values(ErrorType)
    /** Error Type */
    ErrorType:BI7; 
    /** I10: Operating phase */
    OperatingPhase:UCH; 
    /**I11: Load setting */
    LoadSetting:UCH;
    /**I22: Set speed PWM pump */
    PwmPumpSpeed:UCH;
    /**I30: Boiler temperature */
    BoilerTemp:outsidetemp; 
    /**I31: Flue gas temperature */
    FlueGasTemp:outsidetemp;
    /** I32: Ionisation signal */
    IonisationSignal:UCH;
    /**I37: Return temperature */
    ReturnTemp:outsidetemp;
}

@inherit(sregr) //todo first byte of ext always 0x0 on write
model ReadRegister<T> {
  value: T;
}

@inherit(sregw) //todo first byte of ext always 0x0 on write
model WriteRegister<T> {
  value: T;
}

@inherit(regr, regw) //todo first byte of ext always 0x0 on write
model cal {
disabled:BI7,
time:TTQ
}

/** outside temperature */
@unit("°C")
@divisor(10)
scalar outsidetemp10 extends SIN;

/** temperature */
@unit("K")
scalar temp1k extends D1C;

/** Steepness */
@divisor(10)
scalar gradient10 extends SIN;


enum _Values_onoff {
    off: 0,
    on: 1,
  }

@values(_Values_onoff)
scalar Values_onoff extends UIN;

enum _month {
January:0x01,
February:0x02,
March:0x03,
April:0x04,
May:0x05,
June:0x06,
July:0x07,
August:0x08,
September:0x09,
October:0x0A,
November:0x10,
December:0x11
}

@values(_month)
scalar month extends UIN;

enum _boilerid {
  A:0,
  B:1,
  x:240
}

@values(_boilerid)
scalar boilerid extends UIN;

enum _DHWOperation {
  Priority:0x00,
  Sliding:0x01,
  Parallel:0x02
}

@values(_DHWOperation)
scalar DHWOperation extends UIN;

enum _Constructiontype {
  Heavy:0x0,
  Light:0x1
}

@values(_Constructiontype)
scalar Constructiontype extends UIN;

enum _Program {
  Standby:0x01,
  NormalTemperature:0x03,
  LoweringTemperature:0x04,
  Summer:0x05,
  Program1:0x0b,
  Program2:0x0c,
  Program3:0x0d,
  StandbyWTC:0x14
}

@values(_Program)
scalar Program extends UIN;

enum _Dhw {
  DHWProgram:0x00,
  Day24:0x01,
  DHWBeforeHeat:0x02
}

@values(_Dhw)
scalar Dhw extends UIN;

enum _WeekDay {
  Sunday:0x01,
  Monday:0x02,
  Tuesday:0x03,
  Wednesday:0x04,
  Thursday:0x05,
  Friday:0x06,
  Saturday:0x07
}

@values(_WeekDay)
scalar WeekDay extends UIN;

enum _WeekDay2 {
  Monday:0x01,
  Tuesday:0x02,
  Wednesday:0x03,
  Thursday:0x04,
  Friday:0x05,
  Saturday:0x06,
  Sunday:0x07,
}
@values(_WeekDay2)
scalar WeekDay2 extends UIN;

enum _TempReduced {
  Antifreeze:0x00,
  Setback:0x01
}

@values(_TempReduced)
scalar TempReduced extends UIN;

enum _PumpVariationSpeed {
  Operating_level:0x00,
  Characteristic_Curve:0x01
}

@values(_PumpVariationSpeed)
scalar PumpVariationSpeed extends UIN;

enum _HCType {
  UnderFloorHeating:0x00,
  UndeFloorHeating2:0x01,
  Radiator60:0x02,
  Radiator75:0x03,
  Convector:0x04,
  Universal:0x05
}

@values (_HCType)
scalar HCType extends UIN;


enum _Floordrying {
  Off:0x00,
  HeatingFunction:0x01,
  DocumentHeating:0x02,
  FunctionReceiptHeating:0x03
}

@values(_Floordrying)
scalar Floordrying extends UIN;

enum _CVariation {
  Constant:0x00,
  WeatherCompensated:0x01,
  WeatherRoomCompensated:0x02,
  RoomCompensated:0x03
}
@values(_CVariation)
scalar CVariation extends UIN;

enum _WtcOperatingPhase {
  BurnerOff:0x00;
  StandbyCheckFan:0x01;
  PrepurgeSpeedAchieved:0x02;
  Prepurge:0x03;
  IgnitionSpeedAchieved:0x04;
  Ignition:0x05;
  BurnerInOperation:0x06;
  GasValveXheck:0x07;
  PostPurge:0x08;
  ForcedVenting:0x09;
  F11:0x0B;//F11:Temperature at eSTL > 105 °C ;
  W12:0x0C;//W12:Temperature at supply sensor > 95 °C ;
  F12:0x0D;//F13:Flue gas temperature is too high;
  W14:0x0E;//W14:Temperature at eSTL increases too rapidly ;
  F15:0x0F;//F15:Temperature differential between flow and return too high;
  F16:0x10;//F16:Flue gas temperature too high;
  F17:0x11;//F17:Combustion air temperature too high;
  F19:0x13;//F19:Combustion chamber pressure too high;
  F21:0x15;//F21:No flame formation at burner start;
  F22:0x16;//F22:Flame failure during operation;
  F23:0x17;//F23:Flame simulation e. g. reflection of ignition spark through oil film in combustion chamber;
  W24:0x18;//W24:Input H2 is closed;
  W25:0x19;//W25:Alarm condensate lift pump Level switch has been triggered;
  W27:0x1b;//W27:Combustion chamber pressure sensor defective;
  W28:0x1c;//W28:System pressure sensor/return flow sensor defective;
  F30:0x1e;//F30:Flow sensor defective;
  F31:0x1f;//F31:Flue gas sensor defective;
  F33:0x21;//F33/W33:External sensor defective;
  W34:0x22;//W34:DHW sensor (B3) defective;
  W35:0x23;//W35:DHW outlet sensor (B12) defective;
  F36:0x24;//F36:System pressure < 0.5 bar;
  F37:0x25;//F37:Combustion air sensor defective;
  F38:0x26;//F38:Buffer sensor (B10) defective;
  F39:0x27;//F39:Buffer sensor/de-couple sensor (B11) defective;
  F40:0x29;//F41:Flue gas damper is not operating;
  F43:0x2b;//F43:Specified fan speed is not achieved;
  F44:0x2c;//F44:Fan standby defective;
  F47:0x2f;//F47:Ignition faulty;
  F50:0x32;//F50:Electronic fault;
  F51:0x33;//F51:Data record error condensing boiler;
  F52:0x34;//F52:Data record error burner;
  F53:0x35;//F53:Supply voltage or power frequency outside the tolerance limits;
  F54:0x36;//F54:Electronic fault;
  F55:0x37;//F55:Memory fault;
  F56:0x38;//F56:Negative component test;
  F57:0x39;//F57:Communication boiler electronics WCM-OB-CPU and boiler control panel WCM-OB-CUI faulty;
  F58:0x3a;//F58:[reset] button defective;
  F59:0x3b;//F59:Internal communication error;
  F60:0x3c;//F60:Data record error boiler electronics WCM-OB-CPU;
  F61:0x3d;//F61:Coded plug BCC not plugged in;
  F62:0x3e;//F62:Data record error BCC;
  F63:0x3f;//F63:Different data records Incorrect coded plug BCC plugged in;
  F64:0x40;//F64:Data transfer was not performed properly;
  F65:0x41;//F65:Data transfer was not performed properly (e. g.[Enter] key was not pressed within 8 seconds);
  F70:0x46;//F70:Connection boiler electronics WCM-OB-CPU and boiler control panel WCM-OB-CUI incorrect;
  W80:0x50;//W80:Communication to the cascade manager or WCM-Sol is faulty;
  W81:0x51;//W81:Communication to WCM-FS#1 is faulty;
  W82:0x52;//W82:Communication to EM#2 or WCM-FS#2 is faulty;
  W83:0x53;//W83:Communication to EM#3 or WCM-FS#3 is faulty;
  W84:0x54;//W84:Communication to EM#4 or WCM-FS#4 is faulty;
  W85:0x55;//W85:Communication to EM#5 or WCM-FS#5 is faulty;
  W86:0x56;//W86:Communication to EM#6 or WCM-FS#6 is faulty;
  W87:0x57;//W87:Communication to EM#7 or WCM-FS#7 is faulty;
  W88:0x58;//W88:Communication to EM#8 or WCM-FS#8 is faulty;
  W89:0x59;//W89:Temperature remote control is faulty;
}

@values(_WtcOperatingPhase)
scalar WtcOperatingPhase extends UCH;

// --- Writable setpoint ranges (ebusd enforces them on write) ---
// Bounds from the Weishaupt manuals WCM-FS 2.0 (83277701, p.21 / §4.7) and WCM-KA 3.0
// (83258401, p.50-63). The manuals give no step; 0.5 K and 1 % are the steps of their
// display examples. Linked bounds (e.g. reduced <= normal room setpoint, supply min <=
// supply max) cannot be expressed as a static range and stay in the integration guard.
@minValue(16) @maxValue(35) @step(0.5) scalar roomNormalTemp extends temp10;
@minValue(4) @maxValue(16) @step(0.5) scalar roomFrostTemp extends temp10;
@minValue(8) @maxValue(30) @step(0.5) scalar summerWinterTemp extends outsidetemp;
// room_reduced (10-21.5 C) and gradient (2.5-40) have a fractional endpoint that the
// integer-typed @minValue/@maxValue cannot express; their bounds, like the linked bounds
// (reduced <= normal, supply min <= max), stay in the ha-weishaupt integration guard.
@minValue(8) @maxValue(82) @step(0.5) scalar supplyLimitTemp extends temp10;
@minValue(40) @maxValue(60) @step(0.5) scalar dhwSetpointTemp extends temp10;
@minValue(30) @maxValue(100) @step(1) scalar modulationPercent extends percent;
