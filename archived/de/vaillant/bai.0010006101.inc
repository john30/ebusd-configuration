# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,TEC/4,0010006101 188,,,,,,,,,,
*r,,,,,,"B509","0D",,,,,,
*w,,,,,,"B509","0E",,,,,,
*wi,#install,,,,,"B509","0E",,,,,,
*ws,#service,,,,,"B509","0E",,,,,,
# ##### Diagnose Ebene 1 #####,,,,,,,,,,,,,
r;w,,PartloadHcKW,d.00 Heizungsteillast,,,,"0704",,,power,,,Heizungsteillast
r;w,,WPPostrunTime,d.01 Pumpennachlaufzeit,,,,"F703",,,minutes0,,,Wasserpumpennachlaufzeit nach Heizbetrieb
r;w,,BlockTimeHcMax,d.02 Maximale Brennersperrzeit,,,,"0904",,,minutes0,,,Max. Brennersperrzeit bei einem Vorlaufsollwert von 20°C
r,,HwcTemp,d.03 WW Vorlaufsolltemp,,,,"1600",,,tempsensor,,,Vorlauftemperatur bei Warmwasserzapfung (nur bei Kombi-Heizgeräten)
r,,StorageTemp,d.04 Speicheristtemp,,,,"1700",,,tempsensor,,,current temperature for warm start sensor (combination boiler only) Current storage tank sensor (system boiler only)
r,,FlowTempDesired,d.05 Vorlaufsolltemperatur,,,,"3900",,,temp,,,Vorlaufsolltemperatur oder Rücklaufsolltemperatur (wenn Rücklaufregelung aktiviert wurde). Der Maximalwert wird über d.71 und einem eBUS Regler begrenzt.
r,,HwcTempDesired,d.06 Brauchwassersollwert,,,,"EA03",,,temp,,,Gewünschte Warmwasser Solltemperatur
r,,StorageTempDesired,d.07 Speichersolltemp,,,,"0400",,,temp,,,VCW: Solltemperatur des WarmstartspeichersVC: Solltemperatur des externen Speichers
r,,ACRoomthermostat,d.08 Raumthermostat,,,,"2A00",,,onoff,,,Status des extrenen Raumthermostat an Klemme 3/4
r,,ExtFlowTempDesiredMin,d.09 Min. ext. Vorlaufsollwert,,,,"6E04",,,temp,,,minimum out of Kl.7 and eBus flow setpoint
r,,WP,d.10 Wasserpumpe,,,,"4400",,,onoff,,,Interne Heizungspumpe
r,,extWP,d.11 ext. Heizungspumpe,,,,"3F00",,,onoff,,,Externe Heizungspumpe
r,,Storageloadpump,d.12 Speicherladepumpe,,,,"9E00",,,percent0,,,Ladepumpenanforderung
r,,CirPump,d.13 Zirkulationspumpe,,,,"7B00",,,onoff,,,Status Zirkulationspumpe (über ein externes Modul ansteuerbar)
r,,WPPWMPower,d.15 Pumpendrehzahl Istwert,,,,"7300",,,percent0,,,actual PWM-Powerrate of electronic-pump
r,,HwcDemand,d.22 WW Anforderung,,,,"5800",,,yesno,,,Brauchwasseranforderung (Zapfung oder Schaltsignal vom Speicher)
r,,HeatingSwitch,d.23 Winterbetrieb,,,,"F203",,,onoff,,,Wintermodus aktiv (Heizbetrieb und Warmwasser)
r,,AircontrolOk,d.24 SD_AircontrolOk_DK,,,,"0300",,,UCH,240=off;15=on,,Druckdose
r,,StoragereleaseClock,d.25 Speicherfreigabe,,,,"4704",,,yesno,,,Freigabe der Speichrladung oder des Warmstartspeichers durcheinen eBUS Regler
r,,Gasvalve,d.30 Gasventil,,,,"BB00",,,UCH,240=off;15=on,,GMV Ansteuersignal
r,,TargetFanSpeed,d.33 Lüfter Solldrehzahl,,,,"2400",,,UIN,,1/min,Drehzahlsollwert des Lüfters
r,,FanSpeed,d.34 Lüfteristdrehzahl,,,,"8300",,,UIN,,1/min,Aktuelle Lüfterdrehzahl
r,,PositionValveSet,d.35 Position VUV,,,,"5400",,,UCH,,,Position des 3-Wege Ventil: 100=Warmwasser 0=Heizbetrieb 40=Mittenstellung
r,,HwcWaterflow,d.36 Zapfmenge,,,,"5500",,,uin100,,,WW Durchflußsensor
r,,FlowTemp,d.40 Vorlauftemperatur,,,,"1800",,,tempsensor,,,Vorlauftemperatur
r,,ReturnTemp,d.41 Rücklauftemperatur,,,,"9800",,,tempmirrorsensor,,,Rücklauftemperatur
r,,IonisationVoltageLevel,d.44 Spannungspegel Ionisationssignal,,,,"A400",,,SIN,10,,digital ionisation voltage
r,,OutdoorstempSensor,d.47 Außentemperaturfühler,,,,"7600",,,tempsensor,,,Außentemperaturwert (ohne Korrekturwert) und Sensorstatus
r,,AITemp,d.48 Abgassensor innen,,,,"3300",,,tempmirrorsensor,,,Abgassensor innen
r,,AATemp,d.49 Abgassensor aussen,,,,"3200",,,tempmirrorsensor,,,Abgassensor außen
r,,RemainingBoilerblocktime,d.67 Verbleibende Brennersperrzeit,,,,"3800",,,minutes0,,,Verbleibende Brennersperrzeit
r,,EBusHeatcontrol,d.90 Digitaler Regler,,,,"0004",,,yesno,,,Gibt an ob ein digitaler Regler erkannt wurde
r,,dcfState,d.91 DCF Status,,,,"6900",,,dcfstate,,,DCF Status
# ##### Expertenebene #####,,,,,,,,,,,,,
r,,DCRoomthermostat,d.16 Raumthermostat,,,,"0E00",,,onoff,,,Wärmeanforderung vom externen Regler (Klemme 3-4)
r,,HwcSwitch,Wasserschalter,,,,"F303",,,onoff,,,WW aus/ein
r,,WaterPressure,Wasserdruck,,,,"0200",,,presssensor,,,value of waterpressure-sensor
r,,ExternGasvalve,Ext. Gasventil,,,,"E400",,,onoff,,,Externes Magnetventil
r,,expertlevel_ReturnTemp,Rücklauftemperatur,,,,"6B00",,,tempsensor,,,Externer Rücklauftemperatursensor
r,,Ignitor,Zünder,,,,"4900",,,UCH,240=off;15=on,,Zündung aktiviert
r,,Flame,Flammensignal,,,,"0500",,,UCH,240=off;15=on,,Flammensignal
r,,externalHwcSwitch,Wasserschalter,,,,"0000",,,onoff,,,Speicheranforderung eines externen Speichers über den Speicherkontakt
r,,HcUnderHundredStarts,HZ_UnderHundred_SwiActi_DK,,,,"3000",,,UCH,,,Heat switch cycles under hundred
r,,HwcUnderHundredStarts,BW_UnderHundred_SwiActi_DK,,,,"3100",,,UCH,,,DHW switch cycles under hundred
r,,DSN,DSN,,,,"9A00",,,UIN,,,DSN: Device Specific number
r,,DSNStart,DSN Startadresse,,,,"3104",,,UIN,,,DSN Startadresse
r,,ChangesDSN,Anzhl der DSN Änderungen,,,,"0C00",,,UCH,,,Anzahl der DSN (Gerätekennung) Änderungen
r,,ParamToken,ParamToken_DK,,,,"6000",,,UCH,,,token for parameter managment
r,,FanMinSpeedOperation,Min. Lüfterdrehzahl,,,,"DF00",,,UIN,,1/min,Lüfter Minimaldrehzahl
r,,FanMaxSpeedOperation,Max. Lüfterdrehzahl,,,,"E000",,,UIN,,1/min,Lüfter Maximaldrehzahl
r,,WaterpressureBranchControlOff,Drucksprungerkennung ausschalten,,,,"AF00",,,onoff,,,Überwachung der Druckänderung beim Schalten der Pumpe kann hiermit aktiviert oder deaktiviert werden
r,,SerialNumber,SerialNumber,,,,"3F04",,,HEX:8,,,Seriennummer AI
r,,PartnumberBox,Partnumber_Box,,,,"C000",,,HEX:5,,,part number of the eBox
r,,BoilerType,BoilerType_DK,,,,"5E00",,,UCH,,,Boiler typ of the bmu
r,,BoilerType2,BoilerType_2_DK,,,,"0C01",,,ULG,,,
r,,DisplayMode,DisplayMode_DK,,,,"DA00",,,UCH,,,Display mode of the appliance
r,,PowerValue,Leistungsdaten,,,,"AA00",,,HEX:6,,,Geräteleistung (min und max)
r,,DCFTimeDate,DCF Datum/Uhrzeit,,,,"E500",,,btime;bdate,,,DCF Time / date stamp struct { uchar sec; uchar min; uchar std; uchar tag; uchar mon; uchar wtg; uchar jah; } Tdcf77_time;
r,,EbusVoltage,eBUS Spannung,,,,"7F00",,,onoff,,,Rückmeldung der eBUS Spannung
r,,EbusSourceOn,eBUS Spannungsversorgung,,,,"3400",,,onoff,,,Aktivierung der eBUS Speisung
r,,TemplimiterWithNTC,SD_STL_with_NTC,,,,"D200",,,UCH,240=no;15=yes,,Temperaturbegrenzer Art:1 = NTC0 = Schaltkontakt
r,,Templimiter,Temperaturbegrenzer,,,,"7700",,,UCH,240=off;15=on,,Rückmeldung des Temperaturbegrenzer Signals
r,,TimerInputHc,Eingang Schaltuhr,,,,"DE00",,,onoff,,,timer input (block heatdemand)
r,,Statenumber,Statenumber_DK,,,,"AB00",,,UCH,,,status number
r,,ExternalFaultmessage,Ext. Störmeldung,,,,"3E00",,,onoff,,,Signal für die externe Störmeldeeinrichtung
r,,FlowSetPotmeter,Vorlaufsollwert Poti,,,,"F003",,,temp,,,Vorlaufsollwert Potentiometer
r,,HwcSetPotmeter,WW Sollwert Potentiometer,,,,"F103",,,temp,,,WW Sollwertpotentiometer
r,,FloorHeatingContact,Anlegethermostat,,,,"7000",,,onoff,,,Eingang Anlegethermostat
r,,externalFlowTempDesired,ext. Vorlaufsollwert,,,,"2500",,,temp,,,Vorlaufsollwert von einem externen Regler an Klemme 7-8-9
r,,ModulationTempDesired,Modulationssollwert,,,,"2E00",,,SIN,10,%,Modulationssollwert
# ##### Diagnose Ebene 2 #####,,,,,,,,,,,,,
r;wi,,WPPWMPowerDia,d.14 WP_PWMPowerDia_DK,,,,"0A04",,,UCH,,,Set-PWM-Powerrate of electronic-pump
r;wi,,ReturnRegulation,d.17 Rücklaufregelung,,,,"0C04",,,onoff,,,Aktivierung der Rücklaufregelung
r;wi,,HcPumpMode,d.18 Pumpenbetriebsart,,,,"4904",,,UCH,0=post run;1=permanent;2=winter,,"Pump mode: 0=post run, 1=continous, 2=Winter, 3=intermittend"
r;wi,,SecondPumpMode,d.19 Betriebsart 2. Pumpe,,,,"0B04",,,UCH,,,Betriebsart 2stufige Pumpe:0 : Brennerbetrieb = Stufe 2 / Vor-Nachlauf = Stufe 11: Brennerbetrieb + Vorlauf = Stufe 1 / Warmwasser = Stufe 22 : Wie 1 aber im Heizbetrieb hängt die Stufe von der Teillast ab (default)3 : Immer Stufe 2
r;wi,,HwcTempMax,d.20 Max. WW Temperatur,,,,"4304",,,temp,,,Max. Speichersollwert. Begrenzt den max. Einstellbereich des Potentiometers (Rechtsanschlag).
r;wi,,AccessoriesOne,d.27 Zubehörrelais 1,,,,"4B04",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 1
r;wi,,AccessoriesTwo,d.28 Zubehörrelais 2,,,,"4C04",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 2
r;wi,,GVStepOffsetMin,d.52 MinGVStepOffset,,,,"7404",,,UCH,,,Offset for minimum gas valve steps
r;wi,,GVStepOffsetMax,d.53 MaxGVStepOffset,,,,"7504",,,SCH,,,Offset for maximum gas valve steps
r;ws,,ExhaustCurve,d.56 ExhaustCurve,,,,"7204",,,UCH,,,ExhaustCurve
r,,SolPostHeat,d.58 Solarbetriebsart,,,,"7304",,,UCH,,,Spezielle WW Funktionen:0 = Solarfunktion deaktiviert (default)1 = Solarfunktion aktiviert und WW Sollwert minimal 60°C2 = Solarfunktion aktiviert und WW Sollwert min. 35°C3 = WW Sollwert minimum 60°C
r,,DeactivationsTemplimiter,d.60 STB Abschaltungen,,,,"2000",,,UCH,,,Anzahl der Abschaltungen durch den Sicherheitstemperaturbgrenzers
r,,DeactivationsIFC,d.61 Anzahl Zündfehler,,,,"1F00",,,UCH,,,Anzahl der Zündfehler (nicht erfolgreiche Züdung im letzten Versuch oder fehlerhaftes Flammensignal)
r,,exhaustWayBlockCounter,d.63 exhaust way block counter,,,,"9C00",,,UCH,,,numbers the exhaust way was blocked
r,,averageIgnitiontime,d.64 Mittlere Zündzeit,,,,"2D00",,,UCH,10,s,Mittlere Zündzeit
r,,maxIgnitiontime,d.65 Max. Zündzeit,,,,"2C00",,,UCH,10,s,Maximale Zündzeit
r,,CounterStartattempts1,d.68 Zündfehler 1. Versuch,,,,"6E00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 1. Versuch)
r,,CounterStartattempts2,d.69 Zündfehler 2. Versuch,,,,"6F00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 2. Versuch)
r;wi,,ValveMode,d.70 VUV Betriebsart,,,,"2A04",,,UCH,,,Betriebsart 3-Wegeventil:0 = normaler Modus1 = Mittenstellung2 = Permanent Heizbetrieb (keine Umschaltung in den WW Betrieb)
r;wi,,FlowsetHcMax,d.71 Max. Vorlauftemp. Heizbetrieb,,,,"0E04",,,temp,,,Einstellung des maximalen Vorlaufsollwert im Heizbetrieb (bei Linksanschlag des Poti)
r;wi,,HwcPostrunTime,d.72 WW Pumpnenachlaufzeit,,,,"1104",,,UCH,-10,s,Pumpennachlaufzeit nach Speicherladung
r,,WarmstartOffset,d.73 Warmstart Offset,,,,"1004",,,temp,,,Offset für Warmstartsollwert (nur bei VCW)
r;wi,,StorageLoadTimeMax,d.75 Max. Speicherladezeit,,,,"1204",,,minutes0,,,Max. Speicherladezeit für Speicher ohne eigene Regelung
r;wi,,PartloadHwcKW,d.77 Speicherteillast,,,,"0804",,,power,,,Teillast für Speicherladung (Geräteleistung kann auf den angegebenen Wert limitiert werden)
r;wi,,FlowsetHwcMax,d.78 Max. Vorlauftemp. WW,,,,"0F04",,,temp,,,Maximal erlaubte Vorlauftemperatur für die Speicherladung
r,,HcHours,d.80 Hz. Betriebsstunden,,,,"2800",,,hoursum2,,,Betriebsstunden im Heizbetrieb
r,,HwcHours,d.81 Betriebsstunden WW,,,,"2200",,,hoursum2,,,Betriebsstunden Brauchwasser
r,,HcStarts,d.82 Schaltspiele Heizbetrieb,,,,"2900",,,UIN,-100,,Schaltspiele Heizbetrieb
r,,HwcStarts,d.83 Schaltspiele BW Betrieb,,,,"2300",,,UIN,-100,,Schaltspiele WW Betrieb
r;wi,,HoursTillService,d.84 Stunden bis Wartung,,,,"2004",,,hoursum2,,,Wartungsintervall:Anzahl der Stunden bis zur nächsten Wartung
r;wi,,AntiCondensValue,d.85 Antikondensat Funktion,,,,"7704",,,UCH,,kW / %,increase of minimum power
r;wi,,SpecialAdj,d.88 SpecialAdj,,,,"7604",,,UCH,,,"switching on threshold for recognition of water tapping0 = 1,5 l/min and no delay, 1 = 3,7 l/min and 2s delay"
r;ws,,DSNOffset,d.93 Gerätekennung,,,,"3004",,,UCH,,,Gerätekennung (DSN)
r;wi,,SetFactoryValues,d.96 Werkseinstellungen,,,,"6804",,,yesno,,,Werkseinstellungen
# ##### Wartungsdaten #####,,,,,,,,,,,,,
r,,minIgnitiontime,Min. Zündzeit,,,,"2B00",,,UCH,10,s,Minimale Zündzeit
r,,GasvalveUC,Gasventil,,,,"0D00",,,UCH,240=off;15=on,,Schaltsignal für das Gasventil
r,,VolatileLockout,Verriegelnde Störabschaltungen,,,,"1000",,,UCH,240=no;15=yes,,WAHR: STB Fehler sind verriegelnd
r,,FlameSensingASIC,SD_Flame_Sensing_ASIC_DK,,,,"2F00",,,UIN,,,Ioni/ADC Wert vom Flammenwächter
r,,Fluegasvalve,Abgasklappe,,,,"3C00",,,onoff,,,Flüssiggas Magnetventil
r,,GasvalveASICFeedback,Rückmeldung Gasventil,,,,"4700",,,UCH,240=off;15=on,,Rückmeldung Gasventil vom ASIC
r,,GasvalveUCFeedback,Rückmeldung Gasventil,,,,"4800",,,UCH,240=off;15=on,,Rückmeldung Gasventil vom Prozessor
r,,HwcTypes,WW Typen,,,,"4B00",,,UCH,,,DHW type of the appliance
r,,HwcWaterflowMax,Max. WW Vorlauftemp.,,,,"5600",,,uin100,,,Maximalwert des Warmwassersensors
r,,HwcImpellorSwitch,Brauchwasserzapfung,,,,"5700",,,yesno,,,WW Zapfung
r,,WarmstartDemand,Warmstartanforderung,,,,"3A04",,,yesno,,,activation of warmstart
r,,TargetFanSpeedOutput,Lüfter Solldrehzahl,,,,"9F00",,,UIN,,1/min,Lüfterdrehzahl
r;ws,,ReduceModulationBlocktime,ReduceModulationBlocktime_DK,,,,"5C00",,,UCH,,,Reduced modulation blocking time to fulfil 3-star requirement
r,,CounterStartAttempts3,Zündfehler 3. Versuch,,,,"8100",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 3. Versuch)
r,,SHEMaxFlowTemp,Max. WW Vorlauftemp.,,,,"C300",,,temp,,,Max. Vorlauftemperatur für WW
r,,SHEMaxDeltaHwcFlow,SHE_MaxDeltaFlowDHW_DK,,,,"C400",,,temp,,,maximum difference between flow and DHW outlet temperature
r,,PumpHours,Betriebsstunden Pumpe,,,,"1400",,,hoursum2,,,Pumpenbetriebsstunden
r,,WPSecondStage,WP_SecondStage_DK,,,,"ED00",,,UCH,240=off;15=on,,Second stage of the pump activated
r,,HcPumpStarts,CH_PumpCommunt_DK,,,,"1500",,,cntstarts2,,,Schaltspiele Pumpe
r,,ValveStarts,3WV Schaltspiele,,,,"1A00",,,cntstarts2,,,Anzahl der 3WV Umschaltungen
r,,FanHours,Betriebsstunden Lüfter,,,,"1B00",,,hoursum2,,,Betriebsstunden des Lüfters
r,,FanStarts,FanCommunt_DK,,,,"1C00",,,cntstarts2,,,Anzahl der Lüfterschaltspiele
r,,FanPWMTest,Fan_PWM_Test_DK,,,,"3B00",,,UCH,,,Predictive Maintenance data for the fan damage recognition
r,,FanPWMSum,Fan_PWM_Sum_DK,,,,"3A00",,,UIN,,,Predictive Maintenance data for the fan damage recognition
r,,Gasvalve3UC,Gasventil 3,,,,"DB00",,,UCH,240=off;15=on,,Gasventil Schaltsignal (vom Prozessor)
r,,WaterpressureMeasureCounter,WaterpressureMeasureCounter_DK,,,,"F100",,,UCH,,,Wartungsdaten
r,,WaterpressureVariantSum,WaterpressureVariantSum_DK,,,,"F000",,,pressm2,,,Wartungsdaten
r,,StorageLoadPumpHours,TankLoadPumpOperationHours_DK,,,,"4C00",,,hoursum2,,,Preditive maintenance data
r,,StorageloadPumpStarts,TankloadPumpCommunt_DK,,,,"4F00",,,cntstarts2,,,Preditive maintenance data
r,,TempGradientFailure,Gradientenfehler,,,,"1100",,,temp0,,,Anzahl der Boilerabschaltung wegen zu hohem Gradient (S.54)
r,,TempDiffBlock,TempDiffBlock_DK,,,,"1200",,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r,,TempDiffFailure,TempDiffFailure_DK,,,,"1300",,,temp0,,,Anzahl der Abschaltungen wegen zu hoher / fehlerhafter Differenz von Vor- und Rücklauftemperatur
r,,ReturnTempMax,Max. Rücklauftemperatur,,,,"BE00",,,temp,,,Max. Rücklauftemperatur
r,,maintenancedata_HwcTempMax,Max. WW Temperatur,,,,"3500",,,temp,,,Maximaltemperatur gemessen am Brauchwasserauslaufsensor
r,,StorageTempMax,Max. Speichertemp.,,,,"3600",,,temp,,,Maximaltemperatur gemessen am Speichersensor
r,,TempMaxDiffExtTFT,MaxTempDiffExtTFT_DK,,,,"2700",,,temp,,,Predictive maintenance data
r,,DeltaFlowReturnMax,MaxDeltaFlowReturn_DK,,,,"3D00",,,temp,,,Wartungsdaten
r,,WaterHcFlowMax,MaxWaterFlowCH_DK,,,,"D000",,,UIN,,,Wartungsdaten
r,,PumpHwcFlowSum,PumpDHWFlowSum_DK,,,,"C100",,,UIN,,,summed up DHW flow rate
r,,PrAPSCounter,PrAPSCounter_DK,,,,"F200",,,UCH,,,Wartungsdaten
r,,PrAPSSum,PrAPSSum_DK,,,,"F300",,,seconds2,,,Wartungsdaten
r,,PumpHwcFlowNumber,PumpDHWFlowNumber_DK,,,,"C200",,,UCH,,,number of times DHW flow rate was detected
r;wi,,PrEnergySumHwc1,PrEnergySumDHW1_DK,,,,"C500",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc1,PrEnergyCountDHW1_DK,,,,"C600",,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHwc2,PrEnergySumDHW2_DK,,,,"C700",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc2,PrEnergyCountDHW2_DK,,,,"C800",,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHwc3,PrEnergySumDHW3_DK,,,,"C900",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc3,PrEnergyCountDHW3_DK,,,,"CA00",,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHc1,PrEnergySumCH1_DK,,,,"F500",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHc1,PrEnergyCountCH1_DK,,,,"F600",,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHc2,PrEnergySumCH2_DK,,,,"F700",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHc2,PrEnergyCountCH2_DK,,,,"F800",,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHc3,PrEnergySumCH3_DK,,,,"F900",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHc3,PrEnergyCountCH3_DK,,,,"FA00",,,ULG,,,Wartungsdaten
r,,OverflowCounter,Überlauf PM Zähler,,,,"1E00",,,yesno,,,Predictive Maintenance counter have got an overflow
r,,PredFanPWMDevThreshold,Pred_FanPWM_DevThreshold_DK,,,,"3501",,,UCH,,,
r,,PredFanPWMSwitchingPoint,Pred_FanPWM_SwitchingPoint_DK,,,,"3601",,,UIN,,,
r,,PredFanPWMRefPWMcounter,Pred_FanPWM_RefPWMcounter_DK,,,,"3701",,,UCH,,,
r,,PredFanPWMRefPWMsum,Pred_FanPWM_RefPWMsum_DK,,,,"3801",,,UIN,,,
r,,PredFanPWMPredCounter,Pred_FanPWM_PredCounter_DK,,,,"3901",,,UIN;UIN;UIN,,,
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
!include,errors.inc,,,,,,,,,,,,
