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
  // ##### general #####

  /** DisplayedRoomTemp: displayed room temperature */
  @ext(0x1b, 0)
  model DisplayedRoomTemp is ReadonlyRegister<temp>;

  /** RaumtemperaturIst: raw value current room temperature and sensorstate (without any correction) */
  @ext(0, 0)
  model RoomTemp is ReadonlyRegister<tempsensor>;

  /** DesiredHCRoomSetPoint: current room setpoint */
  @ext(0x1d, 0)
  model DesiredHcRoomTempDesired is ReadonlyRegister<temp>;

  /** HCRoomSetPointAdjustable: room temperature setpoint is currently adjustable */
  @ext(0x1e, 0)
  model HcRoomTempDesiredAdjustable is ReadonlyRegister<yesno>;

  /** HCActiveSpecialFunction: if unequal zero a special function (e.g. holidays, floor pavement drying …) has been activated */
  @ext(0x1f, 0)
  model HcActiveSpecialFunction is ReadonlyRegister<UCH>;

  /** OperatingMode430 */
  @inherit(r, w)
  @ext(0x4, 0)
  model OperatingMode430 {
    /** operation mode of the heating circuit for 430 */
    @values(Values_OperatingMode430)
    value: UCH;
  }
  // ##### extra #####

  /** SelectedHeatCircuit: number of heating circuit to which this remote control is assigned */
  @ext(0x1c, 0)
  model SelectedHc is ReadonlyRegister<UCH>;

  /** RaumtemperaturIstOffset: room temperature correction */
  @ext(0x2, 0)
  model RoomTempOffset is Register<temp>;
  // ##### developer's info #####

  /** RaumTempOffsetEigenErwaerm: room temperature intrinsic heating offset */
  @ext(1, 0)
  model RoomTempOffsetSelfWarming is ReadonlyRegister<temp>;

  /** MaxStackeBUSTask: maximum number of bytes needed for the eBUS task stack */
  @ext(0xc, 0)
  model StackeBUSTaskMax is ReadonlyRegister<UCH>;

  /** MaxStackMainTask: maximum number of bytes needed for the main task stack */
  @ext(0xd, 0)
  model StackMainTaskMax is ReadonlyRegister<UCH>;

  /** MaxStackLifeCheckTask: maximum number of bytes needed for the life check task stack */
  @ext(0xe, 0)
  model StackLifeCheckTaskMax is ReadonlyRegister<UCH>;

  /** Variant */
  @inherit(r)
  @ext(0xf, 0)
  model Variant {
    /** identifier for the variant */
    uin: UIN;

    uin_1: UIN;
  }

  /** eBUS_CRC: last calculated eBUS CRC */
  @ext(0x10, 0)
  model EBUSCRC is ReadonlyRegister<UCH>;

  /** eBUSFifoDiffCntMax: max. eBUS-fifo level */
  @ext(0x11, 0)
  model EBUSFifoDiffCntMax is ReadonlyRegister<UCH>;

  /** EEpromMaxInkonsCnt: EEPROM inconsistency counter */
  @ext(0x13, 0)
  model EEpromMaxInkonsCnt is ReadonlyRegister<UIN>;

  /** POCResetCnt: power on resets */
  @ext(0x14, 0)
  model POCResetCnt is ReadonlyRegister<UIN>;

  /** WDResetCnt: watchdog resets */
  @ext(0x15, 0)
  model WDResetCnt is ReadonlyRegister<UIN>;

  /** LVResetCnt: low voltage resets */
  @ext(0x16, 0)
  model LVResetCnt is ReadonlyRegister<UIN>;

  /** CMResetCnt: clock monitor resets */
  @ext(0x17, 0)
  model CMResetCnt is ReadonlyRegister<UIN>;

  /** COMErrorCnt: eBUS-communication errors */
  @ext(0x18, 0)
  model COMErrorCnt is ReadonlyRegister<UIN>;

  /** VariantDKRefreshCnt: counts how often variant ID has been corrected */
  @ext(0x19, 0)
  model VariantDKRefreshCnt is ReadonlyRegister<UCH>;

  /** FiFoResetCnt: counter how often eBUS Fifo was cleared */
  @ext(0x1a, 0)
  model FiFoResetCnt is ReadonlyRegister<UCH>;

  enum Values_OperatingMode430 {
    off: 0,
    manual: 1,
    auto: 2,
  }
}
