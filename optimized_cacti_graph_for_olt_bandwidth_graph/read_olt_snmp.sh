#!/bin/sh
#
# Find a user's in/out traffic by username.
# Syntax:
# olt_snmp <olt> <ontid>

OLT=$1
ONTID=$2

UPLOAD=`/bin/grep ${ONTID} /tmp/${OLT}_upload_data | cut -d':' -f4 | sed 's/ *//g'`
DOWNLOAD=`/bin/grep ${ONTID} /tmp/${OLT}_download_data | cut -d':' -f4 | sed 's/ *//g'`



echo "in_traffic:${UPLOAD} out_traffic:${DOWNLOAD}"
