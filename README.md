# chk_interface
Check ip address and tcp port is alive. Useful for checking connection through firewalls etc. Written in perl


./chk_interface.v3.pl inputfile outputfile

input file example
99.143.238.204:3389:johns vdi
99.143.238.204:135:johns vdi

outputfile example
Checking mc-rdp.txt ....
=================================================
ip: 99.143.238.204   port: 3389   :Connected     johns vdi
ip: 99.143.238.204   port: 135    :Connected     johns vdi
===================Completed=====================

