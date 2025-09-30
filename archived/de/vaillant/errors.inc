# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment,field2,part (m/s),datatypes/templates
# Aktuelle(r) Fehler,,,,,,,,,,,,,,,,
*r,,,,,,"B503","00",,,,,,,,,
r,,currenterror,Aktuelle Fehler,,,,01,,,errors,,,,,,
# Fehlerhistorie,,,,,,,,,,,,,,,,
*r,,,,,,"B503","01",,,,,,,,,
*wi,#install,,,,,"B503","02",,,,,,,,,
r,,errorhistory,Fehlerhistorie,,,,01,index,m,UCH,,,,,,errorhistory
wi,,clearerrorhistory,Fehlerhistorie löschen,,,,01,cleared,s,yesno,,,,,,
