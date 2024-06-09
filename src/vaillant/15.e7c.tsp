import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.num;
using Ebus.dtm;
using Ebus.str;
namespace vaillant;

@zz(0x15)
namespace e7c {
  // ,E7C00,Thermolink P (New)

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *wi for user level "install" */
  @write
  @auth("install")
  @base(MF, 0x9, 0xe)
  model wi {}
  // ##### general #####

  /** Heating Schedule Enable */
  @inherit(r, w)
  @ext(0x2, 0)
  model HeatingScheduleEnable {
    /** Heating Schedule Enable */
    value: onoff;
  }

  /** Heating Enable */
  @inherit(r, w)
  @ext(0x3, 0)
  model HeatingEnable {
    /** Heating Enable */
    value: onoff;
  }

  /** Heating Temp Manual Set */
  @inherit(r, w)
  @ext(0x22, 0)
  model HeatingTempSet {
    /** Heating Temp Manual Set */
    value: temp;
  }

  /** Heating Override Enable */
  @inherit(r, w)
  @ext(0x23, 0)
  model HeatingOverrideEnable {
    /** Heating Override Enable */
    value: onoff;
  }

  /** Heating Override Temp */
  @inherit(r, w)
  @ext(0x24, 0)
  model HeatingOverrideTemp {
    /** Heating Override Temp */
    value: temp;
  }

  /** Heating Override End Time */
  @inherit(r, w)
  @ext(0x25, 0)
  model HeatingOverrideEndTime {
    /** Heating Override End Time */
    value: DTM;
  }

  /** Keyboard Lock Enable */
  @inherit(r, w)
  @ext(0x2a, 0)
  model KeyboardLockEnable {
    /** Keyboard Lock Enable */
    value: onoff;
  }

  /** Contrast */
  @inherit(r, w)
  @ext(0x2b, 0)
  model Contrast {
    /** Contrast */
    value: UCH;
  }

  /** Brightness */
  @inherit(r, w)
  @ext(0x2c, 0)
  model Brightness {
    /** Brightness */
    value: UCH;
  }

  /** Time & Date */
  @inherit(r, w)
  @ext(0x2e, 0)
  model Time_Date {
    /** Time & Date */
    value: DTM;
  }

  /** Date Format */
  @inherit(r, w)
  @ext(0x2d, 0)
  model DateFormat {
    /** Date format 1-dd.mm.yyyy 2-yyyy.mm.dd */
    value: UCH;
  }

  /** weekday */
  @inherit(r, w)
  @ext(0x2f, 0)
  model Weekday {
    /** weekday */
    value: bday;
  }

  /** Room Name */
  @inherit(r, w)
  @ext(0x30, 0)
  model RoomName {
    /** Room Name */
    @maxLength(14)
    value: STR;
  }

  /** Language */
  @inherit(r, w)
  @ext(0x31, 0)
  model Language {
    /** Language */
    @values(values_Language)
    value: UCH;
  }

  /** Room Temp */
  @inherit(r)
  @ext(0x3a, 0)
  model RoomTemp {
    /** Room Temp */
    value: tempsensor;
  }

  /** DisplayedRoomTemp */
  @inherit(r)
  @ext(0x3b, 0)
  model DisplayedRoomTemp {
    /** DisplayedRoomTemp */
    value: temp;
  }

  /** Outside Temp */
  @inherit(r)
  @ext(0x3c, 0)
  model OutsideTemp {
    /** Outside Temp */
    value: tempsensor;
  }

  /** DHW Temp Manual Set */
  @inherit(r, w)
  @ext(0x40, 0)
  model DHWTempSet {
    /** DHW Temp Manual Set */
    value: temp;
  }

  /** DHW Enable */
  @inherit(r, w)
  @ext(0x41, 0)
  model DHWEnable {
    /** DHW Enable */
    value: onoff;
  }

  /** DHW Schedule Enable */
  @inherit(r, w)
  @ext(0x42, 0)
  model DHWScheduleEnable {
    /** DHW Schedule Enable */
    value: onoff;
  }

  /** DHW Override Enable */
  @inherit(r, w)
  @ext(0x51, 0)
  model DHWOverrideEnable {
    /** DHW Override Enable */
    value: onoff;
  }

  /** DHW Override State */
  @inherit(r, w)
  @ext(0x52, 0)
  model DHWOverrideState {
    /** DHW Override State */
    value: onoff;
  }

  /** DHW Override End Time */
  @inherit(r, w)
  @ext(0x53, 0)
  model DHWOverrideEndTime {
    /** DHW Override End Time */
    value: DTM;
  }

  /** Vacation Enable */
  @inherit(r, w)
  @ext(0x54, 0)
  model VacationEnable {
    /** Vacation Enable */
    value: onoff;
  }

  /** Vacation Start Time */
  @inherit(r, w)
  @ext(0x55, 0)
  model VacationStartTime {
    /** Vacation Start Time */
    value: DTM;
  }

  /** Vacation End Time */
  @inherit(r, w)
  @ext(0x57, 0)
  model VacationEndTime {
    /** Vacation End Time */
    value: DTM;
  }

  /** Vacation Temp Manual Set */
  @inherit(r, w)
  @ext(0x58, 0)
  model VacationTempSet {
    /** Vacation Temp Manual Set */
    value: temp;
  }

  /** Heating Temp 1 */
  @inherit(r, w)
  @ext(0x73, 0)
  model HeatingTemp1 {
    /** Heating Temp 1 */
    value: temp;
  }

  /** Heating Temp 2 */
  @inherit(r, w)
  @ext(0x74, 0)
  model HeatingTemp2 {
    /** Heating Temp 2 */
    value: temp;
  }
  // ##### schedules #####

  /** Monday heating time */
  @inherit(r, w)
  @ext(0x5, 0)
  model MondayHeatingTime {
    /** Monday heating time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Tuesday heating time */
  @inherit(r, w)
  @ext(0x6, 0)
  model TuesdayHeatingTime {
    /** Tuesday heating time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Wednesday heating time */
  @inherit(r, w)
  @ext(0x7, 0)
  model WednesdayHeatingTime {
    /** Wednesday heating time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Thursday heating time */
  @inherit(r, w)
  @ext(0x8, 0)
  model ThursdayHeatingTime {
    /** Thursday heating time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Friday heating time */
  @inherit(r, w)
  @ext(0x9, 0)
  model FridayHeatingTime {
    /** Friday heating time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Saturday heating time */
  @inherit(r, w)
  @ext(0xa, 0)
  model SaturdayHeatingTime {
    /** Saturday heating time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Sunday heating time */
  @inherit(r, w)
  @ext(0xb, 0)
  model SundayHeatingTime {
    /** Sunday heating time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Monday Heating Temp */
  @inherit(r, w)
  @ext(0xc, 0)
  model MondayHeatingTemp {
    /** Monday heating temperatures */
    temp: temp;

    temp_1: temp;
    temp_2: temp;
    temp_3: temp;
    temp_4: temp;
    temp_5: temp;
    temp_6: temp;
  }

  /** Tuesday Heating Temp */
  @inherit(r, w)
  @ext(0xd, 0)
  model TuesdayHeatingTemp {
    /** Tuesday heating temperatures */
    temp: temp;

    temp_1: temp;
    temp_2: temp;
    temp_3: temp;
    temp_4: temp;
    temp_5: temp;
    temp_6: temp;
  }

  /** Wednesday Heating Temp */
  @inherit(r, w)
  @ext(0xe, 0)
  model WednesdayHeatingTemp {
    /** Wednesday heating temperatures */
    temp: temp;

    temp_1: temp;
    temp_2: temp;
    temp_3: temp;
    temp_4: temp;
    temp_5: temp;
    temp_6: temp;
  }

  /** Thursday Heating Temp */
  @inherit(r, w)
  @ext(0xf, 0)
  model ThursdayHeatingTemp {
    /** Thursday heating temperatures */
    temp: temp;

    temp_1: temp;
    temp_2: temp;
    temp_3: temp;
    temp_4: temp;
    temp_5: temp;
    temp_6: temp;
  }

  /** Friday Heating Temp */
  @inherit(r, w)
  @ext(0x10, 0)
  model FridayHeatingTemp {
    /** Friday heating temperatures */
    temp: temp;

    temp_1: temp;
    temp_2: temp;
    temp_3: temp;
    temp_4: temp;
    temp_5: temp;
    temp_6: temp;
  }

  /** Saturday Heating Temp */
  @inherit(r, w)
  @ext(0x11, 0)
  model SaturdayHeatingTemp {
    /** Saturday heating temperatures */
    temp: temp;

    temp_1: temp;
    temp_2: temp;
    temp_3: temp;
    temp_4: temp;
    temp_5: temp;
    temp_6: temp;
  }

  /** Sunday Heating Temp */
  @inherit(r, w)
  @ext(0x12, 0)
  model SundayHeatingTemp {
    /** Sunday heating temperatures */
    temp: temp;

    temp_1: temp;
    temp_2: temp;
    temp_3: temp;
    temp_4: temp;
    temp_5: temp;
    temp_6: temp;
  }

  /** Monday DHW time */
  @inherit(r, w)
  @ext(0x43, 0)
  model MondayDHWTime {
    /** Monday DHW time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Tuesday DHW time */
  @inherit(r, w)
  @ext(0x44, 0)
  model TuesdayDHWTime {
    /** Tuesday DHW time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Wednesday DHW time */
  @inherit(r, w)
  @ext(0x45, 0)
  model WednesdayDHWTime {
    /** Wednesday DHW time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Thursday DHW time */
  @inherit(r, w)
  @ext(0x46, 0)
  model ThursdayDHWTime {
    /** Thursday DHW time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Friday DHW time */
  @inherit(r, w)
  @ext(0x47, 0)
  model FridayDHWTime {
    /** Friday DHW time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Saturday DHW time */
  @inherit(r, w)
  @ext(0x48, 0)
  model SaturdayDHWTime {
    /** Saturday DHW time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Sunday DHW time */
  @inherit(r, w)
  @ext(0x49, 0)
  model SundayDHWTime {
    /** Sunday DHW time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Monday DHW state */
  @inherit(r, w)
  @ext(0x4a, 0)
  model MondayDHWState {
    /** Monday DHW state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Tuesday DHW state */
  @inherit(r, w)
  @ext(0x4b, 0)
  model TuesdayDHWState {
    /** Tuesday DHW state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Wednesday DHW state */
  @inherit(r, w)
  @ext(0x4c, 0)
  model WednesdayDHWState {
    /** Wednesday DHW state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Thursday DHW state */
  @inherit(r, w)
  @ext(0x4d, 0)
  model ThursdayDHWState {
    /** Thursday DHW state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Friday DHW state */
  @inherit(r, w)
  @ext(0x4e, 0)
  model FridayDHWState {
    /** Friday DHW state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Saturday DHW state */
  @inherit(r, w)
  @ext(0x4f, 0)
  model SaturdayDHWState {
    /** Saturday DHW state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Sunday DHW state */
  @inherit(r, w)
  @ext(0x50, 0)
  model SundayDHWState {
    /** Sunday DHW state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Monday recirculation time */
  @inherit(r, wi)
  @ext(0x7a, 0)
  model MondayRecirculationTime {
    /** Monday recirculation time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Tuesday recirculation time */
  @inherit(r, wi)
  @ext(0x7b, 0)
  model TuesdayRecirculationTime {
    /** Tuesday recirculation time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Wednesday recirculation time */
  @inherit(r, wi)
  @ext(0x7c, 0)
  model WednesdayRecirculationTime {
    /** Wednesday recirculation time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Thursday recirculation time */
  @inherit(r, wi)
  @ext(0x7d, 0)
  model ThursdayRecirculationTime {
    /** Thursday recirculation time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Friday recirculation time */
  @inherit(r, wi)
  @ext(0x7e, 0)
  model FridayRecirculationTime {
    /** Friday recirculation time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Saturday recirculation time */
  @inherit(r, wi)
  @ext(0x7f, 0)
  model SaturdayRecirculationTime {
    /** Saturday recirculation time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Sunday recirculation time */
  @inherit(r, wi)
  @ext(0x80, 0)
  model SundayRecirculationTime {
    /** Sunday recirculation time */
    ttm: TTM;

    ttm_1: TTM;
    ttm_2: TTM;
    ttm_3: TTM;
    ttm_4: TTM;
    ttm_5: TTM;
    ttm_6: TTM;
  }

  /** Monday recirculation state */
  @inherit(r, wi)
  @ext(0x81, 0)
  model MondayRecirculationState {
    /** Monday recirculation state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Tuesday recirculation state */
  @inherit(r, wi)
  @ext(0x82, 0)
  model TuesdayRecirculationState {
    /** Tuesday recirculation state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Wednesday recirculation state */
  @inherit(r, wi)
  @ext(0x83, 0)
  model WednesdayRecirculationState {
    /** Wednesday recirculation state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Thursday recirculation state */
  @inherit(r, wi)
  @ext(0x84, 0)
  model ThursdayRecirculationState {
    /** Thursday recirculation state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Friday recirculation state */
  @inherit(r, wi)
  @ext(0x85, 0)
  model FridayRecirculationState {
    /** Friday recirculation state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Saturday recirculation state */
  @inherit(r, wi)
  @ext(0x86, 0)
  model SaturdayRecirculationState {
    /** Saturday recirculation state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }

  /** Sunday recirculation state */
  @inherit(r, wi)
  @ext(0x87, 0)
  model SundayRecirculationState {
    /** Sunday recirculation state */
    onoff: onoff;

    onoff_1: onoff;
    onoff_2: onoff;
    onoff_3: onoff;
    onoff_4: onoff;
    onoff_5: onoff;
    onoff_6: onoff;
  }
  // r;wi,MondayVentTime,Monday Vent Time,1400,TTM;TTM;TTM;TTM;TTM;TTM;TTM,Monday Vent Time
  // r;wi,TuesdayVentTime,Tuesday Vent Time,1500,TTM;TTM;TTM;TTM;TTM;TTM;TTM,Tuesday Vent Time
  // r;wi,WednesdayVentTime,Wednesday Vent Time,1600,TTM;TTM;TTM;TTM;TTM;TTM;TTM,Wednesday Vent Time
  // r;wi,ThursdayVentTime,Thursday Vent Time,1700,TTM;TTM;TTM;TTM;TTM;TTM;TTM,Thursday Vent Time
  // r;wi,FridayVentTime,Friday Vent Time,1800,TTM;TTM;TTM;TTM;TTM;TTM;TTM,Friday Vent Time
  // r;wi,SaturdayVentTime,Saturday Vent Time,1900,TTM;TTM;TTM;TTM;TTM;TTM;TTM,Saturday Vent Time
  // r;wi,SundayVentTime,Sunday Vent Time,1a00,TTM;TTM;TTM;TTM;TTM;TTM;TTM,Sunday Vent Time
  // r;wi,MondayVentState,Monday Vent State,1b00,onoff;onoff;onoff;onoff;onoff;onoff;onoff,Monday Vent State
  // r;wi,TuesdayVentState,Tuesday Vent State,1c00,onoff;onoff;onoff;onoff;onoff;onoff;onoff,Tuesday Vent State
  // r;wi,WednesdayVentState,Wednesday Vent State,1d00,onoff;onoff;onoff;onoff;onoff;onoff;onoff,Wednesday Vent State
  // r;wi,ThursdayVentState,Thursday Vent State,1.00E+00,onoff;onoff;onoff;onoff;onoff;onoff;onoff,Thursday Vent State
  // r;wi,FridayVentState,Friday Vent State,1f00,onoff;onoff;onoff;onoff;onoff;onoff;onoff,Friday Vent State
  // r;wi,SaturdayVentState,Saturday Vent State,2000,onoff;onoff;onoff;onoff;onoff;onoff;onoff,Saturday Vent State
  // r;wi,SundayVentState,Sunday Vent State,2100,onoff;onoff;onoff;onoff;onoff;onoff;onoff,Sunday Vent State
  // ##### extra #####

  /** Max Allowed Room Temp */
  @inherit(r, wi)
  @ext(0x32, 0)
  model RoomTempMaxAllowed {
    /** Max Allowed Room Temp */
    value: temp;
  }

  /** RoomTempCorrection */
  @inherit(r, wi)
  @ext(0x33, 0)
  model RoomTempCorr {
    /** RoomTempCorrection */
    value: temp;
  }

  /** Outside Temp Correction */
  @inherit(r, wi)
  @ext(0x36, 0)
  model OutsideTempCorr {
    /** Outside Temp Correction */
    value: temp;
  }

  /** Room Temp Factory Correction */
  @inherit(r, wi)
  @ext(0x39, 0)
  model RoomTempCorrFact {
    /** Room Temp Correction (factory calibrated) */
    value: temp;
  }

  /** Heat Curve */
  @inherit(r, wi)
  @ext(0x5c, 0)
  model HeatCurve {
    /** Heat Curv */
    @divisor(100)
    value: UIN;
  }

  /** Max Allowed DHW Temp */
  @inherit(r, wi)
  @ext(0x5e, 0)
  model DHWTempMaxAllowed {
    /** Max Allowed DHW Temp */
    value: temp;
  }

  /** DHW Schedule Opt Enable */
  @inherit(r, wi)
  @ext(0x5f, 0)
  model DHWScheduleOptEnable {
    /** DHW Schedule Opt Enable */
    value: onoff;
  }

  /** DHW Option Enable */
  @inherit(r, wi)
  @ext(0x60, 0)
  model DHWOptEnable {
    /** DHW Option Enable */
    value: onoff;
  }

  /** Auto Time Correction */
  @inherit(r, wi)
  @ext(0x72, 0)
  model AutoTimeCorr {
    /** Auto Time Correction */
    value: onoff;
  }

  /** Prev Heat Curve */
  @inherit(r)
  @ext(0x75, 0)
  model PrevHeatCurve {
    /** Previous Heat Curve Setting */
    @divisor(100)
    value: UIN;
  }

  /** Maintenance Alarm */
  @inherit(r, wi)
  @ext(0x6f, 0)
  model MaintenanceAlarm {
    /** Maintenance Alarm */
    value: onoff;
  }

  /** Maintenance Alarm Date */
  @inherit(r, wi)
  @ext(0x70, 0)
  model MaintenanceAlarmDate {
    /** Maintance Alarm Date */
    value: ULG;
  }

  /** Auto Heat Curve Regulation */
  @inherit(r, wi)
  @ext(0x6e, 0)
  model AutoHeatCurveRegulation {
    /** Auto Heat Curve Regulation */
    value: onoff;
  }

  /** Preheat */
  @inherit(r, wi)
  @ext(0x6c, 0)
  model Preheat {
    /** Preheat */
    value: onoff;
  }

  /** Recirculation Option Enable */
  @inherit(r, wi)
  @ext(0x6d, 0)
  model RecirculationOptEnable {
    /** Recirculation Option Enable */
    value: onoff;
  }

  /** Maintenance Telephone */
  @inherit(r, wi)
  @ext(0x61, 0)
  model MaintenanceTel {
    /** Maintenance Telephone */
    @maxLength(13)
    value: STR;
  }

  /** Room Temp Option Enable */
  @inherit(r, wi)
  @ext(0x6b, 0)
  model RoomTempOptEnable {
    /** Room Temp Option Enable */
    value: onoff;
  }

  enum values_Language {
    german: 0,
    english: 1,
    french: 2,
    italian: 3,
    flemish: 4,
    dutch: 5,
    spanish: 6,
    catalan: 7,
    basque: 8,
    galician: 9,
    hungarian: 10,
    russian: 11,
    ukrainian: 12,
    polish: 13,
    czech: 14,
    croatian: 15,
    slovakian: 16,
    romanian: 17,
    slovenian: 18,
    Portuguese: 19,
    dutch__AT_: 20,
  }

  /** included parts */
  union _includes {
    errors_inc,
  }
}
