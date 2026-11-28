import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./b516_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x76)
namespace Vwz {
  // additions from PR 330 for HMU;0901;5103 / VWZ;0522;5103
  // Test menus on VWZ. EnableTest message needs to be sent before each of the read messages work.

  /** default *rs for user level "service" */
  @auth("service")
  @base(MF, 0x14, 0x5)
  model rs {
    @maxLength(2)
    ign: IGN;
  }

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x14, 0x5)
  model ws_1 {
    @maxLength(3)
    @constValue("03FFFF")
    ignore: HEX;
  }

  /** enable test 3 way valve */
  @inherit(ws_1)
  @ext(0x2)
  model EnableTestThreeWayValve {}

  /** 3 way valve */
  @inherit(rs)
  @ext(0x2)
  model TestThreeWayValve {
    @values(Values_TestThreeWayValve)
    value: UCH;
  }

  /** enable test hwc temperature */
  @inherit(ws_1)
  @ext(0x2c)
  model EnableTestHwcTemp {}

  /** hwc temperature */
  @inherit(rs)
  @ext(0x2c)
  model TestHwcTemp {
    @unit("°C")
    @divisor(10)
    value: temps2;
  }

  /** enable test outdoor temperature */
  @inherit(ws_1)
  @ext
  model EnableTestOutdoorTemp {}

  /** outdoor temperature */
  @inherit(rs)
  @ext(0x45)
  model TestOutdoorTemp {
    @unit("°C")
    @divisor(10)
    value: temps2;
  }

  // ---------------------------------------------------------------------------
  // Additions 2026-11-26 from the Vaillant EU Data Act export (VWZ02 at 0x76),
  // polled by the myVaillant gateway since 2026-11-23. Vaillant name in comments.
  // ---------------------------------------------------------------------------

  /** default *r (b509 54 02 00 <reg>) */
  @base(MF, 0x9, 0x54, 0x2, 0)
  model r_x09 {
    @maxLength(4)
    ign: IGN;
  }

  /** flow temperature at the backup heater, Vaillant BackupHeaterFlowTemperatureSensor */
  @inherit(r_x09)
  @ext(0x4c, 0x9)
  @Ebus.example("33.63 °C", "76b509055402004c09", "0802014c0921840642")
  model RunDataBackupHeaterFlowTemp {
    value: tempv;
  }

  /** current power of the electric backup heater, Vaillant EBH_CurrentPower */
  @inherit(r_x09)
  @ext(0xa0, 0xa)
  model RunDataBackupHeaterPower {
    @unit("W")
    value: UIN;
  }

  /** flow measured by the outdoor unit, Vaillant VortexFlow_lph_Outdoor */
  @inherit(r_x09)
  @ext(0xbb, 0x9)
  model RunDataFlowOutdoor {
    @unit("l/h")
    value: EXP;
  }

  /** requested operation mode, Vaillant ASW2_ReqOpMode */
  @inherit(r_x09)
  @ext(0xac, 0xd)
  model RunDataReqOpMode {
    value: UCH;
  }

  /** current operation mode, Vaillant ASW2_CurOpMode */
  @inherit(r_x09)
  @ext(0xad, 0xd)
  model RunDataCurOpMode {
    value: UCH;
  }

  /** fault list (65535 = empty), Vaillant ASW2_FaultList */
  @inherit(r_x09)
  @ext(0xb8, 0xd)
  model RunDataFaultList {
    code1: UIN;
    code2: UIN;
    code3: UIN;
    code4: UIN;
    code5: UIN;
  }

  /** device specific number start, Vaillant DeviceSpecificNumberStart */
  @inherit(r_x09)
  @ext(0x83, 0xb)
  model DeviceSpecificNumberStart {
    value: UIN;
  }

  /** device specific number offset, Vaillant DeviceSpecificNumberOffset */
  @inherit(r_x09)
  @ext(0x84, 0xb)
  model DeviceSpecificNumberOffset {
    value: UCH;
  }

  /** device specific number (= start + offset, the Vaillant export shows only the first byte, e.g. 249 for f9 07 = 2041), Vaillant DeviceSpecificNumber */
  @inherit(r_x09)
  @ext(0x85, 0xb)
  @Ebus.example("2041", "76b50905540200850b", "060201850bf907")
  model DeviceSpecificNumber {
    value: UIN;
  }

  /** default *r (b51a 05 ff 32 <nr>), answer ff 08 <type> <value LE> */
  @base(MF, 0x1a, 0x5, 0xff, 0x32)
  model r_x32 {
    @maxLength(3)
    ign: IGN;
  }

  /** backup heater hours, Vaillant EBH_OperatingHours */
  @inherit(r_x32)
  @ext(0x46)
  model BackupHeaterHours {
    @unit("h")
    value: ULG;
  }

  /** backup heater energy, Vaillant EBH_PowerConsumption */
  @inherit(r_x32)
  @ext(0x49)
  @Ebus.example("39 kWh", "76b51a0405ff3249", "0aff082627000000000000")
  model BackupHeaterEnergy {
    @unit("kWh")
    value: ULG;
  }

  /** backup heater switches, Vaillant EBH_Commutations */
  @inherit(r_x32)
  @ext(0x4a)
  model BackupHeaterSwitches {
    value: ULG;
  }

  /** hot water 3 way valve switches, Vaillant DHW_TWV_Commutations */
  @inherit(r_x32)
  @ext(0x4b)
  model HwcValveSwitches {
    value: ULG;
  }

  /** default *r (b51a 05 ff 33 <nr>), answer ff 02 <type> <value> <min> <max> <step> */
  @base(MF, 0x1a, 0x5, 0xff, 0x33)
  model r_x33 {
    @maxLength(3)
    ign: IGN;
  }

  /** maximum power of the internal electric backup heater (parameter), Vaillant MaxPowerInternalElectricalBackupHeater */
  @inherit(r_x33)
  @ext(0x1a)
  model BackupHeaterMaxPower {
    @unit("kW")
    value: UIN;
  }

  enum Values_TestThreeWayValve {
    heating: 0,
    dhw: 1,
  }

  // energy counters as polled by the myVaillant gateway (b516 10 00 ff ff <source> <usage> 00 00),
  // names from the Vaillant EU Data Act export (energyType/operationMode, values in Wh, exact match).
  // source with flag bits: 0x42 = earned environment energy, 0x49 = heat generated, 0x83 = consumed electrical energy.
  // answer: <period> <0> <index> <source> <usage> <date> <value EXP Wh>
  // date: bits yyyyyyy mmmm ddddd, device date of the last 100 Wh step of any of the device's counters (shared by all counters of the device)
  /** default *r for gateway energy counters (b516 10, period total) */
  @base(MF, 0x16, 0x10, 0, 0xff, 0xff)
  model r_x16stat {
    @maxLength(7)
    ign: IGN;
  }

  /** consumed electrical energy for heating (incl. standby, booked 1:1 as heat generated), Vaillant CONSUMED_ELECTRICAL_ENERGY/HEATING */
  @inherit(r_x16stat)
  @ext(0x83, 0x03, 0, 0)
  model ConsumedElectricalEnergyHc {
    value: energye;
  }

  /** consumed electrical energy for hot water (booked 1:1 as heat generated), Vaillant CONSUMED_ELECTRICAL_ENERGY/DOMESTIC_HOT_WATER */
  @inherit(r_x16stat)
  @ext(0x83, 0x04, 0, 0)
  model ConsumedElectricalEnergyHwc {
    value: energye;
  }

  /** included parts */
  union _includes {
    B516_inc,
  }
}
