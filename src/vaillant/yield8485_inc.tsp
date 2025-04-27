import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Yield8485_inc {
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
