import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Str;
namespace Vaillant;

namespace Hmu._hw0403_inc {
  // ,HMU00,flexoTHERM exclusive VWF 197/4,HW 0403 SW 0305
  // each register matched against the display, settings by changing them

  /** default *r */
  @base(MF, 0x9, 0x54, 0x2, 0)
  model r {
    @maxLength(4)
    ign: IGN;
  }

  /** building circuit flow */
  @inherit(r)
  @ext(0xe9, 0xa)
  model RunDataBuildingCircuitFlow {
    @unit("l/h")
    value: UIN;
  }

  /** building circuit pump power (actual) */
  @inherit(r)
  @ext(0xc1, 0x8)
  model RunDataBuildingPumpPower {
    value: percent0;
  }

  /** brine pump on/off */
  @inherit(r)
  @ext(0xd4, 0x8)
  model RunDataBrinePumpOn {
    value: onoff;
  }

  /** brine pump power (actual) */
  @inherit(r)
  @ext(0xd5, 0x8)
  model RunDataBrinePumpPower {
    value: percent0;
  }

  /** brine pump total runtime */
  @inherit(r)
  @ext(0xde, 0x8)
  model RunStatsBrinePumpHours {
    @unit("h")
    value: ULG;
  }

  /** brine pump total starts */
  @inherit(r)
  @ext(0xdf, 0x8)
  model RunStatsBrinePumpStarts {
    value: ULG;
  }

  /** condensation temperature */
  @inherit(r)
  @ext(0xfa, 0xa)
  model RunDataCondensationTemp {
    @unit("°C")
    @divisor(16)
    value: SIN;
  }

  /** evaporation temperature */
  @inherit(r)
  @ext(0xf0, 0xa)
  model RunDataEvaporationTemp {
    @unit("°C")
    @divisor(16)
    value: SIN;
  }

  /** superheat target */
  @inherit(r)
  @ext(0x4, 0xb)
  model RunDataSuperheatTarget {
    @unit("K")
    @divisor(16)
    value: SIN;
  }

  /** EEV position */
  @inherit(r)
  @ext(0x34, 0x8)
  model RunDataEEVPosition {
    @unit("%")
    @divisor(10)
    value: UIN;
  }

  /** EEV-VI (vapour injection) inlet temperature */
  @inherit(r)
  @ext(0xaa, 0xa)
  model RunDataEEVVIInletTemp {
    @unit("°C")
    @divisor(16)
    value: SIN;

    @maxLength(1)
    ign: IGN;
  }

  /** EEV-VI (vapour injection) outlet temperature */
  @inherit(r)
  @ext(0xaf, 0xa)
  model RunDataEEVVIOutletTemp {
    @unit("°C")
    @divisor(16)
    value: SIN;

    @maxLength(1)
    ign: IGN;
  }

  /** compressor start at energy integral */
  @inherit(r)
  @ext(0x22, 0xc)
  model CompressorStartIntegral {
    value: integral;
  }

  /** building circuit pump max residual head */
  @inherit(r)
  @ext(0x24, 0xc)
  model BuildingPumpMaxResidualHead {
    @unit("mbar")
    value: UIN;
  }
}
