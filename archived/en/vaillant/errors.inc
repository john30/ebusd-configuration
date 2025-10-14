# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment,field2,part (m/s),datatypes/templates
# Current errors,,,,,,,,,,,,,,,,
*r,,,,,,"B503","00",,,,,,,,,
r,,currenterror,Current errors,,,,01,,,errors,,,,,,
# Error history,,,,,,,,,,,,,,,,
*r,,,,,,"B503","01",,,,,,,,,
*wi,#install,,,,,"B503","02",,,,,,,,,
r,,errorhistory,Error history,,,,01,index,m,UCH,,,,,,errorhistory
wi,,clearerrorhistory,Clear error history,,,,01,cleared,s,yesno,,,,,,
