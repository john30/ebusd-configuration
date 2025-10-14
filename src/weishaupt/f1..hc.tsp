import "@ebusd/ebus-typespec";
import "../_templates.tsp";
using Ebus;

enum OperatingPhase {
  BurnerOff: 0x00,
  StandbyFanCheck: 0x01,
  PreIgnitionSpeedReached: 0x02,
  PreIgnitionCountdown: 0x03,
  IgnitionSpeedReached: 0x04,
  FlameFormationTime: 0x05,
  BurnerInOperation: 0x06,
  GasValveCheckV1: 0x07,
  GasValveCheckV2: 0x08,
  PostIgnitionPurge: 0x09,
}

enum OperationMode {
  BurnerOff: 0x00,
  NoAction: 0x01,
  DomesticHotWater: 0x55,
  HeatingMode: 0xAA,
  EmissionControl: 0xCC,
  InspectionFunction: 0xDD,
  ControllerStop: 0xEE,
  DHWWithHeating: 0xBB,
  ControllerStopStepMode: 0x44,
}

enum Action {
  NoAction: 0x00,
  SwitchOffBoilerPump: 0x01,
  SwitchOnBoilerPump: 0x02,
  SwitchOffVariableConsumer: 0x03,
  SwitchOnVariableConsumer: 0x04,
}

/** Process values of the heating controller unit. */
namespace weishaupt {
  /** Data from the heater. */
  @qq(0xf1)
  @id(0x50, 0x0A)
  model heater_data {
    /** Status1 byte (bitfield) */
    status1: Num.UCH; // M6

    /** Operating phase */
    @values(OperatingPhase)
    operating_phase: Num.UCH; // M7

    /** Status2 byte (bitfield) */
    status2: Num.UCH; // M8

    /** Status3 byte (bitfield) */
    status3: Num.UCH; // M9

    /** Load position */
    load_position: Num.UCH; // M10

    /** Flow temperature (°C, 0.5 steps) */
    flow_temp: temp1; // D1C, M11

    /** Exhaust temperature (°C, 0.5 steps) */
    exhaust_temp: temp1; // D1C, M12

    /** Hot water temperature (°C, 0.5 steps) */
    hotwater_temp: temp1; // D1C, M13

    /** Outside temperature (°C, signed, 1 step) */
    outside_temp: temp2; // D1B, M15

    /** Temperature trend (2 bytes, signed) */
    temp_trend: temp2; // D2B, M16+M17

    /** Flow setpoint temperature (°C) */
    flow_setpoint: Num.UCH; // M18
  }

  /** Command to the heater. */
  @zz(0xf1)
  @qq(0x30)
  @write(true)
  @id(0x05, 0x07)
  model heater_control {
    @values(OperationMode)
    operation_mode: Num.UCH; // M6

    @values(Action)
    action: Num.UCH; // M7

    /** Boiler setpoint temperature (°C, 1/16 °C per step) */
    boiler_setpoint_temp: temp; // M8+M9, DATA2c, 0-2000 / 1/16

    /** Boiler setpoint pressure (0–100, 1/256 per step) */
    @unit("bar")
    @divisor(256)
    boiler_setpoint_pressure: Num.UIR; // M10+M11, DATA2b

    /** Control degree / load (%) */
    control_degree: percent0; // M12, 0–100

    /** Domestic hot water setpoint (%) */
    dhw_setpoint: percent1; // M13, DATA1c

    /** Fuel selection */
    fuel_selection: fueltype; // M14
  }
}
