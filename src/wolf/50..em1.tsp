import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./wtc_inc.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;

namespace Wolf;

// Exchange between the room controller (QQ 0x30) and heating module #1 (ZZ 0x50).
namespace em1 {
  /** room-controller / heating-module exchange */
  @passive
  @qq(0x30)
  model HcMode is Wolf.HcMode;

  // --- System clock, read side (writes are a separate lot) ---

  /** day of the week */
  @ext(0x61, 0x21, 0x01)
  model SystemWeekday is CrcRead<weekday>;

  /** day of the month */
  @ext(0x85, 0x22, 0x01)
  model SystemDay is CrcRead<UIN>;

  /** month */
  @ext(0xd9, 0x23, 0x01)
  model SystemMonth is CrcRead<month>;

  /** year */
  @ext(0x11, 0x24, 0x01)
  model SystemYear is CrcRead<UIN>;

  /** minute */
  @ext(0xa9, 0x26, 0x01)
  model SystemMinute is CrcRead<minutes>;

  /** second */
  @ext(0xf5, 0x27, 0x01)
  model SystemSecond is CrcRead<seconds>;

  // --- Weekly circulation program, read side: three switch-time slots per day ---

  /** Monday slot 1 */
  @ext(0xaa, 0x10, 0x1a)
  model CircProgramMon1 is SwitchTimes;

  /** Monday slot 2 */
  @ext(0xf6, 0x11, 0x1a)
  model CircProgramMon2 is SwitchTimes;

  /** Monday slot 3 */
  @ext(0x12, 0x12, 0x1a)
  model CircProgramMon3 is SwitchTimes;

  /** Tuesday slot 1 */
  @ext(0x26, 0x20, 0x1a)
  model CircProgramTue1 is SwitchTimes;

  /** Tuesday slot 2 */
  @ext(0x7a, 0x21, 0x1a)
  model CircProgramTue2 is SwitchTimes;

  /** Tuesday slot 3 */
  @ext(0x9e, 0x22, 0x1a)
  model CircProgramTue3 is SwitchTimes;

  /** Wednesday slot 1 */
  @ext(0x96, 0x30, 0x1a)
  model CircProgramWed1 is SwitchTimes;

  /** Wednesday slot 2 */
  @ext(0xca, 0x31, 0x1a)
  model CircProgramWed2 is SwitchTimes;

  /** Wednesday slot 3 */
  @ext(0x2e, 0x32, 0x1a)
  model CircProgramWed3 is SwitchTimes;

  /** Thursday slot 1 */
  @ext(0x62, 0x40, 0x1a)
  model CircProgramThu1 is SwitchTimes;

  /** Thursday slot 2 */
  @ext(0x3e, 0x41, 0x1a)
  model CircProgramThu2 is SwitchTimes;

  /** Thursday slot 3 */
  @ext(0xda, 0x42, 0x1a)
  model CircProgramThu3 is SwitchTimes;

  /** Friday slot 1 */
  @ext(0xd2, 0x50, 0x1a)
  model CircProgramFri1 is SwitchTimes;

  /** Friday slot 2 */
  @ext(0x8e, 0x51, 0x1a)
  model CircProgramFri2 is SwitchTimes;

  /** Friday slot 3 */
  @ext(0x6a, 0x52, 0x1a)
  model CircProgramFri3 is SwitchTimes;

  /** Saturday slot 1 */
  @ext(0x5e, 0x60, 0x1a)
  model CircProgramSat1 is SwitchTimes;

  /** Saturday slot 2 */
  @ext(0x02, 0x61, 0x1a)
  model CircProgramSat2 is SwitchTimes;

  /** Saturday slot 3 */
  @ext(0xe6, 0x62, 0x1a)
  model CircProgramSat3 is SwitchTimes;

  /** Sunday slot 1 */
  @ext(0xee, 0x70, 0x1a)
  model CircProgramSun1 is SwitchTimes;

  /** Sunday slot 2 */
  @ext(0xb2, 0x71, 0x1a)
  model CircProgramSun2 is SwitchTimes;

  /** Sunday slot 3 */
  @ext(0x56, 0x72, 0x1a)
  model CircProgramSun3 is SwitchTimes;

  // --- Weekly hot-water program, read side: three switch-time slots per day ---

  /** Monday slot 1 */
  @ext(0xa7, 0x10, 0x17)
  model DHWProgramMon1 is SwitchTimes;

  /** Monday slot 2 */
  @ext(0xfb, 0x11, 0x17)
  model DHWProgramMon2 is SwitchTimes;

  /** Monday slot 3 */
  @ext(0x1f, 0x12, 0x17)
  model DHWProgramMon3 is SwitchTimes;

  /** Tuesday slot 1 */
  @ext(0x2b, 0x20, 0x17)
  model DHWProgramTue1 is SwitchTimes;

  /** Tuesday slot 2 */
  @ext(0x77, 0x21, 0x17)
  model DHWProgramTue2 is SwitchTimes;

  /** Tuesday slot 3 */
  @ext(0x93, 0x22, 0x17)
  model DHWProgramTue3 is SwitchTimes;

  /** Wednesday slot 1 */
  @ext(0x9b, 0x30, 0x17)
  model DHWProgramWed1 is SwitchTimes;

  /** Wednesday slot 2 */
  @ext(0xc7, 0x31, 0x17)
  model DHWProgramWed2 is SwitchTimes;

  /** Wednesday slot 3 */
  @ext(0x23, 0x32, 0x17)
  model DHWProgramWed3 is SwitchTimes;

  /** Thursday slot 1 */
  @ext(0x6f, 0x40, 0x17)
  model DHWProgramThu1 is SwitchTimes;

  /** Thursday slot 2 */
  @ext(0x33, 0x41, 0x17)
  model DHWProgramThu2 is SwitchTimes;

  /** Thursday slot 3 */
  @ext(0xd7, 0x42, 0x17)
  model DHWProgramThu3 is SwitchTimes;

  /** Friday slot 1 */
  @ext(0xdf, 0x50, 0x17)
  model DHWProgramFri1 is SwitchTimes;

  /** Friday slot 2 */
  @ext(0x83, 0x51, 0x17)
  model DHWProgramFri2 is SwitchTimes;

  /** Friday slot 3 */
  @ext(0x67, 0x52, 0x17)
  model DHWProgramFri3 is SwitchTimes;

  /** Saturday slot 1 */
  @ext(0x53, 0x60, 0x17)
  model DHWProgramSat1 is SwitchTimes;

  /** Saturday slot 2 */
  @ext(0x0f, 0x61, 0x17)
  model DHWProgramSat2 is SwitchTimes;

  /** Saturday slot 3 */
  @ext(0xeb, 0x62, 0x17)
  model DHWProgramSat3 is SwitchTimes;

  /** Sunday slot 1 */
  @ext(0xe3, 0x70, 0x17)
  model DHWProgramSun1 is SwitchTimes;

  /** Sunday slot 2 */
  @ext(0xbf, 0x71, 0x17)
  model DHWProgramSun2 is SwitchTimes;

  /** Sunday slot 3 */
  @ext(0x5b, 0x72, 0x17)
  model DHWProgramSun3 is SwitchTimes;
}
