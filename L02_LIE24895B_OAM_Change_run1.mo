//$New_nmnet_IP is the new OAM IP address
set Transport=1,Router=vr_OAM,InterfaceIPv4=1,AddressIPv4=1 address $New_nmnet_IP/27

//$New_nmnet_default_gateway new Default Gateway of NMNET IP address
set Transport=1,Router=vr_OAM,RouteTableIPv4Static=1,Dst=1,NextHop=1 address $New_nmnet_default_gateway
