#!/bin/bash
echo ` date`
# PTS-OLT1.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area1-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area1-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area1-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area1-olt1.example.com_upload_data 

#CBL-OLT1.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area2-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area2-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area2-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area2-olt1.example.com_upload_data

#area3-olt1.example.com.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area3-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area3-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area3-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area3-olt1.example.com_upload_data

#area4-olt1.example.com.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area4-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area4-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area4-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area4-olt1.example.com_upload_data

#area5-olt1.example.com.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area5-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area5-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area5-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area5-olt1.example.com_upload_data

#area6-olt1.example.com.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area6-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area6-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area6-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area6-olt1.example.com_upload_data

#area7-olt1.example.com.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area7-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area7-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area7-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area7-olt1.example.com_upload_data

#area8-olt1.example.com.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area8-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area8-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area8-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area8-olt1.example.com_upload_data

#area9-olt1.example.com.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area9-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area9-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area9-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area9-olt1.example.com_upload_data

#area10-olt1.example.com.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area10-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area10-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area10-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area10-olt1.example.com_upload_data

#area11-olt1.example.com.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area11-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area11-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area11-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area11-olt1.example.com_upload_data

#area12-olt1.example.com.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area12-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area12-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area12-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area12-olt1.example.com_upload_data

#area13-olt1.example.com.example.com
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area13-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.4 > /tmp/area13-olt1.example.com_download_data
/usr/bin/snmpwalk -v2c -c SnmpS3cretpass area13-olt1.example.com .1.3.6.1.4.1.2011.6.128.1.1.4.23.1.3 > /tmp/area13-olt1.example.com_upload_data

