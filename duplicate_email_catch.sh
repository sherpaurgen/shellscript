#!/bin/bash
grep 'status=sent' /var/log/maillog | grep -vE "axonadvis|norbu|brammer" | grep "to=<"  |  awk -F"[<>]" '{print $2}' | sort | uniq -c |  awk '{ print $1" "$2; }' | sort -nr  > /var/log/summary_`date +%F-%H`.txt

grep -wv "1" /var/log/summary_`date +%F-%H`.txt > /var/log/sorted_summary_`date +%F-%H`.txt

filename=`ls -1t /var/log/sorted_summary_* | head -1`
filename2='/var/log/tempaddr.txt'

cut -d' ' -f2 ${filename} > ${filename2}
echo >> ${filename}
echo "------Email--------SentTimeStamp-------" >> ${filename}
for addr in `cat ${filename2}`;
 do
     grep "${addr}" /var/log/maillog | grep 'status=sent' | grep -vE "axonadvis|norbu|brammer" | grep "to=<"  |  awk -F"[<>]" '{print $2"-->"$1}' | awk -F "server" '{ print $1}' >> ${filename}
 done
sed -i '1i--TimesSent--RcptEmail--' ${filename}
    
        
#test email for me only
echo "This is an automated report. Please see the attached txt file to check if duplicate emails are sent,if file is blank then no duplicates are sent" | /usr/bin/mutt -a "${filename}" -e "my_hdr From:system@axonadvisers.com" -s "No reply: Duplicate Summary" --  abcd@gmail.com
