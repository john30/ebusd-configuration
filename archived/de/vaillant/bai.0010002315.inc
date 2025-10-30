# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,atmoCOMPACT,0010002315 174,,,,,,,,,,
*r,,,,,,"B509","0D",,,,,,
*w,,,,,,"B509","0E",,,,,,
*wi,#install,,,,,"B509","0E",,,,,,
r,,WPSecondStage,WP_SecondStage_DK,,,,"ED00",,,UCH,240=off;15=on,,Second stage of the pump activated
# ##### Diagnose Ebene 1 #####,,,,,,,,,,,,,
r;wi,,PartloadHcKW,d.00 Heizungsteillast,,,,"0704",,,power,,,Heizungsteillast
r;wi,,WPPostrunTime,d.01 Pumpennachlaufzeit,,,,"F703",,,minutes0,,,Wasserpumpennachlaufzeit nach Heizbetrieb
r;wi,,BlockTimeHcMax,d.02 Maximale Brennersperrzeit,,,,"0904",,,minutes0,,,Max. Brennersperrzeit bei einem Vorlaufsollwert von 20°C
r,,HwcTemp,d.03 WW Vorlaufsolltemp,,,,"1600",,,tempsensor,,,Vorlauftemperatur bei Warmwasserzapfung (nur bei Kombi-Heizgeräten)
r,,StorageTemp,d.04 Speicheristtemp,,,,"1700",,,tempsensor,,,Aktuelle Temperatur des Warmstartspeichers (bei Kombigeräten) oder aktuelle Speichertemperatur bei (VC Geräten)
r,,FlowTempDesired,d.05 Vorlaufsolltemperatur,,,,"3900",,,temp,,,Vorlaufsolltemperatur oder Rücklaufsolltemperatur (wenn Rücklaufregelung aktiviert wurde). Der Maximalwert wird über d.71 und einem eBUS Regler begrenzt.
r,,HwcTempDesired,d.06 Brauchwassersollwert,,,,"EA03",,,temp,,,Gewünschte Warmwasser Solltemperatur
r,,StorageTempDesired,d.07 Speichersolltemp,,,,"0400",,,temp,,,VCW: Solltemperatur des WarmstartspeichersVC: Solltemperatur des externen Speichers
r,,ACRoomthermostat,d.08 Raumthermostat,,,,"2A00",,,onoff,,,Status des extrenen Raumthermostat an Klemme 3/4
r,,ExtFlowTempDesiredMin,d.09 Min. ext. Vorlaufsollwert,,,,"6E04",,,temp,,,minimum out of Kl.7 and eBus flow setpoint
r,,WP,d.10 Wasserpumpe,,,,"4400",,,onoff,,,Interne Heizungspumpe
r,,extWP,d.11 ext. Heizungspumpe,,,,"3F00",,,onoff,,,Externe Heizungspumpe
r,,Storageloadpump,d.12 Speicherladepumpe,,,,"9E00",,,percent0,,,Ladepumpenanforderung
r,,CirPump,d.13 Zirkulationspumpe,,,,"7B00",,,onoff,,,Status Zirkulationspumpe (über ein externes Modul ansteuerbar)
r,,HeatingSwitch,d.23 Winterbetrieb,,,,"F203",,,onoff,,,Wintermodus aktiv (Heizbetrieb und Warmwasser)
r,,StoragereleaseClock,d.25 Speicherfreigabe,,,,"4704",,,yesno,,,Freigabe der Speichrladung oder des Warmstartspeichers durcheinen eBUS Regler
r,,Gasvalve,d.30 Gasventil,,,,"BB00",,,UCH,240=off;15=on,,GMV Ansteuersignal
r,,PositionValveSet,d.35 Position VUV,,,,"5400",,,UCH,,,Position des 3-Wege Ventil: 100=Warmwasser 0=Heizbetrieb 40=Mittenstellung
r,,FlowTemp,d.40 Vorlauftemperatur,,,,"1800",,,tempsensor,,,Vorlauftemperatur
r,,ReturnTemp,d.41 Rücklauftemperatur,,,,"9800",,,tempmirrorsensor,,,Rücklauftemperatur
r,,OutdoorstempSensor,d.47 Außentemperaturfühler,,,,"7600",,,tempsensor,,,Außentemperaturwert (ohne Korrekturwert) und Sensorstatus
r,,RemainingBoilerblocktime,d.67 Verbleibende Brennersperrzeit,,,,"3800",,,minutes0,,,Verbleibende Brennersperrzeit
r,,EBusHeatcontrol,d.90 Digitaler Regler,,,,"0004",,,yesno,,,Gibt an ob ein digitaler Regler erkannt wurde
r,,dcfState,d.91 DCF Status,,,,"6900",,,dcfstate,,,DCF Status
# ##### Expertenebene #####,,,,,,,,,,,,,
r,,externalFlowTempDesired,ext. Vorlaufsollwert,,,,"2500",,,temp,,,Vorlaufsollwert von einem externen Regler an Klemme 7-8-9
r,,AITemp,d.48 Abgassensor innen,,,,"3300",,,tempmirrorsensor,,,Abgassensor innen
r,,AATemp,d.49 Abgassensor aussen,,,,"3200",,,tempmirrorsensor,,,Abgassensor außen
r,,WaterPressure,Wasserdruck,,,,"0200",,,presssensor,,,Wasserdruck
r,,Flame,Flammensignal,,,,"0500",,,UCH,240=off;15=on,,Flammensignal
r,,SMGVCurrent,SM_GV_Current_DK,,,,"0600",,,UIN,,ADC,current for the gasvalve
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
r,,HwcImpellorSwitch,Brauchwasserzapfung,,,,"5700",,,yesno,,,WW Zapfung
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
r,,PowerValue,Leistungsdaten,,,,"AA00",,,HEX:6,,,Geräteleistung (min und max)
r,,Statenumber,Statenumber_DK,,,,"AB00",,,UCH,,,status number
r,,WaterpressureBranchControlOff,Drucksprungerkennung ausschalten,,,,"AF00",,,onoff,,,Überwachung der Druckänderung beim Schalten der Pumpe kann hiermit aktiviert oder deaktiviert werden
r,,DSNStart,DSN Startadresse,,,,"3104",,,UIN,,,DSN Startadresse
r,,PartnumberBox,Partnumber_Box,,,,"C000",,,HEX:5,,,part number of the eBox
r,,TemplimiterWithNTC,SD_STL_with_NTC,,,,"D200",,,UCH,240=no;15=yes,,Temperaturbegrenzer Art:1 = NTC0 = Schaltkontakt
r,,VolatileLockoutIFCGV,SD_VolatileLockout_IFC_GV_DK,,,,"D300",,,UCH,240=no;15=yes,,Alle IFC Fehler sind nichtflüchtig
r,,VortexFlowSensor,VortexFlowSensor_DK,,,,"D500",,,UIN,,,"Predictive Maintenance data, CH water flow"
r,,DisplayMode,DisplayMode_DK,,,,"DA00",,,UCH,,,Display mode of the aplliance
r,,Gasvalve3UC,Gasventil 3,,,,"DB00",,,UCH,240=off;15=on,,Gasventil Schaltsignal (vom Prozessor)
r,,InitialisationEEPROM,InitialisationEEPROM_DK,,,,"DC00",,,yesno,,,EEPROM Initialisierrung (für die Produktion)
r,,TimerInputHc,Eingang Schaltuhr,,,,"DE00",,,onoff,,,timer input (block heatdemand)
r,,ExternGasvalve,Ext. Gasventil,,,,"E400",,,onoff,,,Externes Magnetventil
r,,DCFTimeDate,DCF Datum/Uhrzeit,,,,"E500",,,btime;bdate,,,DCF Time / date stamp struct { uchar sec; uchar min; uchar std; uchar tag; uchar mon; uchar wtg; uchar jah; } Tdcf77_time;
# ##### Diagnose Ebene 2 #####,,,,,,,,,,,,,
r;wi,,ReturnRegulation,d.17 Rücklaufregelung,,,,"0C04",,,onoff,,,Aktivierung der Rücklaufregelung
r;wi,,HcPumpMode,d.18 Pumpenbetriebsart,,,,"4904",,,UCH,0=post run;1=permanent;2=winter,,Pumpenbetriebsart für den Heizbetrieb
r;wi,,SecondPumpMode,d.19 Betriebsart 2. Pumpe,,,,"0B04",,,UCH,,,Betriebsart 2stufige Pumpe:0 : Brennerbetrieb = Stufe 2 / Vor-Nachlauf = Stufe 11: Brennerbetrieb + Vorlauf = Stufe 1 / Warmwasser = Stufe 22 : Wie 1 aber im Heizbetrieb hängt die Stufe von der Teillast ab (default)3 : Immer Stufe 2
r;wi,,HwcTempMax,d.20 Max. WW Temperatur,,,,"4304",,,temp,,,Max. Speichersollwert. Begrenzt den max. Einstellbereich des Potentiometers (Rechtsanschlag).
r;wi,,AccessoriesOne,d.27 Zubehörrelais 1,,,,"4B04",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 1
r;wi,,AccessoriesTwo,d.28 Zubehörrelais 2,,,,"4C04",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 2
r;wi,,GVStepOffsetMin,d.52 MinGVStepOffset,,,,"7404",,,UCH,,,Offset for minimum gas valve steps
r;wi,,GVStepOffsetMax,d.53 MaxGVStepOffset,,,,"7504",,,SCH,,,Offset for maximum gas valve steps
r;wi,,ExhaustCurve,d.56 ExhaustCurve,,,,"7204",,,UCH,,,
r,,DeactivationsTemplimiter,d.60 STB Abschaltungen,,,,"2000",,,UCH,,,Anzahl der Abschaltungen durch den Sicherheitstemperaturbgrenzers
r,,DeactivationsIFC,d.61 Anzahl Zündfehler,,,,"1F00",,,UCH,,,Anzahl der Zündfehler (nicht erfolgreiche Züdung im letzten Versuch oder fehlerhaftes Flammensignal)
r,,averageIgnitiontime,d.64 Mittlere Zündzeit,,,,"2D00",,,UCH,10,s,Mittlere Zündzeit
r,,maxIgnitiontime,d.65 Max. Zündzeit,,,,"2C00",,,UCH,10,s,Maximale Zündzeit
r,,CounterStartattempts1,d.68 Zündfehler 1. Versuch,,,,"6E00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 1. Versuch)
r,,CounterStartattempts2,d.69 Zündfehler 2. Versuch,,,,"6F00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 2. Versuch)
r;wi,,ValveMode,d.70 VUV Betriebsart,,,,"2A04",,,UCH,,,Betriebsart 3-Wegeventil:0 = normaler Modus1 = Mittenstellung2 = Permanent Heizbetrieb (keine Umschaltung in den WW Betrieb)
r;wi,,FlowsetHcMax,d.71 Max. Vorlauftemp. Heizbetrieb,,,,"0E04",,,temp,,,Einstellung des maximalen Vorlaufsollwert im Heizbetrieb (bei Linksanschlag des Poti)
r;wi,,FlowsetHwcMax,d.78 Max. Vorlauftemp. WW,,,,"0F04",,,temp,,,Maximal erlaubte Vorlauftemperatur für die Speicherladung
r,,HcHours,d.80 Hz. Betriebsstunden,,,,"2800",,,hoursum2,,,Betriebsstunden im Heizbetrieb
r,,HwcHours,d.81 Betriebsstunden WW,,,,"2200",,,hoursum2,,,Betriebsstunden Brauchwasser
r,,HcStarts,d.82 Schaltspiele Heizbetrieb,,,,"2900",,,UIN,-100,,Schaltspiele Heizbetrieb
r,,HwcStarts,d.83 Schaltspiele BW Betrieb,,,,"2300",,,UIN,-100,,Schaltspiele WW Betrieb
r;wi,,HoursTillService,d.84 Stunden bis Wartung,,,,"2004",,,hoursum2,,,Wartungsintervall:Anzahl der Stunden bis zur nächsten Wartung
r;wi,,AntiCondensValue,d.85 Antikondensat Funktion,,,,"7704",,,power,,,increase of minimum power
r;wi,,DSNOffset,d.93 Gerätekennung,,,,"3004",,,UCH,,,DSN appliance variant setting
r;wi,,SetFactoryValues,d.96 Werkseinstellungen,,,,"6804",,,yesno,,,set diagnostic values back to factory settings
# ##### Wartungsdaten #####,,,,,,,,,,,,,
r,,TempGradientFailure,Gradientenfehler,,,,"1100",,,temp0,,,Anzahl der Boilerabschaltung wegen zu hohem Gradient (S.54)
r,,TempDiffBlock,TempDiffBlock_DK,,,,"1200",,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r,,TempDiffFailure,TempDiffFailure_DK,,,,"1300",,,temp0,,,Anzahl der Abschaltungen wegen zu hoher / fehlerhafter Differenz von Vor- und Rücklauftemperatur
r,,PumpHours,Betriebsstunden Pumpe,,,,"1400",,,hoursum2,,,Pumpenbetriebsstunden
r,,HcPumpStarts,CH_PumpCommunt_DK,,,,"1500",,,cntstarts2,,,Schaltspiele Pumpe
r,,ValveStarts,3WV Schaltspiele,,,,"1A00",,,cntstarts2,,,Anzahl der 3WV Umschaltungen
r,,OverflowCounter,Überlauf PM Zähler,,,,"1E00",,,yesno,,,Predictive Maintenance counter have got an overflow
r,,TempMaxDiffExtTFT,MaxTempDiffExtTFT_DK,,,,"2700",,,temp,,,Predictive maintenance data
r,,minIgnitiontime,Min. Zündzeit,,,,"2B00",,,UCH,10,s,Minimale Zündzeit
r,,maintenancedata_HwcTempMax,Max. WW Temperatur,,,,"3500",,,temp,,,Maximaltemperatur gemessen am Brauchwasserauslaufsensor
r,,StorageTempMax,Max. Speichertemp.,,,,"3600",,,temp,,,Maximaltemperatur gemessen am Speichersensor
r,,FlowTempMax,Max. Vorlauftemperatur,,,,"3700",,,temp,,,Maximaltemperatur gemessen am Vorlaufsensor
r,,DeltaFlowReturnMax,MaxDeltaFlowReturn_DK,,,,"3D00",,,temp,,,Wartungsdaten
r,,StorageLoadPumpHours,TankLoadPumpOperationHours_DK,,,,"4C00",,,hoursum2,,,Preditive maintenance data
r,,StorageloadPumpStarts,TankloadPumpCommunt_DK,,,,"4F00",,,cntstarts2,,,Preditive maintenance data
r,,CounterStartAttempts3,Zündfehler 3. Versuch,,,,"8100",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 3. Versuch)
r,,CounterStartAttempts4,Zündfehler 4. Versuch,,,,"8200",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 4. Versuch)
r,,ReturnTempMax,Max. Rücklauftemperatur,,,,"BE00",,,temp,,,Max. Rücklauftemperatur
r,,PumpHwcFlowSum,PumpDHWFlowSum_DK,,,,"C100",,,UIN,,,summed up DHW flow rate
r,,PumpHwcFlowNumber,PumpDHWFlowNumber_DK,,,,"C200",,,UCH,,,number of times DHW flow rate was detected
r,,SHEMaxFlowTemp,Max. WW Vorlauftemp.,,,,"C300",,,temp,,,Max. Vorlauftemperatur für WW
r,,SHEMaxDeltaHwcFlow,SHE_MaxDeltaFlowDHW_DK,,,,"C400",,,temp,,,maximum difference between flow and DHW outlet temperature
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
