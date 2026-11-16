import "@ebusd/ebus-typespec";
import "../_templates.tsp";

using Ebus;
using Ebus.Num;

namespace Wolf;

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
