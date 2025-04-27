import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./yield3f40_inc.tsp";
import "./errors_inc.tsp";
import "./iotestbsol_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0xec)
namespace Sol.Sc {
  // ,sol00,VR 68,sol 210 Solar
  // ##### SOLAR: Solar #####

  /** KOL: value and sensorstate of the collector sensor */
  @ext(0x4, 0)
  model Col is ReadonlyRegister<tempsensor>;

  /** value and sensorstate of upper tank temperature sensor SP1 */
  @ext(0, 0)
  model SP1 is ReadonlyRegister<tempsensor>;

  /** value and sensorstate of lower tank temperature sensor SP2 */
  @ext(1, 0)
  model SP2 is ReadonlyRegister<tempsensor>;

  /** value and sensorstate of middle tank temperature sensor TD1 */
  @ext(0x2, 0)
  model D1Temp is ReadonlyRegister<tempsensor>;

  /** value and sensorstate of the system's return flow sensor TD2 */
  @ext(0x8, 0)
  model D2Temp is ReadonlyRegister<tempsensor>;

  /** Sensor Solarertrag: value and sensorstate of the solar gain sensor */
  @ext(0x3, 0)
  model SolGain is ReadonlyRegister<tempsensor>;

  /** SolarOperationMode: solar operation mode (permanently on, off) */
  @ext(0x36, 0)
  model SolOperationMode is ReadonlyRegister<onoff>;

  /** CollectorPump: collector pump's state */
  @ext(0x6, 0)
  model CollPump is ReadonlyRegister<onoff>;

  /** RuntimeCollectorPump: accumulated runtime of the collector pump */
  @ext(0x2a, 0)
  model RuntimeCollPump is ReadonlyRegister<hoursum2>;

  /** RuntimeCollectorPumpSeconds: runtime in seconds base for runtime in hours */
  @ext(0x29, 0)
  model RuntimeCollPumpSeconds is ReadonlyRegister<UIN>;

  /** KickFunction: enable kick function */
  @ext(0x32, 0)
  model KickFunction is InstallRegister<onoff>;

  /** ColKickPumpTime: time pump is running when collector kick function is activated */
  @ext(0x3b, 0)
  model ColKickPumpTime is ReadonlyRegister<seconds0>;

  /** ColKickTempDelta: temperature difference necessary for activating the pump kick */
  @ext(0x3c, 0)
  model ColKickTempDelta is ReadonlyRegister<temp0>;

  /** FlowRate */
  @inherit(r, wi)
  @ext(0x2d, 0)
  model FlowRate {
    /** chosen flow rate of the collector pump (to calculate solar gain) */
    @unit("l/min")
    @divisor(10)
    value: SIN;
  }

  /** SolarCollPumpDcIntegrator: integral part of the solar collector pump's control if duty ratio control is active */
  @ext(0x19, 0)
  model SolCollPumpDcIntegrator is ReadonlyRegister<SIN>;

  /** MaximalTemperature: solar storage 1 maximum temperature for solar charge */
  @ext(0x26, 0)
  model MaximalTemp is InstallRegister<temp0>;

  /** TempDifferenceEIN: solar difference control's switch on temperature of storage 1 */
  @ext(0x24, 0)
  model TempDifferenceOn is InstallRegister<temp0>;

  /** TempDifferenceAUS: solar difference control's switch off temperature of storage 1 */
  @ext(0x25, 0)
  model TempDifferenceOff is InstallRegister<temp0>;

  /** MaximalTemperature2: maximum temperature for solar charge of storage 2 */
  @ext(0x26, 0x30)
  model MaximalTemp2 is InstallRegister<temp0>;

  /** TempDifferenceEIN2: solar difference control's switch on temperature of storage 2 */
  @ext(0x24, 0x30)
  model TempDifferenceOn2 is InstallRegister<temp0>;

  /** TempDifferenceAUS2: solar difference control's switch off temperature of storage 2 */
  @ext(0x25, 0x30)
  model TempDifferenceOff2 is InstallRegister<temp0>;

  /** EDFunktion: enable duty ratio control */
  @ext(0x34, 0)
  model EDFunction is InstallRegister<onoff>;

  /** SolarCollectorPumpED: percentage of 'pump is on' during one minute (if duty ratio control is enabled) */
  @ext(0x28, 0)
  model SolCollPumpED is ReadonlyRegister<percent0>;

  /** SolarCircuitProtectionLimit: switch off temperature for collector protection (109 <=> off) */
  @ext(0x30, 0)
  model ScProtectionLimit is InstallRegister<desiredtemp>;

  /** SolarCircuitProtectionHysteresis: temperature hysteresis for activating solar pump after collector protection */
  @ext(0x31, 0)
  model ScProtectionHysteresis is ReadonlyRegister<calibration0>;

  /** SolarCircuitProtectionTime: time for which KOL temperature has to exceed the protection temperature to enter solar circuit protection mode */
  @ext(0x3e, 0)
  model ScProtectionTime is ReadonlyRegister<seconds0>;

  /** EnableSolarCircuitProtection: enable solar circuit protection */
  @ext(0x59, 0)
  model EnableScProtection is InstallRegister<onoff>;

  /** FrostProtectionEnabled: set TRUE to enable solar frost protection */
  @ext(0x5a, 0)
  model FrostProtectionEnabled is ReadonlyRegister<yesno>;

  /** FrostProtectionLimit: temperature level for activating solar frost protection */
  @ext(0x5b, 0)
  model FrostProtectionLimit is ReadonlyRegister<temps2>;

  /** ResetSolarGain: reset solar gain */
  @ext(0x35, 0)
  model ResetSolGain is Register<yesno>;

  /** SumSolarGain_day_before: sum of yesterday's solar gain */
  @ext(0x4c, 0)
  model SumSolGainDayBefore is ReadonlyRegister<energy4>;

  /** SumSolarGain: accumulated solar gain */
  @ext(0x33, 0)
  model SumSolGain is ReadonlyRegister<energy4>;
  // ##### SOLAR: general #####

  /** Weekday: current day of week */
  @ext(0xe, 0)
  model Weekday is ReadonlyRegister<bday>;

  /** current date */
  @ext(0xd, 0)
  model Date is ReadonlyRegister<date>;

  /** current time */
  @ext(0xc, 0)
  model Time is ReadonlyRegister<time>;

  /** Hzdraulic plan: 1..8 nur Solar */
  @ext(0x21, 0)
  model HydraulicScheme is ReadonlyRegister<UCH>;

  /** SystemMode: 0 = heatpump; 1 = 430 system, must be cyclicly written by the CI */
  @ext(0x3d, 0)
  model SystemMode is ReadonlyRegister<onoff>;

  /** MultifunctionOutput: Output of multifunction relay */
  @ext(0xa, 0)
  model MultifunctionOutput is ReadonlyRegister<onoff>;

  /** O_Multifunction: multifunction relay: 0 = 2nd storage, 1 = differential control */
  @ext(0x3a, 0)
  model OMultifunction is InstallRegister<onoff>;

  /** MAPreferredStorage: prefered storage */
  @ext(0x37, 0)
  model MAPreferredStorage is InstallRegister<UCH>;

  /** TempDifferenceOnTD12: temperature difference for the multifunction-output relay to switch on */
  @ext(0x42, 0)
  model TempDifferenceOnTD12 is InstallRegister<temp0>;

  /** TempDifferenceOffTD12: temperature difference for the multifunction-output relay to switch off */
  @ext(0x43, 0)
  model TempDifferenceOffTD12 is InstallRegister<temp0>;

  /** PumpAntiLockingFlags: each set bit represents a pump that has not run in the last 24h */
  @ext(0x9, 0)
  model PumpAntiLockingFlags is ReadonlyRegister<UIN>;

  /** InitCircuit: true if DHW and CP circuits are in init phase */
  @ext(0x18, 0)
  model InitCircuit is ReadonlyRegister<yesno>;

  /** IsInBoostMode: heatpump in boost mode */
  @ext(0x39, 0)
  model IsInBoostMode is ReadonlyRegister<onoff>;

  /** QuickVetoStart: Signal for starting quick veto (will be reset after quick veto has been started) */
  @ext(0x45, 0)
  model QuickVetoStart is ReadonlyRegister<yesno>;

  /** Lp_Zp_Ma_Port: multifunction-output port replay */
  @ext(0x54, 0)
  model LpZpMaPort is ReadonlyRegister<onoff>;

  /** Hk1P_Kol1P_P1_Port: collector 1 pump port replay */
  @ext(0x55, 0)
  model Hc1PumpKol1PP1Port is ReadonlyRegister<onoff>;

  /** Hk2a_LegP_P2_Port: legionella pump port replay */
  @ext(0x57, 0)
  model Hc2aLegPumpP2Port is ReadonlyRegister<onoff>;

  /** Hk2z_Port: Port replay */
  @ext(0x58, 0)
  model Hc2zPort is ReadonlyRegister<onoff>;

  /** included parts */
  union _includes {
    Yield3f40_inc,
    Errors_inc,
    Iotestbsol_inc,
  }
}
