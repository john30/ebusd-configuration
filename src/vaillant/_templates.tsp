import "@ebusd/ebus-typespec";
import "../_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Vaillant;
alias MF = 0xb5; // Ebus.Id.Values_manufacturers.Vaillant

/** temperature */
@unit("°C")
scalar temps extends SCH;

/** temperature */
@unit("°C")
scalar temps2 extends SIN;

/** temperature */
@unit("°C")
scalar tempv extends EXP;

/** pressure */
@unit("bar")
scalar press extends FLT;

/** pressure */
@unit("bar")
scalar pressv extends EXP;

/** percentage */
@unit("%")
scalar percentv extends EXP;

/** date */
scalar date extends HDA3;

/** weekday */
scalar day extends BDY;

/** day selector */
@values(Values_daysel)
scalar daysel extends UCH;

/** day selector */
@values(Values_daysel2)
scalar daysel2 extends UCH;

/** days */
scalar days extends UCH;

/** time */
scalar time extends VTI;

/** time */
scalar time2 extends VTM;

/** minutes */
@unit("min")
@divisor(120)
scalar minutes extends ULG;

/** minutes */
@unit("min")
scalar minutes4 extends ULG;

/** minutes */
@unit("min")
scalar minutes0 extends UCH;

/** minutes */
@unit("min")
scalar minutes2 extends UIN;

/** minutes */
@unit("min")
@factor(5)
scalar minutes5 extends UCH;

/** hours */
@unit("h")
scalar hoursum extends ULG;

/** hours */
@unit("h")
scalar hoursum2 extends UIN;

/** hours */
@unit("h")
scalar hours extends UCH;

/** hours */
@unit("h")
scalar hours1 extends D1C;

/** hours */
@unit("h")
@factor(12)
scalar hours12 extends UCH;

/** hour */
@unit("h")
scalar hour extends UCH;

/** seconds */
@unit("s")
@divisor(2)
scalar seconds extends ULG;

/** seconds */
@unit("s")
scalar seconds0 extends UCH;

/** seconds */
@unit("s")
scalar seconds2 extends UIN;

/** seconds */
@unit("s")
scalar seconds4 extends ULG;

@unit("K")
scalar calibration extends D2C;

@unit("K")
scalar calibration0 extends UCH;

@unit("K")
scalar calibration1 extends D1C;

@unit("K")
@divisor(2)
scalar calibrations extends SCH;

@unit("K")
scalar calibrationv extends EXP;

@unit("°min")
scalar integral extends SIN;

/** boiler mode */
@values(Values_hcmode)
scalar hcmode extends UCH;

/** boiler mode */
@values(Values_hcmode2)
scalar hcmode2 extends UCH;

/** hc pump mode */
@values(Values_hcpumpmode)
scalar hcpumpmode extends UCH;

/** hybrid manager mode */
@values(Values_hmmode)
scalar hmmode extends UCH;

/** mixer mode */
@values(Values_mcmode)
scalar mcmode extends UCH;

/** mixer type */
@values(Values_mctype)
scalar mctype extends UCH;

/** mixer type */
@values(Values_mctype7)
scalar mctype7 extends BI0_7;

/** hot water mode */
@values(Values_hwcmode)
scalar hwcmode extends UCH;

/** hot water mode */
@values(Values_hwcmode2)
scalar hwcmode2 extends UCH;

/** mixer State */
@values(Values_mixer)
scalar mixer extends UCH;

/** zone valve state */
@values(Values_openclose)
scalar openclose extends UCH;

/** day/night mode */
@values(Values_daynight)
scalar daynight extends UCH;

/** Status */
scalar status extends UCH;

/** ESCO */
@values(Values_escomode)
scalar escomode extends UCH;

@values(Values_onoff)
scalar onoff extends UCH;

@values(Values_yesno)
scalar yesno extends UCH;

@values(Values_onoff2)
scalar onoff2 extends UCH;

@values(Values_yesno2)
scalar yesno2 extends UCH;

@values(Values_errorok)
scalar errorok extends UCH;

/** sensor status */
@values(Values_sensor)
scalar sensor extends UCH;

model tempsensor {
  temp: temp;
  sensor: sensor;
}

@unit("°C")
scalar tempmirror extends UIN;

model tempmirrorsensor {
  temp: temp;
  tempmirror: tempmirror;
  sensor: sensor;
}

model presssensor {
  press: press;
  sensor: sensor;
}

/** pressure */
@unit("mbar")
scalar pressm extends ULG;

/** pressure */
@unit("mbar")
scalar pressm2 extends UIN;

@divisor(100)
scalar uin100 extends UIN;

/** Heating curve */
@divisor(100)
scalar curve extends UIN;

/** phase 1 state */
@values(Values_phase1)
scalar phase1 extends BI0;

/** phase 2 state */
@values(Values_phase2)
scalar phase2 extends BI1;

/** phase 3 state */
@values(Values_phase3)
scalar phase3 extends BI2;

model phase {
  phase: phase1;
  phase_1: phase2;
  phase_2: phase3;
}

scalar code extends PIN;

/** error number */
scalar error extends UIN;

model errors {
  error: error;
  error_1: error;
  error_2: error;
  error_3: error;
  error_4: error;
}

model errorhistory {
  status: status;
  time: time2;
  date: date;
  error: error;
}

/** from */
scalar from extends TTM;

/** to */
scalar to extends TTM;

/** slot 1 from/to */
model slot1 {
  from: from;
  to: to;
}

/** slot 2 from/to */
model slot2 {
  from: from;
  to: to;
}

/** slot 3 from/to */
model slot3 {
  from: from;
  to: to;
}

/** slots 1-3 */
model slot1_3 {
  slot: slot1;
  slot_1: slot2;
  slot_2: slot3;
}

model timer {
  slot1_: slot1_3;
  daysel: daysel;
}

@values(Values_backtype)
scalar backtype extends UCH;

@values(Values_backmode)
scalar backmode extends UCH;

@values(Values_backmode2)
scalar backmode2 extends UCH;

@unit("kW")
scalar power extends UCH;

@unit("kWh")
scalar energy extends UIN;

@unit("kWh")
scalar energyr extends UIR;

@unit("kWh")
scalar energy4 extends ULG;

@unit("kWh")
@divisor(1000)
scalar energye extends EXP;

/** start count */
scalar cntstarts extends ULG;

/** start count */
scalar cntstarts2 extends UIN;

/** pump power */
@values(Values_pumppow)
scalar pumppow extends UCH;

/** pump state */
@values(Values_pumpstate)
scalar pumpstate extends UCH;

/** DCF receiver state */
@values(Values_dcfstate)
scalar dcfstate extends UCH;

/** phase state */
@values(Values_phaseok)
scalar phaseok extends UCH;

/** valve position */
@values(Values_switchvalve)
scalar switchvalve extends UCH;

/** valve position */
@values(Values_switchvalve2)
scalar switchvalve2 extends UCH;

/** holiday period from */
scalar hfrom extends HDA3;

/** holiday period to */
scalar hto extends HDA3;

/** holiday period 1 from; 2 from; 1 to; 2 to */
model holiday {
  hfrom: hfrom;
  hfrom_1: hfrom;
  hto: hto;
  hto_1: hto;
}

/** heating state */
@values(Values_hpstatus)
scalar hpstatus extends UCH;

/** frequency */
@unit("Hz")
scalar frequency extends UIN;

/** selected zone */
@values(Values_zonesel)
scalar zonesel extends UIN;

@values(Values_zonestatus)
scalar zonestatus extends UIN;

@values(Values_sfmode)
scalar sfmode extends UCH;

@values(Values_sfmodezone)
scalar sfmodezone extends UCH;

@values(Values_sfmodehwc)
scalar sfmodehwc extends UCH;

@values(Values_opmode)
scalar opmode extends UIN;

@values(Values_opmode2)
scalar opmode2 extends UIN;

@values(Values_zmapping)
scalar zmapping extends UIN;

/** heat circuit name */
@maxLength(11)
scalar hcname extends STR;

/** zone name */
@maxLength(5)
scalar zname extends STR;

/** name */
@maxLength(6)
scalar shortname extends STR;

/** phone number */
@maxLength(9)
scalar phone extends STR;

/** phone number */
@maxLength(6)
scalar shortphone extends STR;

@values(Values_mamode)
scalar mamode extends UIN;

@values(Values_offmode)
scalar offmode extends UIN;

@values(Values_offmode2)
scalar offmode2 extends UIN;

@values(Values_rcmode)
scalar rcmode extends UIN;

@values(Values_rcmode2)
scalar rcmode2 extends UIN;

/** index of a time slot */
scalar slotIndex extends UCH;

/** number of slots on a day */
scalar slotCount extends UCH;

/** number of slots per weekday */
model slotCountWeek {
  @maxLength(1) ign: IGN;
  slotCount: slotCount;
  slotCount_1: slotCount;
  slotCount_2: slotCount;
  slotCount_3: slotCount;
  slotCount_4: slotCount;
  slotCount_5: slotCount;
  slotCount_6: slotCount;
  @maxLength(1) ign_1: IGN;
}

/** timeslot from/until */
model slotTimeFrame {
  htm: HTM;
  htm_1: HTM;
}

/** desired temperature of a slot */
@unit("°C")
@divisor(10)
scalar slotTemp extends UIN;

/** complete slot for writing with target temperature */
model wTimeSlotWithTemp {
  slotIndex: slotIndex;
  slotCount: slotCount;
  slotTimeFrame: slotTimeFrame;
  slotTemp: slotTemp;
}

/** constant value for writing a slot without target temperature */
@constValue(0xffff)
scalar wTimeSlotConst extends U2L;

/** complete slot for writing without target temperature */
model wTimeSlotWithoutTemp {
  slotIndex: slotIndex;
  slotCount: slotCount;
  slotTimeFrame: slotTimeFrame;
  wTimeSlotConst: wTimeSlotConst;
}

/** complete slot for reading with target temperature */
model rTimeSlotWithTemp {
  @maxLength(1) ign: IGN;
  slotTimeFrame: slotTimeFrame;
  slotTemp: slotTemp;
}

/** complete slot for reading without target temperature */
model rTimeSlotWithoutTemp {
  @maxLength(1) ign: IGN;
  slotTimeFrame: slotTimeFrame;
  @maxLength(2) ign_1: IGN;
}

/** Status code */
@values(Values_appliancecode)
scalar appliancecode extends UCH;

/** HMU Status code */
@values(Values_hmucode)
scalar hmucode extends UIN;

enum Values_daysel {
  selected: 0,
  Mo_Fr: 1,
  Sa_Su: 2,
  Mo_Su: 3,
}

enum Values_daysel2 {
  off: 0,
  Mo: 1,
  Tu: 2,
  We: 3,
  Th: 4,
  Fr: 5,
  Sa: 6,
  Su: 7,
  daily: 8,
}

enum Values_hcmode {
  auto: 0,
  off: 1,
  heat: 2,
  water: 3,
}

enum Values_hcmode2 {
  off: 0,
  cooling: 1,
  heat: 3,
  water: 4,
}

enum Values_hcpumpmode {
  off: 0,
  heat: 1,
  cool: 2,
  exthwc: 3,
}

enum Values_hmmode {
  trivalence: 0,
  bivalence: 1,
}

enum Values_mcmode {
  disabled: 0,
  on: 1,
  off: 2,
  auto: 3,
  eco: 4,
  low: 5,
}

enum Values_mctype {
  inactive: 0,
  mixer: 1,
  fixed: 2,
  hwc: 3,
  returnincr: 4,
  pool: 5,
}

enum Values_mctype7 {
  inactive: 0,
  mixer: 1,
  fixed: 2,
  hwc: 3,
  returnincr: 4,
  pool: 5,
  circulation: 6,
}

enum Values_escomode {
  heatpump: 0,
  backup: 1,
  heatpumpandbackup: 2,
  heat: 3,
  cool: 4,
  heatandcool: 5,
}

enum Values_hwcmode {
  disabled: 0,
  on: 1,
  off: 2,
  auto: 3,
}

enum Values_hwcmode2 {
  off: 0,
  on: 1,
  auto: 2,
  manual: 3,
}

enum Values_mixer {
  off: 0,
  open: 1,
  close: 2,
}

enum Values_openclose {
  close: 0,
  open: 1,
}

enum Values_daynight {
  night: 0,
  day: 1,
  load: 4,
  floorpaving: 7,
}

enum Values_onoff {
  off: 0,
  on: 1,
}

enum Values_yesno {
  no: 0,
  yes: 1,
}

enum Values_onoff2 {
  off: 240,
  on: 15,
}

enum Values_yesno2 {
  no: 240,
  yes: 15,
}

enum Values_errorok {
  ok: 0,
  error: 1,
}

enum Values_sensor {
  ok: 0,
  circuit: 85,
  cutoff: 170,
}

enum Values_phase1 {
  missing: 0,
  present: 1,
}

enum Values_phase2 {
  missing: 0,
  present: 1,
}

enum Values_phase3 {
  missing: 0,
  present: 1,
}

enum Values_backtype {
  not_present: 0,
  externalheat: 1,
  externalwater: 2,
  externalheatandwater: 3,
  internalheatandwater: 4,
}

enum Values_backmode {
  no_backup: 0,
  withbackup: 1,
  onlybackup: 2,
}

enum Values_backmode2 {
  off: 0,
  heat: 1,
  water: 2,
  heatandwater: 3,
}

enum Values_pumppow {
  _0: 0,
  _1: 1,
  _2: 2,
  _3: 3,
  _4: 4,
  _5: 5,
  _6: 6,
  off: 7,
}

enum Values_pumpstate {
  off: 0,
  on: 1,
  overrun: 2,
  hwc: 4,
}

enum Values_dcfstate {
  nosignal: 0,
  ok: 1,
  sync: 2,
  valid: 3,
}

enum Values_phaseok {
  error: 0,
  ok: 7,
}

enum Values_switchvalve {
  heat: 0,
  water: 1,
}

enum Values_switchvalve2 {
  heat: 0,
  both: 50,
  water: 100,
  standby: 254,
}

enum Values_hpstatus {
  off: 0,
  heat: 3,
  standby: 6,
  otshutdown: 7,
  water: 8,
}

enum Values_zonesel {
  alle: 0,
  _1: 1,
  _2: 2,
  _3: 3,
  _4: 4,
  _5: 5,
  _6: 6,
}

enum Values_zonestatus {
  auto: 0,
  ventilation: 1,
  party: 3,
  veto: 4,
  onedayaway: 5,
  onedayathome: 6,
  holidayaway: 7,
  holidayathome: 8,
  load: 9,
  off: 10,
}

enum Values_sfmode {
  auto: 0,
  ventilation: 1,
  party: 2,
  veto: 3,
  onedayaway: 4,
  onedayathome: 5,
  load: 6,
}

enum Values_sfmodezone {
  auto: 0,
  ventilation: 1,
  veto: 3,
}

enum Values_sfmodehwc {
  auto: 0,
  load: 6,
}

enum Values_opmode {
  off: 0,
  auto: 1,
  day: 2,
  night: 3,
}

enum Values_opmode2 {
  off: 0,
  auto: 1,
  manual: 2,
}

enum Values_zmapping {
  none: 0,
  VRC700: 1,
  VR91_1: 2,
  VR91_2: 3,
  VR91_3: 4,
}

enum Values_mamode {
  circulation: 0,
  dryer: 1,
  zone: 2,
  legiopump: 3,
}

enum Values_offmode {
  eco: 0,
  night: 1,
}

enum Values_offmode2 {
  eco: 0,
  normal: 1,
}

enum Values_rcmode {
  off: 0,
  modulating: 1,
  thermostat: 2,
}

enum Values_rcmode2 {
  inactive: 0,
  active: 1,
  expanded: 2,
}

enum Values_appliancecode {
  off: 0,
  prerun: 1,
  pump_prerun: 2,
  ignition: 3,
  on: 4,
  overrun: 5,
  fan_overrun: 6,
  pump_overrun: 7,
  shutdown: 8,
  measure: 9,
  hwc_desired: 10,
  hwc_prerun: 11,
  hwc_pump_prerun: 12,
  hwc_ignition: 13,
  hwc_on: 14,
  hwc_overrun: 15,
  hwc_fan_overrun: 16,
  hwc_pump_overrun: 17,
  hwc_shutdown: 18,
  frost_protect: 34,
}

enum Values_hmucode {
  frost_protect: 34,
  standby: 100,
  heat_compressor_shutdown: 101,
  heat_compressor_blocked: 102,
  heat_prerun: 103,
  heat_compressor_active: 104,
  heat_overrun: 107,
  cool_compressor_shutdown: 111,
  cool_compressor_blocked: 112,
  cool_prerun: 113,
  cool_compressor_active: 114,
  cool_overrun: 117,
  heat_immersion_heater_active: 125,
  hwc_compressor_blocked: 132,
  hwc_prerun: 133,
  hwc_compressor_active: 134,
  hwc_immersion_heater_active: 135,
  hwc_overrun: 137,
  heat_immersion_heater_shutdown: 141,
  heat_immersion_heater_blocked: 142,
  hwc_immersion_heater_shutdown: 151,
  hwc_immersion_heater_blocked: 152,
  air_purging_program_active: 202,
  compressor_oil_heating_active: 240,
  fan1_blocked: 252,
  fan1_airinlet_too_high: 255,
  fan1_airinlet_too_low: 256,
  fan2_blocked: 260,
  building_circuit_flow_too_low: 275,
  building_circuit_pump_fault: 277,
  frequency_converter_fault_compressor: 280,
  frequency_converter_fault_mains_voltage: 281,
  frequency_converter_fault_overheating: 282,
  deicing_time_too_long: 283,
  deicing_flow_temp_too_low: 284,
  compressor_outlet_temp_too_high: 285,
  hot_gas_temp_switch_open: 286,
  fan1_wind: 287,
  fan2_wind: 288,
  current_limt_active: 289,
  high_pressure_switch_open: 302,
  compressor_outlet_temp_too_high_1: 303,
  evaporation_temp_too_low: 304,
  condensation_temp_too_low: 305,
  evaporation_temp_too_high: 306,
  condensation_temp_too_high: 308,
  building_circuit_return_temp_too_low: 312,
  building_circuit_return_temp_too_high: 314,
  immersion_heater_flow_temp_too_high: 351,
  deicing_active: 516,
  frequency_converter_fault: 575,
  connection_fault_frequency_converter: 581,
  four_port_valve_position_fault: 590,
}

/** default *r for register */
@base(MF, 0x9, 0xd)
model r {}

/** default *w for register */
@write
@base(MF, 0x9, 0xe)
model w {}

/** default *u for register */
@passive
@base(MF, 0x9, 0x29)
model u {
  @maxLength(2)
  ign: IGN;
}

/** default *wi for register with user level "install" */
@write
@auth("install")
@base(MF, 0x9, 0xe)
model wi {}

/** default *ws for register with user level "service" */
@write
@auth("service")
@base(MF, 0x9, 0xe)
model ws {}

/** read/write register */
@inherit(r, w)
model Register<T> {
  value: T;
}

/** read only register */
@inherit(r)
model ReadonlyRegister<T> {
  value: T;
}

/** installer level register */
@inherit(r, wi)
model InstallRegister<T> {
  value: T;
}

/** service level register */
@inherit(r, ws)
model ServiceRegister<T> {
  value: T;
}

/** read/write updated register */
@inherit(r, w, u)
model UpdateRegister<T> {
  value: T;
}

/** read only updated register */
@inherit(r, u)
model ReadonlyUpdateRegister<T> {
  value: T;
}

/** installer level updated register */
@inherit(r, wi, u)
model InstallUpdateRegister<T> {
  value: T;
}

/** service level updated register */
@inherit(r, ws, u)
model ServiceUpdateRegister<T> {
  value: T;
}

/** default *r for mode */
@base(MF, 0x04)
model rm {}

/** default *w for mode */
@write
@base(MF, 0x05)
model wm {}

/** default *r for timer */
@base(MF, 0x15)
model rt {
  @maxLength(1)
  ign: IGN;
}

/** default *w for timer */
@write
@base(MF, 0x15)
model wt {}

/** timer */
@inherit(rt, wt)
model Timer<T> {
  /** timer value */
  value: T;
}

/** display contrast */
@minValue(0)
@maxValue(15)
scalar displaycontrast extends UCH;
