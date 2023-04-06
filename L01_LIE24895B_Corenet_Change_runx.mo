$date = `date +%y%m%d-%H%M`

cvms Pre_IP_VLAN_Change_$date

// 2hr fallback
set BrmFailsafeBackup=1 timeoutLength 7200

acc BrmFailsafeBackup activate


//$New_VLAN is new Corenet VLAN
crn Transport=1,VlanPort=$New_VLAN
encapsulation EthernetPort=TN_A
vlanId $New_VLAN
end

set Transport=1,Router=LTE,InterfaceIPv4=1 encapsulation VlanPort=$New_VLAN

//$New_corenet_IP is CP/UP IP address
set Transport=1,Router=LTE,InterfaceIPv4=1,AddressIPv4=1 address $New_corenet_IP/29

//$New_corenet_default_gateway is Default Gateway of Corenet IP address
set Transport=1,Router=LTE,RouteTableIPv4Static=1,Dst=1,NextHop=1 address $New_corenet_default_gateway
