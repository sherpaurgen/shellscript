#!/usr/bin/python
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
                SERVER="localhost"
                server=smtplib.SMTP(SERVER)
                message=MIMEText("Power is down since "+ str(PowerRouter.counter) +" minutes ago for " + self.description + str(self.ipaddress))
                message['Subject']="Power Down for %s " % (str(self.ipaddress))
                message['From']=email.utils.formataddr(('PowerMonitor','watchme@classic.com.np'))
                message['To']=email.utils.formataddr(('Recipient','urgen@classic.com.np'))
                From="watch@classic.com.np"
                To="urgen@classic.com.np"
                server.set_debuglevel(True)
                try:
                    server.sendmail('watch@classic.com.np',['urgebn@classic.com.np'],message.as_string())
                finally:
                    server.quit()
                # print "Power down since",PowerRouter.counter,"minutes ago",self.description

                time.sleep(3)
            else:
                PowerRouter.counter=0
                print self.description,"is up"
                time.sleep(3)

powerrouter1=PowerRouter("8.8.8.899","jawalakhel UPS/battery")
powerrouter1.scan()









