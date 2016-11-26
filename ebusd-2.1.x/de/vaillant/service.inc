# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
# Wartungsmeldungen,,,,,,,,,,,,,
*r,,,,,,"B503","00",,,,,,
r,,currentservice,Aktuelle Wartungsmeldungen,,,,02,,,errors,,,
# Historie Wartungsmeldungen,,,,,,,,,,,,,,,,
*r,,,,,,"B503","01",,,,,,,,,
*wi,#install,,,,,"B503","02",,,,,,,,,
r,,servicehistory,Historie Wartungsmeldungen,,,,02,index,m,UCH,,,,,,errorhistory
wi,,clearservicehistory,Historie Wartungsmeldungen löschen,,,,02,cleared,s,yesno,,,,,,
