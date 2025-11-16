# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
# Service message,,,,,,,,,,,,,
*r,,,,,,"B503","00",,,,,,
r,,currentservice,Current service message,,,,02,,,errors,,,
# Service message history,,,,,,,,,,,,,,,,
*r,,,,,,"B503","01",,,,,,,,,
*wi,#install,,,,,"B503","02",,,,,,,,,
r,,servicehistory,Service message history,,,,02,index,m,UCH,,,,,,errorhistory
wi,,clearservicehistory,Clear service message history,,,,02,cleared,s,yesno,,,,,,
