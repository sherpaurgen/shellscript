BASH shellscript and Python script 
scripts for daily use
requirements : linux, python version 2.7.x

Delineate(correctly represent) variables:-


    [root@vm1 test]#n="demo"

    [root@vm1 test]#echo $n

    demo

    [root@vm1 test]#echo $ntest

    [root@vm1 test]#echo ${n}test    ######## ${var_name} will do the task  #####

    demotest


cat demo.sh 

script to create 40 files 1MB each


    for i in `seq 1 40`

    do

    dd if=/dev/zero of=${i}_test_a bs=1024 count=1024

    done

 
FILE GLOBBING or Dynamic filename generation

The shell is also responsible for  file globbing(or dynamic filename generation).

    ls file* or ls *file*   ## 1file12A  file999 

    ls file??   #matches exactly 2 characters after "file" #eg file12 fileAb

    ls File[Aa]

    FileA

    ls File[Aa]?    #matches 'A' or 'a' and one char after [Aa]

    Fileab  FileAB

    ls File[!Aa]?    #do not list with [Aa]

    File55

    ls File[a-z][A-Z] 
  
    tr = translate , cut command examples

    cat /etc/passwd |cut -d":" -f1,4 |tr ':' ' ' | tr 'a-z' 'A-Z'

    POSTGRES 26

    MAILREADER 12

    NAMED 25

    USER2 502

    cat demo.txt  | tr -s ' '     ##this i will replace multiple spaces with single space

    cat demo.txt | tr '\n' ' '   ##replace newline with single space


wget  -m ftp://admin640:sdfPO_09w0rd@49.255.62.9/httpdocs/

View memory used by apache2

    ps -C apache2 -O rss | grep -v "RSS" | awk '{ sum+=$2;} END { print sum/1024 " MB"; }'

      -C = command or binary used to start process
      -O = options

 Alternate way :- view memory used by nginx and apache

    ps aux | grep  -E "nginx|apache" | grep -v "grep" | awk '{ sum+=$6; } END { print sum/1024 " MB"; }'

  Some grep methods to match 'and,or '

         ---OR---
grep -E 'Tech|Sales' employee.txt
grep 'Tech\|Sales' employee.txt
grep -e pattern1 -e pattern2 filename

        ---AND----
grep -E 'pattern1.*pattern2' filename

grep -E 'pattern1.*pattern2|pattern2.*pattern1' filename

    k=0
    for i in `cat score`; do 
    if [ $i -ge 219 ] 
    then 
      k=$((k+1))
    fi
    done
    echo $k

awk ' $1 < 220 ' score | wc -l






