import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x75)
namespace V81 {
  // ,V8100,VR 81,V81 225

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}
  // ##### general #####

  /** DisplayedRoomTemp */
  @inherit(r)
  @ext(0x1b, 0)
  model DisplayedRoomTemp {
    /** displayed room temperature */
    value: temp;
  }

  /** RaumtemperaturIst */
  @inherit(r)
  @ext(0, 0)
  model RoomTemp {
    /** raw value current room temperature and sensorstate (without any correction) */
    value: tempsensor;
  }

  /** DesiredHCRoomSetPoint */
  @inherit(r)
  @ext(0x1d, 0)
  model DesiredHcRoomTempDesired {
    /** current room setpoint */
    value: temp;
  }

  /** HCRoomSetPointAdjustable */
  @inherit(r)
  @ext(0x1e, 0)
  model HcRoomTempDesiredAdjustable {
    /** room temperature setpoint is currently adjustable */
    value: yesno;
  }

  /** HCActiveSpecialFunction */
  @inherit(r)
  @ext(0x1f, 0)
  model HcActiveSpecialFunction {
    /** if unequal zero a special function (e.g. holidays, floor pavement drying …) has been activated */
    value: UCH;
  }

  /** OperatingMode430 */
  @inherit(r, w)
  @ext(0x4, 0)
  model OperatingMode430 {
    /** operation mode of the heating circuit for 430 */
    @values(Values_OperatingMode430)
    value: UCH;
  }
  // ##### extra #####

  /** SelectedHeatCircuit */
  @inherit(r)
  @ext(0x1c, 0)
  model SelectedHc {
    /** number of heating circuit to which this remote control is assigned */
    value: UCH;
  }

  /** RaumtemperaturIstOffset */
  @inherit(r, w)
  @ext(0x2, 0)
  model RoomTempOffset {
    /** room temperature correction */
    value: temp;
  }
  // ##### developer's info #####

  /** RaumTempOffsetEigenErwaerm */
  @inherit(r)
  @ext(1, 0)
  model RoomTempOffsetSelfWarming {
    /** room temperature intrinsic heating offset */
    value: temp;
  }

  /** MaxStackeBUSTask */
  @inherit(r)
  @ext(0xc, 0)
  model StackeBUSTaskMax {
    /** maximum number of bytes needed for the eBUS task stack */
    value: UCH;
  }

  /** MaxStackMainTask */
  @inherit(r)
  @ext(0xd, 0)
  model StackMainTaskMax {
    /** maximum number of bytes needed for the main task stack */
    value: UCH;
  }

  /** MaxStackLifeCheckTask */
  @inherit(r)
  @ext(0xe, 0)
  model StackLifeCheckTaskMax {
    /** maximum number of bytes needed for the life check task stack */
    value: UCH;
  }

  /** Variant */
  @inherit(r)
  @ext(0xf, 0)
  model Variant {
    /** identifier for the variant */
    uin: UIN;

    uin_1: UIN;
  }

  /** eBUS_CRC */
  @inherit(r)
  @ext(0x10, 0)
  model EBUSCRC {
    /** last calculated eBUS CRC */
    value: UCH;
  }

  /** eBUSFifoDiffCntMax */
  @inherit(r)
  @ext(0x11, 0)
  model EBUSFifoDiffCntMax {
    /** max. eBUS-fifo level */
    value: UCH;
  }

  /** EEpromMaxInkonsCnt */
  @inherit(r)
  @ext(0x13, 0)
  model EEpromMaxInkonsCnt {
    /** EEPROM inconsistency counter */
    value: UIN;
  }

  /** POCResetCnt */
  @inherit(r)
  @ext(0x14, 0)
  model POCResetCnt {
    /** power on resets */
    value: UIN;
  }

  /** WDResetCnt */
  @inherit(r)
  @ext(0x15, 0)
  model WDResetCnt {
    /** watchdog resets */
    value: UIN;
  }

  /** LVResetCnt */
  @inherit(r)
  @ext(0x16, 0)
  model LVResetCnt {
    /** low voltage resets */
    value: UIN;
  }

  /** CMResetCnt */
  @inherit(r)
  @ext(0x17, 0)
  model CMResetCnt {
    /** clock monitor resets */
    value: UIN;
  }

  /** COMErrorCnt */
  @inherit(r)
  @ext(0x18, 0)
  model COMErrorCnt {
    /** eBUS-communication errors */
    value: UIN;
  }

  /** VariantDKRefreshCnt */
  @inherit(r)
  @ext(0x19, 0)
  model VariantDKRefreshCnt {
    /** counts how often variant ID has been corrected */
    value: UCH;
  }

  /** FiFoResetCnt */
  @inherit(r)
  @ext(0x1a, 0)
  model FiFoResetCnt {
    /** counter how often eBUS Fifo was cleared */
    value: UCH;
  }

  enum Values_OperatingMode430 {
    off: 0,
    manual: 1,
    auto: 2,
  }
}
