#powershell script to failover to services on another
#service names
$servicegroup = "snmp","snmptrap"
#backup server hostname
$standbyserver_hostname="server2"
$counter=0
#$global_counter=0

#first check services locally
foreach($service in $servicegroup) {
        $arrService = Get-Service -Name $service
        if ($arrService.Status -ne "Running"){
        $counter=$counter+1
         }
}

if($counter -gt 0){
    foreach($job in $servicegroup){
                 echo "Stopping: $job"
                 Get-Service -Name $job | Stop-Service
                 Get-Service $job -ComputerName $standbyserver_hostname | Start-Service
             } 
}
else {
    foreach($job in $servicegroup){
        Get-Service $job -ComputerName $standbyserver_hostname | Stop-Service
        } 
}
#if($counter -gt 0){
#restart-computer
#}
