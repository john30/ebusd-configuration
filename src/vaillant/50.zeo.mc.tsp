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
  // ##### MK: #####

  /** OperatingMode: 1=Heizen 2=Aus 3=Auto 4=Eco 5=Absenken */
  @ext(0x6, 0x4)
  model OperatingMode is ReadonlyRegister<mcmode>;

  /** MinFlowTemp: 1 °C resolution */
  @ext(0xb, 0x4)
  model FlowTempMin is ReadonlyRegister<temp0>;

  /** MaxFlowTemp: 1 °C resolution */
  @ext(0xc, 0x4)
  model FlowTempMax is ReadonlyRegister<temp0>;

  /** DesiredTemperature: 1/2 °C resolution */
  @ext(0xd, 0x4)
  model TempDesired is ReadonlyRegister<temp1>;

  /** DesiredLowTemperature: 1/2 °C resolution */
  @ext(0xe, 0)
  model TempDesiredLow is ReadonlyRegister<temp1>;

  /** HcMaxPreHeating: 0..5h */
  @ext(0x13, 0)
  model HcMaxPreHeating is ReadonlyRegister<UCH>;

  /** FloorPavingDryingDay */
  @ext(0x16, 0)
  model FloorPavingDryingDay is ReadonlyRegister<UCH>;

  /** Kreisart: 1=Brennerkreis 2=BrennerFestwert */
  @ext(0x17, 0)
  model Kreisart is ServiceRegister<UCH>;

  /** CircuitDiaState */
  @ext(0x18, 0x4)
  model CircuitDiaState is ReadonlyRegister<UCH>;

  /** CleaningLady: 0,5h */
  @ext(0x23, 0x4)
  model CleaningLady is ReadonlyRegister<UCH>;

  /** RemoteControlMode */
  @ext(0x24, 0)
  model RemoteControlMode is ReadonlyRegister<UCH>;

  /** RemoteControlRtOffset: 0,5°C */
  @ext(0x25, 0)
  model RemoteControlRtOffset is ReadonlyRegister<SCH>;

  /** ActualDesiredTemp: 1/2°C Auflösung */
  @ext(0x33, 0x4)
  model ActualTempDesired is ReadonlyRegister<temp1>;

  /** Regelungsart: 1 : Rücklaufregelung 2 : Vorlaufregelung */
  @ext(0x35, 0)
  model Regelungsart is ServiceRegister<UCH>;

  /** Configuration */
  @ext(0xc4, 0)
  model Konfiguration is ServiceRegister<UCH>;

  /** T_Hz: Vorlauf- oder Rücklauftemperatur je nach gewählter Regelungsart */
  @ext(0xd8, 0)
  model HzTemp is ReadonlyRegister<temp>;

  /** HT_Soll: °C */
  @ext(0xd9, 0)
  model HTSoll is ReadonlyRegister<temp>;

  /** included parts */
  union _includes {
    Mcmode_inc,
    Timer_inc,
    Roomtempoffset_inc,
    Quick_inc,
  }
}
