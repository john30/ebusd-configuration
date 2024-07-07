import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x64)
namespace V65 {
  // ,V6500,VR 65,V65 199

  /** default *u */
  @passive
  @base(MF, 0x12, 0x2)
  model u_1 {}

  @inherit(u_1)
  @ext
  model State {
    @out
    setvalve: switchvalve2;

    state: switchvalve2;
    dhwdemand: yesno;
    temp: temp;
  }
}
