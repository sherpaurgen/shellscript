#!/bin/bash
port=80
host=google.com
nc -z -w 5 $host $port   #'-w 5'  5seconds timeout value
if [ $? != 0 ];
then
echo "http connection failed to port $port" | mail -s admin@example.com 2> /dev/null
else
echo "connection successfull"
fi
