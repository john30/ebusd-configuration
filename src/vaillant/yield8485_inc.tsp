import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

namespace yield8485_inc {
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
