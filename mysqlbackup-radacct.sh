#!/bin/bash
#This script will backup the radacct table on daily basis

#sys_date=`date +%F -d '-1 day'`
#/usr/bin/mysqldump --single-transaction --no-create-db --no-create-info ctradius radacct --where="acctstarttime LIKE '${sys_date}%'" >  /dbbackup/ctradius/radacct-`date +%F -d '-1 day'`.sql
#Below script is set to run cronjob every sunday to backup weekly radacct from monday to saturday
sys_date1=`date +%F -d '-7 day'`;
sys_date2=`date +%F -d '-1 day'`;
/usr/bin/mysqldump --single-transaction --no-create-db --no-create-info ctradius radacct --where="acctstarttime between '${sys_date1}' and '${sys_date2}'" >  /dbbackup/ctradius/radacct-week-`date +%F -d '-1 day'`.sql
