import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Encon;

// @zz(0x0a)
namespace Co2 {
  // ## BRINK CO2 sensor
  // #
  // # This ebus config is based on information from https://gathering.tweakers.net/forum/list_messages/1979992
  // # It is untested and likely incomplete.
  // # Brink CO2 sensor

  /** default *r */
  model r {}

  /** default *w */
  @write
  model w {}
  // ### SENSOR DATA ####

  /** 40a100 */
  @id(MF, 0xa1)
  model SensorValue {
    /** Address */
    uir: UIR;

    uir_1: UIR;

    /** Value */
    @unit("ppm")
    uir_2: UIR;
  }

  /** default *w */
  @write
  @base(MF, 0x80)
  model w_1 {}

  /** 4080039103e8 */
  @inherit(w_1)
  @ext(0x91)
  model SensorUpperLimit {
    @unit("ppm")
    value: UIR;
  }

  /** 4080039002bc */
  @inherit(w_1)
  @ext(0x90)
  model SensorLowerLimit {
    @unit("ppm")
    value: UIR;
  }
}
