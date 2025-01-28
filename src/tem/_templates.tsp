import "@ebusd/ebus-typespec";
import "../_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
using Ebus.Contrib;

namespace Tem;
alias MF = 0x10; // Ebus.Id.Values_manufacturers.TEM
// Bartl TEM

/** Datentyp */
@values(Values_type)
scalar type extends UCH;

/** Einheit */
@values(Values_unit)
scalar unit extends UCH;

/** Maximum */
scalar maxs extends SIN;

/** Minimum */
scalar mins extends SIN;

/** Maximum (Teiler 10) */
@divisor(10)
scalar maxs_10 extends SIN;

/** Minimum (Teiler 10) */
@divisor(10)
scalar mins_10 extends SIN;

/** Weekday */
scalar wd extends BDY;

/** Range */
scalar range extends SCH;

/** Kommando */
model command {
  tem_p: TEM_P;
  type: type;
  unit: unit;
}

/** Temperatur */
@unit("°C")
scalar temp1 extends SIN;

/** Temperatur */
model temp1_1b {
  sch: SCH;
  @maxLength(1) ign: IGN;
}

/** Temperatur (Teiler 10) */
@unit("°C")
@divisor(10)
scalar temp10 extends SIN;

/** Temperatur (Teiler 10K) */
@unit("K")
@divisor(10)
scalar temp10K extends SIN;

/** Temperatur (Teiler 2) */
@unit("°C")
@divisor(2)
scalar temp2 extends SIN;

/** Temperatur (Teiler 256) */
@unit("°C")
scalar temp256 extends D2B;

/** Maximum */
scalar max_temp1 extends temp1;

/** Minimum */
scalar min_temp1 extends temp1;

/** Maximum */
model max_temp1_1b {
  sch: SCH;
  @maxLength(1) ign: IGN;
}

/** Minimum */
model min_temp1_1b {
  sch: SCH;
  @maxLength(1) ign: IGN;
}

/** Maximum */
scalar max_temp10 extends temp10;

/** Minimum */
scalar min_temp10 extends temp10;

/** Maximum */
scalar max_temp10K extends temp10K;

/** Minimum */
scalar min_temp10K extends temp10K;

/** Maximum */
scalar max_temp2 extends temp2;

/** Minimum */
scalar min_temp2 extends temp2;

/** Maximum */
scalar max_time extends MIN;

/** Minimum */
scalar min_time extends MIN;

/** Maximum */
model max_wd {
  wd: wd;
  @maxLength(1) ign: IGN;
}

/** Minimum */
model min_wd {
  wd: wd;
  @maxLength(1) ign: IGN;
}

/** Maximum */
model max_range {
  range: range;
  @maxLength(1) ign: IGN;
}

/** Minimum */
model min_range {
  range: range;
  @maxLength(1) ign: IGN;
}

/** Parameter */
model parameter1 {
  command: command;
  max: maxs;
  min: mins;
}

/** Parameter10 */
model parameter1_10 {
  command: command;
  max: maxs_10;
  min: mins_10;
}

/** Parameter */
model parameter2 {
  command: command;
  uch: UCH;
  uch_1: UCH;
}

/** ParameterTemp1 */
model parameter_temp1 {
  command: command;
  max: max_temp1;
  min: min_temp1;
}

/** ParameterTemp1 */
model parameter_temp1_1b {
  command: command;
  max: max_temp1_1b;
  min: min_temp1_1b;
}

/** ParameterTemp10 */
model parameter_temp10 {
  command: command;
  max: max_temp10;
  min: min_temp10;
}

/** ParameterTemp10K */
model parameter_temp10K {
  command: command;
  max: max_temp10K;
  min: min_temp10K;
}

/** ParameterTemp2 */
model parameter_temp2 {
  command: command;
  max: max_temp2;
  min: min_temp2;
}

/** ParameterTime */
model parameter_time {
  command: command;
  max: max_time;
  min: min_time;
}

/** ParameterWeekday */
model parameter_wd {
  command: command;
  max: max_wd;
  min: min_wd;
}

/** ParameterRange */
model parameter_range {
  command: command;
  max: max_range;
  max_1: min_range;
}

/** Binary Time */
scalar btime extends BTI;

/** Binary Date */
scalar bdate extends BDA;

/** Status */
scalar status extends UIN;

/** Betriebsstunden (Teiler 10) */
@unit("h")
@divisor(100)
scalar hcd100 extends HCD;

/** Zeitprogramm 2 Stunden */
model tp_2h {
  bi: BI0;
  bi_1: BI1;
  bi_2: BI2;
  bi_3: BI3;
  bi_4: BI4;
  bi_5: BI5;
  bi_6: BI6;
  bi_7: BI7;
}

/** Zeitprogramm 8 Stunden */
model tp_8h {
  tp_2h: tp_2h;
  tp_2h_1: tp_2h;
  tp_2h_2: tp_2h;
  tp_2h_3: tp_2h;
}

/** Zeitprogramm 20 Stunden */
model tp_20h {
  tp_2h: tp_2h;
  tp_2h_1: tp_2h;
  tp_2h_2: tp_2h;
  tp_2h_3: tp_2h;
  tp_2h_4: tp_2h;
  tp_2h_5: tp_2h;
  tp_2h_6: tp_2h;
  tp_2h_7: tp_2h;
  tp_2h_8: tp_2h;
  tp_2h_9: tp_2h;
}

/** Modus Zeitprogramm */
model tp_mode {
  uch: UCH;
  uch_1: UCH;
  uch_2: UCH;
  uch_3: UCH;
  uch_4: UCH;
  uch_5: UCH;
  uch_6: UCH;
  uch_7: UCH;
  uch_8: UCH;
  @maxLength(1) ign: IGN;
}

/** Zeitprogramm Woche */
model tp_week {
  tp_20h: tp_20h;
  tp_20h_1: tp_20h;
  tp_20h_2: tp_20h;
  tp_20h_3: tp_20h;
  tp_20h_4: tp_20h;
  tp_20h_5: tp_20h;
  tp_20h_6: tp_20h;
  tp_20h_7: tp_20h;
  tp_8h: tp_8h;
}

/** Zeitprogramm komplett */
model tp_all {
  tp_mode: tp_mode;
  tp_20h: tp_20h;
  tp_20h_1: tp_20h;
  tp_20h_2: tp_20h;
  tp_20h_3: tp_20h;
  tp_20h_4: tp_20h;
  tp_20h_5: tp_20h;
  tp_20h_6: tp_20h;
  tp_20h_7: tp_20h;
  tp_8h: tp_8h;
}

enum Values_type {
  none: 0x00,
  on_off: 0x02,
  Zeit: 0x04,
  selection: 0x09,
  Temperatur: 0x0d,
  Dauer: 0x40,
  TemperaturSchwelle: 0x4d,
  TemperaturSoll: 0x8d,
  range: 0xc0,
}

enum Values_unit {
  none: 0x00,
  _C: 0x02,
  K: 0x04,
  __0: 0x08,
  h: 0x0a,
  min: 0x0c,
  kW: 0x10,
  hh_mm: 0x2a,
}
