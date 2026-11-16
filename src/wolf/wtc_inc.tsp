import "@ebusd/ebus-typespec";
import "../_templates.tsp";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Str;
using Ebus.Dtm;

namespace Wolf;

// --- shared register-read template (precomputed address CRC, see 15..ka.tsp / evidence) ---

/** register read whose first ID byte is the precomputed Weishaupt CRC-8 (poly 0x5C) */
@base(MF, 0x22)
model crcr {}

/** register read with a precomputed address checksum */
@inherit(crcr)
model CrcRead<T> {
  value: T;
}

/** outside temperature (may be negative) */
@unit("°C")
@divisor(10)
scalar otemp10 extends SIN;

/** seconds */
@unit("s")
scalar seconds extends UIN;

enum _enabled {
  Enabled: 0,
  Disabled: 1,
}

enum _weekday {
  Monday: 1,
  Tuesday: 2,
  Wednesday: 3,
  Thursday: 4,
  Friday: 5,
  Saturday: 6,
  Sunday: 7,
}

/** day of the week */
@values(_weekday)
scalar weekday extends UIN;

enum _month {
  January: 1,
  February: 2,
  March: 3,
  April: 4,
  May: 5,
  June: 6,
  July: 7,
  August: 8,
  September: 9,
  October: 10,
  November: 11,
  December: 12,
}

/** month of the year */
@values(_month)
scalar month extends UIN;

/**
 * One switch-time slot of a weekly program (read side): a start ("from") and stop ("to")
 * time, each with an enable flag. Read via the precomputed-CRC register base.
 */
@inherit(crcr)
model SwitchTimes {
  ToTime: TTQ;
  @values(_enabled) ToEnabled: BI7;
  FromTime: TTQ;
  @values(_enabled) FromEnabled: BI7;
}

enum _onoff {
  off: 0,
  on: 1,
}

enum _operatingPhase {
  BurnerOff: 0x00,
  StandbyCheckFan: 0x01,
  PrepurgeSpeedAchieved: 0x02,
  Prepurge: 0x03,
  IgnitionSpeedAchieved: 0x04,
  Ignition: 0x05,
  BurnerInOperation: 0x06,
  GasValveCheck: 0x07,
  PostPurge: 0x08,
  ForcedVenting: 0x09,
}

/** burner operating phase */
@values(_operatingPhase)
scalar operatingPhase extends UCH;

/**
 * Boiler burner load (PBSB 05 04): current load and the configured minimum and maximum.
 * Incoming only, decoded passively.
 */
@ext(0x05, 0x04)
model Power {
  /** current burner load */
  CurrentLoad: percent0;

  /** minimum burner load */
  MinLoad: percent0;

  /** maximum burner load */
  MaxLoad: percent0;
}

/**
 * Boiler status the WTC broadcasts (PBSB 50 0A). Incoming only: the boiler sends it on its
 * own, so ebusd decodes it passively. Field layout confirmed against a live broadcast frame
 * (see evidence).
 */
@ext(0x50, 0x0a)
model Status {
  /** status byte */
  Status1: UCH;

  OperatingPhase: operatingPhase;
  Ukn2_1: BI0;
  Ukn2_2: BI1;
  Ukn2_3: BI2;
  @values(_onoff) Flame: BI3;
  @values(_onoff) GasValve1: BI4;
  @values(_onoff) GasValve2: BI5;
  @values(_onoff) Pump: BI6;
  @values(_onoff) Error: BI7;
  @values(_onoff) ManualStartUp: BI0;
  @values(_onoff) BurnerStatus: BI1;
  Ukn3_3: BI2;
  @values(_onoff) Service: BI3;
  Ukn3_5: BI4;
  @values(_onoff) Fan: BI5;
  @values(_onoff) CircPump: BI6;
  @values(_onoff) DHWPump: BI7;

  /** burner load */
  Load: percent0;

  /** boiler flow temperature */
  SupplyTemp: temp1;

  /** flue gas temperature */
  FlueGasTemp: temp0;

  /** domestic hot water temperature */
  DHWTemp: temp1;

  /** outside temperature */
  OutsideTemp: temp2;

  /** outside temperature, weighted over time */
  OutsideWeightedTemp: temp2;

  /** boiler flow setpoint */
  SupplySetTemp: temp0;
}

/** temperature difference */
@unit("K")
scalar temp1k extends D1C;

/**
 * Exchange between a room controller and its heating module (PBSB 50 14). Incoming only:
 * the room controller sends the first part, the module answers with the second; ebusd decodes
 * both passively. Field layout confirmed against a live frame (see evidence).
 */
@ext(0x50, 0x14)
model HcMode {
  @out Ink1_1: BI0;
  @out @values(_onoff) Heating: BI1;
  @out Ink1_3: BI2;
  @out Ink1_4: BI3;
  @out Ink1_5: BI4;
  @out Ink1_6: BI5;
  @out Ink1_7: BI6;
  @out Ink1_8: BI7;

  /** requested flow setpoint */
  @out SupplyHCSetTemp: temp2;

  /** room temperature */
  @out RoomTemp: temp2;

  @out Ink2_1: BI0;
  @out Ink2_2: BI1;
  @out Ink2_3: BI2;
  @out @values(_onoff) DHW: BI3;
  @out Ink2_5: BI4;
  @out Ink2_6: BI5;
  @out Ink2_7: BI6;
  @out Ink2_8: BI7;
  @out @maxLength(1) ign: IGN;

  /** operating mode */
  @in Opmode: UCH;

  @in @values(_onoff) Pump: BI0;
  @in @values(_onoff) ValveClosing: BI1;
  @in @values(_onoff) ValveOpening: BI2;
  @in Opmode_4: BI3;
  @in Opmode_5: BI4;
  @in Opmode_6: BI5;
  @in Opmode_7: BI6;

  /** actual flow temperature */
  @in SupplyHCTemp: temp2;

  /** outside temperature */
  @in OutsideTemp: temp2;

  /** boiler boost offset */
  @in BoilerMCBoostTemp: temp1k;

  /** maximum flow temperature */
  @in SupplyHCMaxTemp: temp1;

  /** minimum flow temperature */
  @in SupplyHCMinTemp: temp1;
}
