import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Ochsner;

// @zz(0x15)
namespace _22102 {
  // ,22102,OTE 2,22102 1001 472

  /** default *r */
  @base(0x6, 0x21, 0)
  model r {}

  /** outside temperature */
  @inherit(r)
  @ext(0x80, 0, 0x40)
  model OutsideTemp {
    param: param;
    temp: tempt;
  }

  /** hot water temperature */
  @inherit(r)
  @ext(0x84, 0, 0x40)
  model WaterTemp {
    param: param;
    temp: tempt;
  }

  /** flow temperature */
  @inherit(r)
  @ext(0xe0, 0, 0x40)
  model FlowTemp {
    param: param;
    temp: tempt;
  }

  /** default *r */
  @base(0x6, 0x21, 0x77)
  model r_1 {}

  @inherit(r_1)
  @ext(0x80, 0, 0x8)
  model Status {
    param: param;
    status: status;
  }

  @inherit(r_1)
  @ext(0x81, 0, 0x8)
  model HcOutsideTemp {
    param: param;
    temp: tempt;
  }

  @inherit(r_1)
  @ext(0x82, 0, 0x8)
  model HcOutsideTempAvg {
    param: param;
    temp: tempt;
  }

  @inherit(r_1)
  @ext(0x83, 0, 0x8)
  model RoomTemp {
    param: param;
    temp: tempt;
  }

  @inherit(r_1)
  @ext(0x84, 0, 0x8)
  model DesiredRoomTemp {
    param: param;
    temp: tempt;
  }

  @inherit(r_1)
  @ext(0x85, 0, 0x8)
  model HcFlowTemp {
    param: param;
    temp: tempt;
  }

  @inherit(r_1)
  @ext(0x86, 0, 0x8)
  model DesiredFlowTemp {
    param: param;
    temp: tempt;
  }

  @inherit(r_1)
  @ext(0x87, 0, 0x8)
  model Humidity {
    param: param;
    humidity: humidity;
  }

  /** default *r */
  @base(0x6, 0x21, 0x79)
  model r_2 {}

  @inherit(r_2)
  @ext(0x80, 0, 0xe)
  model HwcStatus {
    param: param;
    status: status;
  }

  @inherit(r_2)
  @ext(0x81, 0, 0xe)
  model HwcTemp {
    param: param;
    temp: tempt;
  }

  @inherit(r_2)
  @ext(0x82, 0, 0xe)
  model DesiredHwcTemp {
    param: param;
    temp: tempt;
  }

  /** default *r */
  @base(0x6, 0x21, 0x7a)
  model r_3 {}

  @inherit(r_3)
  @ext(0x80, 0, 0x10)
  model StoreTempTop {
    param: param;
    temp: tempt;
  }

  @inherit(r_3)
  @ext(0x81, 0, 0x10)
  model StoreTempBottom {
    param: param;
    temp: tempt;
  }

  @inherit(r_3)
  @ext(0x82, 0, 0x10)
  model StoreFlow {
    param: param;
    temp: tempt;
  }

  @inherit(r_3)
  @ext(0x83, 0, 0x10)
  model DesiredStoreFlow {
    param: param;
    temp: tempt;
  }

  @inherit(r_3)
  @ext(0x84, 0, 0x10)
  model HcPart {
    param: param;
    percent100: percent100;
  }

  @inherit(r_3)
  @ext(0x85, 0, 0x10)
  model HwcPart {
    param: param;
    percent100: percent100;
  }

  @inherit(r_3)
  @ext(0x86, 0, 0x10)
  model StoreStatus {
    param: param;
    status: status;
  }

  /** default *r */
  @base(0x6, 0x21, 0x7d)
  model r_4 {}

  @id(0x6, 0x21, 0x2, 0xb5, 0, 0x40)
  model HpMode {
    param: param;
    status: hpstatus;
  }

  @inherit(r_4)
  @ext(0x80, 0, 0x2)
  model HpStatus {
    param: param;
    status: status;
  }

  @inherit(r_4)
  @ext(0x81, 0, 0x2)
  model HpFlowTemp {
    param: param;
    temp: tempt;
  }

  @inherit(r_4)
  @ext(0x82, 0, 0x2)
  model DesiredHpFlow {
    param: param;
    temp: tempt;
  }

  @inherit(r_4)
  @ext(0x83, 0, 0x2)
  model HpReturnTemp {
    param: param;
    temp: tempt;
  }

  @inherit(r_4)
  @ext(0x84, 0, 0x2)
  model HpSourceTempIn {
    param: param;
    temp: tempt;
  }

  @inherit(r_4)
  @ext(0x85, 0, 0x2)
  model HpSourceTempOut {
    param: param;
    temp: tempt;
  }

  @inherit(r_4)
  @ext(0x86, 0, 0x2)
  model HpCycles {
    param: param;
    cycles: cycles;
  }

  @inherit(r_4)
  @ext(0x87, 0, 0x2)
  model HpHours {
    param: param;
    hours: hours;
  }

  @inherit(r_4)
  @ext(0x88, 0, 0x2)
  model HpVolume1 {
    param: param;
    volume: volume;
  }

  @inherit(r_4)
  @ext(0x89, 0, 0x2)
  model HpVolume2 {
    param: param;
    volume: volume;
  }

  @inherit(r_4)
  @ext(0x8a, 0, 0x2)
  model HpHeatKwh {
    param: param;
    kwh: kwh;
  }

  @inherit(r_4)
  @ext(0x8b, 0, 0x2)
  model HpHeatMwh {
    param: param;
    mwh: mwh;
  }

  @inherit(r_4)
  @ext(0x8c, 0, 0x2)
  model HpCoolKwh {
    param: param;
    kwh: kwh;
  }

  @inherit(r_4)
  @ext(0x8d, 0, 0x2)
  model HpCoolMwh {
    param: param;
    mwh: mwh;
  }

  @inherit(r_4)
  @ext(0x8e, 0, 0x2)
  model HpWaterKwh {
    param: param;
    kwh: kwh;
  }

  @inherit(r_4)
  @ext(0x8f, 0, 0x2)
  model HpWaterMwh {
    param: param;
    mwh: mwh;
  }
}
