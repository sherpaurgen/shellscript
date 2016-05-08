#!/bin/bash
#this script will send warning email if disk lv1 usage exceed 80% of total capacity
admin="adminuser@example.com";
admin2="admin2@example.com";
admin3="testuser@example.com.np";

currentusage=`df -h | grep "/dev/mapper/vg1/lv1" | awk ' { print $5; }' | cut -d"%" -f1`;

if [ $currentusage -ge 80 ];
then
echo -e "Max usage exceeded. Your disk usage is at "$currentusage"% \n\n `df -h`" | mail -s "Disk Usage Exceeded HH Server" $admin,$admin2,$admin3;
else
  :                             #do nothing
fi
