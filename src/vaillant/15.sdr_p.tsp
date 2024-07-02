import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x15)
namespace Sdr_p {
  // ,SDR_P,auroMATIC 560,168 168 Disabled

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

  /** Cyl. temp. probe 1 */
  @inherit(r, wi)
  @ext(0, 0)
  model Storage1Sensor {
    value: tempsensor;
  }

  /** Cyl. temp. probe 2 */
  @inherit(r, wi)
  @ext(1, 0)
  model Storage2Sensor {
    value: tempsensor;
  }

  /** Cyl. temp. probe 3 */
  @inherit(r, wi)
  @ext(0x2, 0)
  model Storage3Sensor {
    value: tempsensor;
  }

  /** Solar panel temp. 1 */
  @inherit(r, wi)
  @ext(0x3, 0)
  model Coll1Sensor {
    value: tempsensor;
  }

  /** Solar panel temp. 2 */
  @inherit(r, wi)
  @ext(0x4, 0)
  model Coll2Sensor {
    value: tempsensor;
  }

  /** Solar gain probe */
  @inherit(r, wi)
  @ext(0x5, 0)
  model YieldSensor {
    value: tempsensor;
  }

  /** Status solar panel pump 1 */
  @inherit(r, wi)
  @ext(0x6, 0)
  model CollPump1 {
    value: onoff;
  }

  /** Current power solar pumps */
  @inherit(r, wi)
  @ext(0x7, 0)
  model CollPump1ActualPower {
    @maxLength(2)
    value: HEX;
  }

  /** Status solar panel pump 2 */
  @inherit(r, wi)
  @ext(0x8, 0)
  model CollPump2 {
    value: onoff;
  }

  /** UV 1 */
  @inherit(r, wi)
  @ext(0x9, 0)
  model ThreeWayValve1 {
    value: onoff;
  }

  /** Status legionella pump */
  @inherit(r, wi)
  @ext(0xa, 0)
  model LegioPump {
    value: onoff;
  }

  /** circulation pump */
  @inherit(r, wi)
  @ext(0xb, 0)
  model CirPump {
    value: onoff;
  }

  /** Status electrical heater */
  @inherit(r, wi)
  @ext(0xc, 0)
  model ElectronicCartridge {
    value: onoff;
  }

  /** Status C1/C2 */
  @inherit(r, wi)
  @ext(0xd, 0)
  model C1C2 {
    value: onoff;
  }

  /** Bypass valve */
  @inherit(r, wi)
  @ext(0xe, 0)
  model BypassValve {
    value: onoff;
  }

  /** Target temperature [C] */
  @inherit(r, wi)
  @ext(0x14, 0)
  model ActualTempDesired {
    value: temp1;
  }

  /** Operation mode */
  @inherit(r, wi)
  @ext(0x15, 0)
  model OperatingMode {
    value: mcmode;
  }

  /** Day of week */
  @inherit(r, wi)
  @ext(0x16, 0)
  model Weekday {
    value: bday;
  }

  /** time */
  @inherit(r, wi)
  @ext(0x17, 0)
  model Time {
    value: time;
  }

  /** Solar gain */
  @inherit(r, wi)
  @ext(0x1e, 0)
  model Yield {
    value: UIN;
  }

  /** Operation time solar pump */
  @inherit(r, wi)
  @ext(0x1f, 0)
  model CollPumpHRuntime {
    uin: UIN;
    uin_1: UIN;
  }

  /** date */
  @inherit(r, wi)
  @ext(0x20, 0)
  model Date {
    value: date;
  }

  /** Holiday */
  @inherit(r, wi)
  @ext(0x28, 0)
  model IsInHoliday {
    value: UCH;
  }

  /** override (partyfunction) */
  @inherit(r, wi)
  @ext(0x29, 0)
  model IsInParty {
    value: onoff;
  }

  /** cylinder boost */
  @inherit(r, wi)
  @ext(0x2a, 0)
  model IsInSingleHwcLoading {
    value: onoff;
  }

  /** Hzdraulic plan */
  @inherit(r, wi)
  @ext(0x3d, 0)
  model HydraulicScheme {
    value: UCH;
  }

  /** Max. temp. solar cylinder [C] */
  @inherit(r, wi)
  @ext(0x3e, 0)
  model SolHwcMaxLoadTemp {
    @maxLength(2)
    value: HEX;
  }

  /** Switch-on diff. solar cyl. [K] */
  @inherit(r, wi)
  @ext(0x3f, 0)
  model SolEnableDiffTemp {
    @maxLength(2)
    value: HEX;
  }

  /** Switch/off diff. solar cyl. [K] */
  @inherit(r, wi)
  @ext(0x40, 0)
  model SolDisableDiffTemp {
    @maxLength(2)
    value: HEX;
  }

  /** Legionella protection */
  @inherit(r, wi)
  @ext(0x41, 0)
  model LegioProtectionEnabled {
    value: UCH;
  }

  /** Starting time filling mode (tFIL) */
  @inherit(r, wi)
  @ext(0x42, 0)
  model StartTimeFillingMode {
    value: UCH;
  }

  /** Starting time operatiion mode (tOP) */
  @inherit(r, wi)
  @ext(0x43, 0)
  model StartTimeOperatingMode {
    value: UCH;
  }

  /** No. of solar panels */
  @inherit(r, wi)
  @ext(0x44, 0)
  model NumCollPanels {
    value: UCH;
  }

  /** Blocking time solar pumps (tBLK) */
  @inherit(r, wi)
  @ext(0x45, 0)
  model SolPumpBlockingTime {
    value: UCH;
  }

  /** Re-charge delay */
  @inherit(r, wi)
  @ext(0x46, 0)
  model HwcLoadingDelay {
    value: onoff;
  }

  /** Solar flow rate [l/h] */
  @inherit(r, wi)
  @ext(0x47, 0)
  model SolFlowRate {
    value: UIN;
  }

  /** Solarpump durat.ratio ctrl */
  @inherit(r, wi)
  @ext(0x48, 0)
  model SolEDEnable {
    value: onoff;
  }

  /** Reset solar gain */
  @inherit(r, wi)
  @ext(0x49, 0)
  model ResetYield {
    value: onoff;
  }

  /** Reset operation hours */
  @inherit(r, wi)
  @ext(0x4a, 0)
  model ResetOperatingTimes {
    value: onoff;
  }

  /** Power solar pump [%] */
  @inherit(r, wi)
  @ext(0x4b, 0)
  model SolPumpPower {
    value: power;
  }

  /** De-activation autosync */
  @inherit(r, wi)
  @ext(0x51, 0)
  model DisableAutoSync {
    value: onoff;
  }

  /** Min. switch-on diff. solar cylinder [K] */
  @inherit(r, wi)
  @ext(0x52, 0)
  model SolEnableDiffTempMin {
    @maxLength(2)
    value: HEX;
  }

  /** Max. switch-on diff. solar cylinder [K] */
  @inherit(r, wi)
  @ext(0x53, 0)
  model SolEnableDiffTempMax {
    @maxLength(2)
    value: HEX;
  }
}
