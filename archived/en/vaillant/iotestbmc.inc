# type (r[1-9];w;u),circuit,name,[comment],[QQ],ZZ,PBSB,[ID],field1,part (m/s),datatypes/templates,divider/values,unit,comment
# I/O test: mixer,,,,,,,,,,,,,
*wi,#install,,,,,"B506",,,,,,,
wi,,iotest,I/O test,,,,02,,,UCH,0x01=off/cirpump;0x02=hcpump;0x04=hc2mixeropen;0x08=hc2mixerclose;0x10=hc2pump,,
wi,,ioteststop,stop I/O test,,,,01,,,,,,
