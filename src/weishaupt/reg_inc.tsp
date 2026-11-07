import "@ebusd/ebus-typespec";
import "@ebusd/ebus-typespec";
import "./_templates.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Weishaupt;

namespace register {

   /**[WCRC] Error Status */
   @wcrc(0x00, 0x00)
   model BootStatus is ReadonlyRegister<UIN>;

   /**[WCRC] Error Status */
   @wcrc(0x01, 0x00)
   model ErrorStatus is ReadonlyRegister<UIN>;

   /**[WCRC] Heat demand HK */
   @wcrc(0x02, 0x00)
   model HeatDemandTemp is ReadonlyRegister<temp10>;
   
   /**[WCRC] Hot water setpoint */
   @wcrc(0x03, 0x00)
   model DHWSetValue is ReadonlyRegister<temp10>;

   /**[WCRC] pply SetPoint (121) */
   @wcrc(0x04, 0x00)
   model SupplySetPointTemp is ReadonlyRegister<temp10>;

   /**[WCRC] Normal Room Temperature (112) */
   @wcrc(0x05, 0x00)
   model RoomNormalTemp is Register<roomNormalTemp>;
  
   /**[WCRC] Setback Room Temperature (113) */
   @wcrc(0x08, 0x00)
   model RoomSetbackTemp is Register<temp10>;

   /**[WCRC] Unknown Sensor 15 */
   @wcrc(0x0b, 0x00)
   model UnknownSensor15 is ReadonlyRegister<UIN>;

   /**[WCRC] B1 Outside Sensor Temperature */
   @wcrc(0x0c, 0x00)
   model OutsideTemp is ReadonlyRegister<outsidetemp10>;

   /**[WCRC] Flow temperature WTC */
   @wcrc(0x0d, 0x00)
   model SupplyWTCTemp is ReadonlyRegister<temp10>;

   /**[WCRC] B3 DHW Sensor Temperature */
   @wcrc(0x0e, 0x00)
   model DHWTemp is ReadonlyRegister<temp10>;

   /**[WCRC] B6 Supply Sensor Temperature */
   @wcrc(0x0f, 0x00)
   model SupplyHCTemp is ReadonlyRegister<temp10>;

   /**[WCRC] Configuration Status */
   @wcrc(0x10, 0x00)
   model ConfigStatus is ReadonlyRegister<UIN>;

   /**[WCRC] Room Sensor Temperature */
   @wcrc(0x11, 0x00)
   model RoomTemp is ReadonlyRegister<temp10>;

   /**[WCRC] Room setpoint */
   @wcrc(0x12, 0x00)
   model RoomSetPointTemp is ReadonlyRegister<temp10>;

   /**[WCRC] Hot water setpoint (176) */
   @wcrc(0x13, 0x00)
   model DHWSetpoint is Register<dhwSetpointTemp>;

   /**[WCRC] Blended Outside Temperature */
   @wcrc(0x1a, 0x00)
   model OutsideBlendedTemp is ReadonlyRegister<outsidetemp10>;

   /**[WCRC] WW Operation (343) */
   @wcrc(0x23, 0x00)
   model WWOperationMode is Register<DHWOperation>;

   /**[WCRC] Maximum Blocking Time (537) */
   @wcrc(0x25, 0x00)
   model BlockingTime is Register<minutes>;

   /**[WCRC] Maximum Supply Temperature (422) */
   @wcrc(0x28, 0x00)
   model SupplyMaxTemp is Register<supplyLimitTemp>;

   /**[WCRC]  Mixer Parameter (425) */
   @wcrc(0x2b, 0x00)
   model MixerParameterTemp is Register<temp10k>;

   /**[WCRC] dulation */
   @wcrc(0x2c, 0x00)
   model ModulationStatus is Register<percent>;

   /**[WCRC] 576 DHW exceeded */
   @wcrc(0x2d, 0x00)
   model DHWExceeded is Register<temp10>;

   /**[WCRC] Mixer Pump */
   @wcrc(0x52, 0x00)
   model MixerPump is ReadonlyRegister<Values_onoff>;

   /**[WCRC] Mixer Valve Opening */
   @wcrc(0x56, 0x00)
   model ValveOpening is ReadonlyRegister<Values_onoff>;

   /**[WCRC] Mixer Valve Closing */
   @wcrc(0x57, 0x00)
   model ValveClosing is ReadonlyRegister<Values_onoff>;

   /**[WCRC] Calorifier Top Temp B20 */
   @wcrc(0x76, 0x00)
   model ColorifierTopTemp is ReadonlyRegister<temp10>;

   /**[WCRC] Calorifier Bottom Temp B21   */
   @wcrc(0x78, 0x00)
   model ColorifierBottomTemp is ReadonlyRegister<temp10>;

   /**[WCRC] 14 Target value reduction for solar yield   */
   @wcrc(0x81, 0x00)
   model ReductionSolarYied is ReadonlyRegister<temp10k>;

   /**[WCRC] SOL/905_Durchfluss */
   @wcrc(0x82, 0x00)
   model Durchfluss is ReadonlyRegister<UIN>;    

   /**[WCRC] SOL/906_YieldSince_Wh */
   @wcrc(0x87, 0x00)
   model YieldSince_Wh is ReadonlyRegister<UIN>;   

   /**[WCRC] SOL/906_YieldSince_kWh */
   @wcrc(0x88, 0x00)
   model YieldSince_kWh is ReadonlyRegister<UIN>;   

   /**[WCRC] SOL/906_YieldSince_MWh */
   @wcrc(0x89, 0x00)
   model YieldSince_MWh is ReadonlyRegister<UIN>;   

   /**[WCRC] Legionella Protection Function (605) */
   @wcrc(0x01, 0x01)
   model DHWLegionellaDay is Register<WeekDay2>;

   /**[WCRC] Room Sensor Correction (101) */
   @wcrc(0x09, 0x01)
   model RoomSensorCorrectionTemp is Register<temp10k>;

   /**[WCRC] Steepness (175) */
   @wcrc(0x0e, 0x01)
   model GradientCurve is Register<gradient10>;

   /**[WCRC] Room Factor-P (508) */
   @wcrc(0x0f, 0x01)
   model RoomFactorCurve is Register<UIN>;

   /**[WCRC] Switch-on delay (353) */
   @wcrc(0x10, 0x01)
   model SwitchOnRuntime is Register<minutes>;

   /**[WCRC] Boiler MC Boost(424) */
   @wcrc(0x11, 0x01)
   model BoilerMCBoostTemp is Register<temp10k>;

   /**[WCRC] Program selector switch position*/
   @wcrc(0x12, 0x01)
   model ProgramMode is Register<Program>;

   /**[WCRC] Adaption (507) */
   @wcrc(0x15, 0x01)
   model AdaptionMode is Register<Values_onoff>;

   /**[WCRC] mmer/winter changeover temperature (174)   */
   @wcrc(0x16, 0x01)
   model SummerWinterChangeOverTemp is Register<summerWinterTemp>;

   /**[WCRC] Screed function (381) */
   @wcrc(0x1a, 0x01)
   model FloorDryingMode is Register<Floordrying>;

   /**[WCRC] Hollyday Start Day */
   @wcrc(0x1b, 0x01)
   model HolidayRuntimeFromDay is Register<UIN>;

    /**[WCRC] Hollyday Start Month */
   @wcrc(0x1c, 0x01)
   model HolidayRuntimeFromMonth is Register<month>;

   /**[WCRC] Hollyday Start Year */
   @wcrc(0x1d, 0x01)
   model HolidayRuntimeFromYear is Register<UIN>;

   /**[WCRC] Hollyday End Day */
   @wcrc(0x1e, 0x01)
   model HolidayRuntimeToDay is Register<UIN>;

   /**[WCRC] Hollyday End Month */
   @wcrc(0x1f, 0x01)
   model HolidayRuntimeToMonth is Register<month>;

   /**[WCRC] Hollyday End Year */
   @wcrc(0x20, 0x01)
   model HolidayRuntimeToYear is Register<UIN>;

   /**[WCRC] SystemDate WeekDay */
   @wcrc(0x21, 0x01)
   model SystemDateWeekday is Register<WeekDay2>;

   /**[WCRC] SystemDate Day */
   @wcrc(0x22, 0x01)
   model SystemDateDay is Register<UIN>;

   /**[WCRC] SystemDate Month */
   @wcrc(0x23, 0x01)
   model SystemDateMonth is Register<month>;

   /**[WCRC] SystemDate Year */
   @wcrc(0x24, 0x01)
   model SystemDateYear is Register<UIN>;

   /**[WCRC] SystemTime Hour */
   @wcrc(0x25, 0x01)
   model SystemTimeHour is Register<hours>;

   /**[WCRC] SystemTime Minute */
   @wcrc(0x26, 0x01)
   model SystemTimeMinute is Register<minutes>;

   /**[WCRC] SystemTime Hour */
   @wcrc(0x27, 0x01)
   model SystemTimeSecond is Register<seconds>;

   /**[WCRC] Construction method (371) */
   @wcrc(0x28, 0x01)
   model TypeOfConstructionMode is Register<Constructiontype>;

   /**[WCRC] 15 Normal SPL-Set */
   @wcrc(0x29, 0x01)
   model NormalSplSetTemp is Register<temp10>;

   /**[WCRC] 16 Reduced SPL-Set */
   @wcrc(0x2a, 0x01)
   model ReducedSplSetTemp is Register<temp10>;

   /**[WCRC] Minimum Supply Temperature (421) */
   @wcrc(0x2b, 0x01)
   model SupplyMinTemp is Register<supplyLimitTemp>;

   /**[WCRC] Holiday temperature (183) */
   @wcrc(0x2d, 0x01)
   model HolidayTemp is Register<TempReduced>;

   /**[WCRC] WTC delay(430) */
   @wcrc(0x2e, 0x01)
   model WtcDelayRuntime is Register<minutes>;

   /**[WCRC] Max Pump speed (358) */
   @wcrc(0x2f, 0x01)
   model PumpMaxSpeed is Register<percent>;

   /**[WCRC] Min Pump speed (359) */
   @wcrc(0x30, 0x01)
   model PumpMinSpeed is Register<percent>;

   /**[WCRC] VSD variable (429) */
   @wcrc(0x31, 0x01)
   model PumpVSDvariable is Register<PumpVariationSpeed>;

   /**[WCRC] ReductTemp (501) */
   @wcrc(0x32, 0x01)
   model ReductTemp is Register<TempReduced>;

   /**[WCRC] Hot water Min (177) */
   @wcrc(0x33, 0x01)
   model DHWMinTemp is Register<outsidetemp>;

   /**[WCRC] DHW maximum Temp (601) */
   @wcrc(0x34, 0x01)
   model DHWMaxTemp is Register<temp10>;

   /**[WCRC] WW-Mode (361) */
   @wcrc(0x35, 0x01)
   model DHWMode is Register<Dhw>;

   /**[WCRC] WW operation (360) */
   @wcrc(0x37, 0x01)
   model DHWOperationMode is Register<DHWOperation>;

   /**[WCRC] R3B01 */
   @wcrc(0x3b, 0x01)
   model R3B01 is Register<UIN>;

   /**[WCRC] 42 Holiday Temperature Level*/
   @wcrc(0x3d, 0x01)
   model HolidayTempLevel is Register<temp10>;

   /**[WCRC] 575 DHW Switch Diff */
   @wcrc(0x40, 0x01)
   model DHWSwitchDiff is Register<temp10k>;

   /**[WCRC] Control Variation (318) */
   @wcrc(0x41, 0x01)
   model ControlVariationMode is Register<CVariation>;

   /**[WCRC] OB/i31_TempAbgas */
   @wcrc(0x45, 0x01)
   model TempAbgas is ReadonlyRegister<outsidetemp>;

   /**[WCRC] 577 WW Load Time */
   @wcrc(0x80, 0x01)
   model DHWLoadTime is Register<minutes>;

   /**[WCRC] 574 DHW-Max */
   @wcrc(0x81, 0x01)
   model DHWMaxTemp2 is Register<temp10>;

   /**[WCRC] Ka Version */
   @wcrc(0x8f, 0x01)
   model KaVersion is ReadonlyRegister<SIN>;

   /**[WCRC] Version Major */
   @wcrc(0x99, 0x01)
   model VersionMajor is ReadonlyRegister<UIN>;

   /**[WCRC] Version Minor */
   @wcrc(0x9a, 0x01)
   model VersionMinor is ReadonlyRegister<UIN>;

   /**[WCRC] H1 Control Voltage */
   @wcrc(0xa9, 0x01)
   model H1ControlVoltage is ReadonlyRegister<UIN>;

   /**[WCRC] H1 Control Current */
   @wcrc(0xaA, 0x01)
   model H1ControlCurrent is ReadonlyRegister<UIN>;

   /**[WCRC] 483 Screed Start Temperature */
   @wcrc(0xbb, 0x01)
   model FHCMinTemp is Register<temp10>;

   /**[WCRC] 484 Tag Min Temp Fhz */
   @wcrc(0xbc, 0x01)
   model FHCMinTempDays is Register<UIN>;

   /**[WCRC] SOL/905_Leistung */
   @wcrc(0xdb, 0x01)
   model Leistung is Register<UIN>;

   /**[WCRC] Reset Error Memory */
   @wcrc(0x7a, 0x02)
   model ResetErrorMemory is Register<UIN>;

   /**[WCRC] FS_EM_W4_Sensor */
   @wcrc(0x85, 0x02)
   model FS_EM_W4_Sensor is Register<UIN>;


   /**[WCRC] 573 DHW Min Temp */
   @wcrc(0x8a, 0x02)
   model DHWMinTemp2 is Register<temp10>;


   /**[WCRC] 540 I Regler */
   @wcrc(0x9e, 0x02)
   model RegulationI is Register<UIN>;

   /**[WCRC] 539 1/P Regler */
   @wcrc(0x9f, 0x02)
   model RegulationP is Register<UIN>;

   /**[WCRC] OB/i45_LetzteWartung */
   @wcrc(0xbc, 0x02)
   model i45_LetzteWartung is ReadonlyRegister<UIN>;

   /**[WCRC] 82 Frost Protection Limit */
   @wcrc(0xbe, 0x02)
   model FrostProtectionLimitTemp is Register<temp10>;

   /**[WCRC] SOL/902_StatusDTR */
   @wcrc(0xf1, 0x02)
   model StatusDTR is ReadonlyRegister<UIN>;

   /**[WCRC] FS_EM_R2_Sensor */
   @wcrc(0x59, 0x03)
   model FS_EM_R2_Sensor is Register<UIN>;

   /**[WCRC] B3Sensor */
   @wcrc(0xe9, 0x04)
   model B3Sensor is Register<temp10>;

   /**[WCRC] 580 AntiLeg Setp Temperature */
   @wcrc(0x87, 0x05)
   model LegionellaSetupTemp is Register<temp10>;

   /**[WCRC] 70 Delay WTC */
   @wcrc(0x14, 0x06)
   model WTCDelay is Register<minutes>;
 
   /**[WCRC] SOL/907_YieldSum_Wh */
   @wcrc(0x7c, 0x06)
   model YieldSum_Wh_907 is ReadonlyRegister<UIN>;

   /**[WCRC] SOL/907_YieldSum_kWh */
   @wcrc(0x7d, 0x06)
   model YieldSum_kWh_907 is ReadonlyRegister<UIN>;

   /**[WCRC] SOL/907_YieldSum_MWh */
   @wcrc(0x7e, 0x06)
   model YieldSum_MWh    is ReadonlyRegister<UIN>;

   /**[WCRC] SOL/906_YieldResetDateYear */
   @wcrc(0x7f, 0x06)
   model YieldResetDateYear is ReadonlyRegister<UIN>;

   /**[WCRC] SOL/906_YieldResetDateMonth */
   @wcrc(0x80, 0x06)
   model YieldResetDateMonth is ReadonlyRegister<UIN>;

   /**[WCRC] SOL/906_YieldResetDateDay */
   @wcrc(0x81, 0x06)
   model YieldResetDateDay is ReadonlyRegister<UIN>;

   /**[WCRC] SOL/908_YieldSum_Wh */
   @wcrc(0x86, 0x06)
   model YieldSum_Wh_908 is ReadonlyRegister<UIN>;

   /**[WCRC] SOL/908_YieldSum_kWh */
   @wcrc(0x87, 0x06)
   model YieldSum_kWh_908 is ReadonlyRegister<UIN>;

   /**[WCRC] AE06 */
   @wcrc(0xaE, 0x06)
   model AE06 is Register<UIN>;

   /**[WCRC] AF06 */
   @wcrc(0xaF, 0x06)
   model AF06 is Register<UIN>;

   /**[WCRC] 485 Max Temperature FHC */
   @wcrc(0x9c, 0x08)
   model FHCMaxTemp is Register<UIN>;


   /**[WCRC] 486 Days Max Temperature FHC */
   @wcrc(0x9d, 0x08)
   model FHCMaxTempDays is Register<UIN>;

   /**[WCRC] 487 Days Cooling FHC */
   @wcrc(0x9e, 0x08)
   model FHCCoolingDays is Register<UIN>;

   /**[WCRC] 488 Days Heat-Up BHC */
   @wcrc(0x9f, 0x08)
   model BHCHeatUpDays is Register<UIN>;

   /**[WCRC] 489 Max Temperature BHC */
   @wcrc(0xa0, 0x08)
   model BHCMaxTemp is Register<UIN>;

   /**[WCRC] 490 Days Max Temperature BHC */
   @wcrc(0xa1, 0x08)
   model BHCMaxTempDays is Register<UIN>;

   /**[WCRC] 491 Days Cooling BHC */
   @wcrc(0xa2, 0x08)
   model BHCCoolingDays is Register<UIN>;

   /**[WCRC] Room factor-I */
   @wcrc(0x71, 0x09)
   model RoomFactorI is Register<UIN>;

   /**[WCRC] R7209 */
   @wcrc(0x72, 0x09)
   model R7209 is Register<UIN>;

   /**[WCRC] 16 Heating Circuit Type */
   @wcrc(0x73, 0x09)
   model HCTypeMode is Register<HCType>;

   /**[WCRC] 583 Circ time */
   @wcrc(0x81, 0x09)
   model LegionellaCirculationTime is Register<UIN>;

   /**[WCRC] R000A */
   @wcrc(0x00, 0x0a)
   model R000A is Register<UIN>;

   /**[WCRC] igted Outside Temperature */
   @wcrc(0x0c, 0x0a)
   model OutsideWeightedTemp is ReadonlyRegister<outsidetemp>;

   /**[WCRC] Screed day (382) */
   @wcrc(0x12, 0x0a)
   model FloorDryingDay is Register<UIN>;

   /**[WCRC] Screed temperature (383) */
   @wcrc(0x13, 0x0a)
   model FloorDryingTemp is Register<temp1>;

   /**[WCRC] Room frost protection (173) */
   @wcrc(0x14, 0x0a)
   model RoomFrostProtectionTemp is Register<roomFrostTemp>;

   /**[WCRC] Mixed Outside Temperature */
   @wcrc(0x1a, 0x0a)
   model OutsideMixedTemp is ReadonlyRegister<outsidetemp>;

   /**[WCRC] Room thermostat (344) */
   @wcrc(0x1d, 0x0a)
   model RoomThermostatTemp is Register<temp1>;

   /**[WCRC] FS_EM_W1_Sensor */
   @wcrc(0x20, 0x0a)
   model FS_EM_W1_Sensor is Register<UIN>;

   /**[WCRC] H1 Actual KA */
   @wcrc(0x28, 0x0a)
   model H1StatusKA is ReadonlyRegister<UIN>;

   /**[WCRC] H1Status EM SOL/903_TempKollektor_TKO_T1 */
   @wcrc(0x29, 0x0a)
   model H1Status is ReadonlyRegister<UIN>;

   /**[WCRC] SOL/903_TempSolU_TSU_T2 */
   @wcrc(0x2a, 0x0a)
   model TempSolU_TSU_T2 is ReadonlyRegister<temp10>;

   /**[WCRC] SOL/904_TempSolVL_TKV_T3 */
   @wcrc(0x2b, 0x0a)
   model TempSolVL_TKV_T3 is ReadonlyRegister<temp10>;

   /**[WCRC] SOL/904_TempSolRL_TKR_T4 */
   @wcrc(0xc0, 0x0a)
   model TempSolRL_TKR_T4 is ReadonlyRegister<temp10>;

   /**[WCRC] PWT Primaire Exch B24 */
   @wcrc(0x40, 0x0a)
   model PWTPrimTemp is ReadonlyRegister<temp10>;

   /**[WCRC] 31 H1 Function   */
   @wcrc(0x5b, 0x0a)
   model H1Function is ReadonlyRegister<UIN>;

   /**[WCRC] MFA2 Actual */
   @wcrc(0x8e, 0x0a)
   model MFA2Status is ReadonlyRegister<UIN>;

   /**[WCRC] Error History Id */
   @wcrc(0x9a, 0x0b)
   model ErrorId is Register<UIN>;

   /**[WCRC] Error Code */
   @wcrc(0x9b, 0x0b)
   model ErrorCode is ReadonlyRegister<UIN>;

   /**[WCRC] Error Type */
   @wcrc(0x9c, 0x0b)
   model ErrorType is ReadonlyRegister<UIN>;

   /**[WCRC] Error Device */
   @wcrc(0x9d, 0x0b)
   model ErrorDevice is ReadonlyRegister<UIN>;

   /**[WCRC] Error Time Minute */
   @wcrc(0x9f, 0x0b)
   model ErrorMinute is ReadonlyRegister<minutes>;

   /**[WCRC] rror Time Hour */
   @wcrc(0xa0, 0x0b)
   model ErrorHour is ReadonlyRegister<hours>;

   /**[WCRC] Error Date Day   */
   @wcrc(0xa1, 0x0b)
   model ErrorDay is ReadonlyRegister<UIN>;

   /**[WCRC] Error Date Month */
   @wcrc(0xa2, 0x0b)
   model ErrorMonth is ReadonlyRegister<month>;

   /**[WCRC] Error Date Year */
   @wcrc(0xa3, 0x0b)
   model ErrorYear is ReadonlyRegister<UIN>;

   /**[WCRC] OB/i30_TempVLKessel */
   @wcrc(0x1d, 0x0c)
   model TempVLKessel is Register<outsidetemp>;

   /**[WCRC] R0C1F */
   @wcrc(0x1f, 0x0c)
   model R0C1F is Register<UIN>;

   /**[WCRC] R210C */
   @wcrc(0x21, 0x0c)
   model R210C is Register<UIN>;

   /**[WCRC] OB/i40_SchaltspielBrenner */
   @wcrc(0x7d, 0x0c)
   model i40_SchaltspielBrenner is Register<UIN>;

   /**[WCRC] OB/i41_SchaltspielBrenner */
   @wcrc(0x7c, 0x0c)
   model i41_SchaltspielBrenner is Register<UIN>;

   /**[WCRC] OB/i42_BetrStundenBrenner */
   @wcrc(0x7f, 0x0c)
   model i42_BetrStundenBrenner is Register<UIN>;

   /**[WCRC] OB/i43_BetrStundenBrenner */
   @wcrc(0x7e, 0x0c)
   model i43_BetrStundenBrenner is Register<UIN>;

   /**[WCRC] OB/i46_OelZaehler_1000 */
   @wcrc(0xd0, 0x0e)
   model i46_OelZaehler_1000 is Register<UIN>;

   /**[WCRC] OB/i47_OelZaehler */
   @wcrc(0xd1, 0x0e)
   model i47_OelZaehler is Register<UIN>;

   /**[WCRC] Current performance */
   @wcrc(0x50, 0x10)
   model Currentperformance is Register<UIN>;

   /**[WCRC] Solar Recovery with Legionella */
   @wcrc(0xf1, 0x13)
   model SolarRecoverWithLegionella is Register<Values_onoff>;

   /**[WCRC] 578 Max Load DHW */
   @wcrc(0xf2, 0x13)
   model DHWMaxLoad is Register<percent>;

   /**[WCRC] 582 Circ With Legionella */
   @wcrc(0xf3, 0x13)
   model CircWithLegionella is Register<Values_onoff>;

   /**[WCRC] UnknownSensor11 */
   @wcrc(0x04, 0x76)
   model UnknownSensor11 is Register<UIN>;

   /**[WCRC] UnknownSensor12 */
   @wcrc(0x04, 0x78)
   model UnknownSensor12 is Register<UIN>;

   /**[WCRC] 522 Output MFA 2 */
   @wcrc(0xa4, 0xfd)
   model OutputMFA2 is Register<UIN>;

   /**[WCRC] 526 Input N1 */
   @wcrc(0xc2, 0xfd)
   model InputN1 is Register<Values_onoff>;

   /**[WCRC] 533 Boiler Sequence 1 1 */
   @wcrc(0xca, 0xfd)
   model BoilerSequence1_1 is Register<boilerid>;

   /**[WCRC] 533 Boiler Sequence 1 2 */
   @wcrc(0xcb, 0xfd)
   model BoilerSequence1_2 is Register<boilerid>;

   /**[WCRC] 533 Boiler Sequence 1 3 */
   @wcrc(0xcc, 0xfd)
   model BoilerSequence1_3 is Register<boilerid>;

   /**[WCRC] 533 Boiler Sequence 1 4 */
   @wcrc(0xcd, 0xfd)
   model BoilerSequence1_4 is Register<boilerid>;

   /**[WCRC] 533 Boiler Sequence 1 5 */
   @wcrc(0xce, 0xfd)
   model BoilerSequence1_5 is Register<boilerid>;

   /**[WCRC] 533 Boiler Sequence 2 1 */
   @wcrc(0xd4, 0xfd)
   model BoilerSequence2_1 is Register<boilerid>;

   /**[WCRC] 533 Boiler Sequence 2 2 */
   @wcrc(0xd5, 0xfd)
   model BoilerSequence2_2 is Register<boilerid>;

   /**[WCRC] 533 Boiler Sequence 2 3 */
   @wcrc(0xd6, 0xfd)
   model BoilerSequence2_3 is Register<boilerid>;

   /**[WCRC] 533 Boiler Sequence 2 4 */
   @wcrc(0xd7, 0xfd)
   model BoilerSequence2_4 is Register<boilerid>;

   /**[WCRC] 533 Boiler Sequence 2 5 */
   @wcrc(0xd8, 0xfd)
   model BoilerSequence2_5 is Register<boilerid>;

   /**[WCRC] 593 SummerTime Start Day */
   @wcrc(0xde, 0xfd)
   model SummerTimeFromDay is Register<UIN>;

   /**[WCRC] 593 SummerTime Start Month */
   @wcrc(0xdf, 0xfd)
   model SummerTimeFromMonth is Register<month>;

   /**[WCRC] 594 SummerTime End Day */
   @wcrc(0xe0, 0xfd)
   model SummerTimeToDay is Register<UIN>;

   /**[WCRC] 594 SummerTime End Month */
   @wcrc(0xe1, 0xfd)
   model SummerTimeToMonth is Register<month>;

   /**[WCRC] 562 Calorfier Switch Difference */
   @wcrc(0xe2, 0xfd)
   model CalorfierSwitchDifference is Register<temp1>;

   /**[WCRC] 561 Calorfier exceeded */
   @wcrc(0xe3, 0xfd)
   model CalorfierExceeded is Register<temp1>;

   /**[WCRC] 553 De-Couple Max */
   @wcrc(0xe6, 0xfd)
   model DeCoupleMax is Register<temp1>;

   /**[WCRC] 552 De-Couple Min */
   @wcrc(0xe7, 0xfd)
   model DeCoupleMin is Register<temp1>;

   /**[WCRC] 551 De-Couple Exceeded */
   @wcrc(0xe8, 0xfd)
   model DeCoupleExceeded is Register<temp1>;

   /**[WCRC] 538 Cont. Temp */
   @wcrc(0xe9, 0xfd)
   model ContTemp is Register<temp1>;

   /**[WCRC] 536 Modulation Max */
   @wcrc(0xea, 0xfd)
   model ModulationMax is Register<modulationPercent>;

   /**[WCRC] 535 Modulation Min */
   @wcrc(0xeb, 0xfd)
   model ModulationMin is Register<modulationPercent>;

   /**[WCRC] 532 Change Over Time */
   @wcrc(0xec, 0xfd)
   model ChangeOverTime is Register<temp1>;

   /**[WCRC] 531 Sequence Change Mode */
   @wcrc(0xed, 0xfd)
   model SequenceChangeMode is Register<UIN>;

   /**[WCRC] 525 Spectial Level */
   @wcrc(0xee, 0xfd)
   model SpecialLevel is Register<UIN>;

   /**[WCRC] 524 Input H1 */
   @wcrc(0xef, 0xfd)
   model InputH1 is Register<UIN>;

   /**[WCRC] VA Status */
   @wcrc(0xf0, 0xfd)
   model VAStatus is Register<Values_onoff>;

   /**[WCRC] 523 Output VA */
   @wcrc(0xf1, 0xfd)
   model OutputVA is Register<Values_onoff>;

   /**[WCRC] MFA 1 Status */
   @wcrc(0xf2, 0xfd)
   model MFA1Status is Register<Values_onoff>;

   /**[WCRC] 521 Output MFA 1 */
   @wcrc(0xf3, 0xfd)
   model OutputMFA1 is Register<UIN>;

   /**[WCRC] 581 Legionella Time */
   @wcrc(0xf4, 0xfd)
   model LegionellaTime is Register<TTQ>;

   /**[WCRC] 5UnknownSensor8 */
   @wcrc(0xfb, 0xfd)
   model UnknownSensor8 is Register<UIN>;

   /**[WCRC] Heating Program1 Monday 1 To/From */
   @wcrc(0x10, 0x14)
   model HCRuntimeProgram1Mo1 is cal;

   /**[WCRC] Heating Program1 Monday 2 To/From */
   @wcrc(0x11, 0x14)
   model HCRuntimeProgram1Mo2 is cal;

   /**[WCRC] Heating Program1 Monday 3 To/From */
   @wcrc(0x12, 0x14)
   model HCRuntimeProgram1Mo3 is cal;

   /**[WCRC] Heating Program1 Tuesday 1 To/From */
   @wcrc(0x20, 0x14)
   model HCRuntimeProgram1Tu1 is cal;

   /**[WCRC] Heating Program1 Tuesday 2 To/From */
   @wcrc(0x21, 0x14)
   model HCRuntimeProgram1Tu2 is cal;

    /**[WCRC] Heating Program1 Tuesday 3 To/From */
   @wcrc(0x22, 0x14)
   model HCRuntimeProgram1Tu3 is cal;

   /**[WCRC] Heating Program1 Wednesday 1 To/From */
   @wcrc(0x30, 0x14)
   model HCRuntimeProgram1We1 is cal;

   /**[WCRC] Heating Program1 Wednesday 2 To/From */
   @wcrc(0x31, 0x14)
   model HCRuntimeProgram1We2 is cal;

   /**[WCRC] Heating Program1 Wednesday 3 To/From */
   @wcrc(0x32, 0x14)
   model HCRuntimeProgram1We3 is cal;

   /**[WCRC] Heating Program1 Thursday 1 To/From */
   @wcrc(0x40, 0x14)
   model HCRuntimeProgram1Th1 is cal;

   /**[WCRC] Heating Program1 Thursday 2 To/From */
   @wcrc(0x41, 0x14)
   model HCRuntimeProgram1Th2 is cal;

   /**[WCRC] Heating Program1 Thursday 3 To/From */
   @wcrc(0x42, 0x14)
   model HCRuntimeProgram1Th3 is cal;

   /**[WCRC] Heating Program1 Friday 1 To/From */
   @wcrc(0x50, 0x14)
   model HCRuntimeProgram1Fr1 is cal;

   /**[WCRC] Heating Program1 Friday 2 To/From */
   @wcrc(0x51, 0x14)
   model HCRuntimeProgram1Fr2 is cal;

   /**[WCRC] Heating Program1 Friday 3 To/From */
   @wcrc(0x52, 0x14)
   model HCRuntimeProgram1Fr3 is cal;

   /**[WCRC] Heating Program1 Saturday 1 To/From */
   @wcrc(0x60, 0x14)
   model HCRuntimeProgram1Sa1 is cal;

   /**[WCRC] Heating Program1 Saturday 2 To/From */
   @wcrc(0x61, 0x14)
   model HCRuntimeProgram1Sa2 is cal;

   /**[WCRC] Heating Program1 Saturday 3 To/From */
   @wcrc(0x62, 0x14)
   model HCRuntimeProgram1Sa3 is cal;

   /**[WCRC] Heating Program1 Sunday 1 To/From */
   @wcrc(0x70, 0x14)
   model HCRuntimeProgram1Su1 is cal;

   /**[WCRC] Heating Program1 Sunday 2 To/From */
   @wcrc(0x71, 0x14)
   model HCRuntimeProgram1Su2 is cal;

   /**[WCRC] Heating Program1 Sunday 3 To/From */
   @wcrc(0x72, 0x14)
   model HCRuntimeProgram1Su3 is cal;

   /**[WCRC] Heating Program2 Monday 1 To/From */
   @wcrc(0x10, 0x15)
   model HCRuntimeProgram2Mo1 is cal;

   /**[WCRC] Heating Program2 Monday 2 To/From */
   @wcrc(0x11, 0x15)
   model HCRuntimeProgram2Mo2 is cal;

   /**[WCRC] Heating Program2 Monday 3 To/From */
   @wcrc(0x12, 0x15)
   model HCRuntimeProgram2Mo3 is cal;

   /**[WCRC] Heating Program2 Tuesday 1 To/From */
   @wcrc(0x20, 0x15)
   model HCRuntimeProgram2Tu1 is cal;

   /**[WCRC] Heating Program2 Tuesday 2 To/From */
   @wcrc(0x21, 0x15)
   model HCRuntimeProgram2Tu2 is cal;

   /**[WCRC] Heating Program2 Tuesday 3 To/From */
   @wcrc(0x22, 0x15)
   model HCRuntimeProgram2Tu3 is cal;

   /**[WCRC] Heating Program2 Wednesday 1 To/From */
   @wcrc(0x30, 0x15)
   model HCRuntimeProgram2We1 is cal;

   /**[WCRC] Heating Program2 Wednesday 2 To/From */
   @wcrc(0x31, 0x15)
   model HCRuntimeProgram2We2 is cal;

   /**[WCRC] Heating Program2 Wednesday 3 To/From */
   @wcrc(0x32, 0x15)
   model HCRuntimeProgram2We3 is cal;

   /**[WCRC] Heating Program2 Thursday 1 To/From */
   @wcrc(0x40, 0x15)
   model HCRuntimeProgram2Th1 is cal;

   /**[WCRC] Heating Program2 Thursday 2 To/From */
   @wcrc(0x41, 0x15)
   model HCRuntimeProgram2Th2 is cal;

   /**[WCRC] Heating Program2 Thursday 3 To/From */
   @wcrc(0x42, 0x15)
   model HCRuntimeProgram2Th3 is cal;

   /**[WCRC] Heating Program2 Friday 1 To/From */
   @wcrc(0x50, 0x15)
   model HCRuntimeProgram2Fr1 is cal;

   /**[WCRC] Heating Program2 Friday 2 To/From */
   @wcrc(0x51, 0x15)
   model HCRuntimeProgram2Fr2 is cal;

   /**[WCRC] Heating Program2 Friday 3 To/From */ 
   @wcrc(0x52, 0x15)
   model HCRuntimeProgram2Fr3 is cal;

   /**[WCRC] Heating Program2 Saturday 1 To/From */
   @wcrc(0x60, 0x15)
   model HCRuntimeProgram2Sa1 is cal;

   /**[WCRC] Heating Program2 Saturday 2 To/From */
   @wcrc(0x61, 0x15)
   model HCRuntimeProgram2Sa2 is cal;

   /**[WCRC] Heating Program2 Saturday 3 To/From */
   @wcrc(0x62, 0x15)
   model HCRuntimeProgram2Sa3 is cal;

   /**[WCRC] Heating Program2 Sunday 1 To/From */
   @wcrc(0x70, 0x15)
   model HCRuntimeProgram2Su1 is cal;

   /**[WCRC] Heating Program2 Sunday 2 To/From */
   @wcrc(0x71, 0x15)
   model HCRuntimeProgram2Su2 is cal;

   /**[WCRC] Heating Program2 Sunday 3 To/From */
   @wcrc(0x72, 0x15)
   model HCRuntimeProgram2Su3 is cal;

   /**[WCRC] Heating Program3 Monday 1 To/From */
   @wcrc(0x10, 0x16)
   model HCRuntimeProgram3Mo1 is cal;

   /**[WCRC] Heating Program3 Monday 2 To/From */
   @wcrc(0x11, 0x16)
   model HCRuntimeProgram3Mo2 is cal;

   /**[WCRC] Heating Program3 Monday 3 To/From */
   @wcrc(0x12, 0x16)
   model HCRuntimeProgram3Mo3 is cal;

   /**[WCRC] Heating Program3 Tuesday 1 To/From */
   @wcrc(0x20, 0x16)
   model HCRuntimeProgram3Tu1 is cal;

   /**[WCRC] Heating Program3 Tuesday 2 To/From */
   @wcrc(0x21, 0x16)
   model HCRuntimeProgram3Tu2 is cal;

   /**[WCRC] Heating Program3 Tuesday 3 To/From */
   @wcrc(0x22, 0x16)
   model HCRuntimeProgram3Tu3 is cal;

   /**[WCRC] Heating Program3 Wednesday 1 To/From */
   @wcrc(0x30, 0x16)
   model HCRuntimeProgram3We1 is cal;

   /**[WCRC] Heating Program3 Wednesday 2 To/From */
   @wcrc(0x31, 0x16)
   model HCRuntimeProgram3We2 is cal;

   /**[WCRC] Heating Program3 Wednesday 3 To/From */
   @wcrc(0x32, 0x16)
   model HCRuntimeProgram3We3 is cal;

   /**[WCRC] Heating Program3 Thursday 1 To/From */
   @wcrc(0x40, 0x16)
   model HCRuntimeProgram3Th1 is cal;

   /**[WCRC] Heating Program3 Thursday 2 To/From */
   @wcrc(0x41, 0x16)
   model HCRuntimeProgram3Th2 is cal;

   /**[WCRC] Heating Program3 Thursday 3 To/From */
   @wcrc(0x42, 0x16)
   model HCRuntimeProgram3Th3 is cal;

   /**[WCRC] Heating Program3 Friday 1 To/From */
   @wcrc(0x50, 0x16)
   model HCRuntimeProgram3Fr1 is cal;

   /**[WCRC] Heating Program3 Friday 2 To/From */
   @wcrc(0x51, 0x16)
   model HCRuntimeProgram3Fr2 is cal;

   /**[WCRC] Heating Program3 Friday 3 To/From */
   @wcrc(0x52, 0x16)
   model HCRuntimeProgram3Fr3 is cal;

   /**[WCRC] Heating Program3 Saturday 1 To/From */
   @wcrc(0x60, 0x16)
   model HCRuntimeProgram3Sa1 is cal;

   /**[WCRC] Heating Program3 Saturday 2 To/From */
   @wcrc(0x61, 0x16)
   model HCRuntimeProgram3Sa2 is cal;

   /**[WCRC] Heating Program3 Saturday 3 To/From */
   @wcrc(0x62, 0x16)
   model HCRuntimeProgram3Sa3 is cal;

   /**[WCRC] Heating Program3 Sunday 1 To/From */
   @wcrc(0x70, 0x16)
   model HCRuntimeProgram3Su1 is cal;

   /**[WCRC] Heating Program3 Sunday 2 To/From */
   @wcrc(0x71, 0x16)
   model HCRuntimeProgram3Su2 is cal;

   /**[WCRC] Heating Program3 Sunday 3 To/From */
   @wcrc(0x72, 0x16)
   model HCRuntimeProgram3Su3 is cal;

   /**[WCRC] Hot Water Program Monday 1 To/From */
   @wcrc(0x10, 0x17)
   model DHWRuntimeProgramMo1 is cal;

   /**[WCRC] Hot Water Program Monday 2 To/From */
   @wcrc(0x11, 0x17)
   model DHWRuntimeProgramMo2 is cal;

   /**[WCRC] Hot Water Program Monday 3 To/From */
   @wcrc(0x12, 0x17)
   model DHWRuntimeProgramMo3 is cal;

   /**[WCRC] Hot Water Program Tuesday 1 To/From */
   @wcrc(0x20, 0x17)
   model DHWRuntimeProgramTu1 is cal;

   /**[WCRC] Hot Water Program Tuesday 2 To/From */
   @wcrc(0x21, 0x17)
   model DHWRuntimeProgramTu2 is cal;

   /**[WCRC] Hot Water Program Tuesday 3 To/From */
   @wcrc(0x22, 0x17)
   model DHWRuntimeProgramTu3 is cal;

   /**[WCRC] Hot Water Program Wednesday 1 To/From */
   @wcrc(0x30, 0x17)
   model DHWRuntimeProgramWe1 is cal;

   /**[WCRC] Hot Water Program Wednesday 2 To/From */
   @wcrc(0x31, 0x17)
   model DHWRuntimeProgramWe2 is cal;

   /**[WCRC] Hot Water Program Wednesday 3 To/From */
   @wcrc(0x32, 0x17)
   model DHWRuntimeProgramWe3 is cal;

   /**[WCRC] Hot Water Program Thursday 1 To/From */
   @wcrc(0x40, 0x17)
   model DHWRuntimeProgramTh1 is cal;

   /**[WCRC] Hot Water Program Thursday 2 To/From */
   @wcrc(0x41, 0x17)
   model DHWRuntimeProgramTh2 is cal;

   /**[WCRC] Hot Water Program Thursday 3 To/From */
   @wcrc(0x42, 0x17)
   model DHWRuntimeProgramTh3 is cal;

   /**[WCRC] Hot Water Program Friday 1 To/From */
   @wcrc(0x50, 0x17)
   model DHWRuntimeProgramFr1 is cal;

   /**[WCRC] Hot Water Program Friday 2 To/From */
   @wcrc(0x51, 0x17)
   model DHWRuntimeProgramFr2 is cal;

   /**[WCRC] Hot Water Program Friday 3 To/From */
   @wcrc(0x52, 0x17)
   model DHWRuntimeProgramFr3 is cal;

   /**[WCRC] Hot Water Program Saturday 1 To/From */
   @wcrc(0x60, 0x17)
   model DHWRuntimeProgramSa1 is cal;

   /**[WCRC] Hot Water Program Saturday 2 To/From */
   @wcrc(0x61, 0x17)
   model DHWRuntimeProgramSa2 is cal;

   /**[WCRC] Hot Water Program Saturday 3 To/From */
   @wcrc(0x62, 0x17)
   model DHWRuntimeProgramSa3 is cal;

   /**[WCRC] Hot Water Program Sunday 1 To/From */
   @wcrc(0x70, 0x17)
   model DHWRuntimeProgramSu1 is cal;

   /**[WCRC] Hot Water Program Sunday 2 To/From */
   @wcrc(0x71, 0x17)
   model DHWRuntimeProgramSu2 is cal;

   /**[WCRC] Hot Water Program Sunday 3 To/From */
   @wcrc(0x72, 0x17)
   model DHWRuntimeProgramSu3 is cal;

   /**[WCRC] Circulation Program Monday 1 To/From */
   @wcrc(0x10, 0x1A)
   model CircRuntimeProgramMo1 is cal;

   /**[WCRC] Circulation Program Monday 2 To/From */
   @wcrc(0x11, 0x1A)
   model CircRuntimeProgramMo2 is cal;

   /**[WCRC] Circulation Program Monday 3 To/From */
   @wcrc(0x12, 0x1A)
   model CircRuntimeProgramMo3 is cal;

   /**[WCRC] Circulation Program Tuesday 1 To/From */
   @wcrc(0x20, 0x1A)
   model CircRuntimeProgramTu1 is cal;

   /**[WCRC] Circulation Program Tuesday 2 To/From */
   @wcrc(0x21, 0x1A)
   model CircRuntimeProgramTu2 is cal;

   /**[WCRC] Circulation Program Tuesday 3 To/From */
   @wcrc(0x22, 0x1A)
   model CircRuntimeProgramTu3 is cal;

   /**[WCRC] Circulation Program Wednesday 1 To/From */
   @wcrc(0x30, 0x1A)
   model CircRuntimeProgramWe1 is cal;

   /**[WCRC] Circulation Program Wednesday 2 To/From */
   @wcrc(0x31, 0x1A)
   model CircRuntimeProgramWe2 is cal;

   /**[WCRC] Circulation Program Wednesday 3 To/From */
   @wcrc(0x32, 0x1A)
   model CircRuntimeProgramWe3 is cal;

   /**[WCRC] Circulation Program Thursday 1 To/From */
   @wcrc(0x40, 0x1A)
   model CircRuntimeProgramTh1 is cal;

   /**[WCRC] Circulation Program Thursday 2 To/From */
   @wcrc(0x41, 0x1A)
   model CircRuntimeProgramTh2 is cal;

   /**[WCRC] Circulation Program Thursday 3 To/From */
   @wcrc(0x42, 0x1A)
   model CircRuntimeProgramTh3 is cal;

   /**[WCRC] Circulation Program Friday 1 To/From */
   @wcrc(0x50, 0x1A)
   model CircRuntimeProgramFr1 is cal;

   /**[WCRC] Circulation Program Friday 2 To/From */
   @wcrc(0x51, 0x1A)
   model CircRuntimeProgramFr2 is cal;

   /**[WCRC] Circulation Program Friday 3 To/From */
   @wcrc(0x52, 0x1A)
   model CircRuntimeProgramFr3 is cal;

   /**[WCRC] Circulation Program Saturday 1 To/From */
   @wcrc(0x60, 0x1A)
   model CircRuntimeProgramSa1 is cal;

   /**[WCRC] Circulation Program Saturday 2 To/From */
   @wcrc(0x61, 0x1A)
   model CircRuntimeProgramSa2 is cal;

   /**[WCRC] Circulation Program Saturday 3 To/From */
   @wcrc(0x62, 0x1A)
   model CircRuntimeProgramSa3 is cal;

   /**[WCRC] Circulation Program Sunday 1 To/From */
   @wcrc(0x70, 0x1A)
   model CircRuntimeProgramSu1 is cal;

   /**[WCRC] Circulation Program Sunday 2 To/From */
   @wcrc(0x71, 0x1A)
   model CircRuntimeProgramSu2 is cal;

   /**[WCRC] Circulation Program Sunday 3 To/From */
   @wcrc(0x72, 0x1A)
   model CircRuntimeProgramSu3 is cal;

}