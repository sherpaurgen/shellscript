#!/bin/bash
/usr/bin/cp -f /var/log/maillog /tmp/maillog
tmpdir="/tmp/tmpdir"
mkdir -p /tmp/tmpdir
logfile="/tmp/maillog"
#sed -i 's/  \+/ /g' /tmp/maillog    
dt_past1h=`date --date="1 hour ago" +%b" "%e" "%H`
dt_past4h=`date --date="4 hour ago" +%b" "%e" "%H`
dt_past24h=`date --date="24 hour ago" +%b" "%e" "%H`
dt_past7d=`date --date="7 days ago" +%b" "%e`
dt_now=`date +%b" "%d" "%H`

# For past 1 hour  
grep -E "${dt_past1h}|${dt_now}" ${logfile} > ${tmpdir}/allpasthour1.txt
grep 'status=sent' ${tmpdir}/allpasthour1.txt | grep -vE "axonadvis|norbu|brammer" |  grep "to=<"  >  ${tmpdir}/allpasthour_1.txt
awk -F"[<>]" '{print $2}' ${tmpdir}/allpasthour_1.txt | sort | uniq -c |  awk '{ print $1" "$2; }' | sort -nr  >  ${tmpdir}/sum_1hr.txt

grep -wv "1"  ${tmpdir}/sum_1hr.txt > ${tmpdir}/dup_sum_1hr.txt

totmph=`wc -l ${tmpdir}/allpasthour_1.txt | awk '{ print $1; }'`
totdup1=`wc -l ${tmpdir}/dup_sum_1hr.txt |  awk '{ print $1; }'`
echo "Note: If value is blank or 0(zero) then the match is not found" > /tmp/report.txt
echo "# For past 1 hour :" >> /tmp/report.txt
echo "Total mail sent past hour-> $totmph" >>  /tmp/report.txt
echo "Total email address receiving duplicate email in last 1 hour-> $totdup1" >>  /tmp/report.txt

# For past 4 hour
echo >> /tmp/report.txt
echo "# For past 4 hours :" >> /tmp/report.txt

awk "/${dt_past4h}/{a=1}/${dt_now}/{print;a=0}a" ${logfile} > ${tmpdir}/allpast4hour.txt
grep 'status=sent'  ${tmpdir}/allpast4hour.txt | grep -vE "axonadvis|norbu|brammer" |  grep "to=<"  >  ${tmpdir}/allpast4_hr.txt
awk -F"[<>]" '{print $2}' ${tmpdir}/allpast4_hr.txt | sort | uniq -c |  awk '{ print $1" "$2; }' | sort -nr  >  ${tmpdir}/sum_4hr.txt
grep -wv "1"  ${tmpdir}/sum_4hr.txt >  ${tmpdir}/dup_sum_4hr.txt

total4hr=`wc -l ${tmpdir}/allpast4_hr.txt |  awk '{ print $1; }'`
totdup4=`wc -l ${tmpdir}/dup_sum_4hr.txt |  awk '{ print $1; }'`

echo "Total mail sent in last 4hour-> $total4hr" >>/tmp/report.txt
echo "Total email address receiving duplicate email in last 4 hours-> $totdup4" >> /tmp/report.txt

# For past 24 hour
echo >> /tmp/report.txt
echo "# For past 24 hours :" >> /tmp/report.txt
awk "/${dt_past24h}/{a=1}/${dt_now}/{print;a=0}a" ${logfile} > ${tmpdir}/allpast24hour.txt
grep 'status=sent'  ${tmpdir}/allpast24hour.txt | grep -vE "axonadvis|norbu|brammer" |  grep "to=<"  >  ${tmpdir}/allpast24_hour.txt
awk -F"[<>]" '{print $2}' ${tmpdir}/allpast24_hour.txt | sort | uniq -c |  awk '{ print $1" "$2; }' | sort -nr  >  ${tmpdir}/sum_24hr.txt
grep -wv "1"  ${tmpdir}/sum_24hr.txt >  ${tmpdir}/dup_sum_24hr.txt

total24hr=`wc -l ${tmpdir}/allpast24_hour.txt |  awk '{ print $1; }'`
totdup24=`wc -l ${tmpdir}/dup_sum_24hr.txt |  awk '{ print $1; }'`

echo "Total mail sent last 24 hours-> $total24hr" >> /tmp/report.txt
echo "Total email address receiving duplicate email in last 24 hours-> $totdup24" >> /tmp/report.txt

# For past 7 days

awk "/${dt_past7d}/{a=1}/${dt_now}/{print;a=0}a" ${logfile} > ${tmpdir}/allpastweek.txt
grep 'status=sent'  ${tmpdir}/allpastweek.txt | grep -vE "axonadvis|norbu|brammer" |  grep "to=<"  >  ${tmpdir}/allpast_week.txt
awk -F"[<>]" '{print $2}' ${tmpdir}/allpast_week.txt | sort | uniq -c |  awk '{ print $1" "$2; }' | sort -nr  >  ${tmpdir}/sum_week.txt
grep -wv "1"  ${tmpdir}/sum_24hr.txt >  ${tmpdir}/dup_sum_week.txt

totalweek=`wc -l ${tmpdir}/allpast_week.txt |  awk '{ print $1; }'`
totdupweek=`wc -l ${tmpdir}/dup_sum_week.txt |  awk '{ print $1; }'`

echo >> /tmp/report.txt
echo "# For past 1 Week :" >> /tmp/report.txt
echo "Total mail sent since last week-> $totalweek" >>  /tmp/report.txt
echo "Total email address receiving duplicate email during last week-> $totdupweek" >> /tmp/report.txt

/usr/bin/mutt -a $tmpdir/dup_sum_*  -e "my_hdr From:system@server.com" -s "No reply: Hourly,4 hour,24 hour and weekly report" -- urgen@gmail.com,user@example.com < /tmp/report.txt
