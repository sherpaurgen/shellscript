#!/bin/bash
#This script will backup the radacct table on daily basis

#sys_date=`date +%F -d '-1 day'`

#/usr/bin/mysqldump --single-transaction --no-create-db --no-create-info ctradius radacct --where="acctstarttime LIKE '${sys_date}%'" >  /dbbackup/ctradius/radacct-`date +%F -d '-1 day'`.sql
sys_date1="`date +%F -d '-7 day'` 00:00:00";
sys_date2="`date +%F -d '-1 day'` 23:59:59";
#echo $sys_date1
#echo $sys_date2
#run cronjob every sunday to backup weekly radacct from monday to saturday
/usr/bin/mysqldump --single-transaction --no-create-db --no-create-info ctradius radacct --where="acctstarttime between '${sys_date1}' and '${sys_date2}'" >  /dbbackup/ctradius/radacct-week-`date +%F -d '-1 day'`.sql
