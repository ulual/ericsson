ECHO "Setting configAdmCountdown to 7200 120 minutes"
SET
(
   mo "ManagedElement=1,SwManagement=1,ConfigurationVersion=1"
   exception none
   configAdmCountdown Integer 7200
)
ECHO "Activate configCountdownActivated"
SET
(
   mo "ManagedElement=1,SwManagement=1,ConfigurationVersion=1"
   exception none
   configCountdownActivated Boolean true
)

ECHO "ADD new static route"
ACTION
(
 actionName addStaticRoute
 mo "ManagedElement=1,IpOam=1,Ip=1,IpRoutingTable=1"
 exception none
 nrOfParameters 5
    String "0.0.0.0"
    String "0.0.0.0"
    String "$New_nmnet_default_gateway" // new NMNET default Gateway
    Integer 10
    Boolean false
 returnValue none
)