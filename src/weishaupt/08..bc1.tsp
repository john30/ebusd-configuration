import "@ebusd/ebus-typespec";
import "../broadcast.tsp";
import "./_templates.tsp";
import "./opdata_inc.tsp";
import "./reg_inc.tsp";
import "./WH11928.tsp";

using Ebus;
using Ebus.Num;
using Ebus.Dtm;
using Ebus.Str;

namespace Weishaupt;
//@zz(0x08) // needed here for write to source address calculation
namespace bc1 {

  @qq(0x03)
  /**Display Message */
  model StatusMessage is Broadcast.Error;
  /**Power Info WTC -> KA */
  @qq(0x03)
  @zz(0x15)
  model WTCPower is Opdata_inc.WTCPower;

  /**WTC Status -> KA */
  @qq(0x03)
  @zz(0x15)
  model WTCStatus is Opdata_inc.WTCStatus;

  /** Operating data of the KA controller on the WTC */
  @write(true)
  model PowerDemand is Opdata_inc.HcOperation;

    /** ErrorStatus */
  model ErrorStatus is register.ErrorStatus;

  /** Version Minor */
  model VersionMinor is register.VersionMinor;

  /* FS-Param */

  model FSByte is memory.MB_0003;
  model TCVSP is memory.TCVSP;
  model TCHZZ is memory.TCHZZ;
  model TCNSP is memory.TCNSP;
  model TCFLASTAB is memory.TCFLASTAB;
  model NG_VSP is memory.NG_VSP;
  model NG_NSP is memory.NG_NSP ;
  model NG_GR_MIN is memory.NG_GR_MIN ;
  model NG_GR_MAX is memory.NG_GR_MAX ;
  model NG_MAX_LIMIT is memory.NG_MAX_LIMIT ;
  model MXSTB_K is memory.MXSTB_K ;
  model MXSTW_K is memory.MXSTW_K ;
  model ION_ON is memory.ION_ON ;
  model ION_OFF is memory.ION_OFF ;
  model LIM_ION_FLASTAB is memory.LIM_ION_FLASTAB ;
  model TC_PRUEF_V1 is memory.TC_PRUEF_V1 ;
  model TC_PRUEF_V2 is memory.TC_PRUEF_V2 ;
  model P_LPG is memory.P_LPG ;
  model KASK_P_ANHEB is memory.KASK_P_ANHEB ;
  model KLAPPE_P_ANHEB is memory.KLAPPE_P_ANHEB ;
  model MAXGFASTART is memory.MAXGFASTART ;
  model NG_BR_MIN is memory.NG_BR_MIN ;
  model EE_CONST_CRC is memory.EE_CONST_CRC;

  /* NFS-Param */

  /*P30: Minimum supply temperature#°C*/
  model MAXTVSOLL is memory.MAXTVSOLL ;
  /*"P31: Maximum supply temperature#°C"*/
  model MINTVSOLL is memory.MINTVSOLL ;
  model HZ_HYS is memory.HZ_HYS ;
  model TBRMINOFF is memory.TBRMINOFF;
  model TC_SOFTSTART is memory.TC_SOFTSTART ;
  model HZ_KP is memory.HZ_KP ;
  model HZ_KTND is memory.HZ_KTND ;
  /**P18: Special level heating#°C*/
  model SONDERNIVEAU is memory.SONDERNIVEAU ;
  /**P20: External sensor correction#K */
  model TAUSS_KORREKTUR is memory.TAUSS_KORREKTUR ;
  /**P70: Service interval#h */
  model WARTUNGSINTERVALL is memory.WARTUNGSINTERVALL ;
  model MX_DREHZ_KESSEL is memory.MX_DREHZ_KESSEL ;
  /**P35: Ignition rating#% */
  model NG_ZUEND is memory.NG_ZUEND ;
  model KESSEL_VARIANTE is memory.KESSEL_VARIANTE ;
  model MXGRADTVIST is memory.MXGRADTVIST ;
  /**P33: Switch off temp. flue gas passage#°C */
  model MXTABGAS is memory.MXTABGAS ;
  model TOL_TIME is memory.TOL_TIME ;
  model NG_DGESCHW is memory.NG_DGESCHW ;
  model NG_INCR_DECR is memory.NG_INCR_DECR ;
  /**P36: Minimum boiler rating#% */
  model NG_HZ_MIN is memory.NG_HZ_MIN ;
  model NG_HZ_FREI is memory.NG_HZ_FREI ;
  /**P37: Max. rating heating#% */
  model NG_HZ_MAX is memory.NG_HZ_MAX ;
  model PUHZ_VSP is memory.PUHZ_VSP ;
  /**P44: Min. pump rating heat#% */
  model PUHZ_MIN is memory.PUHZ_MIN ;
  /**P45: Max. pump rating heat#% */
  model PUHZ_MAX is memory.PUHZ_MAX ;
  model PUHZ_DT_REG is memory.PUHZ_DT_REG ;
  model PU_TAKT is memory.PU_TAKT ;
  model DT_VLRL_SOLL is memory.DT_VLRL_SOLL ;
  model DT_VLRL_MAX is memory.DT_VLRL_MAX ;
  model DT_VL_ESTB2_MAX is memory.DT_VL_ESTB2_MAX ;
  /**P41: Pump run on heating#min */
  model PNL_HZ is memory.PNL_HZ ;
  model MAXWWSOLL is memory.MAXWWSOLL ;
  model MINWWSOLL is memory.MINWWSOLL ;
  model WW_HYS is memory.WW_HYS ;
  /** P50: Excess WW-loading#K */
  model TWWPLUS is memory.TWWPLUS ;
  model NG_WW_MIN is memory.NG_WW_MIN ;
  model NG_WW_FREI is memory.NG_WW_FREI ;
  model NG_WW_MAX is memory.NG_WW_MAX ;
  /**P46: Pump rating WW#% */
  model PUHZ_WW is memory.PUHZ_WW ;
  /** P42: Pump run on WW#min */
  model PNL_WW is memory.PNL_WWcnt ;
  model TFRS_A is memory.TFRS_A ;
  model NG_KP is memory.NG_KP ;
  model NG_KTN is memory.NG_KTN ;
  model NG_REG_ANPASS is memory.NG_REG_ANPASS ;
  model SEL_IN_1_2 is memory.SEL_IN_1_2 ;
  model SEL_IN_3_4 is memory.SEL_IN_3_4 ;
  model SEL_PR_1_2 is memory.SEL_PR_1_2 ;
  model SEL_PR_3_4 is memory.SEL_PR_3_4 ;
  model KLAPPENLAUFZEIT is memory.KLAPPENLAUFZEIT ;
  model PARA_DT_WEICHE_VL is memory.PARA_DT_WEICHE_VL ;
  model V24_KM_ADR is memory.V24_KM_ADR ;
  model KESS_OPT is memory.KESS_OPT ;
  model KESS_OPT_2 is memory.KESS_OPT_2 ;
  model KESS_BITS is memory.KESS_BITS ;
  model REF_KORR is memory.REF_KORR ;
  model KES_DAT_CRC is memory.KES_DAT_CRC;

  /* User */

  model EEA_TVSOLL_EPM is memory.EEA_TVSOLL_EPM;
  model EEA_TVABSENK is memory.EEA_TVABSENK;
  model EEA_TWWSOLL_EPM is memory.EEA_TWWSOLL_EPM;
  model EEA_WISO_EPM is memory.EEA_WISO_EPM;
  model EEA_MAINPARACRC is memory.EEA_MAINPARACRC;

  /* Ion Calib */

  model EEA_ION_KALIB is memory.EEA_ION_KALIB;
  model EEA_ION_KALIB_INV is memory.EEA_ION_KALIB_INV;
  model EEA_ION_KALIB_2 is memory.EEA_ION_KALIB_2;
  model EEA_ION_KALIB_2_INV is memory.EEA_ION_KALIB_2_INV;

  /* Statistics */

  /**F11: STB Ecess temperature supply */
  model EEA_FC_11 is memory.EEA_FC_11;
  /**W12: STW Excess temperature supply */
  model EEA_FC_12 is memory.EEA_FC_12;
  /**W14: Max. gradient supply */
  model EEA_FC_14 is memory.EEA_FC_14;
  /**F15/W15: Expansion SP/RT */
  model EEA_FC_15 is memory.EEA_FC_15;
  /**W16: Flue gas excess temperature */
  model EEA_FC_16 is memory.EEA_FC_16;
  /**F18/W18: Expansion eSTB/SP */
  model EEA_FC_18 is memory.EEA_FC_18;
  /**F21: No flame formation */
  model EEA_FC_21 is memory.EEA_FC_21;
  /**W22: Flame failure during operation */
  model EEA_FC_22 is memory.EEA_FC_22;
  /**F2 3: Fllame simulation */
  model EEA_FC_23 is memory.EEA_FC_23;
  /**W24: H2-Emergency Off Function */
  model EEA_FC_24 is memory.EEA_FC_24;
  /**F30: Safety temperature sensor defective */
  model EEA_FC_30 is memory.EEA_FC_30;
  /**F31: Flue gas sensor defective */
  model EEA_FC_31 is memory.EEA_FC_31;
  /**F32: APS fault (stand-by control) */
  model EEA_FC_32 is memory.EEA_FC_32;
  /**W34: Warm water sensor defective */
  model EEA_FC_34 is memory.EEA_FC_34;
  /**F35: Supply sensor defective */
  model EEA_FC_35 is memory.EEA_FC_35;
  /**F36: Water pressure too low */
  model EEA_FC_36 is memory.EEA_FC_36;
  /**F37: Return sensor defective */
  model EEA_FC_37 is memory.EEA_FC_37;
  /**F38: Flue gas pressure switch defective */
  model EEA_FC_38 is memory.EEA_FC_38;
  /**W39: De-couple sensor B11 defective */
  model EEA_FC_39 is memory.EEA_FC_39;
  /**F41: Gas valve circuit V1/V2 defective */
  model EEA_FC_41 is memory.EEA_FC_41;
  /**F43: Fan failure during operation */
  model EEA_FC_43 is memory.EEA_FC_43;
  /**F44: Fan failure during standby */
  model EEA_FC_44 is memory.EEA_FC_44;
  /**F45: APS fault (operating check) */
  model EEA_FC_45 is memory.EEA_FC_45;
  /**F46: Fault flue gas pressure during operation */
  model EEA_FC_46 is memory.EEA_FC_46;
  /**W47: Warning GPS during operation */
  model EEA_FC_47 is memory.EEA_FC_47;
  /**F48/W48: Fault flue gas damper */
  model EEA_FC_48 is memory.EEA_FC_48;
  /**F49: Safety switch, condensate lifting device */
  model EEA_FC_49 is memory.EEA_FC_49;
  /**F51: CRC fault heating engineer parameter */
  model EEA_FC_51 is memory.EEA_FC_51;
  /**F52: CRC fault manufacturer parameter */
  model EEA_FC_52 is memory.EEA_FC_52;
  /**F53: Fault voltage supply */
  model EEA_FC_53 is memory.EEA_FC_53;
  /**F55: Excessive remote reset */
  model EEA_FC_55 is memory.EEA_FC_55;
  /**F57: Fault eBUS */
  model EEA_FC_57 is memory.EEA_FC_57;
  /**I42: Switch play counter burner */
  model EEA_SHUT_OFF is memory.EEA_SHUT_OFF;
  /**I43: Operating hours burner */
  model EEA_H_BON is memory.EEA_H_BON;
  /**I46: Burner operation since last service */
  model EEA_RES_CNT is memory.EEA_RES_CNT;
  /**Number mains on */
  model EEA_N_ZUE is memory.EEA_N_ZUE;
  /**Operating hours boiler */
  model EEA_H_PON is memory.EEA_H_PON;

  
  /* Fault History */
  model EEA_F_HIST_PTR_LOW is memory.EEA_F_HIST_PTR_LOW;
  model EEA_F_HIST_PTR_HIGH is memory.EEA_F_HIST_PTR_HIGH;
  model EEA_F_HIST_PTR is memory.EEA_F_HIST_PTR;
  /** Fault History #1 */
  model EEA_F_HIST_ANF1 is memory.EEA_F_HIST_ANF1;
   /** Fault History #2 */
  model EEA_F_HIST_ANF2 is memory.EEA_F_HIST_ANF2;
   /** Fault History #3 */
  model EEA_F_HIST_ANF3 is memory.EEA_F_HIST_ANF3;
   /** Fault History #4 */
  model EEA_F_HIST_ANF4 is memory.EEA_F_HIST_ANF4;
   /** Fault History #5 */
  model EEA_F_HIST_ANF5 is memory.EEA_F_HIST_ANF5;
   /** Fault History #6 */
  model EEA_F_HIST_ANF6 is memory.EEA_F_HIST_ANF6;
}
