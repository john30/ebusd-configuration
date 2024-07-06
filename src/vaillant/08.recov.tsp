import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x08)
namespace Recov {
  // ,recov,recoVair 260
  // ##### Generell #####

  /** default *r */
  @base(MF, 0x13)
  model r_1 {
    @maxLength(2)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x9)
  model w_1 {}

  /** Read Ventilation Intensity Day */
  @inherit(r_1)
  @poll(2)
  @ext(0x4, 0x8a, 0x3)
  model VentIntensityDay {
    value: UCH;
  }

  /** Read Ventilation Intensity Night */
  @inherit(r_1)
  @poll(2)
  @ext(0x4, 0x8b, 0x3)
  model VentIntensityNight {
    value: UCH;
  }

  /** Read Heat Recovery */
  @inherit(r_1)
  @poll(2)
  @ext(0x4, 0x8c, 0x3)
  model VentHeatRecovery {
    @values(Values_VentHeatRecovery)
    value: UCH;
  }

  /** Set Ventilation Intensity 1 */
  @inherit(w_1)
  @ext(0xe, 0x8a, 0x3, 1)
  model SetVentIntensity1 {}

  /** Set Ventilation Intensity 2 */
  @inherit(w_1)
  @ext(0xe, 0x8a, 0x3, 0x2)
  model SetVentIntensity2 {}

  /** Set Ventilation Intensity 3 */
  @inherit(w_1)
  @ext(0xe, 0x8a, 0x3, 0x3)
  model SetVentIntensity3 {}

  /** Set Ventilation Intensity 4 */
  @inherit(w_1)
  @ext(0xe, 0x8a, 0x3, 0x4)
  model SetVentIntensity4 {}

  /** Set Ventilation Intensity 5 */
  @inherit(w_1)
  @ext(0xe, 0x8a, 0x3, 0x5)
  model SetVentIntensity5 {}

  /** Set Ventilation Intensity 6 */
  @inherit(w_1)
  @ext(0xe, 0x8a, 0x3, 0x6)
  model SetVentIntensity6 {}

  /** Set Heat Recovery Auto */
  @inherit(w_1)
  @ext(0xe, 0x8c, 0x3, 0)
  model SetVentHeatRecoveryAuto {}

  /** Turn On Heat Recovery */
  @inherit(w_1)
  @ext(0xe, 0x8c, 0x3, 1)
  model SetVentHeatRecoveryOn {}

  /** Turn Off Heat Recovery */
  @inherit(w_1)
  @ext(0xe, 0x8c, 0x3, 0x2)
  model SetVentHeatRecoveryOff {}

  /** Set Ventilation Day */
  @inherit(w_1)
  @ext(0xb5, 0x22, 0, 0x2, 0, 0xff, 0xff)
  model SetVentDay {}

  /** Set Ventilation Night */
  @inherit(w_1)
  @ext(0xb5, 0x22, 0, 1, 0, 0xff, 0xff)
  model SetVentNight {}

  /** Activate Boost Ventilation */
  @inherit(w_1)
  @ext(0xb5, 0x22, 0, 0x3, 0, 0xff, 0xff)
  model SetVentBoost {}
  // ##### Weitere #####

  /** default *r */
  @base(MF, 0x9)
  model r_2 {
    @maxLength(2)
    value: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x9)
  model w_2 {}

  /** Position of Bypass Flap */
  @inherit(r_2)
  @poll(9)
  @ext(0x29, 0xb, 0xe)
  model BypassPosition {
    @divisor(10)
    value: UIN;
  }

  /** Outside Air Temperature */
  @inherit(r_2)
  @ext(0x29, 0xc, 0xe)
  model TempOutsideAir {
    value: tempsensor;
  }

  /** Outgoing Air Temperature */
  @inherit(r_2)
  @ext(0x29, 0xd, 0xe)
  model TempOutgoingAir {
    value: tempsensor;
  }

  /** Waste Air Temperature */
  @inherit(r_2)
  @ext(0x29, 0xb4, 0xd)
  model TempWasteAir {
    value: tempsensor;
  }

  /** Inlet Air Temperature */
  @inherit(r_2)
  @ext(0x29, 0xb3, 0xd)
  model TempInletAir {
    value: tempsensor;
  }

  /** Relative Humidity Waste Air */
  @inherit(r_2)
  @poll(2)
  @ext(0x29, 0x85, 0x3)
  model HumiWasteAir {
    value: percent;
  }

  /** Frost Protection Element Active */
  @inherit(r_2)
  @poll(9)
  @ext(0x29, 0xf1, 0xc)
  model FrostProtection {
    value: onoff;
  }

  /** desired temperature */
  @inherit(r_2)
  @ext(0x29, 0x14, 0xe)
  model PreferredTemp {
    value: temp;
  }

  /** Current Volume Flow */
  @inherit(r_2)
  @poll(2)
  @ext(0x29, 0x3, 0xe)
  model FlowActual {
    @unit("m3/h")
    value: UIN;
  }

  enum Values_VentHeatRecovery {
    auto: 0,
    on: 1,
    off: 2,
  }
}
