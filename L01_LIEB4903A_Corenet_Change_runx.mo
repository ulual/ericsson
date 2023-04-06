$date = `date +%y%m%d-%H%M`

cvms Pre_IP_VLAN_Change_$date

// 2hr fallback
set BrmFailsafeBackup=1 timeoutLength 7200

acc BrmFailsafeBackup activate


//3063 is new Corenet VLAN
crn Transport=1,VlanPort=3063
encapsulation EthernetPort=TN_A
vlanId 3063
end

set Transport=1,Router=LTE,InterfaceIPv4=1 encapsulation VlanPort=3063

//42.121.129.148 is CP/UP IP address
set Transport=1,Router=LTE,InterfaceIPv4=1,AddressIPv4=1 address 42.121.129.148/29

//42.121.129.129 is Default Gateway of Corenet IP address
set Transport=1,Router=LTE,RouteTableIPv4Static=1,Dst=1,NextHop=1 address 42.121.129.129
