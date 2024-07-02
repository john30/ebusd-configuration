import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./hwcmode_inc.tsp";
import "./timer_inc.tsp";
import "./errors_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0xe0)
namespace Omu {
  // ,OMU00,OMU_no_serial,OMU00 252

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

  /** Out1_230V */
  @inherit(r)
  @ext(0x18, 0)
  model Out1230V {
    value: onoff;
  }

  /** BrineFlowReversed */
  @inherit(r)
  @ext(0x44, 0)
  model SourceFlowReversed {
    value: onoff;
  }
  // ##### Parameters and information #####

  /** ODU_air_inlet */
  @inherit(r)
  @ext(0x5, 0)
  model ODUSourceInput {
    /** air inlet sensor on ODU */
    value: tempsensor;
  }

  /** ODU_brine_Warm */
  @inherit(r)
  @ext(0x6, 0)
  model Parametersandinformation_ODUSourceInput {
    /** brine_warm sensor on ODU */
    value: tempsensor;
  }

  /** Fan_Speed_Is */
  @inherit(r)
  @ext(0x39, 0)
  model FanSpeedIs {
    /** actual fan speed */
    @unit("/min")
    @factor(10)
    value: UCH;
  }

  /** FanIsRunning */
  @inherit(r)
  @ext(0x3b, 0)
  model FanIsRunning {
    /** fan started successful */
    value: yesno;
  }

  /** DeiceRequest */
  @inherit(r)
  @ext(0x1b, 0)
  model DeiceRequest {
    /** defrosting requested */
    value: yesno;
  }

  /** ManualDeiceRequest */
  @inherit(r, wi)
  @ext(0x1a, 0)
  model ManualDeiceRequest {
    /** start manual defrosting */
    value: yesno;
  }

  /** DeicingActive */
  @inherit(r)
  @ext(0x2c, 0)
  model DeicingActive {
    /** defrosting is active */
    value: yesno;
  }

  /** defroster */
  @inherit(r)
  @ext(0x11, 0)
  model Defroster {
    /** defroster is running */
    value: onoff;
  }

  /** CleaningRequest */
  @inherit(r)
  @ext(0x2d, 0)
  model CleaningRequest {
    /** problems in air flow detected */
    value: yesno;
  }

  /** DeiceError */
  @inherit(r)
  @ext(0x1c, 0)
  model DeiceError {
    /** timeout while defrost process */
    value: yesno;
  }

  /** PollutionDetect */
  @inherit(r)
  @ext(0x1d, 0)
  model PollutionDetect {
    /** unusual low brine temperaure at high air inlet temperature */
    value: yesno;
  }

  /** Fan error */
  @inherit(r)
  @ext(0x2e, 0)
  model FanError {
    /** fan did not start */
    value: yesno;
  }

  /** STBError */
  @inherit(r)
  @ext(0x2f, 0)
  model STBError {
    /** defroster STB was interrupted */
    value: yesno;
  }

  /** STB_OK */
  @inherit(r)
  @ext(0x38, 0)
  model STBOK {
    /** STB is closed */
    value: yesno;
  }

  /** BadWeather */
  @inherit(r)
  @ext(0x31, 0)
  model BadWeather {
    /** too cold to start compressor */
    value: yesno;
  }

  /** HotSummer */
  @inherit(r)
  @ext(0x3c, 0)
  model HotSummer {
    /** air inlet too hot to run compressor */
    value: yesno;
  }

  /** NoiseReduction */
  @inherit(r)
  @ext(0x35, 0)
  model NoiseReduction {
    /** noise reduction is active */
    value: yesno;
  }

  /** NoiseReductionFactor */
  @inherit(r, w)
  @ext(0x40, 0)
  model NoiseReductionFactor {
    /** noise reduction factor to reduce fan speed */
    value: percent0;
  }

  /** T_AirMAX */
  @inherit(r, wi)
  @ext(0x43, 0)
  model SourceMAXTemp {
    /** maximum allowed air inlet temperature */
    value: temp;
  }
  // ##### testing #####

  /** ZustandOAWLogic */
  @inherit(r)
  @ext(0x2a, 0)
  model ZustandOAWLogic {
    /** Output of "OAW_control" statemachine */
    value: UIN;
  }

  /** IDU_appliance_code */
  @inherit(r)
  @ext(0x3e, 0)
  model IDUApplianceCode {
    /** appliance code, copy from AMU */
    value: UCH;
  }

  /** CompressorActive */
  @inherit(r)
  @ext(0x17, 0)
  model CompActive {
    /** compressor is running or pre or post running */
    value: onoff;
  }

  /** Compressor_Demand */
  @inherit(r)
  @ext(0x32, 0)
  model CompDemand {
    /** compressor wants to start or is running */
    value: yesno;
  }

  /** DeicingReleased */
  @inherit(r)
  @ext(0x33, 0)
  model DeicingReleased {
    /** compressor is not running */
    value: yesno;
  }

  /** BrineOK */
  @inherit(r)
  @ext(0x34, 0)
  model SourceOK {
    /** brine pressure is ok and pump is running */
    value: yesno;
  }

  /** FanMode */
  @inherit(r)
  @ext(0x36, 0)
  model FanMode {
    /** future use */
    value: yesno;
  }

  /** OAW_Control_Pump_PWM */
  @inherit(r, wi)
  @ext(0x37, 0)
  model OAWControlPumpPWM {
    /** reserved */
    value: UIN;
  }

  /** Test_Fan */
  @inherit(r)
  @ext(0x3a, 0)
  model TestFan {
    value: UCH;
  }

  /** Pumin */
  @inherit(r)
  @ext(0x3d, 0)
  model Pumin {
    /** reserved */
    value: UCH;
  }

  /** ODUReady */
  @inherit(r)
  @ext(0x2b, 0)
  model ODUReady {
    /** start-up test of ODU was successful */
    value: yesno;
  }

  /** FanStartSpeed */
  @inherit(r)
  @ext(0x22, 0)
  model FanStartSpeed {
    /** reserved */
    value: UIN;
  }

  /** Free2 */
  @inherit(r)
  @ext(0x21, 0)
  model Free2 {
    /** reserved */
    value: UIN;
  }

  /** FanstableTime */
  @inherit(r)
  @ext(0x20, 0)
  model FanstableTime {
    /** reserved */
    value: UIN;
  }

  /** OffsetFanSpeed */
  @inherit(r)
  @ext(0x1f, 0)
  model OffsetFanSpeed {
    /** reserved */
    value: UIN;
  }

  /** RelaisOut */
  @inherit(r)
  @ext(0x1e, 0)
  model RelaisOut {
    /** reserved */
    value: onoff;
  }

  /** PumpSpeedControl */
  @inherit(r)
  @ext(0x19, 0)
  model PumpSpeedControl {
    /** reserved */
    value: UIN;
  }

  /** fan_PWM */
  @inherit(r)
  @ext(0x14, 0)
  model FanPWM {
    /** PWM value from hardware */
    value: UIN;
  }
  // ##### statistics #####
  @condition(Id.Id.sw, ">=104")
  namespace Sw_ge104 {
    /** AirInletSensor_Offset */
    @inherit(r, wi)
    @ext(0x4a, 0)
    model SourceInputSensorOffset {
      /** calibration value for air inlet sensor */
      value: temp;
    }

    /** Brine_warmSensor_Offset */
    @inherit(r, wi)
    @ext(0x4b, 0)
    model Parametersandinformation_SourceInputSensorOffset {
      /** calibration value for brine sensor */
      value: temp;
    }

    /** MaxDeiceTime */
    @inherit(r, wi)
    @ext(0x45, 0)
    model DeiceTimeMax {
      /** max. deicing time. By exceeding this value, message unsuccessful deicing is released */
      value: minutes2;
    }

    /** MinDeicePeriod */
    @inherit(r, wi)
    @ext(0x46, 0)
    model DeicePeriodMin {
      /** Min. time between deicings. If time is shorter, something is wrong */
      value: minutes2;
    }

    /** TDeicefinish */
    @inherit(r, wi)
    @ext(0x29, 0)
    model DeicefinishTemp {
      /** stops automatic defrosting process */
      value: temp;
    }

    /** MaxDeltaT */
    @inherit(r, wi)
    @ext(0x28, 0)
    model DeltaTMax {
      /** start defrost process when temperature difference between air and brine is above this setpoint */
      value: temp;
    }

    /** TDeiceOn */
    @inherit(r, wi)
    @ext(0x27, 0)
    model DeiceOnTemp {
      /** above this air temperature ice is quite unusual */
      value: temp;
    }

    /** TOnlyFan */
    @inherit(r, wi)
    @ext(0x26, 0)
    model OnlyFanTemp {
      /** above this air temperature, the defroster is not used for defrosting, only fan */
      value: temp;
    }

    /** DeiceWFanHyst */
    @inherit(r, wi)
    @ext(0x24, 0)
    model DeiceWFanHyst {
      /** remaining temperature difference to air inlet while fan defrosting */
      value: temp;
    }

    /** DeiceRequestHyst */
    @inherit(r, wi)
    @ext(0x23, 0)
    model DeiceRequestHyst {
      /** for stable frost detection */
      value: temp;
    }

    /** MinSpeedTemp */
    @inherit(r)
    @ext(0x58, 0)
    model SpeedTempMin {
      /** temperature for minimum speed */
      value: temp;
    }

    /** MaxSpeedTemp */
    @inherit(r)
    @ext(0x57, 0)
    model SpeedTempMax {
      /** temperature for maximum speed */
      value: temp;
    }

    /** MaxFanSpeed */
    @inherit(r, wi)
    @ext(0x3f, 0)
    model FanSpeedMax {
      /** maximum allowed fan speed, set by look-up-table according to IDU power */
      value: percent0;
    }

    /** FrostProtection */
    @inherit(r)
    @ext(0x41, 0)
    model FrostProtection {
      /** copy from AMU: frost protection */
      value: temp;
    }

    /** SyncHeaterDeicing */
    @inherit(r)
    @ext(0x47, 0)
    model SyncHeaterDeicing {
      /** synchronize heater while deicing */
      value: yesno;
    }

    /** SyncDeicing */
    @inherit(r)
    @ext(0x49, 0)
    model SyncDeicing {
      /** synchronize deicing process */
      value: yesno;
    }

    /** RelayCommutations */
    @inherit(r)
    @ext(0x4d, 0)
    model RelayStarts {
      /** reserved */
      value: ULG;
    }

    /** CheckByte */
    @inherit(r)
    @ext(0x55, 0)
    model CheckByte {
      /** factory EOL test */
      value: UCH;
    }

    /** LEDBlinkProgram */
    @inherit(r)
    @ext(0x56, 0)
    model LEDBlinkProgram {
      /** LED error message */
      value: UIN;
    }

    /** Test_Heater */
    @inherit(r)
    @ext(0x48, 0)
    model TestHeater {
      /** reserved */
      value: UCH;
    }

    /** T_AirMin */
    @inherit(r)
    @ext(0x25, 0)
    model SourceTempMin {
      /** minimum allowed air temperature */
      value: temp;
    }

    /** FanRuntimeMinutes */
    @inherit(r)
    @ext(0x4c, 0)
    model FanRuntimeMinutes {
      /** fan run time */
      @unit("min")
      value: ULG;
    }

    /** HeaterRuntimeMinutes */
    @inherit(r)
    @ext(0x4e, 0)
    model HeaterRuntimeMinutes {
      /** defroster run time */
      @unit("min")
      value: ULG;
    }

    /** HeaterCommutations */
    @inherit(r)
    @ext(0x4f, 0)
    model HeaterStarts {
      /** defroster cycles */
      value: ULG;
    }

    /** DeicingCommutations */
    @inherit(r)
    @ext(0x51, 0)
    model DeicingStarts {
      /** deicing cycles */
      value: ULG;
    }

    /** DeicingRuntimeMinutes */
    @inherit(r)
    @ext(0x52, 0)
    model DeicingRuntimeMinutes {
      /** deicing run time */
      @unit("min")
      value: ULG;
    }

    /** DeiceErrorCommutations */
    @inherit(r)
    @ext(0x53, 0)
    model DeiceErrorStarts {
      /** deice error cycles */
      value: ULG;
    }

    /** STBErrorCommutations */
    @inherit(r)
    @ext(0x50, 0)
    model STBErrorStarts {
      /** STB cycles */
      value: ULG;
    }

    /** PowerOnCommutations */
    @inherit(r)
    @ext(0x54, 0)
    model PowerOnStarts {
      /** power on cycles */
      value: ULG;
    }
  }
  @condition(Id.Id.sw, ">=130")
  namespace Sw_ge130 {
    /** CoolingActive */
    @inherit(r)
    @ext(0x59, 0)
    model CoolingActive {
      /** CoolingActive */
      value: yesno;
    }

    /** CoolingFanStartTemp */
    @inherit(r, wi)
    @ext(0x5a, 0)
    model CoolingFanStartTemp {
      /** brine temperature to start fan while cooling */
      value: temp0;
    }

    /** CoolingFanStopTemp */
    @inherit(r, wi)
    @ext(0x5b, 0)
    model CoolingFanStopTemp {
      /** reserved */
      value: temp0;
    }

    /** CoolingMaxFanSpeed */
    @inherit(r, wi)
    @ext(0x5c, 0)
    model CoolingMaxFanSpeed {
      /** max. fan speed while cooling */
      value: percent0;
    }

    /** CoolingTest */
    @inherit(r, wi)
    @ext(0x5d, 0)
    model CoolingTest {
      /** reserved */
      value: UCH;
    }
  }

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
    Errors_inc,
  }
}
