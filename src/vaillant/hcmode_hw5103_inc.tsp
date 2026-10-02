import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

/**
 * HC mode messages implemented by HMU HW5103.
 *
 * The generic Hcmode_inc also defines B504/16 (Status16),
 * B511/02 (Status02), and B511/03 (Status). Multiple HW5103
 * installations return an empty slave response for those three
 * messages, so they are intentionally omitted here.
 */
namespace Hcmode_HW5103_inc {
  // HC operation mode

  /** date/time */
  @inherit(rm)
  @ext(0)
  model DateTime {
    dcfstate: dcfstate;
    btime: btime;
    bdate: bdate;
    temp: temp2;
  }

  // HC operation mode2

  /** default *r */
  @base(MF, 0x11)
  model r_1 {}

  /**
   * HW5103 native status.
   *
   * Live-validated on SW0902 and SW0905. CompressorState is kept raw
   * because not all observed state values have an unambiguous meaning.
   */
  @inherit(r_1)
  @ext(0)
  model Status00 {
    /** supply temperature */
    supplytemp: temp;

    /** water pressure */
    @unit("bar")
    @divisor(10)
    waterpressure: UCH;

    /** compressor modulation */
    @unit("%")
    compressormodulation: UCH;

    /** compressor state machine status number */
    compressorstate: UCH;

    /** heating/system state */
    heatingstate: UCH;

    /** unknown status byte */
    unknownstate: UCH;

    /** defrost state */
    defrost: UCH;

    /** compressor power */
    @unit("%")
    compressorpower: UCH;
  }

  /** default *uw */
  @write
  @passive
  @base(MF, 0x10)
  model uw {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x10)
  model wi_1 {}

  /** Operation mode */
  @inherit(uw, wi_1)
  @ext(0)
  model SetMode {
    hcmode: hcmode;
    flowtempdesired: temp1;
    hwctempdesired: temp1;
    hwcflowtempdesired: temp1;

    @maxLength(1)
    ign: IGN;

    disablehc: BI0;
    disablehwctapping: BI1;
    disablehwcload: BI2;

    @maxLength(1)
    ign_1: IGN;

    remoteControlHcPump: BI0;
    releaseBackup: BI1;
    releaseCooling: BI2;
  }

  /** flow/return/outside/HW/storage temperatures and pump status */
  @inherit(r_1)
  @ext(1)
  model Status01 {
    /** flow temperature */
    temp: temp1;

    /** return temperature */
    temp_1: temp1;

    /** outside temperature */
    temp_2: temp2;

    /** hot water temperature */
    temp_3: temp1;

    /** storage temperature */
    temp_4: temp1;

    /** pump status */
    pumpstate: pumpstate;
  }

  /** default *uw */
  @write
  @passive
  @base(MF, 0x12)
  model uw_1 {}

  /** Status circulation pump */
  @inherit(uw_1)
  @ext(0)
  model StatusCirPump {
    @values(Values_StatusCirPump)
    value: UCH;
  }

  enum Values_StatusCirPump {
    off: 0,
    on: 100,
  }
}
