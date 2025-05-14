# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,Vaillant ecoTEC,0010024646,,,,,,,,,,
*r,,,,,,"B509","0D",,,,,,
*w,,,,,,"B509","0E",,,,,,
*wi,#install,,,,,"B509","0E",,,,,,
*ws,#service,,,,,"B509","0E",,,,,,
*[SW],scan,,,SW,,,,,,,,,
# ##### Diagnose Ebene 1 #####,,,,,,,,,,,,,
r,,Statenumber,Statenumber_DK,,,,"AB00",,,UCH,,,status number
r;wi,,PartloadHcKW,d.00 Heizungsteillast,,,,"0704",,,power,,,Heizungsteillast
r;wi,,WPPostrunTime,d.01 Pumpennachlaufzeit,,,,"F703",,,minutes0,,,Wasserpumpennachlaufzeit nach Heizbetrieb
r;wi,,BlockTimeHcMax,d.02 Maximale Brennersperrzeit,,,,"0904",,,minutes0,,,Max. Brennersperrzeit bei einem Vorlaufsollwert von 20°C
r,,HwcTemp,d.03 WW Vorlaufsolltemp,,,,"1600",,,tempsensor,,,Vorlauftemperatur bei Warmwasserzapfung (nur bei Kombi-Heizgeräten)
r,,StorageTemp,d.04 Speicheristtemp,,,,"1700",,,tempsensor,,,Aktuelle Temperatur des Warmstartspeichers (bei Kombigeräten) oder aktuelle Speichertemperatur bei (VC Geräten)
r,,FlowTempDesired,d.05 Vorlaufsolltemperatur,,,,"3900",,,temp,,,Vorlaufsolltemperatur oder Rücklaufsolltemperatur (wenn Rücklaufregelung aktiviert wurde). Der Maximalwert wird über d.71 und einem eBUS Regler begrenzt.
r,,StorageTempDesired,d.07 Speichersolltemp,,,,"0400",,,temp,,,VCW: Solltemperatur des WarmstartspeichersVC: Solltemperatur des externen Speichers
r,,ACRoomthermostat,d.08 Raumthermostat,,,,"2A00",,,onoff,,,Status des extrenen Raumthermostat an Klemme 3/4
r,,ExtFlowTempDesiredMin,d.09 Min. ext. Vorlaufsollwert,,,,"6E04",,,temp,,,minimum out of Kl.7 and eBus flow setpoint
r,,WP,d.10 Wasserpumpe,,,,"4400",,,onoff,,,Interne Heizungspumpe
r,,ExtWP,d.11 ext. Heizungspumpe,,,,"3F00",,,onoff,,,Externe Heizungspumpe
r,,Storageloadpump,d.12 Speicherladepumpe,,,,"9E00",,,percent0,,,Ladepumpenanforderung
r,,CirPump,d.13 Zirkulationspumpe,,,,"7B00",,,onoff,,,Status Zirkulationspumpe (über ein externes Modul ansteuerbar)
r,,HwcDemand,d.22 WW Anforderung,,,,"5800",,,yesno,,,Warmwasseranforderung (Zapfung oder Schaltkontakt)
r,,HeatingSwitch,d.23 Winterbetrieb,,,,"F203",,,onoff,,,Wintermodus aktiv
r,,StoragereleaseClock,d.25 Speicherfreigabe,,,,"4704",,,yesno,,,Speicherladung freigegeben durch eBus Regler
r,,Gasvalve,d.30 Gasventil,,,,"BB00",,,onoff2,,,Gasventil angesteuert
r,,TargetFanSpeed,d.33 Lüfter Solldrehzahl,,,,"2400",,,UIN,,rpm,Solldrehzahl des Lüfters
r,,FanSpeed,d.34 Lüfteristdrehzahl,,,,"8300",,,UIN,,rpm,Aktuelle Drehzahl des Lüfters
r,,PositionValveSet,d.35 Position VUV,,,,"5400",,,UCH,,,Position des 3-Wege Ventil: 100=Warmwasser, 0=Heizbetrieb, 40=Mittelstellung
r,,FlowTemp,d.40 Vorlauftemperatur,,,,"1800",,,tempsensor,,,Vorlauftemperatur
r,,ReturnTemp,d.41 Rücklauftemperatur,,,,"9800",,,tempmirrorsensor,,,Rücklauftemperatur
r,,IonisationVoltageLevel,d.44 Digitaler Ionisationswert,,,,"A400",,,SIN,10,,Ionisationsspannung: größer 80 keine Flammekleiner 40 gute Flamme
r,,OutdoorstempSensor,d.47 Außentemperaturfühler,,,,"7600",,,tempsensor,,,Außentemperatur (nicht korrigierter Wert)
r,,RemainingBoilerblocktime,d.67 Verbleibende Brennersperrzeit,,,,"3800",,,minutes0,,,Verbleibende Brennersperrzeit
r,,DeactivationsTemplimiter,d.60 STB Abschaltungen,,,,"2000",,,UCH,,,Anzahl der Abschaltungen durch den Sicherheitstemperaturbgrenzers
r,,DeactivationsIFC,d.61 Anzahl Zündfehler,,,,"1F00",,,UCH,,,Anzahl der Zündfehler (erfolglose Zündung im letzten Versuch + Flammabbrüche)
r,,AverageIgnitiontime,d.64 Mittlere Zündzeit,,,,"2D00",,,UCH,10,s,Mittlere Zündzeit
r,,MaxIgnitiontime,d.65 Maximale Zündzeit,,,,"2C00",,,UCH,10,s,Maximale Zündzeit
r,,CounterStartattempts1,d.68 Zündfehler 1. Versuch,,,,"6E00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 1. Versuch)
r,,CounterStartattempts2,d.69 Zündfehler 2. Versuch,,,,"6F00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 2. Versuch)
r,,EBusHeatcontrol,d.90 Digitaler Regler,,,,"0004",,,yesno,,,Status des digitalen Reglers
r,,Flame,Flammensignal,,,,"0500",,,onoff2,,,Flammenstatus
r,,FanHours,Betriebsstunden Lüfter,,,,"1B00",,,hoursum2,,h,Betriebsstunden des Lüfters
r,,FanStarts,Schaltspiele Lüfter,,,,"1C00",,,cntstarts2,,,Anzahl der Lüfter-Einschaltungen
r,,CounterStartAttempts3,Zündfehler 3. Versuch,,,,"8100",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 3. Versuch)
r,,CounterStartAttempts4,Zündfehler 4. Versuch,,,,"8200",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 4. Versuch)
r,,TempDiffBlock,TempDiffBlock,,,,"1200",,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r,,TempDiffFailure,TempDiffFailure,,,,"1300",,,temp0,,,Anzahl der Abschaltungen wegen zu hoher / fehlerhafter Differenz von Vor- und Rücklauftemperatur
r,,ValveStarts,3WV Schaltspiele,,,,"1A00",,,cntstarts2,,,Anzahl der 3WV Umschaltungen
r,,TemplimiterWithNTC,TemplimiterWithNTC,,,,"D200",,,yesno2,,,Temperaturbegrenzer mit NTC
r,,HcHours,HZ Betriebsstunden,,,,"3801",,,hoursum,,h,Betriebsstunden Heizbetrieb
r,,HcPumpStarts,HZ Pumpen-Schaltspiele,,,,"5603",,,cntstarts3,,,Schaltspiele der Heizungspumpe
r,,HcStarts,HZ Brennerstarts,,,,"3803",,,cntstarts2,,,Brennerstarts im Heizbetrieb
r,,HwcHours,WW Betriebsstunden,,,,"7701",,,hoursum,,h,Betriebsstunden Warmwasserbetrieb
r,,HwcStarts,WW Brennerstarts,,,,"7703",,,cntstarts2,,,Brennerstarts im Warmwasserbetrieb
r,,PumpHours,Betriebsstunden Pumpe,,,,"5601",,,hoursum,,h,Pumpenbetriebsstunden
r,,StorageLoadPumpHours,Speicherladepumpenlaufzeit,,,,"7301",,,hoursum,,h,Betriebsstunden der Speicherladepumpe
r,,StorageloadPumpStarts,Speicherladepumpen-Schaltspiele,,,,"7303",,,cntstarts2,,,Schaltspiele der Speicherladepumpe
r,,ValveMode,Ventilmodus,,,,"F403",,,UCH,,,Ventilmodus
r,,HcPumpMode,Pumpenmodus Heizung,,,,"4E04",,,pumpmode,,,Pumpenmodus Heizung 