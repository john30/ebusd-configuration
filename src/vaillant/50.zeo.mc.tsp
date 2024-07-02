import "@ebusd/ebus-typespec";
import "./_templates.tsp";
import "./mcmode_inc.tsp";
import "./timer_inc.tsp";
import "./roomtempoffset_inc.tsp";
import "./quick_inc.tsp";
using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;
namespace Vaillant;

// @zz(0x50)
namespace Zeo.Mc {
  // ,ZEO00,Zeolite AMU,ZEO00 197 Mixer

  /** default *r */
  @base(MF, 0x9, 0xd)
  model r {}

  /** default *w */
  @write
  @base(MF, 0x9, 0xe)
  model w {}

  /** default *ws for user level "service" */
  @write
  @auth("service")
  @base(MF, 0x9, 0xe)
  model ws {}
  // ##### MK: #####

  /** OperatingMode */
  @inherit(r)
  @ext(0x6, 0x4)
  model OperatingMode {
    /** 1=Heizen 2=Aus 3=Auto 4=Eco 5=Absenken */
    value: mcmode;
  }

  /** MinFlowTemp */
  @inherit(r)
  @ext(0xb, 0x4)
  model FlowTempMin {
    /** 1 °C resolution */
    value: temp0;
  }

  /** MaxFlowTemp */
  @inherit(r)
  @ext(0xc, 0x4)
  model FlowTempMax {
    /** 1 °C resolution */
    value: temp0;
  }

  /** desired temperature */
  @inherit(r)
  @ext(0xd, 0x4)
  model TempDesired {
    /** 1/2 °C resolution */
    value: temp1;
  }

  /** DesiredLowTemperature */
  @inherit(r)
  @ext(0xe, 0)
  model TempDesiredLow {
    /** 1/2 °C resolution */
    value: temp1;
  }

  /** HcMaxPreHeating */
  @inherit(r)
  @ext(0x13, 0)
  model HcMaxPreHeating {
    /** 0,5h */
    value: UCH;
  }

  /** FloorPavingDryingDay */
  @inherit(r)
  @ext(0x16, 0)
  model FloorPavingDryingDay {
    value: UCH;
  }

  /** Kreisart */
  @inherit(r, ws)
  @ext(0x17, 0)
  model Kreisart {
    /** 1=Brennerkreis 2=BrennerFestwert */
    value: UCH;
  }

  /** CircuitDiaState */
  @inherit(r)
  @ext(0x18, 0x4)
  model CircuitDiaState {
    value: UCH;
  }

  /** CleaningLady */
  @inherit(r)
  @ext(0x23, 0x4)
  model CleaningLady {
    /** 0,5h */
    value: UCH;
  }

  /** RemoteControlMode */
  @inherit(r)
  @ext(0x24, 0)
  model RemoteControlMode {
    value: UCH;
  }

  /** RemoteControlRtOffset */
  @inherit(r)
  @ext(0x25, 0)
  model RemoteControlRtOffset {
    /** 0,5°C */
    value: SCH;
  }

  /** ActualDesiredTemp */
  @inherit(r)
  @ext(0x33, 0x4)
  model ActualTempDesired {
    /** 1/2°C Auflösung */
    value: temp1;
  }

  /** Regelungsart */
  @inherit(r, ws)
  @ext(0x35, 0)
  model Regelungsart {
    /** 1 : Rücklaufregelung 2 : Vorlaufregelung */
    value: UCH;
  }

  /** Configuration */
  @inherit(r, ws)
  @ext(0xc4, 0)
  model Konfiguration {
    value: UCH;
  }

  /** T_Hz */
  @inherit(r)
  @ext(0xd8, 0)
  model HzTemp {
    /** Vorlauf- oder Rücklauftemperatur je nach gewählter Regelungsart */
    value: temp;
  }

  /** HT_Soll */
  @inherit(r)
  @ext(0xd9, 0)
  model HTSoll {
    /** °C */
    value: temp;
  }

  /** included parts */
  union _includes {
    Mcmode_inc,
    Timer_inc,
    Roomtempoffset_inc,
    Quick_inc,
  }
}
