import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace tempsetpoints_inc {
  // Setpoints temperature

  /** default *r */
  @base(MF, 0x4, 0x19)
  model r {
    @maxLength(1)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x5, 0x2e)
  model w {}

  /** Temperatures Monday */
  @inherit(r, w)
  @ext(1)
  model Setpoints_Monday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Tuesday */
  @inherit(r, w)
  @ext(0x2)
  model Setpoints_Tuesday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Wednesday */
  @inherit(r, w)
  @ext(0x3)
  model Setpoints_Wednesday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Thursday */
  @inherit(r, w)
  @ext(0x4)
  model Setpoints_Thursday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Friday */
  @inherit(r, w)
  @ext(0x5)
  model Setpoints_Friday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Saturday */
  @inherit(r, w)
  @ext(0x6)
  model Setpoints_Saturday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }

  /** Temperatures Sunday */
  @inherit(r, w)
  @ext(0x7)
  model Setpoints_Sunday {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp1;
  }
}
