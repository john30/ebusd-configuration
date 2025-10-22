# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
#,BAI00,icoVIT/7,0010006341 207,,,,,,,,,,
*r,,,,,,"B509","0D",,,,,,
*w,,,,,,"B509","0E",,,,,,
*wi,#install,,,,,"B509","0E",,,,,,
*ws,#service,,,,,"B509","0E",,,,,,
# ##### Diagnose Ebene 1 #####,,,,,,,,,,,,,
r;wi,,WPPostrunTime,d.01 Pumpennachlaufzeit,,,,"6400",,,minutes0,,,Wasserpumpennachlaufzeit nach Heizbetrieb
r;wi,,BlockTimeHcMax,d.02 Maximale Brennersperrzeit,,,,"2100",,,minutes0,,,Max. Brennersperrzeit bei einem Vorlaufsollwert von 20°C
r,,HwcTemp,d.03 WW Vorlaufsolltemp,,,,"1600",,,tempsensor,,,actoSTOR inletsensor temperature
r,,StorageTemp,d.04 Speicheristtemp,,,,"1700",,,tempsensor,,,Aktuelle Speichertemperatur und Sensorstatus
r,,FlowTempDesired,d.05 Vorlaufsolltemperatur,,,,"3900",,,temp,,,Vorlaufsolltemperatur oder Rücklaufsolltemperatur (wenn Rücklaufregelung aktiviert wurde). Der Maximalwert wird über d.71 und einem eBUS Regler begrenzt.
r,,StorageTempDesired,d.07 Speichersolltemp,,,,"0400",,,temp,,,Storage temperature target value
r,,ACRoomthermostat,d.08 Raumthermostat,,,,"2A00",,,onoff,,,Status des extrenen Raumthermostat an Klemme 3/4
r,,ExtFlowTempDesiredMin,d.09 Min. ext. Vorlaufsollwert,,,,"6E04",,,temp,,,minimum out of Kl.7 and eBus flow setpoint
r,,WP,d.10 Wasserpumpe,,,,"4400",,,onoff,,,Interne Heizungspumpe
r,,extWP,d.11 ext. Heizungspumpe,,,,"3F00",,,onoff,,,Externe Heizungspumpe
r,,Storageloadpump,d.12 Speicherladepumpe,,,,"9E00",,,percent0,,,Ladepumpenanforderung
r,,CirPump,d.13 Zirkulationspumpe,,,,"7B00",,,onoff,,,Status Zirkulationspumpe (über ein externes Modul ansteuerbar)
r,,WPPWMPower,d.15 Pumpendrehzahl Istwert,,,,"7300",,,percent0,,,Output of pwm pump
r,,DCRoomthermostat,d.16 Raumthermostat,,,,"0E00",,,onoff,,,Wärmeanforderung vom externen Regler (Klemme 3-4)
r,,HwcDemand,d.22 WW Anforderung,,,,"5800",,,yesno,,,Brauchwasseranforderung (Zapfung oder Schaltsignal vom Speicher)
r,,HeatingSwitch,d.23 Winterbetrieb,,,,"F203",,,onoff,,,Wintermodus aktiv (Heizbetrieb und Warmwasser)
r,,StoragereleaseClock,d.25 Speicherfreigabe,,,,"4704",,,yesno,,,Freigabe der Speichrladung oder des Warmstartspeichers durcheinen eBUS Regler
r,,Gasvalve,d.30 Gasventil,,,,"BB00",,,UCH,240=off;15=on,,GMV Ansteuersignal
r,,FlowTemp,d.40 Vorlauftemperatur,,,,"1800",,,tempsensor,,,Vorlauftemperatur
r,,ReturnTemp,d.41 Rücklauftemperatur,,,,"9800",,,tempmirrorsensor,,,Rücklauftemperatur
r,,OutdoorstempSensor,d.47 Außentemperaturfühler,,,,"7600",,,tempsensor,,,Außentemperaturwert (ohne Korrekturwert) und Sensorstatus
r;wi,,FlowHysteresisON,d.53 FlowHysteresis_ON_DK,,,,"1601",,,temp,,,Adjustment of the switch on hysteresis
r;wi,,FlowHysteresisOff,d.54 FlowHysteresis_OFF_DK,,,,"1701",,,temp,,,Adjustment of the switch off hysteresis
r,,RemainingBoilerblocktime,d.67 Verbleibende Brennersperrzeit,,,,"3800",,,minutes0,,,Verbleibende Brennersperrzeit
r,,EBusHeatcontrol,d.90 Digitaler Regler,,,,"0004",,,yesno,,,Gibt an ob ein digitaler Regler erkannt wurde
r,,dcfState,d.91 DCF Status,,,,"6900",,,dcfstate,,,DCF Status
r;ws,,Password,d.97 Password_DK,,,,"4904",,,UCH,,,Password
r;ws,,PhoneNumber,d.98 PhoneNumber_DK,,,,"8104",,,HEX:8,,,Phone number
r;ws,,Language,d.99 Language_DK,,,,"8204",,,UCH,,,language selection
# ##### Diagnose Ebene 2 #####,,,,,,,,,,,,,
r,,PumpspeedDesired,d.14 PumpspeedSetpoint,,,,"A100",,,percent0,,,PWM pump speed
r;wi,,ReturnRegulation,d.17 Rücklaufregelung,,,,"B300",,,onoff,,,Aktivierung der Rücklaufregelung
r;wi,,HcPumpMode,d.18 Pumpenbetriebsart,,,,"B700",,,UCH,0=post run;1=permanent;2=winter,,Pumpenbetriebsart für den Heizbetrieb
r;wi,,HwcTempMax,d.20 Max. WW Temperatur,,,,"D900",,,temp,,,Max. Speichersollwert. Begrenzt den max. Einstellbereich des Potentiometers (Rechtsanschlag).
r;wi,,OptionalRelais,d.26 OptionalRelais_DK,,,,"B800",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Option relais function
r;wi,,AccessoriesOne,d.27 Zubehörrelais 1,,,,"B900",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 1
r;wi,,AccessoriesTwo,d.28 Zubehörrelais 2,,,,"BA00",,,UCH,1=circulationpump;2=extheatingpump;3=storagechargingpump;4=fluegasflapextractorhood;5=externalgasvalve;6=externalerrormessage;7=solarpump;8=remotecontrol,,Funktion des Zubehörrelais 2
r,,DeactivationsTemplimiter,d.60 STB Abschaltungen,,,,"2000",,,UCH,,,Anzahl der Abschaltungen durch den Sicherheitstemperaturbgrenzers
r,,DeactivationsIFC,d.61 Anzahl Zündfehler,,,,"1F00",,,UCH,,,Anzahl der Zündfehler (nicht erfolgreiche Züdung im letzten Versuch oder fehlerhaftes Flammensignal)
r,,averageIgnitiontime,d.64 Mittlere Zündzeit,,,,"2D00",,,UCH,10,s,Mittlere Zündzeit
r,,maxIgnitiontime,d.65 Max. Zündzeit,,,,"2C00",,,UCH,10,s,Maximale Zündzeit
r,,CounterStartattempts1,d.68 Zündfehler 1. Versuch,,,,"6E00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 1. Versuch)
r,,CounterStartattempts2,d.69 Zündfehler 2. Versuch,,,,"6F00",,,temp0,,,Anzahl der erfolglosen Zündversuche (im 2. Versuch)
r;wi,,FlowsetHcMax,d.71 Max. Vorlauftemp. Heizbetrieb,,,,"A500",,,temp,,,Einstellung des maximalen Vorlaufsollwert im Heizbetrieb (bei Linksanschlag des Poti)
r;wi,,StorageLoadTimeMax,d.75 Max. Speicherladezeit,,,,"6600",,,minutes0,,,Max. Speicherladezeit für Speicher ohne eigene Regelung
r,,CodingResistor,d.76 SD_CodingResistor_DK,,,,"9200",,,HEX:3,,,boiler identification resistor
r;wi,,FlowsetHwcMax,d.78 Max. Vorlauftemp. WW,,,,"A600",,,temp,,,Maximal erlaubte Vorlauftemperatur für die Speicherladung
r,,HcHours,d.80 Hz. Betriebsstunden,,,,"2800",,,hoursum2,,,Betriebsstunden im Heizbetrieb
r,,HwcHours,d.81 Betriebsstunden WW,,,,"2200",,,hoursum2,,,Betriebsstunden Brauchwasser
r,,HcStarts,d.82 Schaltspiele Heizbetrieb,,,,"2900",,,UIN,-100,,Schaltspiele Heizbetrieb
r,,HwcStarts,d.83 Schaltspiele BW Betrieb,,,,"2300",,,UIN,-100,,Schaltspiele WW Betrieb
r;wi,,HoursTillService,d.84 Stunden bis Wartung,,,,"2004",,,hoursum2,,,Wartungsintervall:Anzahl der Stunden bis zur nächsten Wartung
r;ws,,DSNOffset,d.93 Gerätekennung,,,,"B500",,,UCH,,,Gerätekennung (DSN)
r;wi,,SetFactoryValues,d.96 Werkseinstellungen,,,,"7201",,,yesno,,,Werkseinstellungen
r,,WaterPressure,Wasserdruck,,,,"0200",,,presssensor,,,Wasserdruck
# ##### Wartungsdaten #####,,,,,,,,,,,,,
r,,TempGradientFailure,Gradientenfehler,,,,"1100",,,temp0,,,Anzahl der Boilerabschaltung wegen zu hohem Gradient (S.54)
r,,TempDiffBlock,TempDiffBlock_DK,,,,"1200",,,temp0,,,Number of modulationblocking of the boilers cause of to high/incorrect difference of flow/return temperatures
r,,TempDiffFailure,TempDiffFailure_DK,,,,"1300",,,temp0,,,Anzahl der Abschaltungen wegen zu hoher / fehlerhafter Differenz von Vor- und Rücklauftemperatur
r,,PumpHours,Betriebsstunden Pumpe,,,,"1400",,,hoursum2,,,Pumpenbetriebsstunden
r,,HcPumpStarts,CH_PumpCommunt_DK,,,,"1500",,,cntstarts2,,,Schaltspiele Pumpe
r,,FanHours,Betriebsstunden Lüfter,,,,"1B00",,,hoursum2,,,Betriebsstunden des Lüfters
r,,FanStarts,FanCommunt_DK,,,,"1C00",,,cntstarts2,,,Anzahl der Lüfterschaltspiele
r,,OverflowCounter,Überlauf PM Zähler,,,,"1E00",,,yesno,,,Predictive Maintenance counter have got an overflow
r,,TempMaxDiffExtTFT,MaxTempDiffExtTFT_DK,,,,"2700",,,temp,,,Predictive maintenance data
r,,minIgnitiontime,Min. Zündzeit,,,,"2B00",,,UCH,10,s,Minimale Zündzeit
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
r;wi,,PrEnergySumHwc1,PrEnergySumDHW1_DK,,,,"C500",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc1,PrEnergyCountDHW1_DK,,,,"C600",,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHwc2,PrEnergySumDHW2_DK,,,,"C700",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc2,PrEnergyCountDHW2_DK,,,,"C800",,,ULG,,,Wartungsdaten
r;wi,,PrEnergySumHwc3,PrEnergySumDHW3_DK,,,,"C900",,,ULG,,,Wartungsdaten
r;wi,,PrEnergyCountHwc3,PrEnergyCountDHW3_DK,,,,"CA00",,,ULG,,,Wartungsdaten
r,,WaterpressureVariantSum,WaterpressureVariantSum_DK,,,,"F000",,,pressm2,,,Wartungsdaten
r,,WaterpressureMeasureCounter,WaterpressureMeasureCounter_DK,,,,"F100",,,UCH,,,Wartungsdaten
# ##### expert level\Main #####,,,,,,,,,,,,,
r,,externalFlowTempDesired,ext. Vorlaufsollwert,,,,"2500",,,temp,,,Vorlaufsollwert von einem externen Regler an Klemme 7-8-9
r,,externalHwcSwitch,Wasserschalter,,,,"0000",,,onoff,,,Speicheranforderung eines externen Speichers über den Speicherkontakt
r,,Flame,Flammensignal,,,,"0500",,,UCH,240=off;15=on,,Flammensignal
r,,IFCFault,SD_IFC_Fault_DK,,,,"0700",,,UCH,240=off;15=on,,IFC error
r,,ChangesDSN,Anzhl der DSN Änderungen,,,,"0C00",,,UCH,,,Anzahl der DSN (Gerätekennung) Änderungen
r,,Brennstoffventil,Brennstoffventil,,,,"0D00",,,UCH,240=off;15=on,,Schaltsignal für das Gasventil
r,,VolatileLockout,Verriegelnde Störabschaltungen,,,,"1000",,,UCH,240=no;15=yes,,WAHR: STB Fehler sind verriegelnd
r,,Faultlist,Faultlist_DK,,,,"2600",,,HEX:10,,,last 10 fault codes
r,,ModulationTempDesired,Modulationssollwert,,,,"2E00",,,SIN,10,%,Modulationssollwert
r,,FlameSensingASIC,SD_Flame_Sensing_ASIC_DK,,,,"2F00",,,UIN,,,Ioni/ADC Wert vom Flammenwächter
r,,HcUnderHundredStarts,HZ_UnderHundred_SwiActi_DK,,,,"3000",,,UCH,,,Heat switch cycles under hundred
r,,HwcUnderHundredStarts,BW_UnderHundred_SwiActi_DK,,,,"3100",,,UCH,,,DHW switch cycles under hundred
r,,EbusSourceOn,eBUS Spannungsversorgung,,,,"3400",,,onoff,,,Aktivierung der eBUS Speisung
r,,Fluegasvalve,Abgasklappe,,,,"3C00",,,onoff,,,Flüssiggas Magnetventil
r,,ExternalFaultmessage,Ext. Störmeldung,,,,"3E00",,,onoff,,,Signal für die externe Störmeldeeinrichtung
r,,RueckmeldungBrennstoffventil1,Rückmeldung Brennstoffventil 1,,,,"4700",,,UCH,240=off;15=on,,Rückmeldung Gasventil vom ASIC
r,,RueckmeldungBrennstoffventil2,Rückmeldung Brennstoffventil 2,,,,"4800",,,UCH,240=off;15=on,,Rückmeldung Gasventil vom Prozessor
r,,Ignitor,Zünder,,,,"4900",,,UCH,240=off;15=on,,Zündung aktiviert
r,,Fan,Lüfter,,,,"4A00",,,yesno,,,Fan activation signal
r,,HwcTypes,WW Typen,,,,"4B00",,,UCH,,,DHW type of the appliance
r,,TemplimiterFault,SD_TL_Fault_DK,,,,"4D00",,,UCH,240=off;15=on,,temperature limiter error
r,,ADCOk,SD_ADC_ok_DK,,,,"4E00",,,UCH,240=off;15=on,,internal electronic error
r,,FanFault,SD_Fan_Fault_DK,,,,"5300",,,UCH,240=off;15=on,,Fan error
r,,BoilerType,BoilerType_DK,,,,"5E00",,,UCH,,,Boiler typ of the bmu
r,,FunctionFlags,FunctionFlags_DK,,,,"5F00",,,UCH,,,differrent function flags
r,,ParamToken,ParamToken_DK,,,,"6000",,,UCH,,,token for parameter managment
r,,expertlevelMain_ReturnTemp,Rücklauftemperatur,,,,"6B00",,,tempsensor,,,Externer Rücklauftemperatursensor
r,,FloorHeatingContact,Anlegethermostat,,,,"7000",,,onoff,,,Eingang Anlegethermostat
r,,Templimiter,Temperaturbegrenzer,,,,"7700",,,UCH,240=off;15=on,,Rückmeldung des Temperaturbegrenzer Signals
r,,SRIFCEEFaultCause,SR_IFC_EE_FaultCause_DK,,,,"7A00",,,UCH,,,current IFC fault cause
r,,ParamReplication,ParamReplication_DK,,,,"7C00",,,yesno,,,activated the parameter managment again
r,,AnodeINFeedback,Anode_IN_Feedback_DK,,,,"7E00",,,yesno,,,feedback signal of the anode
r,,EbusVoltage,eBUS Spannung,,,,"7F00",,,onoff,,,Rückmeldung der eBUS Spannung
r,,SRTFINSDFeedback,SR_TF_IN_SD_Feedback_DK,,,,"8400",,,UCH,240=off;15=on,,Thermal fuse error
r,,DemandCirPump,Demand_CirculationPump_DK,,,,"8800",,,yesno,,,remote control activated accessory circulation pump
r,,FluegasvalveOpen,Abgasklappe offen,,,,"8900",,,onoff,,,Rückmeldung Flüssiggasventil
r,,FunctionFault,Function_Fault_DK,,,,"9500",,,yesno,,,boiler stopped by a internal function fault
r,,Testbyte,Testbyte_DK,,,,"9900",,,UCH,,,Testbyte (relevant for the Tester)
r,,DSN,DSN,,,,"9A00",,,UIN,,,DSN: Device Specific number
r,,TargetFanSpeedOutput,Lüfter Solldrehzahl,,,,"9F00",,,UIN,,1/min,Lüfterdrehzahl
r,,Statenumber,Statenumber_DK,,,,"AB00",,,UCH,,,status number
r,,AdvancedPowerValues,AdvancedPowerValues_DK,,,,"AE00",,,HEX:9,,,min. / max powervalues
r,,DSNStart,DSN Startadresse,,,,"BC00",,,UIN,,,DSN Startadresse
r,,Shiftloadtankpump,Shiftloadtankpump_DK,,,,"B400",,,yesno,,,current status of the shift load pump
r,,ExtStorageModulCon,VR65 angeschlossen,,,,"BF00",,,yesno,,,Externes Speichermodul (VR65) angeschlosssen
r,,PartnumberBox,Partnumber_Box,,,,"C000",,,HEX:5,,,part number of the eBox
r,,SRSyphonINSDSwitch,SR_Syphon_IN_SD_Switch_DK,,,,"CF00",,,UCH,240=no;15=yes,,feedback of the syphon switch contact
r,,TemplimiterWithNTC,SD_STL_with_NTC,,,,"D200",,,UCH,240=no;15=yes,,Temperaturbegrenzer Art:1 = NTC0 = Schaltkontakt
r,,VolatileLockoutIFCGV,SD_VolatileLockout_IFC_GV_DK,,,,"D300",,,UCH,240=no;15=yes,,Alle IFC Fehler sind nichtflüchtig
r,,DisplayMode,DisplayMode_DK,,,,"DA00",,,UCH,,,Display mode of the aplliance
r,,RueckmeldungBrennstoffventil3,Rückmeldung Brennstoffventil 3,,,,"DB00",,,UCH,240=off;15=on,,Gasventil Schaltsignal (vom Prozessor)
r,,InitialisationEEPROM,InitialisationEEPROM_DK,,,,"DC00",,,yesno,,,EEPROM Initialisierrung (für die Produktion)
r,,DefaultSettingEEPROM,DefaultSettingEEPROM_DK,,,,"DD00",,,yesno,,,default value setting off all EEPROM values (done in the production)
r,,TimerInputHc,Eingang Schaltuhr,,,,"DE00",,,onoff,,,timer input (block heatdemand)
r,,RManagEE.VirtualHcPartloadEnableDTemp,TR_Manag_EE.Virtual_CH_Partload_Enable_DK,,,,"E300",,,onoff,,,enable the adaptive CH-partload calulation
r,,ExternGasvalve,Ext. Gasventil,,,,"E400",,,onoff,,,Externes Magnetventil
r,,DCFTimeDate,DCF Datum/Uhrzeit,,,,"E500",,,btime;bdate,,,DCF Time / date stamp struct { uchar sec; uchar min; uchar std; uchar tag; uchar mon; uchar wtg; uchar jah; } Tdcf77_time;
r,,actoSTOREEPreventiveCounter,actoSTOR_EE_PreventiveCounter_DK,,,,"EC00",,,UIN;UIN;UIN,,,Predictive maintenance date of the actoSTOR
r,,InitialisationSequence,InitialisationSequence_DK,,,,"9A01",,,UCH,,,value:0 -> off1-> full initialisation incl. all defaultvalues (done in the production)
r,,FlowSetPotmeter,Vorlaufsollwert Poti,,,,"1900",,,temp,,,Vorlaufsollwert Potentiometer
r,,HwcSetPotmeter,WW Sollwert Potentiometer,,,,"F103",,,temp,,,WW Sollwertpotentiometer
r,,HwcSwitch,Wasserschalter,,,,"F303",,,onoff,,,WW aus/ein
r,,ProductionByte,ProductionByte,,,,"3E04",,,UCH,,,
r,,SerialNumber,SerialNumber,,,,"3F04",,,HEX:8,,,Seriennummer AI
r,,BoilerType2,BoilerType_2_DK,,,,"0C01",,,ULG,,,second Boiler typ of the bmu
r,,StatusList,StatusList_DK,,,,"1101",,,HEX:10,,,List of the last 10 status numbers
r,,LimpHomeModeEEHistoryList,LimpHomeMode_EE_History_List_DK,,,,"8B01",,,UIN;UIN;UIN;UIN;UIN,,,history of the last 5 limp home modes
# ##### expert level\icoVIT #####,,,,,,,,,,,,,
r;wi,,AWPCEEMinThreshold,AWPC_EE_MinThreshold_DK,,,,"1201",,,SIN,10,bar/10,minimum waterpressure threshold
r;wi,,AWPCEEMaxThreshold,AWPC_EE_MaxThreshold_DK,,,,"1301",,,SIN,10,bar/10,maximum waterpressure threshold
r,,OILOUTPreHeater,OIL_OUT_PreHeater_DK,,,,"3101",,,onoff,,,activated the preheater
r,,OILINPreHeaterFeedback,OIL_IN_PreHeaterFeedback_DK,,,,"3201",,,yesno,,,feedback of the preheater
!include,errors.inc,,,,,,,,,,,,
!include,service.inc,,,,,,,,,,,,
