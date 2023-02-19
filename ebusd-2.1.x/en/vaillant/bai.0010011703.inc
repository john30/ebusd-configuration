# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,ecoTEC Plus (euro),308523 174,,,,,,,,,,
*r,,,,,,"B509","0D",,,,,,
*w,,,,,,"B509","0E",,,,,,
*wi,#install,,,,,"B509","0E",,,,,,
*ws,#service,,,,,"B509","0E",,,,,,
*[SW],scan,,,SW,,,,,,,,,
# ##### Diagnose Ebene 1 #####,,,,,,,,,,,,,
r9;wi,,PartloadHcKW,d.00 Heizungsteillast,,,,"6C00",,,power,,,Heizungsteillast
r9;wi,,WPPostrunTime,d.01 Pumpennachlaufzeit,,,,"6400",,,minutes0,,,Wasserpumpennachlaufzeit nach Heizbetrieb
r9;wi,,BlockTimeHcMax,d.02 Maximale Brennersperrzeit,,,,"2100",,,minutes0,,,Max. Brennersperrzeit bei einem Vorlaufsollwert von 20°C
r9,,HwcTemp,d.03 WW Vorlaufsolltemp,,,,"1600",,,tempsensor,,,Vorlauftemperatur bei Warmwasserzapfung (nur bei Kombi-Heizgeräten)
r9,,StorageTemp,d.04 Speicheristtemp,,,,"1700",,,tempsensor,,,Aktuelle Temperatur des Warmstartspeichers (bei Kombigeräten) oder aktuelle Speichertemperatur bei (VC Geräten)
r9,,FlowTempDesired,d.05 Vorlaufsolltemperatur,,,,"3900",,,temp,,,Vorlaufsolltemperatur oder Rücklaufsolltemperatur (wenn Rücklaufregelung aktiviert wurde). Der Maximalwert wird über d.71 und einem eBUS Regler begrenzt.
r9,,HwcTempDesired,d.06 Brauchwassersollwert,,,,"EA03",,,temp,,,Gewünschte Warmwasser Solltemperatur
r9,,StorageTempDesired,d.07 Speichersolltemp,,,,"0400",,,temp,,,VCW: Solltemperatur des WarmstartspeichersVC: Solltemperatur des externen Speichers
r9,,ACRoomthermostat,d.08 Raumthermostat,,,,"2A00",,,onoff,,,Status des extrenen Raumthermostat an Klemme 3/4
r9,,ExtFlowTempDesiredMin,d.09 Min. ext. Vorlaufsollwert,,,,"6E04",,,temp,,,minimum out of Kl.7 and eBus flow setpoint
r1,,WP,d.10 Wasserpumpe,,,,"4400",,,onoff,,,Interne Heizungspumpe
r9,,extWP,d.11 ext. Heizungspumpe,,,,"3F00",,,onoff,,,Externe Heizungspumpe
r9,,Storageloadpump,d.12 Speicherladepumpe,,,,"9E00",,,percent0,,,Ladepumpenanforderung
r1,,CirPump,d.13 Zirkulationspumpe,,,,"7B00",,,onoff,,,Status Zirkulationspumpe (über ein externes Modul ansteuerbar)
r9,,WPPWMPower,d.15 Pumpendrehzahl Istwert,,,,"7300",,,percent0,,,Output of pwm pump
r9,,DCRoomthermostat,d.16 Raumthermostat,,,,"0E00",,,onoff,,,Wärmeanforderung vom externen Regler (Klemme 3-4)
r1,,HwcDemand,d.22 WW Anforderung,,,,"5800",,,yesno,,,Brauchwasseranforderung (Zapfung oder Schaltsignal vom Speicher)
r9,,HeatingSwitch,d.23 Winterbetrieb,,,,"F203",,,onoff,,,Wintermodus aktiv (Heizbetrieb und Warmwasser)
r9,,StoragereleaseClock,d.25 Speicherfreigabe,,,,"4704",,,yesno,,,Freigabe der Speichrladung oder des Warmstartspeichers durcheinen eBUS Regler
r1,,Gasvalve,d.30 Gasventil,,,,"BB00",,,UCH,240=off;15=on,,GMV Ansteuersignal
r9,,TargetFanSpeed,d.33 Lüfter Solldrehzahl,,,,"2400",,,UIN,,1/min,Drehzahlsollwert des Lüfters
r9,,FanSpeed,d.34 Lüfteristdrehzahl,,,,"8300",,,UIN,,1/min,Aktuelle Lüfterdrehzahl
r1,,PositionValveSet,d.35 Position VUV,,,,"5400",,,UCH,,,Position des 3-Wege Ventil: 100=Warmwasser 0=Heizbetrieb 40=Mittenstellung
r1,,HwcWaterflow,d.36 Zapfmenge,,,,"5500",,,uin100,,,WW Durchflußsensor
r1,,FlowTemp,d.40 Vorlauftemperatur,,,,"1800",,,tempsensor,,,Vorlauftemperatur
r1,,ReturnTemp,d.41 Rücklauftemperatur,,,,"9800",,,tempmirrorsensor,,,Rücklauftemperatur
r9,,IonisationVoltageLevel,d.44 Spannungspegel Ionisationssignal,,,,"A400",,,SIN,10,,Ionisationsspannung: größer 80 = keine Flammekleiner 40 = gutes Flammensignal
r9,,OutdoorstempSensor,d.47 Außentemperaturfühler,,,,"7600",,,tempsensor,,,Außentemperaturwert (ohne Korrekturwert) und Sensorstatus
r1,,RemainingBoilerblocktime,d.67 Verbleibende Brennersperrzeit,,,,"3800",,,minutes0,,,Verbleibende Brennersperrzeit
r9,,EBusHeatcontrol,d.90 Digitaler Regler,,,,"0004",,,yesno,,,Gibt an ob ein digitaler Regler erkannt wurde
r9,,dcfState,d.91 DCF Status,,,,"6900",,,dcfstate,,,DCF Status
# ##### Expertenebene #####,,,,,,,,,,,,,
r9,,externalFlowTempDesired,ext. Vorlaufsollwert,,,,"2500",,,temp,,,Vorlaufsollwert von einem externen Regler an Klemme 7-8-9
r9,,externalHwcSwitch,Wasserschalter,,,,"0000",,,onoff,,,Speicheranforderung eines externen Speichers über den Speicherkontakt
r9,,WaterPressure,Wasserdruck,,,,"0200",,,presssensor,,,Wasserdruck
r1,,Flame,Flammensignal,,,,"0500",,,UCH,240=off;15=on,,Flammensignal
r9,,ChangesDSN,Anzhl der DSN Änderungen,,,,"0C00",,,UCH,,,Anzahl der DSN (Gerätekennung) Änderungen
r9,,GasvalveUC,Gasventil,,,,"0D00",,,UCH,240=off;15=on,,Schaltsignal für das Gasventil
r9,,VolatileLockout,Verriegelnde Störabschaltungen,,,,"1000",,,UCH,240=no;15=yes,,WAHR: STB Fehler sind verriegelnd
r1,,ModulationTempDesired,Modulationssollwert,,,,"2E00",,,SIN,10,%,Modulationssollwert
r9,,FlameSensingASIC,SD_Flame_Sensing_ASIC_DK,,,,"2F00",,,UIN,,,Ioni/ADC Wert vom Flammenwächter
r9,,HcUnderHundredStarts,HZ_UnderHundred_SwiActi_DK,,,,"3000",,,UCH,,,Heat switch cycles under hundred
r9,,HwcUnderHundredStarts,BW_UnderHundred_SwiActi_DK,,,,"3100",,,UCH,,,DHW switch cycles under hundred
r9,,EbusSourceOn,eBUS Spannungsversorgung,,,,"3400",,,onoff,,,Aktivierung der eBUS Speisung
r9,,Fluegasvalve,Abgasklappe,,,,"3C00",,,onoff,,,Flüssiggas Magnetventil
r9,,ExternalFaultmessage,Ext. Störmeldung,,,,"3E00",,,onoff,,,Signal für die externe Störmeldeeinrichtung
r9,,GasvalveASICFeedback,Rückmeldung Gasventil,,,,"4700",,,UCH,240=off;15=on,,Rückmeldung Gasventil vom ASIC
r9,,GasvalveUCFeedback,Rückmeldung Gasventil,,,,"4800",,,UCH,240=off;15=on,,Rückmeldung Gasventil vom Prozessor
r9,,Ignitor,Zünder,,,,"4900",,,UCH,240=off;15=on,,Zündung aktiviert
r9,,HwcTypes,WW Typen,,,,"4B00",,,UCH,,,DHW type of the appliance
r9,,HwcImpellorSwitch,Brauchwasserzapfung,,,,"5700",,,yesno,,,WW Zapfung
r9,,WarmstartDemand,Warmstartanforderung,,,,"3A04",,,yesno,,,Warmstartaktivierung
r9,,BoilerType,BoilerType_DK,,,,"5E00",,,UCH,,,Boiler typ of the bmu
r9,,ParamToken,ParamToken_DK,,,,"6000",,,UCH,,,token for parameter managment
r9,,expertlevel_ReturnTemp,Rücklauftemperatur,,,,"6B00",,,tempsensor,,,Externer Rücklauftemperatursensor
r9,,FloorHeatingContact,Anlegethermostat,,,,"7000",,,onoff,,,Eingang Anlegethermostat
r9,,Templimiter,Temperaturbegrenzer,,,,"7700",,,UCH,240=off;15=on,,Rückmeldung des Temperaturbegrenzer Signals
r9,,EbusVoltage,eBUS Spannung,,,,"7F00",,,onoff,,,Rückmeldung der eBUS Spannung
r9,,FluegasvalveOpen,Abgasklappe offen,,,,"8900",,,onoff,,,Rückmeldung Flüssiggasventil
r9,,Testbyte,Testbyte_DK,,,,"9900",,,UCH,,,Testbyte (relevant for the Tester)
r9,,DSN,DSN,,,,"9A00",,,UIN,,,DSN: Device Specific number
r9,,TargetFanSpeedOutput,Lüfter Solldrehzahl,,,,"9F00",,,UIN,,1/min,Lüfterdrehzahl
r1,,PowerValue,Leistungsdaten,,,,"AA00",,,HEX:6,,,Geräteleistung (min und max)
r9,,Statenumber,Statenumber_DK,,,,"AB00",,,UCH,,,status number
r9,,WaterpressureBranchControlOff,Drucksprungerkennung ausschalten,,,,"AF00",,,onoff,,,Überwachung der Druckänderung beim Schalten der Pumpe kann hiermit aktiviert oder deaktiviert werden
r9,,DSNStart,DSN Startadresse,,,,"3104",,,UIN,,,DSN Startadresse
r9,,ExtStorageModulCon,VR65 angeschlossen,,,,"BF00",,,yesno,,,Externes Speichermodul (VR65) angeschlosssen
r9,,PartnumberBox,Partnumber_Box,,,,"C000",,,HEX:5,,,part number of the eBox
r9,,WPSecondStage,WP_SecondStage_DK,,,,"ED00",,,onoff,,,Second stage of the pump activated
r9,,TemplimiterWithNTC,SD_STL_with_NTC,,,,"D200",,,UCH,240=no;15=yes,,Temperaturbegrenzer Art:1 = NTC0 = Schaltkontakt
r9,,VolatileLockoutIFCGV,SD_VolatileLockout_IFC_GV_DK,,,,"D300",,,UCH,240=no;15=yes,,Alle IFC Fehler sind nichtflüchtig
r9,,VortexFlowSensor,VortexFlowSensor_DK,,,,"D500",,,UIN,,,"Predictive Maintenance data, CH water flow"
r9,,DisplayMode,DisplayMode_DK,,,,"DA00",,,UCH,,,Display mode of the aplliance
r9,,Gasvalve3UC,Gasventil 3,,,,"DB00",,,UCH,240=off;15=on,,Gasventil Schaltsignal (vom Prozessor)
r9,,InitialisationEEPROM,InitialisationEEPROM_DK,,,,"DC00",,,yesno,,,EEPROM Initialisierrung (für die Produktion)
r9,,TimerInputHc,Eingang Schaltuhr,,,,"DE00",,,onoff,,,timer input (block heatdemand)
r9,,FanMinSpeedOperation,Min. Lüfterdrehzahl,,,,"DF00",,,UIN,,1/min,Lüfter Minimaldrehzahl
r9,,FanMaxSpeedOperation,Max. Lüfterdrehzahl,,,,"E000",,,UIN,,1/min,Lüfter Maximaldrehzahl
r9,,ExternGasvalve,Ext. Gasventil,,,,"E400",,,onoff,,,Externes Magnetventil
r9,,DCFTimeDate,DCF Datum/Uhrzeit,,,,"E500",,,btime;bdate,,,DCF Time / date stamp struct { uchar sec; uchar min; uchar std; uchar tag; uchar mon; uchar wtg; uchar jah; } Tdcf77_time;
r9,,FlowSetPotmeter,Vorlaufsollwert Poti,,,,"1900",,,temp,,,Vorlaufsollwert Potentiometer
r9,,HwcSetPotmeter,WW Sollwert Potentiometer,,,,"F103",,,temp,,,WW Sollwertpotentiometer
r9,,HwcSwitch,Wasserschalter,,,,"F303",,,onoff,,,WW aus/ein
r9,,ProductionByte,ProductionByte,,,,"3E04",,,UCH,,,
r9,,SerialNumber,SerialNumber,,,,"3F04",,,HEX:8,,,Seriennummer AI
# ##### Diagnose Ebene 2 #####,,,,,,,,,,,,,
r9;wi,,PumpspeedDesired,d.14 PumpspeedSetpoint,,,,"A100",,,percent0,,,PWM pump speed
r2;wi,,ReturnRegulation,d.17 Rücklaufregelung,,,,"B300",,,onoff,,,Aktivierung der Rücklaufregelung
r2;wi,,HcPumpMode,d.18 Pumpenbetriebsart,,,,"4904",,,UCH,0=post run;1=comfort;3=eco,,Pumpenbetriebsart für den Heizbetrieb
r9;wi,,SecondPumpMode,d.19 Betriebsart 2. Pumpe,,,,"0B04",,,UCH,,,Betriebsart 2stufige Pumpe:0 : Brennerbetrieb = Stufe 2 / Vor-Nachlauf = Stufe 11: Brennerbetrieb + Vorlauf = Stufe 1 / Warmwasser = Stufe 22 : Wie 1 aber im Heizbetrieb hängt die Stufe von der Teillast ab (default)3 : Immer Stufe 2
r9;wi,,HwcTempMax,d.20 Max. WW Temperatur,,,,"4304",,,temp,,,Max. Speichersollwert. Begrenzt den max. Einstellbereich des Potentiometers (Rechtsanschlag).
r9;wi,,AccessoriesOne,d.27 Zubehörrelais 1,,,,"4B04",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 1
r9;wi,,AccessoriesTwo,d.28 Zubehörrelais 2,,,,"4C04",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 2
r9;wi,,FanSpeedOffsetMin,d.50 Offet min. Lüfterdrehzahl,,,,"2404",,,SIN,,1/min,Offset min. Drehzahl
r9;wi,,FanSpeedOffsetMax,d.51 Offset max. Lüfterdrehzahl,,,,"2504",,,SIN,,1/min,Offset max. Drehzahl
r9;wi,,SolPostHeat,d.58 Solarbetriebsart,,,,"7304",,,UCH,,,Spezielle WW Funktionen:0 = Solarfunktion deaktiviert (default)1 = Solarfunktion aktiviert und WW Sollwert minimal 60°C2 = Solarfunktion aktiviert und WW Sollwert min. 35°C3 = WW Sollwert minimum 60°C
r9,,DeactivationsTemplimiter,d.60 STB Abschaltungen,,,,"2000",,,UCH,,,Anzahl der Abschaltungen durch den Sicherheitstemperaturbgrenzers
r9,,DeactivationsIFC,d.61 Anzahl Zündfehler,,,,"1F00",,,UCH,,,Anzahl der Zündfehler (nicht erfolgreiche Züdung im letzten Versuch oder fehlerhaftes Flammensignal)
r9,,averageIgnitiontime,d.64 Mittlere Zündzeit,,,,"2D00",,,UCH,10,s,Mittlere Zündzeit
r9,,maxIgnitiontime,d.65 Max. Zündzeit,,,,"2C00",,,UCH,10,s,Maximale Zündzeit
r9,,CounterStartattempts1,d.68 Zündfehler 1. Versuch,,,,"6E00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 1. Versuch)
r9,,CounterStartattempts2,d.69 Zündfehler 2. Versuch,,,,"6F00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 2. Versuch)
r9;wi,,ValveMode,d.70 VUV Betriebsart,,,,"2A04",,,UCH,,,Betriebsart 3-Wegeventil:0 = normaler Modus1 = Mittenstellung2 = Permanent Heizbetrieb (keine Umschaltung in den WW Betrieb)
r9;wi,,FlowsetHcMax,d.71 Max. Vorlauftemp. Heizbetrieb,,,,"0E04",,,temp,,,Einstellung des maximalen Vorlaufsollwert im Heizbetrieb (bei Linksanschlag des Poti)
r9;wi,,HwcPostrunTime,d.72 WW Pumpnenachlaufzeit,,,,"1104",,,UCH,-10,s,Pumpennachlaufzeit nach Speicherladung
r9;wi,,WarmstartOffset,d.73 Warmstart Offset,,,,"1004",,,temp,,,Offset für Warmstartsollwert (nur bei VCW)
r9;wi,,StorageLoadTimeMax,d.75 Max. Speicherladezeit,,,,"1204",,,minutes0,,,Max. Speicherladezeit für Speicher ohne eigene Regelung
r2;wi,,PartloadHwcKW,d.77 Speicherteillast,,,,"B100",,,power,,,Teillast für Speicherladung (Geräteleistung kann auf den angegebenen Wert limitiert werden)
r9;wi,,FlowsetHwcMax,d.78 Max. Vorlauftemp. WW,,,,"0F04",,,temp,,,Maximal erlaubte Vorlauftemperatur für die Speicherladung
r9,,HcHours,d.80 Hz. Betriebsstunden,,,,"2800",,,hoursum2,,,Betriebsstunden im Heizbetrieb
r9,,HwcHours,d.81 Betriebsstunden WW,,,,"2200",,,hoursum2,,,Betriebsstunden Brauchwasser
r9,,HcStarts,d.82 Schaltspiele Heizbetrieb,,,,"2900",,,UIN,-100,,Schaltspiele Heizbetrieb
r9,,HwcStarts,d.83 Schaltspiele BW Betrieb,,,,"2300",,,UIN,-100,,Schaltspiele WW Betrieb
r9;wi,,HoursTillService,d.84 Stunden bis Wartung,,,,"AC00",,,hoursum2,,,Wartungsintervall:Anzahl der Stunden bis zur nächsten Wartung
r9;ws,,DSNOffset,d.93 Gerätekennung,,,,"3004",,,UCH,,,Gerätekennung (DSN)
r9;wi,,SetFactoryValues,d.96 Werkseinstellungen,,,,"6804",,,yesno,,,Werkseinstellungen
# ##### Wartungsdaten #####,,,,,,,,,,,,,
r9,,TempGradientFailure,Gradientenfehler,,,,"1100",,,temp0,,,Anzahl der Boilerabschaltung wegen zu hohem Gradient (S.54)
r9,,TempDiffBlock,TempDiffBlock_DK,,,,"1200",,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r9,,TempDiffFailure,TempDiffFailure_DK,,,,"1300",,,temp0,,,Anzahl der Abschaltungen wegen zu hoher / fehlerhafter Differenz von Vor- und Rücklauftemperatur
r9,,PumpHours,Betriebsstunden Pumpe,,,,"1400",,,hoursum2,,,Pumpenbetriebsstunden
r9,,HcPumpStarts,CH_PumpCommunt_DK,,,,"1500",,,cntstarts2,,,Schaltspiele Pumpe
r9,,ValveStarts,3WV Schaltspiele,,,,"1A00",,,cntstarts2,,,Anzahl der 3WV Umschaltungen
r9,,FanHours,Betriebsstunden Lüfter,,,,"1B00",,,hoursum2,,,Betriebsstunden des Lüfters
r9,,FanStarts,FanCommunt_DK,,,,"1C00",,,cntstarts2,,,Anzahl der Lüfterschaltspiele
r9,,OverflowCounter,Überlauf PM Zähler,,,,"1E00",,,yesno,,,Predictive Maintenance counter have got an overflow
r9,,TempMaxDiffExtTFT,MaxTempDiffExtTFT_DK,,,,"2700",,,temp,,,Predictive maintenance data
r9,,minIgnitiontime,Min. Zündzeit,,,,"2B00",,,UCH,10,s,Minimale Zündzeit
r9,,maintenancedata_HwcTempMax,Max. WW Temperatur,,,,"3500",,,temp,,,Maximaltemperatur gemessen am Brauchwasserauslaufsensor
r9,,StorageTempMax,Max. Speichertemp.,,,,"3600",,,temp,,,Maximaltemperatur gemessen am Speichersensor
r9,,FlowTempMax,Max. Vorlauftemperatur,,,,"3700",,,temp,,,Maximaltemperatur gemessen am Vorlaufsensor
r9,,FanPWMSum,Fan_PWM_Sum_DK,,,,"3A00",,,UIN,,,Predictive Maintenance data for the fan damage recognition
r9,,FanPWMTest,Fan_PWM_Test_DK,,,,"3B00",,,UCH,,,Predictive Maintenance data for the fan damage recognition
r9,,DeltaFlowReturnMax,MaxDeltaFlowReturn_DK,,,,"3D00",,,temp,,,Wartungsdaten
r9,,StorageLoadPumpHours,TankLoadPumpOperationHours_DK,,,,"4C00",,,hoursum2,,,Preditive maintenance data
r9,,StorageloadPumpStarts,TankloadPumpCommunt_DK,,,,"4F00",,,cntstarts2,,,Preditive maintenance data
r9,,HwcWaterflowMax,Max. WW Vorlauftemp.,,,,"5600",,,uin100,,,Maximalwert des Warmwassersensors
r9,,CounterStartAttempts3,Zündfehler 3. Versuch,,,,"8100",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 3. Versuch)
r9,,CounterStartAttempts4,Zündfehler 4. Versuch,,,,"8200",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 4. Versuch)
r9,,ReturnTempMax,Max. Rücklauftemperatur,,,,"BE00",,,temp,,,Max. Rücklauftemperatur
r9,,PumpHwcFlowSum,PumpDHWFlowSum_DK,,,,"C100",,,UIN,,,summed up DHW flow rate
r9,,PumpHwcFlowNumber,PumpDHWFlowNumber_DK,,,,"C200",,,UCH,,,number of times DHW flow rate was detected
r9,,SHEMaxFlowTemp,Max. WW Vorlauftemp.,,,,"C300",,,temp,,,Max. Vorlauftemperatur für WW
r9,,SHEMaxDeltaHwcFlow,SHE_MaxDeltaFlowDHW_DK,,,,"C400",,,temp,,,maximum difference between flow and DHW outlet temperature
r9,,PrEnergySumHwc1,PrEnergySumDHW1_DK,,,,"C500",,,ULG,,,Wartungsdaten
r9,,PrEnergyCountHwc1,PrEnergyCountDHW1_DK,,,,"C600",,,ULG,,,Wartungsdaten
r9,,PrEnergySumHwc2,PrEnergySumDHW2_DK,,,,"C700",,,ULG,,,Wartungsdaten
r9,,PrEnergyCountHwc2,PrEnergyCountDHW2_DK,,,,"C800",,,ULG,,,Wartungsdaten
r9,,PrEnergySumHwc3,PrEnergySumDHW3_DK,,,,"C900",,,ULG,,,Wartungsdaten
r9,,PrEnergyCountHwc3,PrEnergyCountDHW3_DK,,,,"CA00",,,ULG,,,Wartungsdaten
r9,,WaterHcFlowMax,MaxWaterFlowCH_DK,,,,"D000",,,UIN,,,Wartungsdaten
r9,,WaterpressureVariantSum,WaterpressureVariantSum_DK,,,,"F000",,,pressm2,,,Wartungsdaten
r9,,WaterpressureMeasureCounter,WaterpressureMeasureCounter_DK,,,,"F100",,,UCH,,,Wartungsdaten
r9,,PrAPSCounter,PrAPSCounter_DK,,,,"F200",,,UCH,,,Wartungsdaten
r9,,PrAPSSum,PrAPSSum_DK,,,,"F300",,,seconds2,,,Wartungsdaten
r9,,PrVortexFlowSensorValue,PrVortexFlowSensorValue_DK,,,,"F400",,,SIN,,ADC,Wartungsdaten
r9,,PrEnergySumHc1,PrEnergySumCH1_DK,,,,"F500",,,ULG,,,Wartungsdaten
r9,,PrEnergyCountHc1,PrEnergyCountCH1_DK,,,,"F600",,,ULG,,,Wartungsdaten
r9,,PrEnergySumHc2,PrEnergySumCH2_DK,,,,"F700",,,ULG,,,Wartungsdaten
r9,,PrEnergyCountHc2,PrEnergyCountCH2_DK,,,,"F800",,,ULG,,,Wartungsdaten
r9,,PrEnergySumHc3,PrEnergySumCH3_DK,,,,"F900",,,ULG,,,Wartungsdaten
r9,,PrEnergyCountHc3,PrEnergyCountCH3_DK,,,,"FA00",,,ULG,,,Wartungsdaten
!include,errors.inc,,,,,,,,,,,,
