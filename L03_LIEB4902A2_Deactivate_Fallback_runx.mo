acc BrmFailsafeBackup deactivate
1

//2582 and 4001 are OLD Corenet and NMNET VLAN
del Transport=1,VlanPort=2582

$date = `date +%y%m%d-%H%M`
cvms Post_IP_VLAN_Change_$date