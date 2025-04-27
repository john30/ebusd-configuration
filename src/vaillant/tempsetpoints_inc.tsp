import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Tempsetpoints_inc {
  // Setpoints temperature

  /** default *r */
  @base(MF, 0x4, 0x19)
  model r_1 {
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x5, 0x2e)
  model w_1 {}

  /** Temperatures Monday */
  @inherit(r_1, w_1)
  @ext(1)
  model Setpoints_Monday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Tuesday */
  @inherit(r_1, w_1)
  @ext(0x2)
  model Setpoints_Tuesday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Wednesday */
  @inherit(r_1, w_1)
  @ext(0x3)
  model Setpoints_Wednesday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Thursday */
  @inherit(r_1, w_1)
  @ext(0x4)
  model Setpoints_Thursday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Friday */
  @inherit(r_1, w_1)
  @ext(0x5)
  model Setpoints_Friday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Saturday */
  @inherit(r_1, w_1)
  @ext(0x6)
  model Setpoints_Saturday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Sunday */
  @inherit(r_1, w_1)
  @ext(0x7)
  model Setpoints_Sunday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }
}
