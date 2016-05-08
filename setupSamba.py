#!/usr/bin/python
#author urgensherpa
import os
os.system("apt-get update")
os.system("apt-get --yes --force-yes install samba samba-common python-glade2 system-config-samba")
print "########## packages installed ############\n";
print "Exiting"
editfile = "/etc/samba/smb.conf"
template = '''
#sambaconfiguration template
[global]
workgroup = WORKGROUP
server string = Samba Server %v
netbios name = ubuntu
security = user
map to guest = bad user
dns proxy = no

#share definitions

[Anonymous]
path = /samba/anonymous
browsable = yes
writable = yes
guest ok = yes
read only = no
'''
os.system("sleep 1")
print "setting up configuration files "
os.system("sleep 1") 
fout = open (editfile, "w")
fout.write(template)
fout.close()
print "Done"
