import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Str;
namespace Vaillant;

/** b516 energy statistics */
namespace B516_inc {
  @base(MF, 0x16, 0x10)
  model rc {
    // @out
    // @values(Values_period)
    // period: UCH;
    // @out
    // @constValue(0xffff)
    // ign2: UIN;
    /** the energy source */
    @out
    @values(Values_source)
    source: UCH;

    /** the energy usage */
    @out
    @values(Values_usage)
    usage: UCH;
  }

  @inherit(rc)
  @ext(
    3,  // period=year
    0xff, 0xff // fix value
  )
  model StatEnergySumYear {
    // according to #490 and #504:
    // hex digits MDYY with M=month*2 (or 0 for year period), D=day of month (or 0 for year/month period), YY=year*2 since 2000 (or 0 for total)
    // i.e. bits (rev): yyyyyyy mmmm ddddd
    //  e.g. 0x3257 = 0b0011001 0010 10111 = 2025-02-23
    //  e.g. 0x3180 = 0b0011000 1100 00000 = 2024-12-00
    // @out
    // date: UIN; // would require a new base datatype
    @out
    @constValue(0)
    ign2: UCH; // ignored M+D for period=year

    /** the year as offset from 2000 */
    @out
    @divisor(2)
    year: UCH; // upper 7 bits of YY (with divisor)

    @maxLength(7)
    ign: IGN; // repeats the query (more or less)

    value: energye;
  }

  enum Values_period {
    total: 0,
    day: 1,
    month: 2,
    year: 3,
  }

  enum Values_source {
    solar: 1,
    environment: 2,
    electricity: 3,
    gas: 4,
  }

  enum Values_usage {
    all: 0,
    heat: 3,
    water: 4,
    cool: 5,
  }

  @base(MF, 0x16, 0x10,
    0,  // period=total
    0xff, 0xff // fix value
  )
  model r {
    @maxLength(7)
    ign: IGN;
  }

  @inherit(r)
  @ext(1, 0, 0, 0)
  model StatSolarEnergySum {
    value: energye;
  }

  @inherit(r)
  @ext(1, 0x03, 0, 0)
  model StatSolarEnergySumHc {
    value: energye;
  }

  @inherit(r)
  @ext(1, 0x04, 0, 0)
  model StatSolarEnergySumHwc {
    value: energye;
  }

  @inherit(r)
  @ext(0x02, 0, 0, 0)
  model StatEnvironmentEnergySum {
    value: energye;
  }

  @inherit(r)
  @ext(0x02, 0x03, 0, 0)
  model StatEnvironmentEnergySumHc {
    value: energye;
  }

  @inherit(r)
  @ext(0x02, 0x04, 0, 0)
  model StatEnvironmentEnergySumHwc {
    value: energye;
  }

  @inherit(r)
  @ext(0x02, 0x05, 0, 0)
  model StatEnvironmentEnergySumCool {
    value: energye;
  }

  @inherit(r)
  @ext(0x03, 0, 0, 0)
  model StatElectricEnergySum {
    value: energye;
  }

  @inherit(r)
  @ext(0x03, 0x03, 0, 0)
  model StatElectricEnergySumHc {
    value: energye;
  }

  @inherit(r)
  @ext(0x03, 0x04, 0, 0)
  model StatElectricEnergySumHwc {
    value: energye;
  }

  @inherit(r)
  @ext(0x03, 0x05, 0, 0)
  model StatElectricEnergySumCool {
    value: energye;
  }

  @inherit(r)
  @ext(0x04, 0, 0, 0)
  model StatFuelSum {
    value: energye;
  }

  @inherit(r)
  @ext(0x04, 0x03, 0, 0)
  model StatFuelSumHc {
    value: energye;
  }

  @inherit(r)
  @ext(0x04, 0x04, 0, 0)
  model StatFuelSumHwc {
    value: energye;
  }
}
