import "@ebusd/ebus-typespec";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;

namespace Vaillant;

// @zz(0x04)
namespace Netx3 {
  /** default *u */
  @passive
  @base(MF, 0x11)
  model u_1 {}

  /** room thermostat measured temperature */
  @inherit(u_1)
  @ext(0x0e)
  model RoomTempDial {
    /** room temperature measured by the wall thermostat */
    @unit("°C")
    temp: UCH;
  }

  /** default *u */
  @passive
  @base(MF, 0x03)
  model u_2 {}

  /** current errors */
  @inherit(u_2)
  @ext(0x00, 0x01)
  model Currenterror {
    /** error number */
    error: UIN;
  }
}

