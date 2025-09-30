# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,ecoTEC/4 eGAS,0010004121 209,,,,,,,,,,
*r,,,,,,"B509","0D",,,,,,
*w,,,,,,"B509","0E",,,,,,
*wi,#install,,,,,"B509","0E",,,,,,
*ws,#service,,,,,"B509","0E",,,,,,
# ##### Diagnose Ebene 1 #####,,,,,,,,,,,,,
r,,Statenumber,Statenumber_DK,,,,"AB00",,,UCH,,,status number
r,,StatusList,StatusList_DK,,,,"1101",,,HEX:10,,,Statustexte ergänzen
r;wi,,PartloadHcKW,d.00 Heizungsteillast,,,,"0704",,,power,,,Heizungsteillast
r;wi,,WPPostrunTime,d.01 Pumpennachlaufzeit,,,,"F703",,,minutes0,,,Wasserpumpennachlaufzeit nach Heizbetrieb
r;wi,,BlockTimeHcMax,d.02 Maximale Brennersperrzeit,,,,"0904",,,minutes0,,,Max. Brennersperrzeit bei einem Vorlaufsollwert von 20°C
r,,HwcTemp,d.03 WW Vorlaufsolltemp,,,,"1600",,,tempsensor,,,Vorlauftemperatur bei Warmwasserzapfung (nur bei Kombi-Heizgeräten)
r,,StorageTemp,d.04 Speicheristtemp,,,,"1700",,,tempsensor,,,current temperature for warm start sensor (combination boiler only) Current storage tank sensor (system boiler only)
r,,FlowTempDesired,d.05 Vorlaufsolltemperatur,,,,"3900",,,temp,,,Vorlaufsolltemperatur oder Rücklaufsolltemperatur (wenn Rücklaufregelung aktiviert wurde). Der Maximalwert wird über d.71 und einem eBUS Regler begrenzt.
r,,StorageTempDesired,d.07 Speichersolltemp,,,,"0400",,,temp,,,VCW: Solltemperatur des WarmstartspeichersVC: Solltemperatur des externen Speichers
r,,ACRoomthermostat,d.08 Raumthermostat,,,,"2A00",,,onoff,,,Status des extrenen Raumthermostat an Klemme 3/4
r,,ExtFlowTempDesiredMin,d.09 Min. ext. Vorlaufsollwert,,,,"6E04",,,temp,,,minimum out of Kl.7 and eBus flow setpoint
r,,WP,d.10 Wasserpumpe,,,,"4400",,,onoff,,,Interne Heizungspumpe
r,,extWP,d.11 ext. Heizungspumpe,,,,"3F00",,,onoff,,,Externe Heizungspumpe
r,,Storageloadpump,d.12 Speicherladepumpe,,,,"9E00",,,percent0,,,Ladepumpenanforderung
r,,CirPump,d.13 Zirkulationspumpe,,,,"7B00",,,onoff,,,Status Zirkulationspumpe (über ein externes Modul ansteuerbar)
r,,WPPWMPower,d.15 Pumpendrehzahl Istwert,,,,"7300",,,UCH,,,actual PWM-Powerrate of electronic-pump
r,,HwcDemand,d.22 WW Anforderung,,,,"5800",,,yesno,,,Brauchwasseranforderung (Zapfung oder Schaltsignal vom Speicher)
r,,HeatingSwitch,d.23 Winterbetrieb,,,,"F203",,,onoff,,,Wintermodus aktiv (Heizbetrieb und Warmwasser)
r,,SourcePressure,d.24 Druckdosensignal,,,,"FF00",,,UIN,,Pa,value of airpressure-sensor
r,,StoragereleaseClock,d.25 Speicherfreigabe,,,,"4704",,,yesno,,,Freigabe der Speichrladung oder des Warmstartspeichers durcheinen eBUS Regler
r,,PrimaryCircuitFlowrate,d.29 PrimaryCircuitFlowrate_DK,,,,"FB00",,,UIN,,l/h,value of flowrate
r,,Gasvalve,d.30 Gasventil,,,,"BB00",,,UCH,240=off;15=on,,GMV Ansteuersignal
r,,TargetFanSpeed,d.33 Lüfter Solldrehzahl,,,,"2400",,,UIN,,1/min,Drehzahlsollwert des Lüfters
r,,FanSpeed,d.34 Lüfteristdrehzahl,,,,"8300",,,UIN,,1/min,Aktuelle Lüfterdrehzahl
r,,PositionValveSet,d.35 Position VUV,,,,"5400",,,UCH,,,Position des 3-Wege Ventil: 100=Warmwasser 0=Heizbetrieb 40=Mittenstellung
r,,FlowTemp,d.40 Vorlauftemperatur,,,,"1800",,,tempsensor,,,Vorlauftemperatur
r,,ReturnTemp,d.41 Rücklauftemperatur,,,,"9800",,,tempmirrorsensor,,,Rücklauftemperatur
r,,IonisationVoltageLevel,d.44 Spannungspegel Ionisationssignal,,,,"A400",,,SIN,10,,Ionisationsspannung: größer 80 = keine Flammekleiner 40 = gutes Flammensignal
r,,OutdoorstempSensor,d.47 Außentemperaturfühler,,,,"7600",,,tempsensor,,,Außentemperaturwert (ohne Korrekturwert) und Sensorstatus
r,,RemainingBoilerblocktime,d.67 Verbleibende Brennersperrzeit,,,,"3800",,,minutes0,,,Verbleibende Brennersperrzeit
r,,EBusHeatcontrol,d.90 Digitaler Regler,,,,"0004",,,yesno,,,Gibt an ob ein digitaler Regler erkannt wurde
r,,dcfState,d.91 DCF Status,,,,"6900",,,dcfstate,,,DCF Status
# ##### Expertenebene #####,,,,,,,,,,,,,
r,,SMGVCorrFactorLowOffset,e.04 SMGV_CorrFactorLow_Offset_DK,,,,"0F01",,,percents,,,CO2 offset-value low-load
r,,SMGVCorrFactorHighOffset,e.05 SMGV_CorrFactorHigh_Offset_DK,,,,"1001",,,percents,,,CO2 offset-value high-load
r,,COConcentration,e.06 SD_CO_Concentration_DK,,,,"0601",,,UIN,,ppm,calculated CO-concentration
r,,CORsens,e.07 SD_CO_Rsens_DK,,,,"0501",,,UIN,,kOhm,Aktueller Widderstand des CO-Sensors
r,,COR0,e.08 SD_CO_R0_DK,,,,"0401",,,UIN,,kOhm,CO-sensor resistance @ 0ppm CO
r,,COPTCActualTemp,e.09 SD_CO_PTC_ActualTemp_DK,,,,"0901",,,temp,,,actual heater-temperature
r,,COPTCMeasureTemp,e.10 CO_PTC_MeasureTemp_DK,,,,"0701",,,temp,,,heater-temperature during burner operation
r,,COCorrFactorOffset,e.11 CO_CorrFactor_Offset_DK,,,,"0E01",,,percents,,,CO2 offset value for gas-adaptive correction-factor
r,,COCorrFactor,e.12 CO_CorrFactor_DK,,,,"0101",,,percent0,,,calculated gas-adaptive correction-factor
r,,SMGVCorrFactorLow,e.13 SMGV_CorrFactorLow_DK,,,,"0201",,,percent0,,,calculated correction-factor low-load
r,,SMGVCorrFactorHigh,e.14 SMGV_CorrFactorHigh_DK,,,,"0301",,,percent0,,,calculated correction-factor high-load
r,,COLastError,e.18 CO_LastError_DK,,,,"0A01",,,UCH,,,CO-sensor failure number
r,,FluePipeFactor,e.19 FluePipeFactor_DK,,,,"0B01",,,UCH,,,calculated fluepipe-factor
r,,HwcImpellorSwitch,Brauchwasserzapfung,,,,"5700",,,yesno,,,WW Zapfung
r,,COPTCTargetTemp,SD_CO_PTC_TargetTemp_DK,,,,"0801",,,temp,,,target heater-temperature
r,,BoilerType2,BoilerType_2_DK,,,,"0C01",,,ULG,,,
r,,TMMaxTimeTemp,TTM_MaxTime_DK,,,,"1801",,,seconds2,,,maximum time for calibration-routine
r,,TMAverageTimeSumTemp,TTM_AverageTime_sum_DK,,,,"1901",,,UIN,,_1S * 100,average time for calibration-routine
r,,COCorrFactorMax,CO_CorrFactor_max_DK,,,,"1A01",,,UIN,,%,maximum value of calculated gas-adaptive correction-factor
r,,COCorrFactorSum,CO_CorrFactor_sum_DK,,,,"1B01",,,UIN,,% * 100,average value of calculated gas-adaptive correction-factor
r,,SMGVCorrFactorLowSum,SMGV_CorrFactorLow_sum_DK,,,,"1C01",,,UIN,,% * 100,average value of calculated correction-factor low-load
r,,SMGVCorrFactorHighSum,SMGV_CorrFactorHigh_sum_DK,,,,"1D01",,,UIN,,% * 100,average value of calculated correction-factor high-load
r,,COPTCADC1,CO_PTC_ADC1_DK,,,,"1E01",,,UIN,,,
r,,COPTCADC2,CO_PTC_ADC2_DK,,,,"1F01",,,UIN,,,
r,,COPTCPWMTest,CO_PTC_PWM_Test_DK,,,,"2001",,,UIN,,,
r,,COPTCCalParms,CO_PTC_CalParms,,,,"2101",,,UCH,,,
r,,CalibrationDone,TTM_Done_DK,,,,"2201",,,onoff,,,calibration-routine after burner start finished
r,,CalibrationRecalDone,TTM_RecalDone_DK,,,,"2301",,,onoff,,,calibration-routine during burner operation finished
r,,CalibrationLowDone,TTL_Done_DK,,,,"2401",,,onoff,,,calibration-routine low-load after burner start finished
r,,CalibrationLowRecalDone,TTL_RecalDone_DK,,,,"2501",,,onoff,,,calibration-routine low-load during burner operation finished
r,,CalibrationHighDone,TTH_Done_DK,,,,"2601",,,onoff,,,calibration-routine high-load after burner start finished
r,,CalibrationHighRecalDone,TTH_RecalDone_DK,,,,"2701",,,onoff,,,calibration-routine high-load during burner operation finished
r,,WindOff,Wind_Off_DK,,,,"2801",,,onoff,,,Wind-function not active
r,,COmonOff,COmon_Off_DK,,,,"2901",,,onoff,,,CO-monitoring not active
r,,FlameLossOff,FlameLoss_Off_DK,,,,"2A01",,,onoff,,,Flame-loss-function not active
r,,ForcedR0Trigger,SD_ForcedR0_Trigger_DK,,,,"2B01",,,onoff,,,forced-R0-mode active
r,,StartPeakEnable,StartPeak_Enable_DK,,,,"2C01",,,onoff,,,
r,,COPTCU1,CO_PTC_U1_DK,,,,"2D01",,,UIN,,,
r,,COPTCU2,CO_PTC_U2_DK,,,,"2E01",,,UIN,,,
r,,ThresholdWaterpressureMin,MinThresholdWaterpressure_DK,,,,"1201",,,UIN,,bar,
r,,ThresholdWaterpressureMax,MaxThresholdWaterpressure_DK,,,,"1301",,,UIN,,bar,
r,,MeasuredFluePipeFactor,MeasuredFluePipeFactor_DK,,,,"3401",,,UCH,,,
r,,VortexFlowCheckEnabled,VortexFlowCheckEnabled_DK,,,,"4901",,,onoff,,,
r,,VortexSensorFault,VortexSensorFault_DK,,,,"4A01",,,onoff,,,
r,,VortexSensorFaultCounter,VortexSensorFaultCounter_DK,,,,"4B01",,,UCH,,,
r,,VortexFlowCheckFault,VortexFlowCheckFault_DK,,,,"4C01",,,onoff,,,
r,,VortexFlowCheckFaultCounter,VortexFlowCheckFaultCounter_DK,,,,"4D01",,,UCH,,,
r,,SMGVCurrentPos,SMGV_CurrentPos_DK,,,,"7C01",,,SIN,,,
r,,PredSourcePressureRefPressureCounter,Pred_AirPressure_RefPressureCounter_DK,,,,"7F01",,,UCH,,,
r,,PredSourcePressureRefPressureSum,Pred_AirPressure_RefPressureSum_DK,,,,"8001",,,UIN,,,
r;ws,,SRFLIDEMode,SR_FLIDE_Mode_DK,,,,"8101",,,UCH,,,
r,,COSensorSNR,CO_Sensor_SNR,,,,"AF01",,,HEX:7,,,
r,,WaterPressure,Wasserdruck,,,,"0200",,,presssensor,,,value of waterpressure-sensor
r,,Flame,Flammensignal,,,,"0500",,,UCH,240=off;15=on,,Flammensignal
r,,ChangesDSN,Anzhl der DSN Änderungen,,,,"0C00",,,UCH,,,Anzahl der DSN (Gerätekennung) Änderungen
r,,GasvalveUC,Gasventil,,,,"0D00",,,UCH,240=off;15=on,,Schaltsignal für das Gasventil
r,,VolatileLockout,Verriegelnde Störabschaltungen,,,,"1000",,,UCH,240=no;15=yes,,WAHR: STB Fehler sind verriegelnd
r,,ModulationTempDesired,Modulationssollwert,,,,"2E00",,,SIN,10,%,Modulationssollwert
r,,FlameSensingASIC,SD_Flame_Sensing_ASIC_DK,,,,"2F00",,,UIN,,,Ioni/ADC Wert vom Flammenwächter
r,,HcUnderHundredStarts,HZ_UnderHundred_SwiActi_DK,,,,"3000",,,UCH,,,Heat switch cycles under hundred
r,,HwcUnderHundredStarts,BW_UnderHundred_SwiActi_DK,,,,"3100",,,UCH,,,DHW switch cycles under hundred
r,,EbusSourceOn,eBUS Spannungsversorgung,,,,"3400",,,onoff,,,Aktivierung der eBUS Speisung
r,,Fluegasvalve,Abgasklappe,,,,"3C00",,,onoff,,,Flüssiggas Magnetventil
r,,ExternalFaultmessage,Ext. Störmeldung,,,,"3E00",,,onoff,,,Signal für die externe Störmeldeeinrichtung
r,,GasvalveASICFeedback,Rückmeldung Gasventil,,,,"4700",,,UCH,240=off;15=on,,Rückmeldung Gasventil vom ASIC
r,,GasvalveUCFeedback,Rückmeldung Gasventil,,,,"4800",,,UCH,240=off;15=on,,Rückmeldung Gasventil vom Prozessor
r,,Ignitor,Zünder,,,,"4900",,,UCH,240=off;15=on,,Zündung aktiviert
r,,HwcTypes,WW Typen,,,,"4B00",,,UCH,,,DHW type of the appliance
r,,WarmstartDemand,Warmstartanforderung,,,,"3A04",,,yesno,,,Warmstartaktivierung
r,,BoilerType,BoilerType_DK,,,,"5E00",,,UCH,,,Boiler typ of the bmu
r,,ParamToken,ParamToken_DK,,,,"6000",,,UCH,,,token for parameter managment
r,,expertlevel_ReturnTemp,Rücklauftemperatur,,,,"6B00",,,tempsensor,,,Externer Rücklauftemperatursensor
r,,FloorHeatingContact,Anlegethermostat,,,,"7000",,,onoff,,,Eingang Anlegethermostat
r,,Templimiter,Temperaturbegrenzer,,,,"7700",,,UCH,240=off;15=on,,Rückmeldung des Temperaturbegrenzer Signals
r,,EbusVoltage,eBUS Spannung,,,,"7F00",,,onoff,,,Rückmeldung der eBUS Spannung
r,,FluegasvalveOpen,Abgasklappe offen,,,,"8900",,,onoff,,,Rückmeldung Flüssiggasventil
r,,Testbyte,Testbyte_DK,,,,"9900",,,UCH,,,Testbyte (relevant for the Tester)
r,,DSN,DSN,,,,"9A00",,,UIN,,,DSN: Device Specific number
r,,TargetFanSpeedOutput,Lüfter Solldrehzahl,,,,"9F00",,,UIN,,1/min,Lüfterdrehzahl
r,,PowerValue,Leistungsdaten,,,,"AA00",,,HEX:6,,,Geräteleistung (min und max)
r,,WaterpressureBranchControlOff,Drucksprungerkennung ausschalten,,,,"AF00",,,onoff,,,Überwachung der Druckänderung beim Schalten der Pumpe kann hiermit aktiviert oder deaktiviert werden
r,,DSNStart,DSN Startadresse,,,,"3104",,,UIN,,,DSN Startadresse
r,,ExtStorageModulCon,VR65 angeschlossen,,,,"BF00",,,yesno,,,Externes Speichermodul (VR65) angeschlosssen
r,,PartnumberBox,Partnumber_Box,,,,"C000",,,HEX:5,,,part number of the eBox
r,,WPSecondStage,WP_SecondStage_DK,,,,"ED00",,,UCH,240=off;15=on,,Second stage of the pump activated
r,,TemplimiterWithNTC,SD_STL_with_NTC,,,,"D200",,,UCH,240=no;15=yes,,Temperaturbegrenzer Art:1 = NTC0 = Schaltkontakt
r,,VolatileLockoutIFCGV,SD_VolatileLockout_IFC_GV_DK,,,,"D300",,,UCH,240=no;15=yes,,Alle IFC Fehler sind nichtflüchtig
r,,VortexFlowSensor,VortexFlowSensor_DK,,,,"D500",,,UIN,,,"Predictive Maintenance data, CH water flow"
r,,DisplayMode,DisplayMode_DK,,,,"DA00",,,UCH,,,Display mode of the appliance
r,,Gasvalve3UC,Gasventil 3,,,,"DB00",,,UCH,240=off;15=on,,Gasventil Schaltsignal (vom Prozessor)
r,,InitialisationEEPROM,InitialisationEEPROM_DK,,,,"DC00",,,yesno,,,EEPROM Initialisierrung (für die Produktion)
r,,TimerInputHc,Eingang Schaltuhr,,,,"DE00",,,onoff,,,timer input (block heatdemand)
r,,FanMinSpeedOperation,Min. Lüfterdrehzahl,,,,"DF00",,,UIN,,1/min,Lüfter Minimaldrehzahl
r,,FanMaxSpeedOperation,Max. Lüfterdrehzahl,,,,"E000",,,UIN,,1/min,Lüfter Maximaldrehzahl
r,,ExternGasvalve,Ext. Gasventil,,,,"E400",,,onoff,,,Externes Magnetventil
r,,DCFTimeDate,DCF Datum/Uhrzeit,,,,"E500",,,btime;bdate,,,DCF Time / date stamp struct { uchar sec; uchar min; uchar std; uchar tag; uchar mon; uchar wtg; uchar jah; } Tdcf77_time;
r,,FlowSetPotmeter,Vorlaufsollwert Poti,,,,"F003",,,temp,,,Vorlaufsollwert Potentiometer
r,,HwcSetPotmeter,WW Sollwert Potentiometer,,,,"F103",,,temp,,,WW Sollwertpotentiometer
r,,ProductionByte,ProductionByte,,,,"3E04",,,UCH,,,
r,,SerialNumber,SerialNumber,,,,"3F04",,,HEX:8,,,Seriennummer AI
# ##### Diagnose Ebene 2 #####,,,,,,,,,,,,,
r;wi,,WPPWMPowerDia,d.14 WP_PWMPowerDia_DK,,,,"A100",,,UCH,,,Set-PWM-Powerrate of electronic-pump
r;wi,,ReturnRegulation,d.17 Rücklaufregelung,,,,"0C04",,,onoff,,,Aktivierung der Rücklaufregelung
r;wi,,HcPumpMode,d.18 Pumpenbetriebsart,,,,"4904",,,UCH,0=post run;1=permanent;2=winter,,"Pump mode: 0=post run, 1=continous, 2=Winter, 3=intermittend"
r;wi,,HwcTempMax,d.20 Max. WW Temperatur,,,,"4304",,,temp,,,Max. Speichersollwert. Begrenzt den max. Einstellbereich des Potentiometers (Rechtsanschlag).
r;wi,,OptionRelais,d.26 OptionRelais_DK,,,,"B800",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Option relais function
r;wi,,AccessoriesOne,d.27 Zubehörrelais 1,,,,"4B04",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 1
r;wi,,AccessoriesTwo,d.28 Zubehörrelais 2,,,,"4C04",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 2
r;wi,,FanSpeedOffsetMin,d.50 Offet min. Lüfterdrehzahl,,,,"2404",,,SIN,,1/min,Offset min. Drehzahl
r;wi,,FanSpeedOffsetMax,d.51 Offset max. Lüfterdrehzahl,,,,"2504",,,SIN,,1/min,Offset max. Drehzahl
r,,DeactivationsTemplimiter,d.60 STB Abschaltungen,,,,"2000",,,UCH,,,Anzahl der Abschaltungen durch den Sicherheitstemperaturbgrenzers
r,,DeactivationsIFC,d.61 Anzahl Zündfehler,,,,"1F00",,,UCH,,,Anzahl der Zündfehler (nicht erfolgreiche Züdung im letzten Versuch oder fehlerhaftes Flammensignal)
r,,averageIgnitiontime,d.64 Mittlere Zündzeit,,,,"2D00",,,UCH,10,s,Mittlere Zündzeit
r,,maxIgnitiontime,d.65 Max. Zündzeit,,,,"2C00",,,UCH,10,s,Maximale Zündzeit
r,,CounterStartattempts1,d.68 Zündfehler 1. Versuch,,,,"6E00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 1. Versuch)
r,,CounterStartattempts2,d.69 Zündfehler 2. Versuch,,,,"6F00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 2. Versuch)
r;wi,,ValveMode,d.70 VUV Betriebsart,,,,"2A04",,,UCH,,,Betriebsart 3-Wegeventil:0 = normaler Modus1 = Mittenstellung2 = Permanent Heizbetrieb (keine Umschaltung in den WW Betrieb)
r;wi,,FlowsetHcMax,d.71 Max. Vorlauftemp. Heizbetrieb,,,,"0E04",,,temp,,,Einstellung des maximalen Vorlaufsollwert im Heizbetrieb (bei Linksanschlag des Poti)
r;wi,,HwcPostrunTime,d.72 WW Pumpnenachlaufzeit,,,,"1104",,,UCH,-10,s,Pumpennachlaufzeit nach Speicherladung
r;wi,,StorageLoadTimeMax,d.75 Max. Speicherladezeit,,,,"1204",,,minutes0,,,Max. Speicherladezeit für Speicher ohne eigene Regelung
r;wi,,PartloadHwcKW,d.77 Speicherteillast,,,,"0804",,,power,,,Teillast für Speicherladung (Geräteleistung kann auf den angegebenen Wert limitiert werden)
r;wi,,FlowsetHwcMax,d.78 Max. Vorlauftemp. WW,,,,"0F04",,,temp,,,Maximal erlaubte Vorlauftemperatur für die Speicherladung
r,,HcHours,d.80 Hz. Betriebsstunden,,,,"2800",,,hoursum2,,,Betriebsstunden im Heizbetrieb
r,,HwcHours,d.81 Betriebsstunden WW,,,,"2200",,,hoursum2,,,Betriebsstunden Brauchwasser
r,,HcStarts,d.82 Schaltspiele Heizbetrieb,,,,"2900",,,UIN,-100,,Schaltspiele Heizbetrieb
r,,HwcStarts,d.83 Schaltspiele BW Betrieb,,,,"2300",,,UIN,-100,,Schaltspiele WW Betrieb
r;wi,,HoursTillService,d.84 Stunden bis Wartung,,,,"2004",,,hoursum2,,,Wartungsintervall:Anzahl der Stunden bis zur nächsten Wartung
r;wi,,ServiceMode,d.86 ServiceMode_DK,,,,"CB00",,,onoff,,,Counter-activation for predictive maintenance
r;wi,,GasType,d.87 Gasart,,,,"FE00",,,UCH,,,"0=Erdgas,1=Flüssiggas 50mbar,2=Flüssiggas 30mbar"
r;wi,,StartOffset,d.89 StartOffset_DK,,,,"0D01",,,percents,,,value of gas-offset during ignition
r;ws,,DSNOffset,d.93 Gerätekennung,,,,"3004",,,UCH,,,Gerätekennung (DSN)
r;wi,,SetFactoryValues,d.96 Werkseinstellungen,,,,"6804",,,yesno,,,Werkseinstellungen
r,,Faultlist,Faultlist_DK,,,,"2600",,,HEX:10,,,
# ##### Wartungsdaten #####,,,,,,,,,,,,,
r,,PredFanPWMDevThreshold,Pred_FanPWM_DevThreshold_DK,,,,"3501",,,UCH,,,
r,,PredFanPWMSwitchingPoint,Pred_FanPWM_SwitchingPoint_DK,,,,"3601",,,UIN,,,
r,,PredFanPWMRefPWMcounter,Pred_FanPWM_RefPWMcounter_DK,,,,"3701",,,UCH,,,
r,,PredFanPWMRefPWMsum,Pred_FanPWM_RefPWMsum_DK,,,,"3801",,,UIN,,,
r,,PredFanPWMPredCounter,Pred_FanPWM_PredCounter_DK,,,,"3901",,,UIN;UIN;UIN,,,
r,,PredCOsensorSwitchingPoint,Pred_COsensor_SwitchingPoint_DK,,,,"3A01",,,UIN,,,
r,,PredCOsensorPredCounter,Pred_COsensor_PredCounter,,,,"3B01",,,UIN;UIN;UIN,,,
r,,PredIgnitionSwitchingPoint,Pred_Ignition_SwitchingPoint_DK,,,,"3C01",,,UIN,,,
r,,PredIgnitionPredCounter,Pred_Ignition_PredCounter_DK,,,,"3D01",,,UIN;UIN;UIN,,,
r,,PredCombustionDecrementTime,Pred_Combustion_DecrementTime_DK,,,,"3E01",,,UCH,,,
r,,PredCombustionSwitchingPoint,Pred_Combustion_SwitchingPoint_DK,,,,"3F01",,,UIN,,,
r,,PredCombustionPredCounter,Pred_Combustion_PredCounter_DK,,,,"4001",,,UIN;UIN;UIN,,,
r,,PredSourcePressureDevThreshold,Pred_AirPressure_DevThreshold_DK,,,,"4101",,,UCH,,,
r,,PredSourcePressureSwitchingPoint,Pred_AirPressure_SwitchingPoint_DK,,,,"4201",,,UIN,,,
r,,PredSourcePressurePredCounter,Pred_AirPressure_PredCounter_DK,,,,"4301",,,UIN;UIN;UIN,,,
r,,PredWaterflowDevThreshold,Pred_Waterflow_DevThreshold_DK,,,,"4401",,,UCH,,,
r,,PredWaterflowSwitchingPoint,Pred_Waterflow_SwitchingPoint_DK,,,,"4501",,,UIN,,,
r,,PredWaterpressureMinPressure,Pred_Waterpressure_MinPressure_DK,,,,"4601",,,UIN,,,
r,,PredWaterpressureMaxPressure,Pred_Waterpressure_MaxPressure_DK,,,,"4701",,,UIN,,,
r,,PredWaterpressureSwitchingPoint,Pred_Waterpressure_SwitchingPoint_DK,,,,"4801",,,UIN,,,
r,,PredStatusFlags,Pred_StatusFlags_DK,,,,"7D01",,,ULG,,,
r,,PredConditionFlags,Pred_ConditionFlags,,,,"7E01",,,ULG,,,
r,,TempGradientFailure,Gradientenfehler,,,,"1100",,,temp0,,,Anzahl der Boilerabschaltung wegen zu hohem Gradient (S.54)
r,,TempDiffBlock,TempDiffBlock_DK,,,,"1200",,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r,,TempDiffFailure,TempDiffFailure_DK,,,,"1300",,,temp0,,,Anzahl der Abschaltungen wegen zu hoher / fehlerhafter Differenz von Vor- und Rücklauftemperatur
r,,PumpHours,Betriebsstunden Pumpe,,,,"1400",,,hoursum2,,,Pumpenbetriebsstunden
r,,HcPumpStarts,CH_PumpCommunt_DK,,,,"1500",,,cntstarts2,,,Schaltspiele Pumpe
r,,ValveStarts,3WV Schaltspiele,,,,"1A00",,,cntstarts2,,,Anzahl der 3WV Umschaltungen
r,,FanHours,Betriebsstunden Lüfter,,,,"1B00",,,hoursum2,,,Betriebsstunden des Lüfters
r,,FanStarts,FanCommunt_DK,,,,"1C00",,,cntstarts2,,,Anzahl der Lüfterschaltspiele
r,,OverflowCounter,Überlauf PM Zähler,,,,"1E00",,,yesno,,,Predictive Maintenance counter have got an overflow
r,,TempMaxDiffExtTFT,MaxTempDiffExtTFT_DK,,,,"2700",,,temp,,,Predictive maintenance data
r,,minIgnitiontime,Min. Zündzeit,,,,"2B00",,,UCH,10,s,Minimale Zündzeit
r,,maintenancedata_HwcTempMax,Max. WW Temperatur,,,,"3500",,,temp,,,Maximaltemperatur gemessen am Brauchwasserauslaufsensor
r,,StorageTempMax,Max. Speichertemp.,,,,"3600",,,temp,,,Maximaltemperatur gemessen am Speichersensor
r,,FlowTempMax,Max. Vorlauftemperatur,,,,"3700",,,temp,,,Maximaltemperatur gemessen am Vorlaufsensor
r,,FanPWMSum,Fan_PWM_Sum_DK,,,,"3A00",,,UIN,,,Predictive Maintenance data for the fan damage recognition
r,,FanPWMTest,Fan_PWM_Test_DK,,,,"3B00",,,UCH,,,Predictive Maintenance data for the fan damage recognition
r,,DeltaFlowReturnMax,MaxDeltaFlowReturn_DK,,,,"3D00",,,temp,,,Wartungsdaten
r,,StorageLoadPumpHours,TankLoadPumpOperationHours_DK,,,,"4C00",,,hoursum2,,,Preditive maintenance data
r,,StorageloadPumpStarts,TankloadPumpCommunt_DK,,,,"4F00",,,cntstarts2,,,Preditive maintenance data
r,,HwcWaterflowMax,Max. WW Vorlauftemp.,,,,"5600",,,uin100,,,Maximalwert des Warmwassersensors
r,,CounterStartAttempts3,Zündfehler 3. Versuch,,,,"8100",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 3. Versuch)
r,,CounterStartAttempts4,Zündfehler 4. Versuch,,,,"8200",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 4. Versuch)
r,,ReturnTempMax,Max. Rücklauftemperatur,,,,"BE00",,,temp,,,Max. Rücklauftemperatur
r,,PumpHwcFlowSum,PumpDHWFlowSum_DK,,,,"C100",,,UIN,,,summed up DHW flow rate
r,,PumpHwcFlowNumber,PumpDHWFlowNumber_DK,,,,"C200",,,UCH,,,number of times DHW flow rate was detected
r,,SHEMaxFlowTemp,Max. WW Vorlauftemp.,,,,"C300",,,temp,,,Max. Vorlauftemperatur für WW
r,,SHEMaxDeltaHwcFlow,SHE_MaxDeltaFlowDHW_DK,,,,"C400",,,temp,,,maximum difference between flow and DHW outlet temperature
r;wi,,PrEnergySumHwc1,PrEnergySumDHW1_DK,,,,"C500",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc1,PrEnergyCountDHW1_DK,,,,"C600",,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHwc2,PrEnergySumDHW2_DK,,,,"C700",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc2,PrEnergyCountDHW2_DK,,,,"C800",,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHwc3,PrEnergySumDHW3_DK,,,,"C900",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc3,PrEnergyCountDHW3_DK,,,,"CA00",,,ULG,,,Wartungsdaten
r,,WaterHcFlowMax,MaxWaterFlowCH_DK,,,,"D000",,,UIN,,,Wartungsdaten
r,,WaterpressureVariantSum,WaterpressureVariantSum_DK,,,,"F000",,,pressm2,,,Wartungsdaten
r,,WaterpressureMeasureCounter,WaterpressureMeasureCounter_DK,,,,"F100",,,UCH,,,Wartungsdaten
r,,PrAPSCounter,PrAPSCounter_DK,,,,"F200",,,UCH,,,Wartungsdaten
r,,PrAPSSum,PrAPSSum_DK,,,,"F300",,,seconds2,,,Wartungsdaten
r,,PrVortexFlowSensorValue,PrVortexFlowSensorValue_DK,,,,"F400",,,SIN,,ADC,Wartungsdaten
r;wi,,PrEnergySumHc1,PrEnergySumCH1_DK,,,,"F500",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHc1,PrEnergyCountCH1_DK,,,,"F600",,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHc2,PrEnergySumCH2_DK,,,,"F700",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHc2,PrEnergyCountCH2_DK,,,,"F800",,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHc3,PrEnergySumCH3_DK,,,,"F900",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHc3,PrEnergyCountCH3_DK,,,,"FA00",,,ULG,,,Wartungsdaten
!include,errors.inc,,,,,,,,,,,,
!include,service.inc,,,,,,,,,,,,
