import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Yield4445_inc {
  // yield

  /** yield this year */
  @inherit(r)
  @poll(9)
  @ext(0x44, 0)
  @chain(
    2,
    #[0x44, 0x8],
    #[0x44, 0x10],
    #[0x44, 0x18],
    #[0x44, 0x20],
    #[0x44, 0x28],
    #[0x44, 0x30],
    #[0x44, 0x38],
    #[0x44, 0x40],
    #[0x44, 0x48],
    #[0x44, 0x50],
    #[0x44, 0x58]
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
  @ext(0x45, 0)
  @chain(
    2,
    #[0x45, 0x8],
    #[0x45, 0x10],
    #[0x45, 0x18],
    #[0x45, 0x20],
    #[0x45, 0x28],
    #[0x45, 0x30],
    #[0x45, 0x38],
    #[0x45, 0x40],
    #[0x45, 0x48],
    #[0x45, 0x50],
    #[0x45, 0x58]
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
