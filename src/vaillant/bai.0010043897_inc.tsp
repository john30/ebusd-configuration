import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./bai.emm_inc.tsp";
import "./bai.308523_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010043897_inc {
  // ,BAI00,ecoTEC plus 0010043897 VC 15CS/1-5 (HW 7603) combined with sensoDIRECT 0020274790 VRC710 ("EMM00")

  /** included parts */
  union _includes {
    Bai._308523_inc,

    @conditionExt(Id.Id.id, 0x15, "='EMM00'")
    Bai.Emm_inc,
  }
}
