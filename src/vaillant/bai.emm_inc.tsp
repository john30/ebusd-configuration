import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./bai.308523_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

namespace Bai.Emm_inc {
  // ,BAI00,part that becomes available on presence of sensoDIRECT 0020274790 VRC710 ("EMM00")
  // most of this was taken from ctlv2
  // ##### General #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0, 0)
  model r_1 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0, 0)
  model w_1 {}

  /** Global System OFF */
  @inherit(r_1, wi)
  @ext(0x7, 0)
  model GlobalSystemOff {
    /** For switching system off */
    value: yesno;
  }

  /** desired room temperature in holiday for zone 1 */
  @inherit(r_1)
  @ext(0xf6, 0)
  model Z1HolidayTempStatus { // todo this can be dropped if Z1HolidayTemp works as well
    value: tempv;
  }

  /** date */
  @inherit(r_1, w_1)
  @ext(0x34, 0)
  model Date {
    /** current date */
    value: date;
  }

  /** time */
  @inherit(r_1, w_1)
  @ext(0x35, 0)
  model Time {
    /** current time */
    value: HTI;
  }

  /** water pressure */
  @inherit(r_1)
  @ext(0x39, 0)
  model WaterPressure {
    /** water pressure */
    value: pressv;
  }

  /** outside temperature */
  @inherit(r_1)
  @ext(0x73, 0)
  model DisplayedOutsideTemp {
    /** outside temperature */
    value: tempv;
  }
  // ##### hot water circuit #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 1, 0)
  model r_2 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 1, 0)
  model w_2 {}

  /** HwcOpMode */
  @inherit(r_2, w_2)
  @ext(0x3, 0)
  model HwcOpMode {
    /** operation mode of Hwc */
    value: opmode;
  }

  /** gewünschte Temperatur Warmwasserkreis */
  @inherit(r_2, w_2)
  @ext(0x4, 0)
  model HwcTempDesired {
    /** setpoint of domestic hot water circuit */
    value: tempv;
  }

  /** HwcStorageTemp */
  @inherit(r_2)
  @ext(0x5, 0)
  model HwcStorageTemp {
    /** current hot water storage temperature */
    value: tempv;
  }

  /** hwc holiday start period */
  @inherit(r_2, w_2)
  @ext(0x9, 0)
  model HwcHolidayStartPeriod {
    /** start date of holidays */
    value: hfrom;
  }

  /** hwc holiday end period */
  @inherit(r_2, w_2)
  @ext(0xa, 0)
  model HwcHolidayEndPeriod {
    /** end date of holidays */
    value: hto;
  }

  /** hwc SF mode */
  @inherit(r_2, w_2)
  @ext(0xd, 0)
  model HwcSFMode {
    value: sfmode;
  }
  // ##### zone 1 #####

  /** default *r */
  @base(MF, 0x24, 0x2, 0, 0x3, 0)
  model r_3 {
    @maxLength(4)
    ign: IGN;
  }

  /** default *w */
  @write
  @base(MF, 0x24, 0x2, 1, 0x3, 0)
  model w_3 {}

  /** Ferienzeitraum Start Zone 1 */
  @inherit(r_3, w_3)
  @ext(0x3, 0)
  model Z1HolidayStartPeriod {
    /** start date of holidays for zone 1 */
    value: hfrom;
  }

  /** Ferienzeitraum Ende Zone 1 */
  @inherit(r_3, w_3)
  @ext(0x4, 0)
  model Z1HolidayEndPeriod {
    /** end date of holidays for zone 1 */
    value: hto;
  }

  /** Raumsollwert Ferienbetrieb Zone 1 (untested) */
  @inherit(r_3, w_3)
  @ext(0x5, 0)
  model Z1HolidayTemp {
    /** holiday setpoint for zone 1 */
    value: tempv;
  }

  /** Betriebsart Zone 1 */
  @inherit(r_3, w_3)
  @ext(0x6, 0)
  model Z1OpMode {
    /** operation mode of zone 1 */
    value: opmode;
  }

  /** Quick Veto Temperatur Zone 1 */
  @inherit(r_3, w_3)
  @ext(0x8, 0)
  model Z1QuickVetoTemp {
    /** manual override setpoint for zone 1 */
    value: tempv;
  }

  /** Duration of Quick Veto mode Zone 1 */
  @inherit(r_3, w_3)
  @ext(0x26, 0)
  model Z1QuickVetoDuration {
    /** valid values are 0.5-12 in steps of 0.5 and writing enables quick veto mode */
    @unit("h")
    value: EXP;
  }

  /** Quick Veto end time Zone 1 */
  @inherit(r_3)
  @ext(0x1e, 0)
  model Z1QuickVetoEndTime {
    value: HTI;
  }

  /** Quick Veto end date Zone 1 */
  @inherit(r_3)
  @ext(0x24, 0)
  model Z1QuickVetoEndDate {
    value: date;
  }

  /** Absenktemperatur Zone 1 */
  @inherit(r_3, w_3)
  @ext(0x9, 0)
  model Z1NightTemp {
    /** night setpoint for zone 1 */
    value: tempv;
  }

  /** Bank Feiertag Start Zone 1 (untested) */
  @inherit(r_3, w_3)
  @ext(0xc, 0)
  model Z1BankHolidayStartPeriod {
    /** start date of bank holidays for zone 1 */
    value: hfrom;
  }

  /** Bank Feiertag Ende Zone 1 (untested) */
  @inherit(r_3, w_3)
  @ext(0xd, 0)
  model Z1BankHolidayEndPeriod {
    /** end date of bank holidays for zone 1 */
    value: hto;
  }

  /** SF mode zone 1 */
  @inherit(r_3, w_3)
  @ext(0xe, 0)
  model Z1SFMode {
    value: sfmode;
  }

  /** Raumisttemperatur Zone 1 (untested) */
  @inherit(r_3)
  @ext(0xf, 0)
  model Z1RoomTemp {
    /** aktuelle Raumtemperatur in Zone 1 */
    value: tempv;
  }

  /** Ventilstatus Zone 1 (untested) */
  @inherit(r_3, w_3)
  @ext(0x12, 0)
  model Z1ValveStatus {
    /** valve status of zone 1 */
    value: UCH;
  }

  /** Raumregler Zuordnung Zone 1 (untested) */
  @inherit(r_3, w_3)
  @ext(0x13, 0)
  model Z1RoomZoneMapping {
    /** configures which room temperature is assigned to zone 1 */
    value: zmapping;
  }

  /** Raumsolltemperatur Zone 1 */
  @inherit(r_3, w_3)
  @ext(0x14, 0)
  model Z1ActualRoomTempDesired {
    /** current room setpoint considering all basic conditions passed to the control algorithms */
    value: tempv;
  }

  /** Kurzbezeichnung Zone 1 (untested) */
  @inherit(r_3, w_3)
  @ext(0x16, 0)
  model Z1Shortname {
    /** short name of zone 1 */
    value: shortname;
  }

  /** Bezeichnung Zone 1 Teil 1 */
  @inherit(r_3, w_3)
  @ext(0x17, 0)
  model Z1Name1 {
    /** name of zone 1 */
    value: zname;
  }

  /** Bezeichnung Zone 1 Teil 2 */
  @inherit(r_3, w_3)
  @ext(0x18, 0)
  model Z1Name2 {
    /** name of zone 1 */
    value: zname;
  }

  /** Solltemperatur Zone 1 */
  @inherit(r_3, w_3)
  @ext(0x22, 0)
  model Z1DayTemp {
    /** day setpoint for zone 1 */
    value: tempv;
  }
  // timers hot water

  /** default *r */
  @base(MF, 0x55, 0xa5, 0, 0x2)
  model r_4 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0, 0x2)
  model w_4 {}

  /** timer Anzahl */
  @id(MF, 0x55, 0xa4, 0, 0x2)
  model HwcTimer_Timeframes {
    /** Amount of configured slots per weekday */
    value: slotCountWeek;
  }

  /** timer monday 1 */
  @inherit(r_4)
  @ext(0, 0)
  model HwcTimer_Monday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer monday 2 */
  @inherit(r_4)
  @ext(0, 1)
  model HwcTimer_Monday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer monday 3 */
  @inherit(r_4)
  @ext(0, 0x2)
  model HwcTimer_Monday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer tuesday 1 */
  @inherit(r_4)
  @ext(1, 0)
  model HwcTimer_Tuesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer tuesday 2 */
  @inherit(r_4)
  @ext(1, 1)
  model HwcTimer_Tuesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer tuesday 3 */
  @inherit(r_4)
  @ext(1, 0x2)
  model HwcTimer_Tuesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer wednesday 1 */
  @inherit(r_4)
  @ext(0x2, 0)
  model HwcTimer_Wednesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer wednesday 2 */
  @inherit(r_4)
  @ext(0x2, 1)
  model HwcTimer_Wednesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer wednesday 3 */
  @inherit(r_4)
  @ext(0x2, 0x2)
  model HwcTimer_Wednesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer thursday 1 */
  @inherit(r_4)
  @ext(0x3, 0)
  model HwcTimer_Thursday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer thursday 2 */
  @inherit(r_4)
  @ext(0x3, 1)
  model HwcTimer_Thursday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer thursday 3 */
  @inherit(r_4)
  @ext(0x3, 0x2)
  model HwcTimer_Thursday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer friday 1 */
  @inherit(r_4)
  @ext(0x4, 0)
  model HwcTimer_Friday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer friday 2 */
  @inherit(r_4)
  @ext(0x4, 1)
  model HwcTimer_Friday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer friday 3 */
  @inherit(r_4)
  @ext(0x4, 0x2)
  model HwcTimer_Friday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer saturday 1 */
  @inherit(r_4)
  @ext(0x5, 0)
  model HwcTimer_Saturday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer saturday 2 */
  @inherit(r_4)
  @ext(0x5, 1)
  model HwcTimer_Saturday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer saturday 3 */
  @inherit(r_4)
  @ext(0x5, 0x2)
  model HwcTimer_Saturday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer sunday 1 */
  @inherit(r_4)
  @ext(0x6, 0)
  model HwcTimer_Sunday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer sunday 2 */
  @inherit(r_4)
  @ext(0x6, 1)
  model HwcTimer_Sunday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer sunday 3 */
  @inherit(r_4)
  @ext(0x6, 0x2)
  model HwcTimer_Sunday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer monday (untested) */
  @inherit(w_4)
  @ext(0)
  model HwcTimer_Monday {
    value: wTimeSlotWithTemp;
  }

  /** timer tuesday (untested) */
  @inherit(w_4)
  @ext(1)
  model HwcTimer_Tuesday {
    value: wTimeSlotWithTemp;
  }

  /** timer wednesday (untested) */
  @inherit(w_4)
  @ext(0x2)
  model HwcTimer_Wednesday {
    value: wTimeSlotWithTemp;
  }

  /** timer thursday (untested) */
  @inherit(w_4)
  @ext(0x3)
  model HwcTimer_Thursday {
    value: wTimeSlotWithTemp;
  }

  /** timer friday (untested) */
  @inherit(w_4)
  @ext(0x4)
  model HwcTimer_Friday {
    value: wTimeSlotWithTemp;
  }

  /** timer saturday (untested) */
  @inherit(w_4)
  @ext(0x5)
  model HwcTimer_Saturday {
    value: wTimeSlotWithTemp;
  }

  /** timer sunday (untested) */
  @inherit(w_4)
  @ext(0x6)
  model HwcTimer_Sunday {
    value: wTimeSlotWithTemp;
  }
  // timers circulation pump

  /** default *r */
  @base(MF, 0x55, 0xa5, 0, 0x3)
  model r_5 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0, 0x3)
  model w_5 {}

  /** timer Anzahl */
  @id(MF, 0x55, 0xa4, 0, 0x3)
  model CcTimer_Timeframes {
    /** Amount of configured slots per weekday */
    value: slotCountWeek;
  }

  /** timer monday 1 */
  @inherit(r_5)
  @ext(0, 0)
  model CcTimer_Monday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer monday 2 */
  @inherit(r_5)
  @ext(0, 1)
  model CcTimer_Monday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer monday 3 */
  @inherit(r_5)
  @ext(0, 0x2)
  model CcTimer_Monday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer tuesday 1 */
  @inherit(r_5)
  @ext(1, 0)
  model CcTimer_Tuesday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer tuesday 2 */
  @inherit(r_5)
  @ext(1, 1)
  model CcTimer_Tuesday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer tuesday 3 */
  @inherit(r_5)
  @ext(1, 0x2)
  model CcTimer_Tuesday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer wednesday 1 */
  @inherit(r_5)
  @ext(0x2, 0)
  model CcTimer_Wednesday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer wednesday 2 */
  @inherit(r_5)
  @ext(0x2, 1)
  model CcTimer_Wednesday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer wednesday 3 */
  @inherit(r_5)
  @ext(0x2, 0x2)
  model CcTimer_Wednesday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer thursday 1 */
  @inherit(r_5)
  @ext(0x3, 0)
  model CcTimer_Thursday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer thursday 2 */
  @inherit(r_5)
  @ext(0x3, 1)
  model CcTimer_Thursday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer thursday 3 */
  @inherit(r_5)
  @ext(0x3, 0x2)
  model CcTimer_Thursday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer friday 1 */
  @inherit(r_5)
  @ext(0x4, 0)
  model CcTimer_Friday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer friday 2 */
  @inherit(r_5)
  @ext(0x4, 1)
  model CcTimer_Friday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer friday 3 */
  @inherit(r_5)
  @ext(0x4, 0x2)
  model CcTimer_Friday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer saturday 1 */
  @inherit(r_5)
  @ext(0x5, 0)
  model CcTimer_Saturday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer saturday 2 */
  @inherit(r_5)
  @ext(0x5, 1)
  model CcTimer_Saturday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer saturday 3 */
  @inherit(r_5)
  @ext(0x5, 0x2)
  model CcTimer_Saturday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer sunday 1 */
  @inherit(r_5)
  @ext(0x6, 0)
  model CcTimer_Sunday0 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer sunday 2 */
  @inherit(r_5)
  @ext(0x6, 1)
  model CcTimer_Sunday1 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer sunday 3 */
  @inherit(r_5)
  @ext(0x6, 0x2)
  model CcTimer_Sunday2 {
    value: rTimeSlotWithoutTemp;
  }

  /** timer monday (untested) */
  @inherit(w_5)
  @ext(0)
  model CcTimer_Monday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer tuesday (untested) */
  @inherit(w_5)
  @ext(1)
  model CcTimer_Tuesday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer wednesday (untested) */
  @inherit(w_5)
  @ext(0x2)
  model CcTimer_Wednesday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer thursday (untested) */
  @inherit(w_5)
  @ext(0x3)
  model CcTimer_Thursday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer friday (untested) */
  @inherit(w_5)
  @ext(0x4)
  model CcTimer_Friday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer saturday (untested) */
  @inherit(w_5)
  @ext(0x5)
  model CcTimer_Saturday {
    value: wTimeSlotWithoutTemp;
  }

  /** timer sunday (untested) */
  @inherit(w_5)
  @ext(0x6)
  model CcTimer_Sunday {
    value: wTimeSlotWithoutTemp;
  }
  // timers zone 1

  /** default *r */
  @base(MF, 0x55, 0xa5, 0, 0)
  model r_6 {}

  /** default *w */
  @write
  @base(MF, 0x55, 0xa6, 0, 0)
  model w_6 {}

  /** timer Anzahl */
  @id(MF, 0x55, 0xa4, 0, 0)
  model Z1Timer_Timeframes {
    /** Amount of configured slots per weekday */
    value: slotCountWeek;
  }

  /** timer heating monday 1 */
  @inherit(r_6)
  @ext(0, 0)
  model Z1Timer_Monday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday 2 */
  @inherit(r_6)
  @ext(0, 1)
  model Z1Timer_Monday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday 3 */
  @inherit(r_6)
  @ext(0, 0x2)
  model Z1Timer_Monday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 1 */
  @inherit(r_6)
  @ext(1, 0)
  model Z1Timer_Tuesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 2 */
  @inherit(r_6)
  @ext(1, 1)
  model Z1Timer_Tuesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating tuesday 3 */
  @inherit(r_6)
  @ext(1, 0x2)
  model Z1Timer_Tuesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 1 */
  @inherit(r_6)
  @ext(0x2, 0)
  model Z1Timer_Wednesday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 2 */
  @inherit(r_6)
  @ext(0x2, 1)
  model Z1Timer_Wednesday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating wednesday 3 */
  @inherit(r_6)
  @ext(0x2, 0x2)
  model Z1Timer_Wednesday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 1 */
  @inherit(r_6)
  @ext(0x3, 0)
  model Z1Timer_Thursday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 2 */
  @inherit(r_6)
  @ext(0x3, 1)
  model Z1Timer_Thursday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating thursday 3 */
  @inherit(r_6)
  @ext(0x3, 0x2)
  model Z1Timer_Thursday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 1 */
  @inherit(r_6)
  @ext(0x4, 0)
  model Z1Timer_Friday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 2 */
  @inherit(r_6)
  @ext(0x4, 1)
  model Z1Timer_Friday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating friday 3 */
  @inherit(r_6)
  @ext(0x4, 0x2)
  model Z1Timer_Friday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 1 */
  @inherit(r_6)
  @ext(0x5, 0)
  model Z1Timer_Saturday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 2 */
  @inherit(r_6)
  @ext(0x5, 1)
  model Z1Timer_Saturday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating saturday 3 */
  @inherit(r_6)
  @ext(0x5, 0x2)
  model Z1Timer_Saturday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 1 */
  @inherit(r_6)
  @ext(0x6, 0)
  model Z1Timer_Sunday0 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 2 */
  @inherit(r_6)
  @ext(0x6, 1)
  model Z1Timer_Sunday1 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating sunday 3 */
  @inherit(r_6)
  @ext(0x6, 0x2)
  model Z1Timer_Sunday2 {
    value: rTimeSlotWithTemp;
  }

  /** timer heating monday (untested) */
  @inherit(w_6)
  @ext(0)
  model Z1Timer_Monday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating tuesday (untested) */
  @inherit(w_6)
  @ext(1)
  model Z1Timer_Tuesday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating wednesday (untested) */
  @inherit(w_6)
  @ext(0x2)
  model Z1Timer_Wednesday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating thursday (untested) */
  @inherit(w_6)
  @ext(0x3)
  model Z1Timer_Thursday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating friday (untested) */
  @inherit(w_6)
  @ext(0x4)
  model Z1Timer_Friday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating saturday (untested) */
  @inherit(w_6)
  @ext(0x5)
  model Z1Timer_Saturday {
    value: wTimeSlotWithTemp;
  }

  /** timer heating sunday (untested) */
  @inherit(w_6)
  @ext(0x6)
  model Z1Timer_Sunday {
    value: wTimeSlotWithTemp;
  }

  // ##### consumption #####

  /** default *r */
  @base(MF, 0x16, 0x10, 0, 0xff, 0xff)
  model r_7 {
    @maxLength(7)
    ign: IGN;
  }

  /** fuel consumption heating */
  @inherit(r_7)
  @ext(0x84, 0x3, 0, 0)
  model PrFuelSumHc {
    value: energye;
  }

  /** energy consumption heating */
  @inherit(r_7)
  @ext(0x83, 0x3, 0, 0)
  model PrEnergySumHc {
    value: energye;
  }

  /** yield heating */
  @inherit(r_7)
  @ext(0x49, 0x3, 0, 0)
  model YieldHc {
    value: energye;
  }

  /** fuel consumption hot water */
  @inherit(r_7)
  @ext(0x84, 0x4, 0, 0)
  model PrFuelSumHwc {
    value: energye;
  }

  /** energy consumption hot water */
  @inherit(r_7)
  @ext(0x83, 0x4, 0, 0)
  model PrEnergySumHwc {
    value: energye;
  }

  /** yield hot water */
  @inherit(r_7)
  @ext(0x49, 0x4, 0, 0)
  model YieldHwc {
    value: energye;
  }
}
