import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x06)
namespace Pms {
  // ,PMS00,VPM 20 S,0020071488 243
  // ##### general #####

  /** Ntc1RawData */
  @ext(0, 0)
  model Ntc1RawData is ReadonlyRegister<UIN>;

  /** Ntc2RawData */
  @ext(1, 0)
  model Ntc2RawData is ReadonlyRegister<UIN>;

  /** Ntc3RawData */
  @ext(0x2, 0)
  model Ntc3RawData is ReadonlyRegister<UIN>;

  /** Ntc4RawData */
  @ext(0x3, 0)
  model Ntc4RawData is ReadonlyRegister<UIN>;

  /** Ntc1Sensor: Temperature in solar flow (from solar collector) */
  @ext(0x5, 0)
  model Ntc1Sensor is ReadonlyRegister<tempsensor>;

  /** Ntc2Sensor: Temperature in solar back flow (to solar collector) */
  @ext(0x6, 0)
  model Ntc2Sensor is ReadonlyRegister<tempsensor>;

  /** Ntc3Sensor: Temperature in buffer flow (to buffer) */
  @ext(0x7, 0)
  model Ntc3Sensor is ReadonlyRegister<tempsensor>;

  /** Ntc4Sensor: Temperature in buffer back flow (from buffer) */
  @ext(0x8, 0)
  model Ntc4Sensor is ReadonlyRegister<tempsensor>;

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

  /** CurrentSolarSetpoint */
  @inherit(r)
  @ext(0x18, 0)
  model CurrentSolTempDesired {
    /** Temperature target in solar flow at sensor Ntc1Sensor */
    @unit("°C")
    value: UIN;
  }

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

  /** P_BufferControl */
  @ext(0x25, 0)
  model BufferControlPress is ReadonlyRegister<SIN>;

  /** I_BufferControl */
  @ext(0x26, 0)
  model BufferControlInt is ReadonlyRegister<SIN>;

  /** D_BufferControl */
  @ext(0x27, 0)
  model BufferControlDiff is ReadonlyRegister<SIN>;

  /** P_SolarControl */
  @ext(0x28, 0)
  model SolControlPress is ReadonlyRegister<SIN>;

  /** I_SolarControl */
  @ext(0x29, 0)
  model SolControlInt is ReadonlyRegister<SIN>;

  /** D_SolarControl */
  @ext(0x2a, 0)
  model SolControlDiff is ReadonlyRegister<SIN>;

  /** MonitorBufferPIDValue */
  @ext(0x2b, 0)
  model MonitorBufferPIDValue is ReadonlyRegister<SIN>;

  /** MonitorSolarPIDValue */
  @ext(0x2c, 0)
  model MonitorSolPIDValue is ReadonlyRegister<SIN>;

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

  /** PowerOnCounter */
  @ext(0x3f, 0)
  model PowerOnCounter is ReadonlyRegister<UIN>;

  /** RTCLowVoltageCounter */
  @ext(0x40, 0)
  model RTCLowVoltageCounter is ReadonlyRegister<UIN>;

  /** ForceStartSolarPumpKick: Start solar pump for max. 5min to check collector temperature 0: OFF, 1: ON */
  @ext(0x47, 0)
  model ForceStartSolPumpKick is ReadonlyRegister<onoff>;

  /** MonitorMatlabState: main states: 201: Waiting; 209: Loading; 41: Night Modus */
  @ext(0x48, 0)
  model MonitorMatlabState is ReadonlyRegister<UCH>;

  /** CurrentBufferSetpoint: Temperature target in buffer circuit at sensor Ntc3Sensor */
  @ext(0x49, 0)
  model CurrentBufferTempDesired is ReadonlyRegister<SIN>;

  /** RunTimeBufferPump_Minutes: Runtime of buffer pump in minutes */
  @ext(0x4b, 0)
  model RunTimeBufferPumpMinutes is ReadonlyRegister<minutes0>;

  /** RunTimeBufferPump_Hours: Runtime of buffer pump in hours */
  @ext(0x4c, 0)
  model RunTimeBufferPumpHours is ReadonlyRegister<hoursum2>;

  /** MonitorOverheatState: 111: Waiting; 112 and 113: Temperature to high; 220 and 221: In Overheat protection */
  @ext(0x4f, 0)
  model MonitorOverheatState is ReadonlyRegister<UCH>;

  /** Monitor_Matlab_DHW_Calculation */
  @ext(0x53, 0)
  model MonitorMatlabHwcCalculation is ReadonlyRegister<SIN>;

  /** Monitor_Matlab_CH_Calculation */
  @ext(0x54, 0)
  model MonitorMatlabHcCalculation is ReadonlyRegister<SIN>;

  /** SolarYieldTotal: Accumulated solar gain since installation */
  @ext(0x56, 0)
  model YieldTotal is InstallRegister<energy4>;

  /** included parts */
  union _includes {
    Errors_inc,
  }
}
