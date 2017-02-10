    #!/bin/bash
    output="/tmp/accountusage"
    domain="classictech.org.np"
    SendTo="urgen@example.com"

    rm -f $output
    touch $output

    server=`zmhostname`
    /opt/zimbra/bin/zmprov gqu $server|grep $domain|awk {'print $1" "$3" "$2'}|sort|while read line
    do
    usage=`echo $line|cut -f2 -d " "`
    quota=`echo $line|cut -f3 -d " "`
    user=`echo $line|cut -f1 -d " "`
    status=`/opt/zimbra/bin/zmprov ga $user | grep  ^zimbraAccountStatus | cut -f2 -d " "`
    echo "$user `expr $usage / 1024 / 1024`Mb `expr $quota / 1024 / 1024`Mb ($status account)" >> $output
    done

    cat $output | mail @SendTo -s"Mailbox Usages for $domain"

    # yum install mailx
    # chown zimbra:zimbra mailsummary.sh 
    # crontab -e
      1 8 * * * /path/to/mailsummary.sh
