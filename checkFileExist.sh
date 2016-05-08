#!/bin/bash
if [ -e "$1" ];
then
echo -e "this $1 is valid file"
echo -e "`cut -d: -f1 $1`"
else 
echo "Not Found"
fi

