import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./wtc_inc.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Wolf;

enum _DHWOperation {
  Priority: 0x00,
  Sliding: 0x01,
  Parallel: 0x02,
}

// Parameter "DHW operation" of the vendor. Only 0 (Priority) has been read on the bus: the
// values of Sliding and Parallel are not established.
/** hot water loading with priority over the heating circuit, in parallel with it, or sliding */
@values(_DHWOperation)
scalar DHWOperation extends UIN;

// The register-read template (crcr / CrcRead) and otemp10 are shared from wtc_inc.tsp.

@zz(0x15) // system manager (KA)
namespace ka {
  // Status each boiler sends to the cascade master (ZZ 0x10, the master address of this
  // device). ebusd loads a file for a scanned slave address only, hence these messages are here.

  /** passive, sent by the first boiler */
  @passive
  @qq(0x03)
  @zz(0x10)
  model up1 {}

  /** passive, sent by the second boiler */
  @passive
  @qq(0x13)
  @zz(0x10)
  model up2 {}

  /** status of the first boiler */
  @inherit(up1)
  model Boiler1Status is Status;

  /** burner load of the first boiler */
  @inherit(up1)
  model Boiler1Power is Power;

  /** status of the second boiler */
  @inherit(up2)
  model Boiler2Status is Status;

  /** burner load of the second boiler */
  @inherit(up2)
  model Boiler2Power is Power;

  /** error status, 0 when no error is pending */
  @ext(0x5c, 0x01, 0x00)
  model ErrorStatus is CrcRead<UIN>;

  /** heat demand of the heating circuit */
  @ext(0xb8, 0x02, 0x00)
  model HeatDemandTemp is CrcRead<temp10>;

  /** domestic hot water setpoint */
  @ext(0xe4, 0x03, 0x00)
  model DHWSetValue is CrcRead<otemp10>;

  /** outside sensor B1 */
  @ext(0x74, 0x0c, 0x00)
  model OutsideTemp is CrcRead<otemp10>;

  /** de-couple sensor B22 (hydraulic separator or plate exchanger, secondary side) */
  @ext(0x28, 0x0d, 0x00)
  model DeCoupleTemp is CrcRead<otemp10>;

  /** domestic hot water sensor B3 */
  @ext(0xcc, 0x0e, 0x00)
  model DHWTemp is CrcRead<otemp10>;

  /** configuration status */
  @ext(0xb0, 0x10, 0x00)
  model ConfigStatus is CrcRead<UIN>;

  /** outside temperature, weighted over time */
  @ext(0x7e, 0x0c, 0x0a)
  model OutsideWeightedTemp is CrcRead<otemp10>;

  /** firmware version, major part */
  @ext(0x45, 0x99, 0x01)
  model VersionMajor is CrcRead<UIN>;

  /** firmware version, minor part */
  @ext(0xa1, 0x9a, 0x01)
  model VersionMinor is CrcRead<UIN>;

  // Heating-circuit and hot-water settings, read side only (writes are a separate lot).

  /** normal room temperature setpoint */
  @ext(0x70, 0x05, 0x00)
  model RoomNormalTemp is CrcRead<temp10>;

  /** setback room temperature setpoint */
  @ext(0x58, 0x08, 0x00)
  model RoomSetbackTemp is CrcRead<temp10>;

  /** configured hot water setpoint */
  @ext(0x54, 0x13, 0x00)
  model DHWSetpoint is CrcRead<temp10>;

  /** priority of the hot water loading over the heating circuit */
  @ext(0xd8, 0x23, 0x00)
  model DHWLoadingPriority is CrcRead<DHWOperation>;

  /** blocking time before a further boiler of the cascade is switched on */
  @ext(0x4c, 0x25, 0x00)
  model BlockingTime is CrcRead<minutes>;

  /** maximum flow temperature limit */
  @ext(0x64, 0x28, 0x00)
  model SupplyMaxTemp is CrcRead<temp10>;

  /** current burner modulation */
  @ext(0x48, 0x2c, 0x00)
  model ModulationStatus is CrcRead<percent>;

  /** hot water exceed temperature */
  @ext(0x14, 0x2d, 0x00)
  model DHWExceeded is CrcRead<temp10>;
}
