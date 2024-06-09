import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x06)
namespace vms {
  // ,VMS00,VMS20 S,0020071488 243

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x9, 0xe)
  model wi {}
  // ##### general #####

  /** Ntc1Sensor */
  @inherit(r)
  @ext(0x5, 0)
  model Ntc1Sensor {
    /** Temperature in solar flow (from solar collector) */
    value: tempsensor;
  }

  /** Ntc2Sensor */
  @inherit(r)
  @ext(0x6, 0)
  model Ntc2Sensor {
    /** Temperature in solar back flow (to solar collector) */
    value: tempsensor;
  }

  /** Relais Solarpumpe */
  @inherit(r, wi)
  @ext(0xf, 0)
  model SolPumpRelay {
    /** Solar pump relay: 0: OFF; 1: ON */
    value: onoff;
  }

  /** SolarPumpPower */
  @inherit(r, wi)
  @ext(0x10, 0)
  model SolPumpPower {
    /** Performance of solar pump: (7 - 100 %) */
    value: power;
  }

  /** BufferPumpPower */
  @inherit(r, wi)
  @ext(0x11, 0)
  model BufferPumpPower {
    /** Performance of buffer pump: (15 - 100%) */
    value: power;
  }

  /** MonitorMatlab_Last5minSolarAverage */
  @inherit(r)
  @ext(0x17, 0)
  model MonitorMatlabLast5minSolAverage {
    value: SIN;
  }

  /** CurrentVPM_LoadingMode */
  @inherit(r)
  @ext(0x19, 0)
  model CurrentVPMLoadingMode {
    /** 1. DHW-Support (stand alone), 2. CH-Support (stand alone), 3. +10K (stand alone), 4. SwimmingPool, 5.DHW-Support (with external control), 6. CH-Support (with external control), 7. +10K (with external control) */
    value: UCH;
  }

  /** RunTimePump1_Minutes */
  @inherit(r)
  @ext(0x1a, 0)
  model RunTimePump1Minutes {
    /** Runtime of solar pump in minutes */
    value: minutes0;
  }

  /** RunTimePump1_Hours */
  @inherit(r)
  @ext(0x1b, 0)
  model RunTimePump1Hours {
    /** Runtime of solar pump in hours */
    value: hoursum2;
  }

  /** ExternalDHWRequest */
  @inherit(r)
  @ext(0x1c, 0)
  model ExternalHwcRequest {
    /** 0: No request; 1: Request */
    value: onoff;
  }

  /** ExternalCHRequest */
  @inherit(r)
  @ext(0x1d, 0)
  model ExternalHcRequest {
    /** 0: No request; 1: Request */
    value: onoff;
  }

  /** ExternalDHWSetpoint */
  @inherit(r)
  @ext(0x1e, 0)
  model ExternalHwcTempDesired {
    /** Requested temperature for DHW */
    value: desiredtemp;
  }

  /** ExternalCHSetpoint */
  @inherit(r)
  @ext(0x1f, 0)
  model ExternalHcTempDesired {
    /** Requested temperature for CH */
    value: desiredtemp;
  }

  /** CurrentASCStateforExternals */
  @inherit(r)
  @ext(0x20, 0)
  model CurrentASCStateforExternals {
    /** 1:OFF 2: Proofing 3:DHWLoading 4:CHLoading 5:Overtemperature */
    value: UCH;
  }

  /** CurrentASCStateforASI */
  @inherit(r)
  @ext(0x21, 0)
  model CurrentASCStateforASI {
    /** 1: Standby 2:Proofing 3:StorageLoading 4:Error_System_blocked */
    value: UCH;
  }

  /** DateAndTimeIsSet */
  @inherit(r)
  @ext(0x22, 0)
  model DateAndTimeIsSet {
    /** 0: Date and Time is not set; 1: Date and Time is set */
    value: onoff;
  }

  /** time */
  @inherit(r, wi)
  @ext(0x23, 0)
  model Time {
    value: time;
  }

  /** date */
  @inherit(r, wi)
  @ext(0x24, 0)
  model Date {
    value: date;
  }

  /** FlowSensorFrequency */
  @inherit(r)
  @ext(0x2d, 0)
  model FlowSensorFrequency {
    value: UIN;
  }

  /** CurrentFlow */
  @inherit(r)
  @ext(0x2e, 0)
  model CurrentFlow {
    /** Flow thru buffer circuit if loading the storage */
    @unit("ml / min")
    value: UIN;
  }

  /** Variante */
  @inherit(r)
  @ext(0x30, 0)
  model Variante {
    /** 1: VMS 30 2: VPM 20 S 3: VPM 60 S (identified by resistor in harness) */
    value: UCH;
  }

  /** CurrentSystemMode */
  @inherit(r)
  @ext(0x33, 0)
  model CurrentSystemMode {
    /** 1: Standalone, 3: With external control */
    value: UCH;
  }

  /** InternalDHWSetpoint */
  @inherit(r)
  @ext(0x35, 0)
  model InternalHwcTempDesired {
    /** Temperature target for DHW loading if solar module is in stand alone appliccation without external control */
    value: UCH;
  }

  /** InternalCHSetpoint */
  @inherit(r)
  @ext(0x36, 0)
  model InternalHcTempDesired {
    /** Temperature target for CW loading if solar module is in stand alone appliccation without external control */
    value: UCH;
  }

  /** ASIDetected */
  @inherit(r)
  @ext(0x38, 0)
  model ASIDetected {
    value: onoff;
  }

  /** CountryZone */
  @inherit(r, wi)
  @ext(0x39, 0)
  model CountryZone {
    /** Location for calculation of sun calender. See list in control manual (default = 2: Germany) */
    value: UCH;
  }

  /** RequestForExternalDateTimeSetting */
  @inherit(r)
  @ext(0x3a, 0)
  model RequestForExternalDateTimeSetting {
    /** 0: Time and Date is set; 1: Time and Date is not set */
    value: onoff;
  }

  /** SolarYieldCurrentDay */
  @inherit(r, wi)
  @ext(0x3b, 0)
  model YieldCurrentDay {
    /** Accumulated solar gain from 00:00 to 24:00 if time is set */
    value: energy;
  }

  /** ForceStartSolarPumpKick */
  @inherit(r)
  @ext(0x47, 0)
  model ForceStartSolPumpKick {
    /** Start solar pump for max. 5min to check collector temperature 0: OFF, 1: ON */
    value: onoff;
  }

  /** MonitorMatlabState */
  @inherit(r)
  @ext(0x48, 0)
  model MonitorMatlabState {
    /** main states: 201: Waiting; 209: Loading; 41: Night Modus */
    value: UCH;
  }

  /** RunTimeBufferPump_Minutes */
  @inherit(r)
  @ext(0x4b, 0)
  model RunTimeBufferPumpMinutes {
    /** Runtime of buffer pump in minutes */
    value: minutes0;
  }

  /** RunTimeBufferPump_Hours */
  @inherit(r)
  @ext(0x4c, 0)
  model RunTimeBufferPumpHours {
    /** Runtime of buffer pump in hours */
    value: hoursum2;
  }

  /** MonitorOverheatState */
  @inherit(r)
  @ext(0x4f, 0)
  model MonitorOverheatState {
    /** 111: Waiting; 112 and 113: Temperature to high; 220 and 221: In Overheat protection */
    value: UCH;
  }

  /** SolarYieldTotal */
  @inherit(r, wi)
  @ext(0x56, 0)
  model YieldTotal {
    /** Accumulated solar gain since installation */
    value: energy4;
  }

  /** included parts */
  union _includes {
    errors_inc,
  }
}
