#!/bin/bash
grep 'status=sent' /var/log/maillog | grep -v "axonadvis" | grep "to=" |  awk -F"[<>]" '{print $2}' | sort | uniq -c |  awk '{ print $1" "$2; }' | sort -nr > /var/log/summary_`date +%F-%H`.txt

grep -wv "1" /var/log/summary_`date +%F-%H`.txt > /var/log/sorted_summary_`date +%F-%H`.txt

echo "This is an automated report. Please see the attached txt file to check if duplicate emails are sent,if file is blank then no duplicates are sent" | /usr/bin/mutt -a "/var/log/sorted_summary_`date +%F-%H`.txt" -e "my_hdr From:system@axonadvisers.com" -s "No reply: Duplicate Summary" --  johndoe@example.com,user101@hubgit.com,user111@football.com
