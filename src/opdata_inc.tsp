import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Opdata_inc {
  /** burner operational data */
  @ext(0x5, 0x7)
  model HcOperation {
    /** status heat request */
    @values(Values_status)
    status: UCH;

    /** variable consumers */
    @values(Values_action)
    action: UCH;

    /** boiler target temperature */
    desiredtemp: temp;

    /** boiler target pressure */
    desiredpress: press;

    /** setting degree, steps instead of percent when action is 0x44=hwc_stepped */
    settingdegree: percent1;

    /** hot water target temperature */
    hwcdesiredtemp: temp1;

    /** fuel choice */
    @values(Values_fuel)
    fuel: UCH;
  }

  /** room controller target values */
  @ext(0x8, 0)
  model RcTarget {
    /** boiler target temperature */
    desiredtemp: temp2;

    /** outside temperature */
    outsidetemp: temp2;

    /** forced performance */
    @unit("%")
    forced: D1B;

    /** hot water active */
    hwc: BI0;

    /** heat active */
    hc: BI1;

    /** hot water target temperature */
    hwcdesiredtemp: temp2;
  }

  /** room controller operational data */
  @ext(0x8, 1)
  model RcOperation {
    /** boiler effective temperature */
    temp: temp2;

    /** hot water effective temperature */
    buffertemp: temp2;

    /** emission test */
    @values(Values_emission_test)
    emissiontest: UCH;

    /** hot water active */
    hwc: BI0;

    /** pump active */
    pump: BI1;

    /** buffer 1 active */
    buffer1: BI2;

    /** buffer 2 active */
    buffer2: BI3;

    /** loading pump active */
    loading: BI4;

    /** hot water loading pump active */
    hwcloading: BI5;

    /** TBF connected */
    tbfconnect: BI6;

    /** return flow temperature */
    returntemp: temp2;
  }

  /** control commands */
  @ext(0x8, 0x2)
  model ControlCmd {
    /** boiler target temperature */
    desiredtemp: temp2;

    /** hot water target temperature */
    hwcdesiredtemp: temp2;

    /** expected performance */
    @unit("%")
    expected: D1B;

    /** first device with error */
    device: UCH;

    /** error code */
    error: UCH;
  }

  enum Values_status {
    off: 0x00,
    none: 0x01,
    hwc: 0x55,
    heat: 0xAA,
    emissioncheck: 0xCC,
    techcheck: 0xDD,
    stop: 0xEE,
    hwc_stop: 0x66,
    hwc_heat: 0xBB,
    hwc_stepped: 0x44,
  }

  enum Values_action {
    none: 0x00,
    pumpoff: 0x01,
    pumpon: 0x02,
    consumeoff: 0x03,
    consumeon: 0x04,
  }

  enum Values_fuel {
    dontcare: 0x00,
    gas: 0x01,
    oil: 0x02,
    dontcare1: 0x03,
  }

  enum Values_emission_test {
    none: 0,
    br1: 1,
    br1stb: 2,
    br12: 3,
    br12stb: 4,
  }
}
