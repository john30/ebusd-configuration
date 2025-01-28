import "@ebusd/ebus-typespec";
import "../_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Encon;
alias MF = 0x40; // Ebus.Id.Values_manufacturers.ENCON

/** days */
@unit("days")
scalar days extends UIR;

/** hours */
@unit("h")
@factor(5)
scalar hours5 extends UIR;

@values(Values_onoff)
scalar onoff extends UIR;

@values(Values_yesno)
scalar yesno extends UIR;

@unit("°C")
@divisor(10)
scalar temp10 extends SIR;

@unit("m³")
@factor(1000)
scalar volume extends UIR;

@unit("m³/h")
scalar speed extends UIR;

@unit("m³/h")
scalar sspeed extends SIR;

@unit("%")
scalar percentr extends UIR;

@values(Values_heaterstatus)
scalar heaterstatus extends UIR;

@values(Values_sensorstate)
scalar sensorstate extends UIR;

@values(Values_position)
scalar position extends UIR;

@values(Values_autocloseopen)
scalar autocloseopen extends UIR;

@unit("V")
@divisor(10)
scalar voltage extends SIR;

@values(Values_onoffbypass)
scalar onoffbypass extends UIR;

@values(Values_fanmode)
scalar fanmode extends UIR;

@values(Values_inputmode)
scalar inputmode extends UIR;

@unit("baud")
@values(Values_baud)
scalar baud extends UIR;

@values(Values_parity)
scalar parity extends UIR;

enum Values_onoff {
  off: 0,
  on: 1,
}

enum Values_yesno {
  no: 0,
  yes: 1,
}

enum Values_heaterstatus {
  Initializing: 0,
  Off: 1,
  On: 2,
}

enum Values_sensorstate {
  Error: 0,
  NotInitialized: 1,
  Idle: 2,
  WarmingUp: 3,
  Running: 4,
  Calibrating: 5,
  SelfTest: 6,
}

enum Values_position {
  _0: 0,
  _1: 1,
  _2: 2,
  _3: 3,
}

enum Values_autocloseopen {
  Auto: 0,
  Closed: 1,
  Open: 2,
}

enum Values_onoffbypass {
  off: 0,
  on: 1,
  on_if_bypass_open_condition_satisfied: 2,
  bypass_control: 3,
  Bedroom_valve: 4,
}

enum Values_fanmode {
  FanOff: 0,
  Minimal_flow_50m3_h: 1,
  FanMode1: 2,
  FanMode2: 3,
  FanMode3: 4,
  ManualSwitch: 5,
  MaximalFlow: 6,
  FanNotActive: 7,
}

enum Values_inputmode {
  Normally_Closed: 0,
  _0_10V_input: 1,
  Normally_Open: 2,
  _12V_Bypass_Open_0V_Bypass_Closed: 3,
  _0V_Bypass_Open_12V_Bypass_Closed: 4,
}

enum Values_baud {
  _1k2: 0,
  _2k4: 1,
  _4k8: 2,
  _9k6: 3,
  _19k2: 4,
  _38k4: 5,
  _56k: 6,
  _115k: 7,
}

enum Values_parity {
  None: 0,
  Even: 1,
  Odd: 2,
  Unknown: 3,
}
