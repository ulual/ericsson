$date = `date +%y%m%d-%H%M`

cvms Pre_IP_VLAN_Change_$date

// 2hr fallback
set BrmFailsafeBackup=1 timeoutLength 7200

acc BrmFailsafeBackup activate


//3053 is new Corenet VLAN
crn Transport=1,VlanPort=3053
encapsulation EthernetPort=TN_A
vlanId 3053
end

set Transport=1,Router=LTE,InterfaceIPv4=1 encapsulation VlanPort=3053

//42.121.131.180 is CP/UP IP address
set Transport=1,Router=LTE,InterfaceIPv4=1,AddressIPv4=1 address 42.121.131.180/29

//42.121.131.161 is Default Gateway of Corenet IP address
set Transport=1,Router=LTE,RouteTableIPv4Static=1,Dst=1,NextHop=1 address 42.121.131.161
