import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai._0010023691_inc {
  // ,BAI00,eloBLOCK VE 9/14
  // Confirmed working on: 0010023691, 0010023684, 0010023657
  
  /** d.77 hot water partload: Storage charging power (1–9 kW) */
  @ext(0xa9, 0)
  model PartloadHwcKW is InstallRegister<power>;
}
