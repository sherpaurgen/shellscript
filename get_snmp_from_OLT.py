#get_snmp data(user upload and download rate) from OLT \

#!/usr/bin/python
#olt_snmp.py <olt> <snmp community> <ontid>
import sys
import subprocess
OLT=sys.argv[1]
ONT=sys.argv[2]
COMM="t3sTCommunity$trinG"
SNMPWALK="/usr/bin/snmpwalk"
uploadtree=".1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3."+ONT
downloadtree=".1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4."+ONT

UPLOAD=subprocess.check_output([SNMPWALK,"-v2c","-c",COMM,OLT,uploadtree])
DOWNLOAD=subprocess.check_output([SNMPWALK,"-v2c","-c",COMM,OLT,downloadtree])

uploadrate=UPLOAD.split()
downloadrate=DOWNLOAD.split()
#print uploadrate,downloadrate
#uploadrate = ['SNMPv2-SMI::enterprises.2011.6.128.1.1.4.23.1.3.4194306816.0', '=', 'Counter64:', '18709767443'] 
#downloadrate = ['SNMPv2-SMI::enterprises.2011.6.128.1.1.4.23.1.4.4194306816.0', '=', 'Counter64:', '363693806017']

print "in_traffic:{} out_traffic:{}" .format(uploadrate[3],downloadrate[3])


# execution
# python /usr/local/cacti/scripts/olt_snmp.py <olt ip address> <ont id>
# python /usr/local/cacti/scripts/olt_snmp.py  100.26.26.6  4194306816.0
