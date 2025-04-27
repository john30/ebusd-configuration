import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Hcmode_inc {
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

  /** outside temperature */
  @inherit(rm)
  @ext(0x16)
  model Status16 {
    value: temp;
  }
  // HC operation mode2

  /** default *r */
  @base(MF, 0x11)
  model r_1 {}

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
    hwcflowtempdesired: temp0;

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
  // potential last byte: currentmode,s,UCH,0=off;1=standby;2=heat;3=water

  /** Vorlauftemperatur/Rücklauftemperatur/Aussentemperatur/WW Temperatur/Speichertemperatur/Pumpenstatus */
  @inherit(r_1)
  @ext(1)
  model Status01 {
    temp: temp1;
    temp_1: temp1;
    temp_2: temp2;
    temp_3: temp1;
    temp_4: temp1;
    pumpstate: pumpstate;
  }

  /** Betriebsart/Maximaltemperatur/ReglerCurrentTemp/Maximaltemperatur/ReglerCurrentTemp */
  @inherit(r_1)
  @ext(0x2)
  model Status02 {
    hwcmode: hwcmode;
    temp: temp0;
    temp_1: temp1;
    temp_2: temp0;
    temp_3: temp1;
  }

  /** Status */
  @inherit(r_1)
  @ext(0x3)
  model Status {
    temp: temp;
    press: press;
    press_1: press;
    hcmode: hcmode2;
    hex: HEX;
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
