import "@ebusd/ebus-typespec";
import "./_templates.tsp";
using Ebus;

/** Process values of the heating controller/burner control unit. */
@zz(0xfe) // broadcast address
namespace heating_controller {
  /** Process values message. */
  @id(0x50, 0x0A)
  model process_values {
    /** Status1 byte (bitfield) */
    status1: Num.UCH, // M6

    /** Operating phase */
    operating_phase: Num.UCH, // M7

    /** Status2 byte (bitfield) */
    status2: Num.UCH, // M8

    /** Status3 byte (bitfield) */
    status3: Num.UCH, // M9

    /** Load position */
    load_position: Num.UCH, // M10

    /** Flow temperature (°C, 0.5 steps) */
    flow_temp: temp1, // D1C, M11

    /** Exhaust temperature (°C, 0.5 steps) */
    exhaust_temp: temp1, // D1C, M12

    /** Hot water temperature (°C, 0.5 steps) */
    hotwater_temp: temp1, // D1C, M13

    /** Unknown (reserved) */
    unknown1: Num.UCH, // M14

    /** Outside temperature (°C, signed, 1 step) */
    outside_temp: temp2, // D1B, M15

    /** Temperature trend (2 bytes, signed) */
    temp_trend: temp2, // D2B, M16+M17

    /** Flow setpoint temperature (°C) */
    flow_setpoint: Num.UCH, // M18
  }
}