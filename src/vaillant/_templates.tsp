import "@ebusd/ebus-typespec";
import "../_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;

namespace vaillant;
alias MF = 0xb5; // Ebus.id.manufacturers.Vaillant

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
@values(values_daysel)
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
scalar minutes0 extends UCH;

/** minutes */
@unit("min")
scalar minutes2 extends UIN;

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

/** calibration */
@unit("K")
scalar calibration extends D2C;

/** calibration0 */
@unit("K")
scalar calibration0 extends UCH;

/** calibration1 */
@unit("K")
scalar calibration1 extends D1C;

/** calibrations */
@unit("K")
@divisor(2)
scalar calibrations extends SCH;

/** calibrationv */
@unit("K")
scalar calibrationv extends EXP;

/** Integral */
@unit("°min")
scalar integral extends SIN;

/** boiler mode */
@values(values_hcmode)
scalar hcmode extends UCH;

/** boiler mode */
@values(values_hcmode2)
scalar hcmode2 extends UCH;

/** mixer mode */
@values(values_mcmode)
scalar mcmode extends UCH;

/** mixer type */
@values(values_mctype)
scalar mctype extends UCH;

/** mixer type */
@values(values_mctype7)
scalar mctype7 extends BI0_7;

/** hot water mode */
@values(values_hwcmode)
scalar hwcmode extends UCH;

/** hot water mode */
@values(values_hwcmode2)
scalar hwcmode2 extends UCH;

/** mixer State */
@values(values_mixer)
scalar mixer extends UCH;

/** day/night mode */
@values(values_daynight)
scalar daynight extends UCH;

/** Status */
scalar status extends UCH;

/** onoff */
@values(values_onoff)
scalar onoff extends UCH;

/** yesno */
@values(values_yesno)
scalar yesno extends UCH;

/** errorok */
@values(values_errorok)
scalar errorok extends UCH;

/** sensor status */
@values(values_sensor)
scalar sensor extends UCH;

/** tempsensor */
model tempsensor {
  temp: temp;
  sensor: sensor;
}

/** tempmirror */
scalar tempmirror extends UIN;

/** tempmirrorsensor */
model tempmirrorsensor {
  temp: temp;
  tempmirror: tempmirror;
  sensor: sensor;
}

/** presssensor */
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

/** uin100 */
@divisor(100)
scalar uin100 extends UIN;

/** Heating curve */
@divisor(100)
scalar curve extends UIN;

/** phase 1 state */
@values(values_phase1)
scalar phase1 extends BI0;

/** phase 2 state */
@values(values_phase2)
scalar phase2 extends BI1;

/** phase 3 state */
@values(values_phase3)
scalar phase3 extends BI2;

/** phase */
model phase {
  phase: phase1;
  phase_1: phase2;
  phase_2: phase3;
}

/** code */
scalar code extends PIN;

/** error number */
scalar error extends UIN;

/** errors */
model errors {
  error: error;
  error_1: error;
  error_2: error;
  error_3: error;
  error_4: error;
}

/** Error_History */
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

/** slot1-3 */
model slot1_3 {
  slot: slot1;
  slot_1: slot2;
  slot_2: slot3;
}

/** timer */
model timer {
  slot1_: slot1_3;
  daysel: daysel;
}

/** backtype */
@values(values_backtype)
scalar backtype extends UCH;

/** backmode */
@values(values_backmode)
scalar backmode extends UCH;

/** power */
@unit("kW")
scalar power extends UCH;

/** energy */
@unit("kWh")
scalar energy extends UIN;

/** energyr */
@unit("kWh")
scalar energyr extends UIR;

/** energy4 */
@unit("kWh")
scalar energy4 extends ULG;

/** start count */
scalar cntstarts extends ULG;

/** start count */
scalar cntstarts2 extends UIN;

/** pump power */
@values(values_pumppow)
scalar pumppow extends UCH;

/** pump state */
@values(values_pumpstate)
scalar pumpstate extends UCH;

/** DCF receiver state */
@values(values_dcfstate)
scalar dcfstate extends UCH;

/** phase state */
@values(values_phaseok)
scalar phaseok extends UCH;

/** valve position */
@values(values_switchvalve)
scalar switchvalve extends UCH;

/** valve position */
@values(values_switchvalve2)
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
@values(values_hpstatus)
scalar hpstatus extends UCH;

/** frequency */
@unit("Hz")
scalar frequency extends UIN;

/** selected zone */
@values(values_zonesel)
scalar zonesel extends UIN;

/** SF mode */
@values(values_sfmode)
scalar sfmode extends UCH;

/** opmode */
@values(values_opmode)
scalar opmode extends UIN;

/** zmapping */
@values(values_zmapping)
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

/** mamode */
@values(values_mamode)
scalar mamode extends UIN;

/** offmode */
@values(values_offmode)
scalar offmode extends UIN;

/** rcmode */
@values(values_rcmode)
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

enum values_daysel {
  selected: 0,
  Mo_Fr: 1,
  Sa_Su: 2,
  Mo_Su: 3,
}

enum values_hcmode {
  auto: 0,
  off: 1,
  heat: 2,
  water: 2,
}

enum values_hcmode2 {
  off: 0,
  heat: 3,
  water: 4,
}

enum values_mcmode {
  disabled: 0,
  on: 1,
  off: 2,
  auto: 3,
  eco: 4,
  low: 5,
}

enum values_mctype {
  inactive: 0,
  mixer: 1,
  fixed: 2,
  hwc: 3,
  returnincr: 4,
  pool: 5,
}

enum values_mctype7 {
  inactive: 0,
  mixer: 1,
  fixed: 2,
  hwc: 3,
  returnincr: 4,
  pool: 5,
  circulation: 6,
}

enum values_hwcmode {
  disabled: 0,
  on: 1,
  off: 2,
  auto: 3,
}

enum values_hwcmode2 {
  off: 0,
  on: 1,
  auto: 2,
  manual: 3,
}

enum values_mixer {
  off: 0,
  open: 1,
  close: 2,
}

enum values_daynight {
  night: 0,
  day: 1,
  floorpaving: 7,
}

enum values_onoff {
  off: 0,
  on: 1,
}

enum values_yesno {
  no: 0,
  yes: 1,
}

enum values_errorok {
  ok: 0,
  error: 1,
}

enum values_sensor {
  ok: 0,
  circuit: 85,
  cutoff: 170,
}

enum values_phase1 {
  missing: 0,
  present: 1,
}

enum values_phase2 {
  missing: 0,
  present: 1,
}

enum values_phase3 {
  missing: 0,
  present: 1,
}

enum values_backtype {
  not_present: 0,
  externalheat: 1,
  externalwater: 2,
  externalheatandwater: 3,
  internalheatandwater: 4,
}

enum values_backmode {
  no_backup: 0,
  withbackup: 1,
  onlybackup: 2,
}

enum values_pumppow {
  _0: 0,
  _1: 1,
  _2: 2,
  _3: 3,
  _4: 4,
  _5: 5,
  _6: 6,
  off: 7,
}

enum values_pumpstate {
  off: 0,
  on: 1,
  overrun: 2,
  hwc: 4,
}

enum values_dcfstate {
  nosignal: 0,
  ok: 1,
  sync: 2,
  valid: 3,
}

enum values_phaseok {
  error: 0,
  ok: 7,
}

enum values_switchvalve {
  heat: 0,
  water: 1,
}

enum values_switchvalve2 {
  heat: 0,
  both: 50,
  water: 100,
  standby: 254,
}

enum values_hpstatus {
  off: 0,
  heat: 3,
  standby: 6,
  otshutdown: 7,
  water: 8,
}

enum values_zonesel {
  alle: 0,
  _1: 1,
  _2: 2,
  _3: 3,
  _4: 4,
  _5: 5,
  _6: 6,
}

enum values_sfmode {
  auto: 0,
  ventilation: 1,
  party: 2,
  veto: 3,
  onedayaway: 4,
  onedayathome: 5,
  load: 6,
}

enum values_opmode {
  off: 0,
  auto: 1,
  day: 2,
  night: 3,
}

enum values_zmapping {
  none: 0,
  VRC700: 1,
  VR91_1: 2,
  VR91_2: 3,
  VR91_3: 4,
}

enum values_mamode {
  circulation: 0,
  dryer: 1,
  zone: 2,
  legiopump: 3,
}

enum values_offmode {
  eco: 0,
  night: 1,
}

enum values_rcmode {
  off: 0,
  modulating: 1,
  thermostat: 2,
}
