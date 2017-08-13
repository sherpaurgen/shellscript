#!/bin/bash
usedmem=`/usr/bin/free  | grep 'Mem' | awk '{ print $3; }'`
if [ $usedmem -gt 2054300 ]
then
    /bin/sync; 
    echo 3 > /proc/sys/vm/drop_caches;
fi
