#!/bin/bash
#nc -w option for timeout
rm -f /tmp/blacklist.txt
for ip in `cat /script/iplist.txt`;
do
  nc  -s $ip -vz -w 1 alt1.gmail-smtp-in.l.google.com 25  > /dev/null 2>&1
  if [ $? -gt 0 ]; then
    echo "${ip} blacklisted for google" >> /tmp/blacklist.txt
  fi
  nc  -s $ip -vz -w 1 mta5.am0.yahoodns.net 25 > /dev/null 2>&1
  if [ $? -gt 0 ]; then
    echo "${ip} blacklisted for yahoo" >> /tmp/blacklist.txt
  fi
  nc  -s $ip -vz -w 1 mailin-02.mx.aol.com 25 > /dev/null 2>&1
  if [ $? -gt 0 ]; then
    echo "${ip} blacklisted for AOL " >> /tmp/blacklist.txt
  fi
done
cat /tmp/blacklist.txt | sort -nrk 3
