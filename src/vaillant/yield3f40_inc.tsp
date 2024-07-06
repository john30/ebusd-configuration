import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Yield3f40_inc {
  // yield

  /** yield this year */
  @inherit(r)
  @poll(9)
  @ext(0x3f, 0)
  @chain(
    2,
    #[0x3f, 0x8],
    #[0x3f, 0x10],
    #[0x3f, 0x18],
    #[0x3f, 0x20],
    #[0x3f, 0x28],
    #[0x3f, 0x30],
    #[0x3f, 0x38],
    #[0x3f, 0x40],
    #[0x3f, 0x48],
    #[0x3f, 0x50],
    #[0x3f, 0x58]
  )
  model YieldThisYear {
    energy: energy;
    energy_1: energy;
    energy_2: energy;
    energy_3: energy;
    energy_4: energy;
    energy_5: energy;
    energy_6: energy;
    energy_7: energy;
    energy_8: energy;
    energy_9: energy;
    energy_10: energy;
    energy_11: energy;
  }

  /** yield last year */
  @inherit(r)
  @ext(0x40, 0)
  @chain(
    2,
    #[0x40, 0x8],
    #[0x40, 0x10],
    #[0x40, 0x18],
    #[0x40, 0x20],
    #[0x40, 0x28],
    #[0x40, 0x30],
    #[0x40, 0x38],
    #[0x40, 0x40],
    #[0x40, 0x48],
    #[0x40, 0x50],
    #[0x40, 0x58]
  )
  model YieldLastYear {
    energy: energy;
    energy_1: energy;
    energy_2: energy;
    energy_3: energy;
    energy_4: energy;
    energy_5: energy;
    energy_6: energy;
    energy_7: energy;
    energy_8: energy;
    energy_9: energy;
    energy_10: energy;
    energy_11: energy;
  }
}
