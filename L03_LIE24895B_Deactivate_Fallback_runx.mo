acc BrmFailsafeBackup deactivate
1

//$Old_VLAN and 4001 are OLD Corenet and NMNET VLAN
del Transport=1,VlanPort=$Old_VLAN

$date = `date +%y%m%d-%H%M`
cvms Post_IP_VLAN_Change_$date
