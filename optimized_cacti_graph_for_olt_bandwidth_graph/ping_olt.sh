#!/bin/bash
for hosts in `cat olts`;
 do 
    ping -c 2 $hosts >/dev/null 2>&1; 
    if [ $? -eq 0 ]; 
     then
    echo ${hosts}" OK"
        else
    echo ${hosts}" unreachable"
        fi
 done
