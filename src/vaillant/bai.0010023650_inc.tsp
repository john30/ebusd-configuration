import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
namespace Vaillant;

namespace Bai._0010023650_inc {
  // ,BAI00,Protherm RAY 18 KE /14 RU,0010023650
  // Tested with SW 0109 / HW 7503. Do not infer support for other products.

  /** d.00 heating power limit; applies to space heating, not storage charging. Write tested at 10 -> 4 -> 10 kW. */
  @inherit(r, wi)
  @ext(0x6c, 0)
  model PartloadHcKW {
    @unit("kW")
    @minValue(2)
    @maxValue(18)
    @step(1)
    value: UCH;
  }

  /** Storage temperature with sensor status; verified during an indirect cylinder charging cycle. */
  @ext(0x17, 0)
  model StorageTemp is ReadonlyRegister<tempsensor>;

  /** d.05 effective heating flow target; follows the external B510 target while external control is active. */
  @ext(0x39, 0)
  model FlowTempDesired is ReadonlyRegister<temp>;

  /** Storage temperature target; read back as 50 degrees C throughout the tests. */
  @ext(0x04, 0)
  model StorageTempDesired is ReadonlyRegister<temp>;

  /** Internal heating pump state, including storage charging and pump overrun. */
  @ext(0x44, 0)
  model WP is ReadonlyRegister<onoff>;

  /** d.18 pump mode; raw value 3 observed. Writing this parameter was not tested. */
  @ext(0xb7, 0)
  model HcPumpMode is ReadonlyRegister<UCH>;

  /** d.23 heating enable switch; off/on verified by readback and observation at the boiler. */
  @ext(0xf2, 0x03)
  model HeatingSwitch is InstallRegister<onoff>;

  /** Diverter valve position: 0 observed for heating, 100 for storage charging. */
  @ext(0x54, 0)
  model PositionValveSet is ReadonlyRegister<UCH>;

  /** Heating flow temperature with sensor status. */
  @ext(0x18, 0)
  model FlowTemp is ReadonlyRegister<tempsensor>;

  /** d.71 maximum heating flow target; readback verified, no valid-range write tested. */
  @ext(0xa5, 0)
  model FlowsetHcMax is ReadonlyRegister<temp>;

  /** d.90 external eBUS regulator recognized; returned to no about 15 minutes after the last B510 command. */
  @ext(0x74, 0)
  model EBusHeatcontrol is ReadonlyRegister<yesno>;

  /** d.09 last received external heating flow target; not necessarily the current effective target. */
  @ext(0xbe, 0x01)
  model EbusFlowTempDesired is ReadonlyRegister<temp>;

  /** d.155 reported heating power; scale adopted from HW 7503 definitions and observed dynamics, not independently meter-verified. */
  @inherit(r)
  @ext(0xc9, 0x03)
  model ActualHeatOutput {
    @unit("kW")
    @divisor(100)
    value: UIN;
  }

  /** Controller demand in percent; 22 observed with a 4 kW heating limit on this 18 kW boiler. */
  @ext(0xed, 0x03)
  model ControllerDemand is ReadonlyRegister<percent0>;

  /** Operating status number; observed 0 (idle), 4 (heating), 24 (storage charging), 27 (storage pump overrun). */
  @ext(0xab, 0)
  model Statenumber is ReadonlyRegister<UCH>;

  /** System water pressure with sensor status. */
  @ext(0x02, 0)
  model WaterPressure is ReadonlyRegister<presssensor>;
}
