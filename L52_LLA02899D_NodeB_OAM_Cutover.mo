ACTION
(
       actionName deleteStaticRoute
       mo "ManagedElement=1,IpOam=1,Ip=1,IpRoutingTable=1"
       exception none
       nrOfParameters 1
           Struct
           nrOfElements 4
               destinationIpAddr String "0.0.0.0"
               destinationNetworkMask String "0.0.0.0"
               nextHopIpAddr String "$Old_nmnet_default_gateway" // Old NMNET default gateway towards 1st NG MAD pair
               routeMetric Integer 10
       returnValue none
)


ECHO "IP change "
ACTION
(
 actionName assignipaddress
 mo "ManagedElement=1,IpOam=1,Ip=1,IpHostLink=1"
 exception none
 nrOfParameters 6
    String "$New_nmnet_IP" // new NMNET IP address
    Integer 27
    String "$New_nmnet_default_gateway" // new NMNET default Gateway
    String "0.0.0.0"
    String "0.0.0.0"
    String "0.0.0.0"
 returnValue none
)