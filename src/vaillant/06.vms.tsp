import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x06)
namespace Vms {
  // ,VMS00,VMS20 S,0020071488 243
  // ##### general #####

  /** Ntc1Sensor: Temperature in solar flow (from solar collector) */
  @ext(0x5, 0)
  model Ntc1Sensor is ReadonlyRegister<tempsensor>;

  /** Ntc2Sensor: Temperature in solar back flow (to solar collector) */
  @ext(0x6, 0)
  model Ntc2Sensor is ReadonlyRegister<tempsensor>;

  /** Relais Solarpumpe: Solar pump relay: 0: OFF; 1: ON */
  @ext(0xf, 0)
  model SolPumpRelay is InstallRegister<onoff>;

  /** SolarPumpPower: Performance of solar pump: (7 - 100 %) */
  @ext(0x10, 0)
  model SolPumpPower is InstallRegister<percent0>;

  /** BufferPumpPower: Performance of buffer pump: (15 - 100%) */
  @ext(0x11, 0)
  model BufferPumpPower is InstallRegister<percent0>;

  /** MonitorMatlab_Last5minSolarAverage */
  @ext(0x17, 0)
  model MonitorMatlabLast5minSolAverage is ReadonlyRegister<SIN>;

  /** CurrentVPM_LoadingMode: 1. DHW-Support (stand alone), 2. CH-Support (stand alone), 3. +10K (stand alone), 4. SwimmingPool, 5.DHW-Support (with external control), 6. CH-Support (with external control), 7. +10K (with external control) */
  @ext(0x19, 0)
  model CurrentVPMLoadingMode is ReadonlyRegister<UCH>;

  /** RunTimePump1_Minutes: Runtime of solar pump in minutes */
  @ext(0x1a, 0)
  model RunTimePump1Minutes is ReadonlyRegister<minutes0>;

  /** RunTimePump1_Hours: Runtime of solar pump in hours */
  @ext(0x1b, 0)
  model RunTimePump1Hours is ReadonlyRegister<hoursum2>;

  /** ExternalDHWRequest: 0: No request; 1: Request */
  @ext(0x1c, 0)
  model ExternalHwcRequest is ReadonlyRegister<onoff>;

  /** ExternalCHRequest: 0: No request; 1: Request */
  @ext(0x1d, 0)
  model ExternalHcRequest is ReadonlyRegister<onoff>;

  /** ExternalDHWSetpoint: Requested temperature for DHW */
  @ext(0x1e, 0)
  model ExternalHwcTempDesired is ReadonlyRegister<desiredtemp>;

  /** ExternalCHSetpoint: Requested temperature for CH */
  @ext(0x1f, 0)
  model ExternalHcTempDesired is ReadonlyRegister<desiredtemp>;

  /** CurrentASCStateforExternals: 1:OFF 2: Proofing 3:DHWLoading 4:CHLoading 5:Overtemperature */
  @ext(0x20, 0)
  model CurrentASCStateforExternals is ReadonlyRegister<UCH>;

  /** CurrentASCStateforASI: 1: Standby 2:Proofing 3:StorageLoading 4:Error_System_blocked */
  @ext(0x21, 0)
  model CurrentASCStateforASI is ReadonlyRegister<UCH>;

  /** DateAndTimeIsSet: 0: Date and Time is not set; 1: Date and Time is set */
  @ext(0x22, 0)
  model DateAndTimeIsSet is ReadonlyRegister<onoff>;

  /** time */
  @ext(0x23, 0)
  model Time is InstallRegister<time>;

  /** date */
  @ext(0x24, 0)
  model Date is InstallRegister<date>;

  /** FlowSensorFrequency */
  @ext(0x2d, 0)
  model FlowSensorFrequency is ReadonlyRegister<UIN>;

  /** CurrentFlow */
  @inherit(r)
  @ext(0x2e, 0)
  model CurrentFlow {
    /** Flow thru buffer circuit if loading the storage */
    @unit("ml / min")
    value: UIN;
  }

  /** Variante: 1: VMS 30 2: VPM 20 S 3: VPM 60 S (identified by resistor in harness) */
  @ext(0x30, 0)
  model Variante is ReadonlyRegister<UCH>;

  /** CurrentSystemMode: 1: Standalone, 3: With external control */
  @ext(0x33, 0)
  model CurrentSystemMode is ReadonlyRegister<UCH>;

  /** InternalDHWSetpoint: Temperature target for DHW loading if solar module is in stand alone appliccation without external control */
  @ext(0x35, 0)
  model InternalHwcTempDesired is ReadonlyRegister<UCH>;

  /** InternalCHSetpoint: Temperature target for CW loading if solar module is in stand alone appliccation without external control */
  @ext(0x36, 0)
  model InternalHcTempDesired is ReadonlyRegister<UCH>;

  /** ASIDetected */
  @ext(0x38, 0)
  model ASIDetected is ReadonlyRegister<onoff>;

  /** CountryZone: Location for calculation of sun calender. See list in control manual (default = 2: Germany) */
  @ext(0x39, 0)
  model CountryZone is InstallRegister<UCH>;

  /** RequestForExternalDateTimeSetting: 0: Time and Date is set; 1: Time and Date is not set */
  @ext(0x3a, 0)
  model RequestForExternalDateTimeSetting is ReadonlyRegister<onoff>;

  /** SolarYieldCurrentDay: Accumulated solar gain from 00:00 to 24:00 if time is set */
  @ext(0x3b, 0)
  model YieldCurrentDay is InstallRegister<energy>;

  /** ForceStartSolarPumpKick: Start solar pump for max. 5min to check collector temperature 0: OFF, 1: ON */
  @ext(0x47, 0)
  model ForceStartSolPumpKick is ReadonlyRegister<onoff>;

  /** MonitorMatlabState: main states: 201: Waiting; 209: Loading; 41: Night Modus */
  @ext(0x48, 0)
  model MonitorMatlabState is ReadonlyRegister<UCH>;

  /** RunTimeBufferPump_Minutes: Runtime of buffer pump in minutes */
  @ext(0x4b, 0)
  model RunTimeBufferPumpMinutes is ReadonlyRegister<minutes0>;

  /** RunTimeBufferPump_Hours: Runtime of buffer pump in hours */
  @ext(0x4c, 0)
  model RunTimeBufferPumpHours is ReadonlyRegister<hoursum2>;

  /** MonitorOverheatState: 111: Waiting; 112 and 113: Temperature to high; 220 and 221: In Overheat protection */
  @ext(0x4f, 0)
  model MonitorOverheatState is ReadonlyRegister<UCH>;

  /** SolarYieldTotal: Accumulated solar gain since installation */
  @ext(0x56, 0)
  model YieldTotal is InstallRegister<energy4>;

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
