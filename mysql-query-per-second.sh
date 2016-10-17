    #!/bin/bash
    sel1=`mysql -e 'show global status like "Com_select"' | grep select | awk '{ print $2;}'` 
    sleep 1;
    sel2=`mysql -e 'show global status like "Com_select"' | grep select | awk '{ print $2;}'`
    echo $((sel2-sel1))" Select-Queries Per Seconds"
     # echo $[sel2-sel1]

    ins1=`mysql -e 'show global status like "Com_insert"' | grep insert | awk '{ print $2;}'`
    sleep 1;
    ins2=`mysql -e 'show global status like "Com_insert"' | grep insert | awk '{ print $2;}'`
    echo $[ins2-ins1]" Insert-Queries Per Seconds"

    up1=`mysql -e 'show global status like "Com_update"' | grep update | awk '{ print $2;}'`
    sleep 1
    up2=`mysql -e 'show global status like "Com_update"' | grep update | awk '{ print $2;}'`
    echo $[up2-up1]" Update-Queries Per Seconds"

    de1=`mysql -e 'show global status like "Com_delete"' | grep delete | awk '{ print $2;}'`
    sleep 1
    de2=`mysql -e 'show global status like "Com_delete"' | grep delete | awk '{ print $2;}'`
    echo $[de2-de1]" Delete-Queries Per Seconds"
