import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace E7000 {
  // ,E7000,VRC E7000 system manager (paired with HMU01 heat-pump indoor unit)
  //
  // Originally shipped as `archived/en/vaillant/15.e7000.csv` in the legacy
  // ebusd-2.1.x CSV tree. Not ported during the TypeSpec migration, even
  // though sibling controllers (15.e7c, 15.e7f) were. Reintroduced here to
  // restore the DHW cylinder probe readings that were lost in that gap.
  //
  // Verified against MF=Vaillant;ID=E7000;SW=0608;HW=7003 paired with an
  // HMU01 SW=0306 HW=8802 (Saunier Duval rebadge). Only the subset known
  // to respond on this firmware is exposed below.

  // ##### hot water circuit #####

  /** default *r for HWC parameter block (b5 24 02 00 01 00 + 2 ext bytes) */
  @base(MF, 0x24, 0x2, 0, 1, 0)
  model r_hwc {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w for HWC parameter block (b5 24 02 01 01 00 + 2 ext bytes) */
  @write
  @base(MF, 0x24, 0x2, 1, 1, 0)
  model w_hwc {}

  /** DHW temperature setpoint. Writable — useful for cheap-hours / solar pre-heat schemes. */
  @inherit(r_hwc, w_hwc)
  @ext(0x4, 0)
  model HwcTempDesired {
    value: tempv;
  }

  /** DHW cylinder/storage actual temperature (Speicheristtemperatur) */
  @inherit(r_hwc)
  @ext(0x5, 0)
  model HwcStorageTemp {
    value: tempv;
  }

  /** DHW flow temperature */
  @inherit(r_hwc)
  @ext(0x8, 0)
  model HwcFlowTemp {
    value: tempv;
  }

  // ##### sensor probes #####

  /** default *r for sensor probe block (b5 24 02 00 00 00 + 2 ext bytes) */
  @base(MF, 0x24, 0x2, 0, 0, 0)
  model r_sensors {
    @maxLength(4)
    ign: IGN;
  }

  /** DHW storage temperature, top probe (stratified-tank installs only) */
  @inherit(r_sensors)
  @ext(0x9d, 0)
  model HwcStorageTempTop {
    value: tempv;
  }

  /** DHW storage temperature, bottom probe (stratified-tank installs only) */
  @inherit(r_sensors)
  @ext(0x9e, 0)
  model HwcStorageTempBottom {
    value: tempv;
  }
}
