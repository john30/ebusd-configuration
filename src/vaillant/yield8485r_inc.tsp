import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace yield8485r_inc {
  // yield

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** yield this year */
  @inherit(r)
  @ext(0x84, 0)
  @ext(0x84, 0x8)
  @ext(0x84, 0x10)
  @ext(0x84, 0x18)
  @ext(0x84, 0x20)
  @ext(0x84, 0x28)
  @ext(0x84, 0x30)
  @ext(0x84, 0x38)
  @ext(0x84, 0x40)
  @ext(0x84, 0x48)
  @ext(0x84, 0x50)
  @ext(0x84, 0x58)
  model YieldThisYear {
    energyr: energyr;
    energyr_1: energyr;
    energyr_2: energyr;
    energyr_3: energyr;
    energyr_4: energyr;
    energyr_5: energyr;
    energyr_6: energyr;
    energyr_7: energyr;
    energyr_8: energyr;
    energyr_9: energyr;
    energyr_10: energyr;
    energyr_11: energyr;
  }

  /** yield last year */
  @inherit(r)
  @ext(0x85, 0)
  @ext(0x85, 0x8)
  @ext(0x85, 0x10)
  @ext(0x85, 0x18)
  @ext(0x85, 0x20)
  @ext(0x85, 0x28)
  @ext(0x85, 0x30)
  @ext(0x85, 0x38)
  @ext(0x85, 0x40)
  @ext(0x85, 0x48)
  @ext(0x85, 0x50)
  @ext(0x85, 0x58)
  model YieldLastYear {
    energyr: energyr;
    energyr_1: energyr;
    energyr_2: energyr;
    energyr_3: energyr;
    energyr_4: energyr;
    energyr_5: energyr;
    energyr_6: energyr;
    energyr_7: energyr;
    energyr_8: energyr;
    energyr_9: energyr;
    energyr_10: energyr;
    energyr_11: energyr;
  }
}
