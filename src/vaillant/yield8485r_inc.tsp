import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Yield8485r_inc {
  // yield

  /** yield this year */
  @inherit(r)
  @poll(9)
  @ext(0x84, 0)
  @chain(
    2,
    #[0x84, 0x8],
    #[0x84, 0x10],
    #[0x84, 0x18],
    #[0x84, 0x20],
    #[0x84, 0x28],
    #[0x84, 0x30],
    #[0x84, 0x38],
    #[0x84, 0x40],
    #[0x84, 0x48],
    #[0x84, 0x50],
    #[0x84, 0x58]
  )
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
  @chain(
    2,
    #[0x85, 0x8],
    #[0x85, 0x10],
    #[0x85, 0x18],
    #[0x85, 0x20],
    #[0x85, 0x28],
    #[0x85, 0x30],
    #[0x85, 0x38],
    #[0x85, 0x40],
    #[0x85, 0x48],
    #[0x85, 0x50],
    #[0x85, 0x58]
  )
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
