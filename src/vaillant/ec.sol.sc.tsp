import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./yield3f40_inc.tsp";
import "./errors_inc.tsp";
import "./iotestbsol_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0xec)
namespace sol.sc {
  // ,sol00,VR 68,sol 210 Solar

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
  // ##### SOLAR: Solar #####

  /** KOL */
  @inherit(r)
  @ext(0x4, 0)
  model Col {
    /** value and sensorstate of the collector sensor */
    value: tempsensor;
  }

  /** SP1 */
  @inherit(r)
  @ext(0, 0)
  model SP1 {
    /** value and sensorstate of upper tank temperature sensor SP1 */
    value: tempsensor;
  }

  /** SP2 */
  @inherit(r)
  @ext(1, 0)
  model SP2 {
    /** value and sensorstate of lower tank temperature sensor SP2 */
    value: tempsensor;
  }

  /** TD1 */
  @inherit(r)
  @ext(0x2, 0)
  model D1Temp {
    /** value and sensorstate of middle tank temperature sensor TD1 */
    value: tempsensor;
  }

  /** TD2 */
  @inherit(r)
  @ext(0x8, 0)
  model D2Temp {
    /** value and sensorstate of the system's return flow sensor TD2 */
    value: tempsensor;
  }

  /** Sensor Solarertrag */
  @inherit(r)
  @ext(0x3, 0)
  model SolGain {
    /** value and sensorstate of the solar gain sensor */
    value: tempsensor;
  }

  /** SolarOperationMode */
  @inherit(r)
  @ext(0x36, 0)
  model SolOperationMode {
    /** solar operation mode (permanently on, off) */
    value: onoff;
  }

  /** CollectorPump */
  @inherit(r)
  @ext(0x6, 0)
  model CollPump {
    /** collector pump's state */
    value: onoff;
  }

  /** RuntimeCollectorPump */
  @inherit(r)
  @ext(0x2a, 0)
  model RuntimeCollPump {
    /** accumulated runtime of the collector pump */
    value: hoursum2;
  }

  /** RuntimeCollectorPumpSeconds */
  @inherit(r)
  @ext(0x29, 0)
  model RuntimeCollPumpSeconds {
    /** runtime in seconds base for runtime in hours */
    value: UIN;
  }

  /** KickFunction */
  @inherit(r, wi)
  @ext(0x32, 0)
  model KickFunction {
    /** enable kick function */
    value: onoff;
  }

  /** ColKickPumpTime */
  @inherit(r)
  @ext(0x3b, 0)
  model ColKickPumpTime {
    /** time pump is running when collector kick function is activated */
    @unit("sec")
    value: UCH;
  }

  /** ColKickTempDelta */
  @inherit(r)
  @ext(0x3c, 0)
  model ColKickTempDelta {
    /** temperature difference necessary for activating the pump kick */
    value: temp0;
  }

  /** FlowRate */
  @inherit(r, wi)
  @ext(0x2d, 0)
  model FlowRate {
    /** chosen flow rate of the collector pump (to calculate solar gain) */
    @unit("l/min")
    @divisor(10)
    value: SIN;
  }

  /** SolarCollPumpDcIntegrator */
  @inherit(r)
  @ext(0x19, 0)
  model SolCollPumpDcIntegrator {
    /** integral part of the solar collector pump's control if duty ratio control is active */
    value: SIN;
  }

  /** MaximalTemperature */
  @inherit(r, wi)
  @ext(0x26, 0)
  model MaximalTemp {
    /** solar storage 1 maximum temperature for solar charge */
    value: temp0;
  }

  /** TempDifferenceEIN */
  @inherit(r, wi)
  @ext(0x24, 0)
  model TempDifferenceOn {
    /** solar difference control's switch on temperature of storage 1 */
    value: temp0;
  }

  /** TempDifferenceAUS */
  @inherit(r, wi)
  @ext(0x25, 0)
  model TempDifferenceOff {
    /** solar difference control's switch off temperature of storage 1 */
    value: temp0;
  }

  /** MaximalTemperature2 */
  @inherit(r, wi)
  @ext(0x26, 0x30)
  model MaximalTemp2 {
    /** maximum temperature for solar charge of storage 2 */
    value: temp0;
  }

  /** TempDifferenceEIN2 */
  @inherit(r, wi)
  @ext(0x24, 0x30)
  model TempDifferenceOn2 {
    /** solar difference control's switch on temperature of storage 2 */
    value: temp0;
  }

  /** TempDifferenceAUS2 */
  @inherit(r, wi)
  @ext(0x25, 0x30)
  model TempDifferenceOff2 {
    /** solar difference control's switch off temperature of storage 2 */
    value: temp0;
  }

  /** EDFunktion */
  @inherit(r, wi)
  @ext(0x34, 0)
  model EDFunction {
    /** enable duty ratio control */
    value: onoff;
  }

  /** SolarCollectorPumpED */
  @inherit(r)
  @ext(0x28, 0)
  model SolCollPumpED {
    /** percentage of 'pump is on' during one minute (if duty ratio control is enabled) */
    value: percent0;
  }

  /** SolarCircuitProtectionLimit */
  @inherit(r, wi)
  @ext(0x30, 0)
  model ScProtectionLimit {
    /** switch off temperature for collector protection (109 <=> off) */
    value: desiredtemp;
  }

  /** SolarCircuitProtectionHysteresis */
  @inherit(r)
  @ext(0x31, 0)
  model ScProtectionHysteresis {
    /** temperature hysteresis for activating solar pump after collector protection */
    value: calibration0;
  }

  /** SolarCircuitProtectionTime */
  @inherit(r)
  @ext(0x3e, 0)
  model ScProtectionTime {
    /** time for which KOL temperature has to exceed the protection temperature to enter solar circuit protection mode */
    @unit("sec")
    value: UCH;
  }

  /** enable solar circuit protection */
  @inherit(r, wi)
  @ext(0x59, 0)
  model EnableScProtection {
    /** enable solar circuit protection */
    value: onoff;
  }

  /** FrostProtectionEnabled */
  @inherit(r)
  @ext(0x5a, 0)
  model FrostProtectionEnabled {
    /** set TRUE to enable solar frost protection */
    value: yesno;
  }

  /** FrostProtectionLimit */
  @inherit(r)
  @ext(0x5b, 0)
  model FrostProtectionLimit {
    /** temperature level for activating solar frost protection */
    value: temps2;
  }

  /** Reset solar gain */
  @inherit(r, w)
  @ext(0x35, 0)
  model ResetSolGain {
    /** Reset solar gain */
    value: yesno;
  }

  /** SumSolarGain_day_before */
  @inherit(r)
  @ext(0x4c, 0)
  model SumSolGainDayBefore {
    /** sum of yesterday's solar gain */
    value: energy4;
  }

  /** SumSolarGain */
  @inherit(r)
  @ext(0x33, 0)
  model SumSolGain {
    /** accumulated solar gain */
    value: energy4;
  }
  // ##### SOLAR: general #####

  /** weekday */
  @inherit(r)
  @ext(0xe, 0)
  model Weekday {
    /** current day of week */
    value: bday;
  }

  /** date */
  @inherit(r)
  @ext(0xd, 0)
  model Date {
    /** current date */
    value: date;
  }

  /** time */
  @inherit(r)
  @ext(0xc, 0)
  model Time {
    /** current time */
    value: time;
  }

  /** Hzdraulic plan */
  @inherit(r)
  @ext(0x21, 0)
  model HydraulicScheme {
    /** 1..8 nur Solar */
    value: UCH;
  }

  /** SystemMode */
  @inherit(r)
  @ext(0x3d, 0)
  model SystemMode {
    /** 0 = heatpump; 1 = 430 system, must be cyclicly written by the CI */
    value: onoff;
  }

  /** MultifunctionOutput */
  @inherit(r)
  @ext(0xa, 0)
  model MultifunctionOutput {
    /** Output of multifunction relay */
    value: onoff;
  }

  /** O_Multifunction */
  @inherit(r, wi)
  @ext(0x3a, 0)
  model OMultifunction {
    /** multifunction relay: 0 = 2nd storage, 1 = differential control */
    value: onoff;
  }

  /** MAPreferredStorage */
  @inherit(r, wi)
  @ext(0x37, 0)
  model MAPreferredStorage {
    /** prefered storage */
    value: UCH;
  }

  /** TempDifferenceOnTD12 */
  @inherit(r, wi)
  @ext(0x42, 0)
  model TempDifferenceOnTD12 {
    /** temperature difference for the multifunction-output relay to switch on */
    value: temp0;
  }

  /** TempDifferenceOffTD12 */
  @inherit(r, wi)
  @ext(0x43, 0)
  model TempDifferenceOffTD12 {
    /** temperature difference for the multifunction-output relay to switch off */
    value: temp0;
  }

  /** PumpAntiLockingFlags */
  @inherit(r)
  @ext(0x9, 0)
  model PumpAntiLockingFlags {
    /** each set bit represents a pump that has not run in the last 24h */
    value: UIN;
  }

  /** InitCircuit */
  @inherit(r)
  @ext(0x18, 0)
  model InitCircuit {
    /** true if DHW and CP circuits are in init phase */
    value: yesno;
  }

  /** IsInBoostMode */
  @inherit(r)
  @ext(0x39, 0)
  model IsInBoostMode {
    /** heatpump in boost mode */
    value: onoff;
  }

  /** QuickVetoStart */
  @inherit(r)
  @ext(0x45, 0)
  model QuickVetoStart {
    /** Signal for starting quick veto (will be reset after quick veto has been started) */
    value: yesno;
  }

  /** Lp_Zp_Ma_Port */
  @inherit(r)
  @ext(0x54, 0)
  model LpZpMaPort {
    /** multifunction-output port replay */
    value: onoff;
  }

  /** Hk1P_Kol1P_P1_Port */
  @inherit(r)
  @ext(0x55, 0)
  model Hc1PumpKol1PP1Port {
    /** collector 1 pump port replay */
    value: onoff;
  }

  /** Hk2a_LegP_P2_Port */
  @inherit(r)
  @ext(0x57, 0)
  model Hc2aLegPumpP2Port {
    /** legionella pump port replay */
    value: onoff;
  }

  /** Hk2z_Port */
  @inherit(r)
  @ext(0x58, 0)
  model Hc2zPort {
    /** Port replay */
    value: onoff;
  }

  /** included parts */
  union _includes {
    yield3f40_inc,
    errors_inc,
    iotestbsol_inc,
  }
}
