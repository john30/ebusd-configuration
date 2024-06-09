import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x64)
namespace v65 {
  // ,V6500,VR 65,V65 199

  /** default *u */
  @passive
  @base(MF, 0x12, 0x2)
  model u {}

  @inherit(u)
  model State {
    @out
    setvalve: switchvalve2;

    state: switchvalve2;
    dhwdemand: yesno;
    temp: temp;
  }
}
