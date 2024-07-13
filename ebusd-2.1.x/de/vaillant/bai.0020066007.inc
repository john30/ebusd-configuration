# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,zeoTHERM (BMU),0020066007 187,,,,,,,,,,
*r,,,,,,"B509","0D",,,,,,
*w,,,,,,"B509","0E",,,,,,
*wi,#install,,,,,"B509","0E",,,,,,
*ws,#service,,,,,"B509","0E",,,,,,
# ##### Diagnose Ebene 1 #####,,,,,,,,,,,,,
r,,T3TempDesired,d.05 T3_Setpoint,,,,"3900",,,temp,,,Sollwert PWT-Ausgang
r,,ThermostatkontaktAnKl34,d.08 Wärmeanforderung Klemme 3-4,,,,"2A00",,,onoff,,,Status des extrenen Raumthermostat an Klemme 3/4
r,,Gasvalve,d.30 Gasventil,,,,"BB00",,,UCH,240=off;15=on,,GMV Ansteuersignal
r,,TargetFanSpeed,d.33 Lüfter Solldrehzahl,,,,"2400",,,UIN,,1/min,Drehzahlsollwert des Lüfters
r,,FanSpeed,d.34 Lüfteristdrehzahl,,,,"8300",,,UIN,,1/min,Aktuelle Lüfterdrehzahl
r,,PositionValveSet,d.35 Position VUV,,,,"5400",,,UCH,,,Position des 3-Wege Ventil: 100=Warmwasser 0=Heizbetrieb 40=Mittenstellung
r,,T3,d.40 T3,,,,"1800",,,tempsensor,,,PWT-Ausgangstemperatur
r,,T4,d.41 T4,,,,"9800",,,tempmirrorsensor,,,PWT-Eingangstemperatur
r,,IonisationVoltageLevel,d.44 Spannungspegel Ionisationssignal,,,,"A400",,,SIN,10,,Ionisationsspannung: größer 80 = keine Flammekleiner 40 = gutes Flammensignal
r;wi,,FanSpeedOffsetMin,d.50 Offet min. Lüfterdrehzahl,,,,"A700",,,SIN,,1/min,Offset min. Drehzahl
r;wi,,FanSpeedOffsetMax,d.51 Offset max. Lüfterdrehzahl,,,,"A800",,,SIN,,1/min,Offset max. Drehzahl
r,,DeactivationsTemplimiter,d.60 STB Abschaltungen,,,,"2000",,,UCH,,,Anzahl der Abschaltungen durch den Sicherheitstemperaturbgrenzers
r,,DeactivationsIFC,d.61 Anzahl Zündfehler,,,,"1F00",,,UCH,,,Anzahl der Zündfehler (nicht erfolgreiche Züdung im letzten Versuch oder fehlerhaftes Flammensignal)
r,,averageIgnitiontime,d.64 Mittlere Zündzeit,,,,"2D00",,,UCH,10,s,Mittlere Zündzeit
r,,maxIgnitiontime,d.65 Max. Zündzeit,,,,"2C00",,,UCH,10,s,Maximale Zündzeit
r,,CounterStartattempts1,d.68 Zündfehler 1. Versuch,,,,"6E00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 1. Versuch)
r,,CounterStartattempts2,d.69 Zündfehler 2. Versuch,,,,"6F00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 2. Versuch)
r;ws,,DSNOffset,d.93 Gerätekennung,,,,"B500",,,UCH,,,Gerätekennung (DSN)
# ##### Expertenebene #####,,,,,,,,,,,,,
r,,Flame,Flammensignal,,,,"0500",,,UCH,240=off;15=on,,Flammensignal
r,,ChangesDSN,Anzhl der DSN Änderungen,,,,"0C00",,,UCH,,,Anzahl der DSN (Gerätekennung) Änderungen
r,,GasvalveUC,Gasventil,,,,"0D00",,,UCH,240=off;15=on,,Schaltsignal für das Gasventil
r,,VolatileLockout,Verriegelnde Störabschaltungen,,,,"1000",,,UCH,240=no;15=yes,,WAHR: STB Fehler sind verriegelnd
r,,FlameSensingASIC,SD_Flame_Sensing_ASIC_DK,,,,"2F00",,,UIN,,,Ioni/ADC Wert vom Flammenwächter
r,,BoilerType,BoilerType_DK,,,,"5E00",,,UCH,,,Boiler typ of the bmu
r,,ReturnTemp,Rücklauftemperatur,,,,"6B00",,,tempsensor,,,Externer Rücklauftemperatursensor
r,,FloorHeatingContact,Anlegethermostat,,,,"7000",,,onoff,,,Eingang Anlegethermostat
r,,EbusVoltage,eBUS Spannung,,,,"7F00",,,onoff,,,Rückmeldung der eBUS Spannung
r,,FluegasvalveOpen,Abgasklappe offen,,,,"8900",,,onoff,,,Rückmeldung Flüssiggasventil
r,,Testbyte,Testbyte_DK,,,,"9900",,,UCH,,,Testbyte (relevant for the Tester)
r,,DSN,DSN,,,,"9A00",,,UIN,,,DSN: Device Specific number
r,,TargetFanSpeedOutput,Lüfter Solldrehzahl,,,,"9F00",,,UIN,,1/min,Lüfterdrehzahl
r,,PowerValue,Leistungsdaten,,,,"AA00",,,HEX:6,,,Geräteleistung (min und max)
r,,Statenumber,Statenumber_DK,,,,"AB00",,,UCH,,,status number
r,,DSNStart,DSN Startadresse,,,,"BC00",,,UIN,,,DSN Startadresse
r,,PartnumberBox,Partnumber_Box,,,,"C000",,,HEX:5,,,part number of the eBox
r,,TemplimiterWithNTC,SD_STL_with_NTC,,,,"D200",,,UCH,240=no;15=yes,,Temperaturbegrenzer Art:1 = NTC0 = Schaltkontakt
r,,VolatileLockoutIFCGV,SD_VolatileLockout_IFC_GV_DK,,,,"D300",,,UCH,240=no;15=yes,,Alle IFC Fehler sind nichtflüchtig
r,,Gasvalve3UC,Gasventil 3,,,,"DB00",,,UCH,240=off;15=on,,Gasventil Schaltsignal (vom Prozessor)
r,,InitialisationEEPROM,InitialisationEEPROM_DK,,,,"DC00",,,yesno,,,EEPROM Initialisierrung (für die Produktion)
r,,TimerInputHc,Eingang Schaltuhr,,,,"DE00",,,onoff,,,timer input (block heatdemand)
r,,FanMinSpeedOperation,Min. Lüfterdrehzahl,,,,"DF00",,,UIN,,1/min,Lüfter Minimaldrehzahl
r,,FanMaxSpeedOperation,Max. Lüfterdrehzahl,,,,"E000",,,UIN,,1/min,Lüfter Maximaldrehzahl
r,,FaultlistDK,Fehlerliste,,,,"2600",,,HEX:10,,,Liste der letzten 10 Fehler
# ##### Wartungsdaten #####,,,,,,,,,,,,,
r,,TempDiffBlock,TempDiffBlock_DK,,,,"1200",,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r,,TempDiffFailure,TempDiffFailure_DK,,,,"1300",,,temp0,,,Anzahl der Abschaltungen wegen zu hoher / fehlerhafter Differenz von Vor- und Rücklauftemperatur
r,,ValveStarts,3WV Schaltspiele,,,,"1A00",,,cntstarts2,,,Anzahl der 3WV Umschaltungen
r,,FanHours,Betriebsstunden Lüfter,,,,"1B00",,,hoursum2,,,Betriebsstunden des Lüfters
r,,FanStarts,FanCommunt_DK,,,,"1C00",,,cntstarts2,,,Anzahl der Lüfterschaltspiele
r,,minIgnitiontime,Min. Zündzeit,,,,"2B00",,,UCH,10,s,Minimale Zündzeit
r,,T3Max,T3_max,,,,"3700",,,temp,,,Maximaltemperatur am PWT-Ausgang
r,,CounterStartAttempts3,Zündfehler 3. Versuch,,,,"8100",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 3. Versuch)
r,,CounterStartAttempts4,Zündfehler 4. Versuch,,,,"8200",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 4. Versuch)
r,,T4Max,T4_max,,,,"BE00",,,temp,,,Maximaltemperatur am PWT-Eingang
!include,errors.inc,,,,,,,,,,,,
