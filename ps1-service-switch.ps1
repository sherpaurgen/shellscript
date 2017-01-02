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
        #increase counter by 1 if any 1 service is down on primaryserver
        $counter=$counter+1
         }
}
#action to take if any one service is down on primaryserver
if($counter -gt 0){
    foreach($job in $servicegroup){
                 #echo "Stopping: $job"
                 #Stop all service on array
                 Get-Service -Name $job | Stop-Service
                 #Start all service listed on array at remote site
                 Get-Service $job -ComputerName $standbyserver_hostname | Start-Service
             } 
}
else {
#if all service are running locally then make sure those are not running on standby server
    foreach($job in $servicegroup){
        Get-Service $job -ComputerName $standbyserver_hostname | Stop-Service
        } 
}
#if($counter -gt 0){
#restart-computer
#}
