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

/** date */
scalar date extends HDA3;

/** weekday */
scalar day extends BDY;

/** days */
@values(Values_daysel)
scalar daysel extends UCH;

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

/** day/night mode */
@values(Values_daynight)
scalar daynight extends UCH;

/** Status */
scalar status extends UCH;

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

@unit("kW")
scalar power extends UCH;

@unit("kWh")
scalar energy extends UIN;

@unit("kWh")
scalar energyr extends UIR;

@unit("kWh")
scalar energy4 extends ULG;

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

@values(Values_sfmode)
scalar sfmode extends UCH;

@values(Values_opmode)
scalar opmode extends UIN;

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

@values(Values_rcmode)
scalar rcmode extends UIN;

/** array index for the zones. Array Index start at 0 for the first element */
scalar slotIndex extends UCH;

/** Number of total slots in the array. May be Zero. */
scalar slotCount extends UCH;

/** Number of total slots in the array for a week. Mon-Sun */
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

/** Timeslot from/until */
model slotTimeFrame {
  htm: HTM;
  htm_1: HTM;
}

/** Temperature stored in the slot. Degrees Celsius */
@divisor(10)
scalar slotTemp extends UIN;

/** Complete Slot for writing the time table settings. */
model wTimeSlotWithTemp {
  slotIndex: slotIndex;
  slotCount: slotCount;
  slotTimeFrame: slotTimeFrame;
  slotTemp: slotTemp;
}

/** Complete slot for writing the time table settings without a temperature. FF FF has to be appended. */
model wTimeSlotWithoutTemp {
  slotIndex: slotIndex;
  slotCount: slotCount;
  slotTimeFrame: slotTimeFrame;
  @maxLength(2) hex: HEX;
}

/** Complete Slot for reading the time table settings. */
model rTimeSlotWithTemp {
  @maxLength(1) ign: IGN;
  slotTimeFrame: slotTimeFrame;
  slotTemp: slotTemp;
}

/** Complete slot for reading the time table settings without a temperature. */
model rTimeSlotWithoutTemp {
  @maxLength(1) ign: IGN;
  slotTimeFrame: slotTimeFrame;
  @maxLength(2) ign_1: IGN;
}

/** Status code */
@values(Values_appliancecode)
scalar appliancecode extends UCH;

enum Values_daysel {
  selected: 0,
  Mo_Fr: 1,
  Sa_Su: 2,
  Mo_Su: 3,
}

enum Values_hcmode {
  auto: 0,
  off: 1,
  heat: 2,
  water: 3,
}

enum Values_hcmode2 {
  off: 0,
  heat: 3,
  water: 4,
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

enum Values_daynight {
  night: 0,
  day: 1,
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

enum Values_sfmode {
  auto: 0,
  ventilation: 1,
  party: 2,
  veto: 3,
  onedayaway: 4,
  onedayathome: 5,
  load: 6,
}

enum Values_opmode {
  off: 0,
  auto: 1,
  day: 2,
  night: 3,
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

enum Values_rcmode {
  off: 0,
  modulating: 1,
  thermostat: 2,
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
  value: IGN;
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
  value: IGN;
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
