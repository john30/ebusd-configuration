import "@ebusd/ebus-typespec";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Tem;

/**
 * Wolf TopOne with TEM R19 controller.
 * Observed identification at slave 0x15: TEM;R19;1;0.
 * Passive messages from controller master 0x10; no remote emulation or writes.
 * Unknown status fields are kept raw. Additional slots are observed but their
 * association with heating circuits has not been independently confirmed.
 */
@zz(0x15)
namespace R19 {
  enum Weekday {
    Monday: 1,
    Tuesday: 2,
    Wednesday: 3,
    Thursday: 4,
    Friday: 5,
    Saturday: 6,
    Sunday: 7,
  }

  /** Operating states observed on this R19, independent of remote mode. */
  enum HeatingOperatingState {
    Off: 0,
    NormalHeating: 1,
    ReducedHeating: 3,
    FrostProtection: 4,

    /** Observed during the controller's timed chimney-sweep test. */
    ChimneySweep: 7,
  }

  /** Controller clock; date bytes are unset (95 95 weekday 95), so decode only the weekday. */
  @passive
  @qq(0x10)
  @zz(0xfe)
  @id(0x07, 0x00)
  model Clock {
    @unit("°C")
    outdoorTemperature: D2B;

    time: BTI;

    @maxLength(2)
    unsetDatePrefix: IGN;

    @values(Weekday)
    weekday: UCH;

    unsetDateSuffix: IGN;
  }

  /** Actual-value records. Slot 1 is populated; the roles of slots 2 and 3 need validation on a multi-circuit installation. */
  @passive
  @qq(0x10)
  @zz(0xfe)
  @base(0x10, 0x0a, 0x10)
  model ActualValues {
    @unit("°C")
    @divisor(10)
    heatGeneratorFlowTemperature: SIN;

    @maxLength(2)
    reserved1: HEX;

    @maxLength(2)
    temperatureWordRaw: HEX;

    @maxLength(2)
    reserved2: HEX;

    @unit("°C")
    @divisor(10)
    upperDhwStorageTemperature: SIN;

    /** Mirrors the remote heartbeat; observed as 10 °C fallback without the remote. */
    @unit("°C")
    @divisor(10)
    remoteRoomTemperature: SIN;
  }

  @inherit(ActualValues)
  @ext(0x00)
  model ActualValuesSlot1 {}

  @inherit(ActualValues)
  @ext(0x01)
  model ActualValuesSlot2 {}

  @inherit(ActualValues)
  @ext(0x02)
  model ActualValuesSlot3 {}

  /** Outside temperature and raw status context. Pump-bit assignments remain unresolved. */
  @passive
  @qq(0x10)
  @zz(0xfe)
  @base(0x10, 0x0a, 0x11)
  model ActualContext {
    @unit("°C")
    @divisor(10)
    outdoorTemperature: SIN;

    demandAndPumpFlagsRaw: UCH;

    @maxLength(5)
    statusFlagsPadding: HEX;

    contextMarkerRaw: UCH;

    @maxLength(1)
    contextMarkerRawPadding: HEX;
  }

  @inherit(ActualContext)
  @ext(0x00)
  model ActualContextSlot1 {}

  @inherit(ActualContext)
  @ext(0x01)
  model ActualContextSlot2 {}

  @inherit(ActualContext)
  @ext(0x02)
  model ActualContextSlot3 {}

  /** Aggregate operating context; unknown bytes are retained without interpretation. */
  @passive
  @qq(0x10)
  @zz(0xfe)
  @id(0x10, 0x0a, 0x11, 0x09)
  model OperatingContext {
    @maxLength(2)
    prefix: HEX;

    @maxLength(2)
    statusFlagsRaw: HEX;

    @maxLength(4)
    reserved: HEX;

    contextMarkerRaw: UCH;

    @maxLength(1)
    contextMarkerRawPadding: HEX;
  }

  /** Target-value context. Operating state is distinct from the remote mode selection. */
  @passive
  @qq(0x10)
  @zz(0xfe)
  @base(0x10, 0x0a, 0x11)
  model TargetContext {
    @maxLength(2)
    prefix: HEX;

    /** Monday 00:00 = 0; Sunday 23:59 = 10079. */
    @unit("min")
    minuteOfWeek: UIN;

    modeContextRaw: HEX;

    @values(HeatingOperatingState)
    operatingState: UCH;

    @maxLength(2)
    statusRaw: HEX;

    contextMarkerRaw: UCH;

    @maxLength(1)
    contextMarkerRawPadding: HEX;
  }

  @inherit(TargetContext)
  @ext(0x03)
  model TargetContextSlot1 {}

  @inherit(TargetContext)
  @ext(0x04)
  model TargetContextSlot2 {}

  @inherit(TargetContext)
  @ext(0x05)
  model TargetContextSlot3 {}

  /** Aggregate operating values. The temperature-like word follows the outside sensor with a delay; its role is unconfirmed. */
  @passive
  @qq(0x10)
  @zz(0xfe)
  @id(0x10, 0x0a, 0x10, 0x09)
  model OperatingValues {
    @maxLength(6)
    statusPrefix: HEX;

    @unit("°C")
    @divisor(10)
    filteredOutdoorTemperatureCandidate: SIN;

    constant2000: UIN;
    constant10000: UIN;
  }

  /** Generator, heating-circuit, hot-water and room targets. Slot numbering does not assert a heating-circuit assignment. */
  @passive
  @qq(0x10)
  @zz(0xfe)
  @base(0x10, 0x0a, 0x10)
  model TargetValues {
    @unit("°C")
    @divisor(10)
    heatGeneratorFlowTargetTemperature: SIN;

    @maxLength(2)
    reserved1: HEX;

    @unit("°C")
    @divisor(10)
    heatingCircuitFlowTargetTemperature: SIN;

    @maxLength(2)
    reserved2: HEX;

    @unit("°C")
    @divisor(10)
    dhwTargetTemperature: SIN;

    @unit("°C")
    @divisor(10)
    activeRoomTargetTemperature: SIN;
  }

  @inherit(TargetValues)
  @ext(0x03)
  model TargetValuesSlot1 {}

  @inherit(TargetValues)
  @ext(0x04)
  model TargetValuesSlot2 {}

  @inherit(TargetValues)
  @ext(0x05)
  model TargetValuesSlot3 {}
}
