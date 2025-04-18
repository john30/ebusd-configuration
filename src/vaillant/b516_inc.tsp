import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Str;
namespace Vaillant;

/** b516 energy statistics */
namespace B516_inc {

  model energye {
    @maxLength(7)
    ign: IGN;
    @unit("Wh")
    energye: EXP;
  }

  @base(MF, 0x16, 0x10)
  model r_1 {}

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x01, 0x00, 0x00, 0x30)
  model SolarSumSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x01, 0x03, 0x00, 0x30)
  model SolarHeatingSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x01, 0x04, 0x00, 0x30)
  model SolarHotWaterSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x02, 0x00, 0x00, 0x30)
  model EnvironmentalSumSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x02, 0x03, 0x00, 0x30)
  model EnvironmentalHeatingSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x02, 0x04, 0x00, 0x30)
  model EnvironmentalHotWaterSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x02, 0x05, 0x00, 0x30)
  model EnvironmentalCoolingSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x03, 0x00, 0x00, 0x30)
  model ElectricalSumSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x03, 0x03, 0x00, 0x30)
  model ElectricalHeatingSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x03, 0x04, 0x00, 0x30)
  model ElectricalHotWaterSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x03, 0x05, 0x00, 0x30)
  model ElectricalCoolingSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x04, 0x00, 0x00, 0x30)
  model FuelSumSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x04, 0x03, 0x00, 0x30)
  model FuelHeatingSystem {
    value: energye;
  }

  @inherit(r_1)
  @ext(0x00, 0xff, 0xff, 0x04, 0x04, 0x00, 0x30)
  model FuelHotWaterSystem {
    value: energye;
  }
}
