#!/usr/bin/python
# classic watch.classic.com.np
import os
from datetime import datetime
import subprocess
import time
import smtplib
import email.utils
# from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

FNULL=open(os.devnull,'w')   #suppress output

class PowerRouter:
    counter=0
    def __init__(self,ipaddress,description):
        self.ipaddress=ipaddress
        self.description=description

    def scan(self):
        while 1:
        # for ip-address in ip_address:
            exitcode=subprocess.call(["ping", "-c 2",self.ipaddress],stdout=FNULL,stderr=FNULL)
            if exitcode:
                PowerRouter.counter+=3
                time.sleep(180)    # sleep for 3 minutes
                SERVER="localhost"
                server=smtplib.SMTP(SERVER)
                message=MIMEText("Power is down since "+ str(PowerRouter.counter) +" minutes ago for " + self.description + str(self.ipaddress))
                message['Subject']="Power Down for %s " % (str(self.ipaddress))
                message['From']=email.utils.formataddr(('Powermonitor','checker@classic.com'))
                message['To']=email.utils.formataddr(('Recipient','staffname@classic.com'))
                From="watch@classic.com.np"
                To="urgen@classic.com.np"
                server.set_debuglevel(True)
                try:
                    server.sendmail('checker@classic.com',['staffname@classic.com'],message.as_string())
                finally:
                    server.quit()
                # print "Power down since",PowerRouter.counter,"minutes ago",self.description

            else:
                PowerRouter.counter=0
                time.sleep(180)

#############################
## EDIT FROM BELOW ONWARDS ##
#############################
#              Syntax

# powerrouter1=PowerRouter("<ip address>"," <Description/infrmation> ")
# powerrouter1.scan()

#              Example

# router1=PowerRouter("8.8.8.8","jawalakhel UPSbattery")
# router1.scan()

# router2=PowerRouter("8.8.4.4","bhaktapur UPSbattery")
# router2.scan()
