#!/bin/bash
#author urgensherpa
#2012-03-18

#netstat -ant | grep 3306  2> /dev/null
#pgrep smbd   ;  for samba service
MYSQLSTATUS=`echo $?`
COUNT=0
THRESHOLD=2
SERVICENAME="mysqld"   # use SERVICENAME="smbd"  for samba 

if [ $MYSQLSTATUS != 0 ];
then
    while [ $COUNT -le $THRESHOLD ]
    do
        service $SERVICENAME start 2> /dev/null ;
        if [ $? != 0 ];
            then 
            let "COUNT +=1"   #or COUNT=$((COUNT+1)) OR ((COUNT+=1))
        else 
            exit 0  #exits the shell 
        fi
    done

    echo "Problems starting $SERVICENAME" | mail -s "service startfailure" admin@example.com  2> /dev/null
else
    echo $SERVICENAME is running.
fi

#if you dont source it creates a subshell 
#if you source script then your parent shell becomes the shell that you are in
#source script.sh runs the script within the current process, thus all variable assignments are preserved as variables even after the script finishes (and don't have to be explicitly export'd).
#./script.sh just runs the script in a subprocess, and any variables which are assigned disappear after the script is done
