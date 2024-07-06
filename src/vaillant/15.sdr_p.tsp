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

  /** Cyl. temp. probe 1 */
  @ext(0, 0)
  model Storage1Sensor is InstallRegister<tempsensor>;

  /** Cyl. temp. probe 2 */
  @ext(1, 0)
  model Storage2Sensor is InstallRegister<tempsensor>;

  /** Cyl. temp. probe 3 */
  @ext(0x2, 0)
  model Storage3Sensor is InstallRegister<tempsensor>;

  /** Solar panel temp. 1 */
  @ext(0x3, 0)
  model Coll1Sensor is InstallRegister<tempsensor>;

  /** Solar panel temp. 2 */
  @ext(0x4, 0)
  model Coll2Sensor is InstallRegister<tempsensor>;

  /** Solar gain probe */
  @ext(0x5, 0)
  model YieldSensor is InstallRegister<tempsensor>;

  /** Status solar panel pump 1 */
  @ext(0x6, 0)
  model CollPump1 is InstallRegister<onoff>;

  /** Current power solar pumps */
  @inherit(r, wi)
  @ext(0x7, 0)
  model CollPump1ActualPower {
    @maxLength(2)
    value: HEX;
  }

  /** Status solar panel pump 2 */
  @ext(0x8, 0)
  model CollPump2 is InstallRegister<onoff>;

  /** UV 1 */
  @ext(0x9, 0)
  model ThreeWayValve1 is InstallRegister<onoff>;

  /** Status legionella pump */
  @ext(0xa, 0)
  model LegioPump is InstallRegister<onoff>;

  /** Circulation pump */
  @ext(0xb, 0)
  model CirPump is InstallRegister<onoff>;

  /** Status electrical heater */
  @ext(0xc, 0)
  model ElectronicCartridge is InstallRegister<onoff>;

  /** Status C1/C2 */
  @ext(0xd, 0)
  model C1C2 is InstallRegister<onoff>;

  /** Bypass valve */
  @ext(0xe, 0)
  model BypassValve is InstallRegister<onoff>;

  /** Target temperature [C] */
  @ext(0x14, 0)
  model ActualTempDesired is InstallRegister<temp1>;

  /** Operation mode */
  @ext(0x15, 0)
  model OperatingMode is InstallRegister<mcmode>;

  /** Day of week */
  @ext(0x16, 0)
  model Weekday is InstallRegister<bday>;

  /** time */
  @ext(0x17, 0)
  model Time is InstallRegister<time>;

  /** Solar gain */
  @poll(1)
  @ext(0x1e, 0)
  model Yield is InstallRegister<UIN>;

  /** Operation time solar pump */
  @inherit(r, wi)
  @poll(1)
  @ext(0x1f, 0)
  model CollPumpHRuntime {
    uin: UIN;
    uin_1: UIN;
  }

  /** date */
  @ext(0x20, 0)
  model Date is InstallRegister<date>;

  /** Holiday */
  @ext(0x28, 0)
  model IsInHoliday is InstallRegister<UCH>;

  /** override (partyfunction) */
  @ext(0x29, 0)
  model IsInParty is InstallRegister<onoff>;

  /** cylinder boost */
  @ext(0x2a, 0)
  model IsInSingleHwcLoading is InstallRegister<onoff>;

  /** Hzdraulic plan */
  @ext(0x3d, 0)
  model HydraulicScheme is InstallRegister<UCH>;

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
  @ext(0x41, 0)
  model LegioProtectionEnabled is InstallRegister<UCH>;

  /** Starting time filling mode (tFIL) */
  @ext(0x42, 0)
  model StartTimeFillingMode is InstallRegister<UCH>;

  /** Starting time operatiion mode (tOP) */
  @ext(0x43, 0)
  model StartTimeOperatingMode is InstallRegister<UCH>;

  /** No. of solar panels */
  @ext(0x44, 0)
  model NumCollPanels is InstallRegister<UCH>;

  /** Blocking time solar pumps (tBLK) */
  @ext(0x45, 0)
  model SolPumpBlockingTime is InstallRegister<UCH>;

  /** Re-charge delay */
  @ext(0x46, 0)
  model HwcLoadingDelay is InstallRegister<onoff>;

  /** Solar flow rate [l/h] */
  @ext(0x47, 0)
  model SolFlowRate is InstallRegister<UIN>;

  /** Solarpump durat.ratio ctrl */
  @ext(0x48, 0)
  model SolEDEnable is InstallRegister<onoff>;

  /** Reset solar gain */
  @ext(0x49, 0)
  model ResetYield is InstallRegister<onoff>;

  /** Reset operation hours */
  @ext(0x4a, 0)
  model ResetOperatingTimes is InstallRegister<onoff>;

  /** Power solar pump [%] */
  @ext(0x4b, 0)
  model SolPumpPower is InstallRegister<power>;

  /** De-activation autosync */
  @ext(0x51, 0)
  model DisableAutoSync is InstallRegister<onoff>;

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
