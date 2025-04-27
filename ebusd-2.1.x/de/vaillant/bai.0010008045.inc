# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,Panther,25KOV v.19,,,,,,,,,,
*r,,,,,,B509,0D,,,,,,
*w,,,,,,B509,0E,,,,,,
*wi,#install,,,,,B509,0E,,,,,,
*ws,#service,,,,,B509,0E,,,,,,
*[SW],scan,,,SW,,,,,,,,,
# ##### dia level 1 #####,,,,,,,,,,,,,
r;wi,,PartloadHcKW,d.00 Heizungsteillast,,,,6C00,,,power,,,Heizungsteillast
r;wi,,WPPostrunTime,d.01 Pumpennachlaufzeit,,,,6400,,,minutes0,,,Wasserpumpennachlaufzeit nach Heizbetrieb
r;wi,,BlockTimeHcMax,d.02 Maximale Brennersperrzeit,,,,2100,,,minutes0,,,Max. Brennersperrzeit bei einem Vorlaufsollwert von 20°C
r,,HwcTemp,d.03 WW Vorlaufsolltemp,,,,0100,,,temp,,,Vorlauftemperatur bei Warmwasserzapfung (nur bei Kombi-Heizgeräten)
r,,StorageTemp,d.04 Speicheristtemp,,,,1700,,,tempsensor,,,current temperature for warm start sensor (combination boiler only) Current storage tank sensor (system boiler only)
r,,ACRoomthermostat,d.08 Raumthermostat,,,,2A00,,,onoff,,,Status des extrenen Raumthermostat an Klemme 3/3
r,,ExtFlowTempDesiredMin,d.09 Min. ext. Vorlaufsollwert,,,,3900,,,temp,,,minimum out of Kl.7 and eBus flow setpoint
r,,WP,d.10 Wasserpumpe,,,,4400,,,onoff,,,Interne Heizungspumpe
r,,extWP,d.11 ext. Heizungspumpe,,,,3F00,,,onoff,,,Externe Heizungspumpe
r,,CirPump,d.13 Zirkulationspumpe,,,,7B00,,,onoff,,,Status Zirkulationspumpe (über ein externes Modul ansteuerbar)
r,,DCRoomthermostat,d.16 Raumthermostat,,,,0E00,,,onoff,,,Wärmeanforderung vom externen Regler
#r,,Warmstart,d.21 Warmstartfunktion,,,,5B00,,,onoff,,,"Warmstart-Funktion: Dieser Parameter zeigt an, ob die Funktion aktiviert und erlaubt ist"
r,,HwcDemand,d.22 WW Anforderung,,,,5800,,,yesno,,,Brauchwasseranforderung (Zapfung oder Schaltsignal vom Speicher)
r,,HeatingDemand,d.23 Winterbetrieb,,,,4000,,,yesno,,,Wintermodus aktiv (Heizbetrieb und Warmwasser)
r,,StoragereleaseClock,d.25 Speicherfreigabe,,,,7100,,,yesno,,,Freigabe der Speichrladung oder des Warmstartspeichers durcheinen eBUS Regler
r,,PrimaryCircuitFlowRate,d.29 PrimaryCircuitFlowrate_DK,,,,FB00,,,uin100,,,value of flowrate
r,,Gasvalve,d.30 Gasventil,,,,BB00,,,UCH,240=off;15=on,,GMV Ansteuersignal
r,,PositionValveSet,d.35 Position VUV,,,,5400,,,UCH,,,Position des 3-Wege Ventil: 100=Warmwasser 0=Heizbetrieb 40=Mittenstellung
r,,HwcWaterflow,d.36 Zapfmenge,,,,5500,,,uin100,,,WW Durchflussensor
r,,FlowTemp,d.40 Vorlauftemperatur,,,,1800,,,tempsensor,,,Vorlauftemperatur
r,,ReturnTemp,d.41 Rücklauftemperatur,,,,9800,,,tempmirrorsensor,,,Rücklauftemperatur
r,,IonisationVoltageLevel,d.44 Spannungspegel Ionisationssignal,,,,A400,,,SIN,10,,Ionisationsspannung: größer 80 = keine Flammekleiner 40 = gutes Flammensignal
r,,OutdoorstempSensor,d.47 Außentemperaturfühler,,,,7600,,,tempsensor,,,Außentemperaturwert (ohne Korrekturwert) und Sensorstatus
r;wi,,NighttimeOffset,d.62 Nachtverschiebung,,,,3F04,,,IGN:7;UCH,,,"Nachtverschiebung (Spezifische Funktion für Belgien und NL: RT stoppt den Brenner nicht, sondern ändert den Sollwert. Nicht in anderen Ländern verwenden)"
r,,RemainingBoilerblocktime,d.67 Verbleibende Brennersperrzeit,,,,3800,,,minutes0,,,Verbleibende Brennersperrzeit
r,,EBusHeatcontrol,d.90 Digitaler Regler,,,,7400,,,yesno,,,Gibt an ob ein digitaler Regler erkannt wurde
# ##### dia level 2 #####,,,,,,,,,,,,,
r;ws,,ReturnRegulation,d.17 Rücklaufregelung,,,,B300,,,onoff,,,Aktivierung der Rücklaufregelung
r;wi,,HcPumpMode,d.18 Pumpenbetriebsart,,,,B700,,,UCH,0=post run;1=permanent;2=winter,,"Pump mode: 0=post run, 1=continous, 2=Winter, 3=intermittend"
r;wi,,SecondPumpMode,d.19 Modus der 2-stufigen Pumpe,,,,A000,,,UCH,,,"Betriebsart der zweistufigen Heizungspumpe0: Brennerbetrieb = 2, Vor-/Nachlauf = 1; 1: ZH + Nachlauf = 1, Warmwasser = 2, 2: wie 1, jedoch Drehzahl in ZH abhängig von Heizteillast, (Werkseinstellung)3: immer Stufe 1"
r;wi,,HwcTempMax,d.20 Max. WW Temperatur,,,,D900,,,temp,,,Max. Speichersollwert. Begrenzt den max. Einstellbereich des Potentiometers (Rechtsanschlag).
r,,AircontrolOk,d.24 SD_AircontrolOk_DK,,,,0300,,,UCH,240=off;15=on,,Luftdruckschalter
r;wi,,AccessoriesOne,d.27 Zubehörrelais 0,,,,B900,,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 1
r;wi,,AccessoriesTwo,d.28 Zubehörrelais 1,,,,BA00,,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 2
r;ws,,GasvalveMinPowPos,d.52 Offset für minimale Schrittmotorposition,,,,E900,,,UCH,,,Pmin-Einstellung . Zur Anpassung siehe Gasumwandlung
r;ws,,GasvalveMaxPowPos,d.53 Offset für maximale Schrittmotorposition,,,,EA00,,,SCH,,,Pmax-Einstellung . Zur Anpassung siehe Gasumwandlung
r,,DeactivationsTemplimiter,d.60 STB Abschaltungen,,,,2000,,,UCH,,,Anzahl der Abschaltungen durch den Sicherheitstemperaturbgrenzers
r,,DeactivationsIFC,d.61 Anzahl Zündfehler,,,,1F00,,,UCH,,,Anzahl der Zündfehler (nicht erfolgreiche Zödung im letzten Versuch oder fehlerhaftes Flammensignal)
r,,averageIgnitiontime,d.64 Mittlere Zündzeit,,,,2D00,,,UCH,10,s,Mittlere Zündzeit
r,,maxIgnitiontime,d.65 Max. Zündzeit,,,,2C00,,,UCH,10,s,Maximale Zündzeit
r;ws,,WarmstartEnable,d.66 Warmstart aktivieren,,,,5B00,,,onoff,,,1 = Warmstart aktiviert 1 = Warmstart deaktiviert
r,,CounterStartattempts1,d.68 Zündfehler 1. Versuch,,,,6E00,,,temp0,,,Anzahl der erfolglosen Zündversuche (im 1. Versuch)
r,,CounterStartattempts2,d.69 Zündfehler 2. Versuch,,,,6F00,,,temp0,,,Anzahl der erfolglosen Zündversuche (im 2. Versuch)
r;wi,,FlowsetHcMax,d.71 Max. Vorlauftemp. Heizbetrieb,,,,A500,,,temp,,,Einstellung des maximalen Vorlaufsollwert im Heizbetrieb (bei Linksanschlag des Poti)
r,,HcHours,d.80 Hz. Betriebsstunden,,,,2800,,,hoursum2,,,Betriebsstunden im Heizbetrieb
r,,HwcHours,d.81 Betriebsstunden WW,,,,2200,,,hoursum2,,,Betriebsstunden Brauchwasser
r,,HcStarts,d.82 Schaltspiele Heizbetrieb,,,,2900,,,UIN,-100,,Schaltspiele Heizbetrieb
r,,HwcStarts,d.83 Schaltspiele BW Betrieb,,,,2300,,,UIN,-100,,Schaltspiele WW Betrieb
r;wi,,AntiCondensValue,d.85 Minimale Leistung zur Vermeidung von Kondensation,,,,EC00,,,power,,,Minimale Leistung zur Vermeidung von Kondensation
r;wi,,SpecialAdj,d.88 Sonderanpassung,,,,EB00,,,UCH,,,"Einschaltschwelle zur Erkennung der Wasserentnahme 0 = 1,5 l/min und keine Verzögerung, 1 = 3,7 l/min und 2s Verzögerung"
r;ws,,DSNOffset,d.93 Gerätekennung,,,,3004,,,UCH,,,Gerätekennung (DSN)
r;ws,,SetFactoryValues,d.96 Werkseinstellungen,,,,6804,,,yesno,,,Werkseinstellungen
# ##### maintenance data #####,,,,,,,,,,,,,
r,,TempGradientFailure,Gradientenfehler,,,,1100,,,temp0,,,Anzahl der Boilerabschaltung wegen zu hohem Gradient (S.54)
r,,TempDiffBlock,TempDiffBlock_DK,,,,1200,,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r,,TempDiffFailure,TempDiffFailure_DK,,,,1300,,,temp0,,,Anzahl der Abschaltungen wegen zu hoher / fehlerhafter Differenz von Vor- und Rücklauftemperatur
r,,PumpHours,Betriebsstunden Pumpe,,,,1400,,,hoursum2,,,Pumpenbetriebsstunden
r,,HcPumpStarts,CH_PumpCommunt_DK,,,,1500,,,cntstarts2,,,Schaltspiele Pumpe
r,,ValveStarts,3WV Schaltspiele,,,,1A00,,,cntstarts2,,,Anzahl der 3WV Umschaltungen
r,,FanHours,Betriebsstunden Lüfter,,,,1B00,,,hoursum2,,,Betriebsstunden des Lüfters
r,,FanStarts,FanCommunt_DK,,,,1C00,,,cntstarts2,,,Anzahl der Lüfterschaltspiele
r,,OverflowCounter,Überlauf PM Zähler,,,,1E00,,,yesno,,,Predictive Maintenance counter have got an overflow
r,,TempMaxDiffExtTFT,MaxTempDiffExtTFT_DK,,,,2700,,,temp,,,Predictive maintenance data
r,,minIgnitiontime,Min. Zündzeit,,,,2B00,,,UCH,10,s,Minimale Zündzeit
r,,maintenancedata_HwcTempMax,Max. WW Temperatur,,,,3500,,,temp,,,Maximaltemperatur gemessen am Brauchwasserauslaufsensor
r,,StorageTempMax,Max. Speichertemp.,,,,3600,,,temp,,,Maximaltemperatur gemessen am Speichersensor
r,,FlowTempMax,Max. Vorlauftemperatur,,,,3700,,,temp,,,Maximaltemperatur gemessen am Vorlaufsensor
r,,FanPWMSum,Fan_PWM_Sum_DK,,,,3A00,,,UIN,,,Predictive Maintenance data for the fan damage recognition
r,,FanPWMTest,Fan_PWM_Test_DK,,,,3B00,,,UCH,,,Predictive Maintenance data for the fan damage recognition
r,,DeltaFlowReturnMax,MaxDeltaFlowReturn_DK,,,,3D00,,,temp,,,Wartungsdaten
r,,StorageLoadPumpHours,TankLoadPumpOperationHours_DK,,,,4C00,,,hoursum2,,,Preditive maintenance data
r,,StorageloadPumpStarts,TankloadPumpCommunt_DK,,,,4F00,,,cntstarts2,,,Preditive maintenance data
r,,HwcWaterflowMax,Max. WW Vorlauftemp.,,,,5600,,,uin100,,,Maximalwert des Warmwassersensors
r,,CounterStartAttempts3,Zündfehler 3. Versuch,,,,8100,,,temp0,,,Anzahl der erfolglosen Zündversuche (im 3. Versuch)
r,,CounterStartAttempts4,Zündfehler 4. Versuch,,,,8200,,,temp0,,,Anzahl der erfolglosen Zündversuche (im 4. Versuch)
r,,ReturnTempMax,Max. Rücklauftemperatur,,,,BE00,,,temp,,,Max. Rücklauftemperatur
r,,PumpHwcFlowSum,PumpDHWFlowSum_DK,,,,C100,,,UIN,,,summed up DHW flow rate
r,,PumpHwcFlowNumber,PumpDHWFlowNumber_DK,,,,C200,,,UCH,,,number of times DHW flow rate was detected
r,,SHEMaxFlowTemp,Max. WW Vorlauftemp.,,,,C300,,,temp,,,Max. Vorlauftemperatur für WW
r,,SHEMaxDeltaHwcFlow,SHE_MaxDeltaFlowDHW_DK,,,,C400,,,temp,,,maximum difference between flow and DHW outlet temperature
r;wi,,PrEnergySumHwc1,PrEnergySumDHW1_DK,,,,C500,,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc1,PrEnergyCountDHW1_DK,,,,C600,,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHwc2,PrEnergySumDHW2_DK,,,,C700,,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc2,PrEnergyCountDHW2_DK,,,,C800,,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHwc3,PrEnergySumDHW3_DK,,,,C900,,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc3,PrEnergyCountDHW3_DK,,,,CA00,,,ULG,,,Wartungsdaten
r,,WaterHcFlowMax,MaxWaterFlowCH_DK,,,,D000,,,UIN,,,Wartungsdaten
r,,WaterpressureVariantSum,WaterpressureVariantSum_DK,,,,F000,,,pressm2,,,Wartungsdaten
r,,WaterpressureMeasureCounter,WaterpressureMeasureCounter_DK,,,,F100,,,UCH,,,Wartungsdaten
r,,PrAPSCounter,PrAPSCounter_DK,,,,F200,,,UCH,,,Wartungsdaten
r,,PrAPSSum,PrAPSSum_DK,,,,F300,,,seconds2,,,Wartungsdaten
r,,PrVortexFlowSensorValue,PrVortexFlowSensorValue_DK,,,,F400,,,SIN,,ADC,Wartungsdaten
r;wi,,PrEnergySumHc1,PrEnergySumCH1_DK,,,,F500,,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHc1,PrEnergyCountCH1_DK,,,,F600,,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHc2,PrEnergySumCH2_DK,,,,F700,,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHc2,PrEnergyCountCH2_DK,,,,F800,,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHc3,PrEnergySumCH3_DK,,,,F900,,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHc3,PrEnergyCountCH3_DK,,,,FA00,,,ULG,,,Wartungsdaten
# ##### expert level #####,,,,,,,,,,,,,
r,,externalFlowTempDesired,externer Durchflusssollwert,,,,2500,,,temp,,,Vorlaufsolltemperatur vom externen Regler zu Klemme 7-8-8
r,,externalHwcSwitch,externe Warmwasserschaltung,,,,0000,,,onoff,,,Externen Tank anfordern (über Kontakt)
r,,WaterPressure,Wasserdruck,,,,0200,,,presssensor,,,value of waterpressure-sensor
r,,Flame,Flammensignal,,,,0500,,,UCH,240=off;15=on,,Flammensignal
r,,ChangesDSN,Anzhl der DSN Änderungen,,,,0C00,,,UCH,,,Anzahl der DSN (Gerätekennung) Änderungen
r,,GasvalveUC,Gasventil,,,,0D00,,,UCH,240=off;15=on,,Schaltsignal für das Gasventil
r,,VolatileLockout,Verriegelnde Störabschaltungen,,,,1000,,,UCH,240=no;15=yes,,WAHR: STB Fehler sind verriegelnd
r,,ModulationTempDesired,Modulationssollwert,,,,2E00,,,SIN,10,%,Modulationssollwert
r,,FlameSensingASIC,SD_Flame_Sensing_ASIC_DK,,,,2F00,,,UIN,,,Ioni/ADC Wert vom Flammenwächter
r,,HcUnderHundredStarts,HZ_UnderHundred_SwiActi_DK,,,,3000,,,UCH,,,Heat switch cycles under hundred
r,,HwcUnderHundredStarts,BW_UnderHundred_SwiActi_DK,,,,3100,,,UCH,,,DHW switch cycles under hundred
r,,EbusSourceOn,eBUS Spannungsversorgung,,,,3400,,,onoff,,,Aktivierung der eBUS Speisung
r,,Fluegasvalve,Abgasklappe,,,,3C00,,,onoff,,,Flüssiggas Magnetventil
r,,ExternalFaultmessage,Ext. Störmeldung,,,,3E00,,,onoff,,,Signal für die externe Störmeldeeinrichtung
r,,GasvalveASICFeedback,Rückmeldung Gasventil,,,,4700,,,UCH,240=off;15=on,,Rückmeldung Gasventil vom ASIC
r,,GasvalveUCFeedback,Rückmeldung Gasventil,,,,4800,,,UCH,240=off;15=on,,Rückmeldung Gasventil vom Prozessor
r,,Ignitor,Zünder,,,,4900,,,UCH,240=off;15=on,,Zündung aktiviert
r,,HwcTypes,WW Typen,,,,4B00,,,UCH,,,DHW type of the appliance
r,,HwcImpellorSwitch,Brauchwasserzapfung,,,,5700,,,yesno,,,WW Zapfung
r,,WarmstartDemand,Warmstartanforderung,,,,3A04,,,yesno,,,Warmstartaktivierung
r,,BoilerType,BoilerType_DK,,,,5E00,,,UCH,,,Boiler typ of the bmu
r,,ParamToken,ParamToken_DK,,,,6000,,,UCH,,,token for parameter managment
r,,expertlevel_ReturnTemp,Rücklauftemperatur,,,,6B00,,,tempsensor,,,Externer Rücklauftemperatursensor
r,,FloorHeatingContact,Anlegethermostat,,,,7000,,,onoff,,,Eingang Anlegethermostat
r,,Templimiter,Temperaturbegrenzer,,,,7700,,,UCH,240=off;15=on,,Rückmeldung des Temperaturbegrenzer Signals
r,,EbusVoltage,eBUS Spannung,,,,7F00,,,onoff,,,Rückmeldung der eBUS Spannung
r,,FluegasvalveOpen,Abgasklappe offen,,,,8900,,,onoff,,,Rückmeldung Flüssiggasventil
r,,Testbyte,Testbyte_DK,,,,9900,,,UCH,,,Testbyte (relevant for the Tester)
r,,DSN,DSN,,,,9A00,,,UIN,,,DSN: Device Specific number
r,,TargetFanSpeedOutput,Lüfter Solldrehzahl,,,,9F00,,,UIN,,1/min,Lüfterdrehzahl
r,,PowerValue,Leistungsdaten,,,,AA00,,,HEX:6,,,Geräteleistung (min und max)
r,,Statenumber,Statenumber_DK,,,,AB00,,,UCH,,,status number
r,,WaterpressureBranchControlOff,Drucksprungerkennung ausschalten,,,,AF00,,,onoff,,,Überwachung der Druckänderung beim Schalten der Pumpe kann hiermit aktiviert oder deaktiviert werden
r,,DSNStart,DSN Startadresse,,,,3104,,,UIN,,,DSN Startadresse
r,,ExtStorageModulCon,VR65 angeschlossen,,,,BF00,,,yesno,,,Externes Speichermodul (VR65) angeschlosssen
r,,PartnumberBox,Partnumber_Box,,,,C000,,,HEX:5,,,part number of the eBox
r,,WPSecondStage,WP_SecondStage_DK,,,,ED00,,,onoff,,,Second stage of the pump activated
r,,TemplimiterWithNTC,SD_STL_with_NTC,,,,D200,,,UCH,240=no;15=yes,,Temperaturbegrenzer Art:1 = NTC0 = Schaltkontakt
r,,VolatileLockoutIFCGV,SD_VolatileLockout_IFC_GV_DK,,,,D300,,,UCH,240=no;15=yes,,Alle IFC Fehler sind nichtflüchtig
r,,VortexFlowSensor,VortexFlowSensor_DK,,,,D500,,,UIN,,,"Predictive Maintenance data, CH water flow"
r,,DisplayMode,DisplayMode_DK,,,,DA00,,,UCH,,,Display mode of the appliance
r,,Gasvalve3UC,Gasventil 2,,,,DB00,,,UCH,240=off;15=on,,Gasventil Schaltsignal (vom Prozessor)
r,,InitialisationEEPROM,InitialisationEEPROM_DK,,,,DC00,,,yesno,,,EEPROM Initialisierrung (für die Produktion)
r,,TimerInputHc,Eingang Schaltuhr,,,,DE00,,,onoff,,,timer input (block heatdemand)
r,,FanMinSpeedOperation,Min. Lüfterdrehzahl,,,,DF00,,,UIN,,1/min,Lüfter Minimaldrehzahl
r,,FanMaxSpeedOperation,Max. Lüfterdrehzahl,,,,E000,,,UIN,,1/min,Lüfter Maximaldrehzahl
r,,ExternGasvalve,Ext. Gasventil,,,,E400,,,onoff,,,Externes Magnetventil
r,,DCFTimeDate,DCF Datum/Uhrzeit,,,,E500,,,HEX:8,,,DCF Time / date stamp struct { uchar sec; uchar min; uchar std; uchar tag; uchar mon; uchar wtg; uchar jah; } Tdcf77_time;
r;w,,FlowSetPotmeter,Vorlaufsollwert Poti,,,,F003,,,temp,,,Vorlaufsollwert Potentiometer
r;w,,HwcSetPotmeter,WW Sollwert Potentiometer,,,,F103,,,temp,,,WW Sollwertpotentiometer
r;w,,HeatingSwitch,d.23 Winterbetrieb,,,,F203,,,onoff,,,Wintermodus aktiv (Heizbetrieb und Warmwasser)
r;w,,HwcSwitch,Warmwasserschalter,,,,F303,,,onoff,,,Warmwasser ein/aus
r,,ProductionByte,ProductionByte,,,,3E04,,,UCH,,,
!include,errors.inc,,,,,,,,,,,,
