//11.249.131.180 is the new OAM IP address
set Transport=1,Router=vr_OAM,InterfaceIPv4=1,AddressIPv4=1 address 11.249.131.180/27

//11.249.131.161 new Default Gateway of NMNET IP address
set Transport=1,Router=vr_OAM,RouteTableIPv4Static=1,Dst=1,NextHop=1 address 11.249.131.161
