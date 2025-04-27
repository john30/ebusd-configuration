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

  /** Out1_230V */
  @ext(0x18, 0)
  model Out1230V is ReadonlyRegister<onoff>;

  /** BrineFlowReversed */
  @ext(0x44, 0)
  model SourceFlowReversed is ReadonlyRegister<onoff>;
  // ##### Parameters and information #####

  /** ODU_air_inlet: air inlet sensor on ODU */
  @ext(0x5, 0)
  model ODUSourceInput is ReadonlyRegister<tempsensor>;

  /** ODU_brine_Warm: brine_warm sensor on ODU */
  @ext(0x6, 0)
  model Parametersandinformation_ODUSourceInput is ReadonlyRegister<tempsensor>;

  /** Fan_Speed_Is */
  @inherit(r)
  @ext(0x39, 0)
  model FanSpeedIs {
    /** actual fan speed */
    @unit("/min")
    @factor(10)
    value: UCH;
  }

  /** FanIsRunning: fan started successful */
  @ext(0x3b, 0)
  model FanIsRunning is ReadonlyRegister<yesno>;

  /** DeiceRequest: defrosting requested */
  @ext(0x1b, 0)
  model DeiceRequest is ReadonlyRegister<yesno>;

  /** ManualDeiceRequest: start manual defrosting */
  @ext(0x1a, 0)
  model ManualDeiceRequest is InstallRegister<yesno>;

  /** DeicingActive: defrosting is active */
  @ext(0x2c, 0)
  model DeicingActive is ReadonlyRegister<yesno>;

  /** defroster is running */
  @ext(0x11, 0)
  model Defroster is ReadonlyRegister<onoff>;

  /** CleaningRequest: problems in air flow detected */
  @ext(0x2d, 0)
  model CleaningRequest is ReadonlyRegister<yesno>;

  /** DeiceError: timeout while defrost process */
  @ext(0x1c, 0)
  model DeiceError is ReadonlyRegister<yesno>;

  /** PollutionDetect: unusual low brine temperaure at high air inlet temperature */
  @ext(0x1d, 0)
  model PollutionDetect is ReadonlyRegister<yesno>;

  /** FanError: fan did not start */
  @ext(0x2e, 0)
  model FanError is ReadonlyRegister<yesno>;

  /** STBError: defroster STB was interrupted */
  @ext(0x2f, 0)
  model STBError is ReadonlyRegister<yesno>;

  /** STB_OK: STB is closed */
  @ext(0x38, 0)
  model STBOK is ReadonlyRegister<yesno>;

  /** BadWeather: too cold to start compressor */
  @ext(0x31, 0)
  model BadWeather is ReadonlyRegister<yesno>;

  /** HotSummer: air inlet too hot to run compressor */
  @ext(0x3c, 0)
  model HotSummer is ReadonlyRegister<yesno>;

  /** NoiseReduction: noise reduction is active */
  @ext(0x35, 0)
  model NoiseReduction is ReadonlyRegister<yesno>;

  /** NoiseReductionFactor: noise reduction factor to reduce fan speed */
  @ext(0x40, 0)
  model NoiseReductionFactor is Register<percent0>;

  /** T_AirMAX: maximum allowed air inlet temperature */
  @ext(0x43, 0)
  model SourceMAXTemp is InstallRegister<temp>;
  // ##### testing #####

  /** ZustandOAWLogic: Output of "OAW_control" statemachine */
  @ext(0x2a, 0)
  model ZustandOAWLogic is ReadonlyRegister<UIN>;

  /** IDU_appliance_code: appliance code, copy from AMU */
  @ext(0x3e, 0)
  model IDUApplianceCode is ReadonlyRegister<appliancecode>;

  /** CompressorActive: compressor is running or pre or post running */
  @ext(0x17, 0)
  model CompActive is ReadonlyRegister<onoff>;

  /** CompressorDemand: compressor wants to start or is running */
  @ext(0x32, 0)
  model CompDemand is ReadonlyRegister<yesno>;

  /** DeicingReleased: compressor is not running */
  @ext(0x33, 0)
  model DeicingReleased is ReadonlyRegister<yesno>;

  /** BrineOK: brine pressure is ok and pump is running */
  @ext(0x34, 0)
  model SourceOK is ReadonlyRegister<yesno>;

  /** FanMode: future use */
  @ext(0x36, 0)
  model FanMode is ReadonlyRegister<yesno>;

  /** OAW_Control_Pump_PWM: reserved */
  @ext(0x37, 0)
  model OAWControlPumpPWM is InstallRegister<UCH>;

  /** Test_Fan */
  @ext(0x3a, 0)
  model TestFan is ReadonlyRegister<UCH>;

  /** Pumin: reserved */
  @ext(0x3d, 0)
  model Pumin is ReadonlyRegister<UCH>;

  /** ODUReady: start-up test of ODU was successful */
  @ext(0x2b, 0)
  model ODUReady is ReadonlyRegister<yesno>;

  /** FanStartSpeed: reserved */
  @ext(0x22, 0)
  model FanStartSpeed is ReadonlyRegister<percent0>;

  /** Free2: reserved */
  @ext(0x21, 0)
  model Free2 is ReadonlyRegister<UIN>;

  /** FanstableTime: reserved */
  @ext(0x20, 0)
  model FanstableTime is ReadonlyRegister<minutes0>;

  /** OffsetFanSpeed: reserved */
  @ext(0x1f, 0)
  model OffsetFanSpeed is ReadonlyRegister<UCH>;

  /** RelaisOut: reserved */
  @ext(0x1e, 0)
  model RelaisOut is ReadonlyRegister<onoff>;

  /** PumpSpeedControl: reserved */
  @ext(0x19, 0)
  model PumpSpeedControl is ReadonlyRegister<UIN>;

  /** fan_PWM: PWM value from hardware */
  @ext(0x14, 0)
  model FanPWM is ReadonlyRegister<UCH>;
  // ##### statistics #####
  // B521 service commands

  /** default *uw */
  @write
  @passive
  @base(MF, 0x21, 0)
  model uw {}
  @condition(Id.Id.sw, ">=104")
  namespace Sw_ge104 {
    /** AirInletSensor_Offset: calibration value for air inlet sensor */
    @ext(0x4a, 0)
    model SourceInputSensorOffset is InstallRegister<temp>;

    /** Brine_warmSensor_Offset: calibration value for brine sensor */
    @ext(0x4b, 0)
    model Parametersandinformation_SourceInputSensorOffset
      is InstallRegister<temp>;

    /** MaxDeiceTime: max. deicing time. By exceeding this value, message unsuccessful deicing is released */
    @ext(0x45, 0)
    model DeiceTimeMax is InstallRegister<minutes2>;

    /** MinDeicePeriod: Min. time between deicings. If time is shorter, something is wrong */
    @ext(0x46, 0)
    model DeicePeriodMin is InstallRegister<minutes2>;

    /** TDeicefinish: stops automatic defrosting process */
    @ext(0x29, 0)
    model DeicefinishTemp is InstallRegister<temp>;

    /** MaxDeltaT: start defrost process when temperature difference between air and brine is above this setpoint */
    @ext(0x28, 0)
    model DeltaTMax is InstallRegister<temp>;

    /** TDeiceOn: above this air temperature ice is quite unusual */
    @ext(0x27, 0)
    model DeiceOnTemp is InstallRegister<temp>;

    /** TOnlyFan: above this air temperature, the defroster is not used for defrosting, only fan */
    @ext(0x26, 0)
    model OnlyFanTemp is InstallRegister<temp>;

    /** DeiceWFanHyst: remaining temperature difference to air inlet while fan defrosting */
    @ext(0x24, 0)
    model DeiceWFanHyst is InstallRegister<temp>;

    /** DeiceRequestHyst: for stable frost detection */
    @ext(0x23, 0)
    model DeiceRequestHyst is InstallRegister<temp>;

    /** MinSpeedTemp: temperature for minimum speed */
    @ext(0x58, 0)
    model SpeedTempMin is ReadonlyRegister<temp>;

    /** MaxSpeedTemp: temperature for maximum speed */
    @ext(0x57, 0)
    model SpeedTempMax is ReadonlyRegister<temp>;

    /** MaxFanSpeed: maximum allowed fan speed, set by look-up-table according to IDU power */
    @ext(0x3f, 0)
    model FanSpeedMax is InstallRegister<percent0>;

    /** FrostProtection: copy from AMU: frost protection */
    @ext(0x41, 0)
    model FrostProtection is ReadonlyRegister<temp>;

    /** SyncHeaterDeicing: synchronize heater while deicing */
    @ext(0x47, 0)
    model SyncHeaterDeicing is ReadonlyRegister<yesno>;

    /** SyncDeicing: synchronize deicing process */
    @ext(0x49, 0)
    model SyncDeicing is ReadonlyRegister<yesno>;

    /** RelayCommutations: reserved */
    @ext(0x4d, 0)
    model RelayStarts is ReadonlyRegister<ULG>;

    /** CheckByte: factory EOL test */
    @ext(0x55, 0)
    model CheckByte is ReadonlyRegister<UCH>;

    /** LEDBlinkProgram: LED error message */
    @ext(0x56, 0)
    model LEDBlinkProgram is ReadonlyRegister<UIN>;

    /** Test_Heater: reserved */
    @ext(0x48, 0)
    model TestHeater is ReadonlyRegister<UCH>;

    /** T_AirMin: minimum allowed air temperature */
    @ext(0x25, 0)
    model SourceTempMin is ReadonlyRegister<temp>;

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

    /** HeaterCommutations: defroster cycles */
    @ext(0x4f, 0)
    model HeaterStarts is ReadonlyRegister<ULG>;

    /** DeicingCommutations: deicing cycles */
    @ext(0x51, 0)
    model DeicingStarts is ReadonlyRegister<ULG>;

    /** DeicingRuntimeMinutes */
    @inherit(r)
    @ext(0x52, 0)
    model DeicingRuntimeMinutes {
      /** deicing run time */
      @unit("min")
      value: ULG;
    }

    /** DeiceErrorCommutations: deice error cycles */
    @ext(0x53, 0)
    model DeiceErrorStarts is ReadonlyRegister<ULG>;

    /** STBErrorCommutations: STB cycles */
    @ext(0x50, 0)
    model STBErrorStarts is ReadonlyRegister<ULG>;

    /** PowerOnCommutations: power on cycles */
    @ext(0x54, 0)
    model PowerOnStarts is ReadonlyRegister<ULG>;
  }
  @condition(Id.Id.sw, ">=130")
  namespace Sw_ge130 {
    /** CoolingActive */
    @ext(0x59, 0)
    model CoolingActive is ReadonlyRegister<yesno>;

    /** CoolingFanStartTemp: brine temperature to start fan while cooling */
    @ext(0x5a, 0)
    model CoolingFanStartTemp is InstallRegister<temp0>;

    /** CoolingFanStopTemp: reserved */
    @ext(0x5b, 0)
    model CoolingFanStopTemp is InstallRegister<temp0>;

    /** CoolingMaxFanSpeed: max. fan speed while cooling */
    @ext(0x5c, 0)
    model CoolingMaxFanSpeed is InstallRegister<percent0>;

    /** CoolingTest: reserved */
    @ext(0x5d, 0)
    model CoolingTest is InstallRegister<UCH>;
  }
  @condition(Id.Id.sw, "<131")
  namespace Sw_lt131 {
    /** Control command from HMU to OMU */
    @inherit(uw)
    @ext
    model OMUControl {
      /** new status */
      NewStatus: appliancecode;

      @maxLength(3)
      ign: IGN;

      /** current status */
      @in
      Status: appliancecode;

      /** last status */
      @in
      LastStatus: appliancecode;

      /** brine outlet temperature */
      @in
      @unit("°C")
      @divisor(16)
      BrineOutletTemp: D2C;

      /** air inlet temperature */
      @in
      @unit("°C")
      @divisor(16)
      TempAirInlet: D2C;

      @in
      ign_1: IGN;

      /** fan speed */
      @in
      @unit("/min")
      @factor(10)
      FanSpeed: UCH;

      /** fan power */
      @in
      FanPower: percent0;
    }
  }
  @condition(Id.Id.sw, ">=131")
  namespace Sw_ge131 {
    /** Control command from HMU to OMU */
    @inherit(uw)
    @ext
    model OMUControl {
      /** new status */
      NewStatus: appliancecode;

      @maxLength(7)
      ign: IGN;

      /** current status */
      @in
      Status: appliancecode;

      /** last status */
      @in
      LastStatus: appliancecode;

      /** brine outlet temperature */
      @in
      @unit("°C")
      @divisor(16)
      BrineOutletTemp: D2C;

      /** air inlet temperature */
      @in
      @unit("°C")
      @divisor(16)
      TempAirInlet: D2C;

      @in
      ign_1: IGN;

      /** fan speed */
      @in
      @unit("/min")
      @factor(10)
      FanSpeed: UCH;

      /** fan power */
      @in
      FanPower: percent0;
    }
  }

  /** included parts */
  union _includes {
    Hwcmode_inc,
    Timer_inc,
    Errors_inc,
  }
}
