#!/bin/bash
#curload=`uptime | awk '{ print $11; }' | sed 's/,//g' | cut -d"." -f1`
curload=`uptime | grep -E -o "average:.{0,5}" | awk '{ print $2; }'|cut -d"." -f1`
threshold=4
echo "Current load:"$curload
echo "Threshold:"$threshold
if [ $curload -gt $threshold ]
then
   echo "high load";
   /usr/bin/mysql -e "show processlist\G" | grep -B 7 -i "select" | grep Id: | awk '{ print $2; }' > /tmp/select.txt;
    for processid in `cat /tmp/select.txt`; do mysql -e "kill $processid"; done;
    echo "`date;uptime`" >> /var/log/mysqlclearselect.log
else
    echo "`date; uptime`" >> /tmp/mysqlnormalload.log
fi
