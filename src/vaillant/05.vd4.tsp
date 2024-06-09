import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x05)
namespace vd4 {
  // ,VD400,vrnetDIALOG 840/2,175 175

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

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x9, 0xe)
  model ws {}

  @inherit(r, wi)
  @ext(0, 0)
  model SoftwareVersion {
    @maxLength(4)
    value: HEX;
  }

  @inherit(r, wi)
  @ext(1, 0)
  model EnableMonitoring {
    @maxLength(5)
    value: HEX;
  }

  @inherit(r, wi)
  @ext(0x2, 0)
  model FlexibleMonitoring {
    @maxLength(8)
    value: HEX;
  }

  @inherit(r, wi)
  @ext(0x3, 0)
  model DataCollectionRequest {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x4, 0)
  model DataCollectionBuffer {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x5, 0)
  model DataCollCycle {
    value: ULG;
  }

  @inherit(r, wi)
  @ext(0x6, 0)
  model DataCollBufSize {
    value: ULG;
  }

  /** Enable broadcast error messages */
  @inherit(r, wi)
  @ext(0x7, 0)
  model EnableBcErrMsg {
    /** Brodcast error messages on the eBUS will be send to the server */
    value: yesno;
  }

  @inherit(r, wi)
  @ext(0x8, 0)
  model BoxSerialNumber1 {
    @maxLength(9)
    value: HEX;
  }

  @inherit(r, wi)
  @ext(0x9, 0)
  model BoxSerialNumber2 {
    @maxLength(9)
    value: HEX;
  }

  @inherit(r, wi)
  @ext(0xa, 0)
  model BoxSerialNumber3 {
    @maxLength(9)
    value: HEX;
  }

  @inherit(r, wi)
  @ext(0xb, 0)
  model BoxSerialNumber4 {
    @maxLength(9)
    value: HEX;
  }

  /** Device Layout */
  @inherit(r, wi)
  @ext(0xc, 0)
  model DeviceLayout {
    /** Type of Interface which will be used and definition of appliance */
    @values(values_DeviceLayout)
    value: UCH;
  }

  /** Layout Checksum */
  @inherit(r, wi)
  @ext(0xd, 0)
  model DeviceLayoutCRC {
    /** Checksum over all devives connected to vrnetDIALOG. Will be used from the server to find out if new devices added or devices are deleted */
    value: UCH;
  }

  /** AutoSync enabled */
  @inherit(r, wi)
  @ext(0xe, 0)
  model AutoSyncEnable {
    /** Enabling or disabling of the AutoYync on the eBUS. Only usefull if there problems with outher AutoSync devices on the eBUS. */
    value: onoff;
  }

  /** Last connection error */
  @inherit(r, wi)
  @ext(0xf, 0)
  model LastConnectionError {
    /** Shows the last state where the connection has failed. */
    @values(values_LastConnectionError)
    value: UCH;
  }

  /** Connection error retry delay [minutes] */
  @inherit(r, wi)
  @ext(0x10, 0)
  model ConnErrorRetryDelay {
    /** Delay between two connection tries in case of a connection error */
    value: UCH;
  }

  /** Connection Delay [minutes] */
  @inherit(r, wi)
  @ext(0x11, 0)
  model ConnectionDelay {
    /** Minimum delay between two server connections established by the dialog box. */
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x12, 0)
  model ErrorMessage {
    value: UCH;
  }

  /** Connection error counter */
  @inherit(r, wi)
  @ext(0x13, 0)
  model ConnErrorCnt {
    /** Number of connection tries. Will be reset to zero after a successful connection */
    value: UCH;
  }

  /** PPP phone number 1 */
  @inherit(r, wi)
  @ext(0x14, 0)
  model PppPhoneNumber1 {
    /** Fon number or ATN of the first PPP provider selected by server */
    @maxLength(21)
    value: STR;
  }

  /** PPP Login 1 */
  @inherit(r, wi)
  @ext(0x15, 0)
  model PppLogin1 {
    /** Login for the first internetprovider */
    @maxLength(21)
    value: STR;
  }

  /** PPP Password 1 */
  @inherit(r, wi)
  @ext(0x16, 0)
  model PppPassword1 {
    /** Password for the first internet provider */
    @maxLength(21)
    value: STR;
  }

  /** Phone number provider 1 */
  @inherit(r, wi)
  @ext(0x17, 0)
  model PppPhoneNumber2 {
    @maxLength(21)
    value: STR;
  }

  /** PPP Login 2 */
  @inherit(r, wi)
  @ext(0x18, 0)
  model PppLogin2 {
    /** Login for second internetprovide */
    @maxLength(21)
    value: STR;
  }

  /** PPP Password 2 */
  @inherit(r, wi)
  @ext(0x19, 0)
  model PppPassword2 {
    /** Paswword for second internetprovider */
    @maxLength(21)
    value: STR;
  }

  /** Server IP address */
  @inherit(r, wi)
  @ext(0x1a, 0)
  model ServerIpAddr {
    uch: UCH;
    uch_1: UCH;
    uch_2: UCH;
    uch_3: UCH;
  }

  /** Actual GSM/GPRS provider */
  @inherit(r, wi)
  @ext(0x1b, 0)
  model ActualGsmProvider {
    /** Information which provider has been selectet. Only valid in case of GSM/GPRS modem. */
    @maxLength(5)
    value: STR;
  }

  /** Modem init string */
  @inherit(r, wi)
  @ext(0x1c, 0)
  model ModemInitString {
    /** Special string for initialsing the modem. Default empty. Wrong values can cause a dialog box which can't communicate. */
    @maxLength(21)
    value: STR;
  }

  /** Call back delay GSM/GPRS [s] */
  @inherit(r, wi)
  @ext(0x1e, 0)
  model RingTimeGsmCB {
    /** Time between the last ring and the call back. */
    value: UCH;
  }

  /** Rings before pickup */
  @inherit(r, wi)
  @ext(0x1f, 0)
  model RingsBeforePickup {
    /** Only for analog modems used. 0 = will never pick up. */
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x20, 0)
  model RingTimeTSM1 {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x21, 0)
  model RingTimeTSM2 {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x22, 0)
  model MessageThreshold {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x23, 0)
  model ConnectionCycle {
    value: UCH;
  }

  /** Max. signal strength GSM/GPRS */
  @inherit(r, wi)
  @ext(0x24, 0)
  model FieldStrengthMax {
    /** Max value since last power on (0..31) */
    value: UCH;
  }

  /** Min. signal strength GSM/GPRS */
  @inherit(r, wi)
  @ext(0x25, 0)
  model FieldStrengthMin {
    /** Min. value since last power on (0..31) */
    value: UCH;
  }

  /** Enable OK message */
  @inherit(r, wi)
  @ext(0x26, 0)
  model EnableDisErrorMsg {
    /** If on a error free message will be sent to the server. */
    value: onoff;
  }

  /** Relay outputs */
  @inherit(r, wi)
  @ext(0x27, 0)
  model SwitchRelays {
    bi: BI0;
    bi_1: BI1;
  }

  @inherit(r, wi)
  @ext(0x2b, 0)
  model StandbySignal {
    value: UCH;
  }

  /** Power on alarm */
  @inherit(r, wi)
  @ext(0x2c, 0)
  model PowerOnMessage {
    /** If on a alarm message is sent after power on */
    value: onoff;
  }

  @inherit(r, wi)
  @ext(0x2e, 0)
  model AlarmOnDelay {
    uin: UIN;
    uin_1: UIN;
  }

  @inherit(r, wi)
  @ext(0x2f, 0)
  model AlarmOffDelay {
    uin: UIN;
    uin_1: UIN;
  }

  @inherit(r, wi)
  @ext(0x30, 0)
  model ScanLayoutCycle {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x31, 0)
  model PredMaintConnectionCycle {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x32, 0)
  model LastKnownEbusAddr {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x33, 0)
  model Time {
    value: time;
  }

  @inherit(r, wi)
  @ext(0x34, 0)
  model Date {
    value: date;
  }

  @inherit(r, wi)
  @ext(0x35, 0)
  model Weekday {
    value: bday;
  }

  @inherit(r, wi)
  @ext(0x36, 0)
  model CurrentPppProvider {
    @values(values_CurrentPppProvider)
    value: UCH;
  }

  /** GSM SIM Pin */
  @inherit(r, wi)
  @ext(0x37, 0)
  model GsmGprsPin {
    /** Wrong pin disables the box functionality */
    @maxLength(4)
    value: STR;
  }

  @inherit(r, wi)
  @ext(0x38, 0)
  model ModemType {
    @values(values_ModemType)
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x39, 0)
  model H2BusLayout {
    value: UCH;
  }

  /** Digital input actual values */
  @inherit(r, wi)
  @ext(0x3a, 0)
  model ActualDigitalInputs {
    bi: BI0;
    bi_1: BI1;
  }

  /** Analog inputs actual values */
  @inherit(r, wi)
  @ext(0x3b, 0)
  model ActualAnalogInputs {
    uin: UIN;
    uin_1: UIN;
  }

  /** Counter inputs actual values */
  @inherit(r, wi)
  @ext(0x3c, 0)
  model ActualCounterValue {
    uin: UIN;
    uin_1: UIN;
  }

  /** Modem dial prefix */
  @inherit(r, wi)
  @ext(0x3d, 0)
  model ModemDialPrefix {
    /** Prefix which will be sent to the modem befor dialing */
    @maxLength(4)
    value: STR;
  }

  @inherit(r, wi)
  @ext(0x3e, 0)
  model DebugFlags {
    value: ULG;
  }

  /** Modem country code */
  @inherit(r, wi)
  @ext(0x3f, 0)
  model ModemCountryCode {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x40, 0)
  model DoReset {
    value: UCH;
  }

  @inherit(r, wi)
  @ext(0x41, 0)
  model DataCollectionLimit {
    value: ULG;
  }

  @inherit(r, wi)
  @ext(0x42, 0)
  model Temp3WayValve {
    value: tempsensor;
  }

  @condition(id.id.sw, ">=200")
  namespace sw__200 {
    @inherit(r, ws)
    @ext(0x43, 0)
    model ComErrorDelay {
      @unit("Control interface")
      value: UIN;
    }
  }

  @inherit(r, ws)
  @ext(0x46, 0)
  model RfWakeupCycle {
    value: UIN;
  }

  enum values_DeviceLayout {
    _unknown: 0,
    JV_PC: 1,
    H2B: 2,
    _1_16: 3,
    complex: 4,
    eBUSheater: 5,
  }

  enum values_LastConnectionError {
    none: 0,
    connection: 1,
    PPP: 2,
    TCPopen: 3,
    TCPauth: 4,
    TCPsend: 5,
  }

  enum values_CurrentPppProvider {
    _1: 0,
    _2: 1,
    emergency_provider: 2,
  }

  enum values_ModemType {
    analogue: 0,
    GSM: 1,
    GPRS: 2,
  }
}
