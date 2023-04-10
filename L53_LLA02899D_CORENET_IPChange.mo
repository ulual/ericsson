///////////////////////////////////////////////////////////////////////////////////////////////
//                        Remove synchref, IPSync                                            //
//                                                                                           //
///////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////
///////                   IpSyncRef=1                               /////
/////////////////////////////////////////////////////////////////////////
//
//ACTION
//(
//    actionName removeSyncRefResource
//    mo "ManagedElement=1,TransportNetwork=1,Synchronization=1"
//    exception none
//    nrOfParameters 1
//        Reference "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=1"
//    returnValue none
//)
/////////////////////////////////////////////////////////////////////////
///////                   IpSyncRef=2                               /////
/////////////////////////////////////////////////////////////////////////
//ACTION
//(
//    actionName removeSyncRefResource
//    mo "ManagedElement=1,TransportNetwork=1,Synchronization=1"
//    exception none
//    nrOfParameters 1
//        Reference "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=2"
//    returnValue none
//)

///////////////////////////////////////////////////////////////////////////////////////////////
//ECHO "Setting administrativeState Integer 0"
//SET
//(
//    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=1"
//    exception none
//    administrativeState Integer 0
//)
//ECHO "Delete IpSyncRef"
//DELETE
//(
//    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=1"
//    exception none
//)
//ECHO "Setting administrativeState Integer 0"
//SET
//(
//    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=2"
//    exception none
//    administrativeState Integer 0
//)
//ECHO "Delete IpSyncRef"
//DELETE
//(
//    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=2"
//    exception none
//)
SET
(
    mo "ManagedElement=1,ENodeBFunction=1"
    exception none
        upIpAddressRef Ref "null"
)
SET
(
    mo "ManagedElement=1,ENodeBFunction=1"
    exception none
        sctpRef Ref "null"
)
SET
(
    mo "ManagedElement=1,TransportNetwork=1,Sctp=1"
    exception none
        ipAccessSctpRef Ref "null"
)
DELETE
(
    mo "ManagedElement=1,IpSystem=1,IpAccessSctp=1"
    exception none
)

ECHO "Setting administrativeState Integer 0"
SET
(
    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
    exception none
    administrativeState Integer 0
)

ECHO "Delete IpAccessHostEt"
DELETE
(
    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
    exception none
)

////////////////////////////////////////////////////////////////////////
///         create Ipinterface       for CBU                        ////
////////////////////////////////////////////////////////////////////////
ECHO "Delete IpInterface"
DELETE
(
    mo "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,ExchangeTerminalIp=1,GigaBitEthernet=1,IpInterface=2"
    exception none
)

ECHO "CREATE - Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,ExchangeTerminalIp=1,GigaBitEthernet=1,IpInterface=2"
CREATE
(
    parent "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,ExchangeTerminalIp=1,GigaBitEthernet=1"
    identity "2"
    moType IpInterface
    exception none
    nrOfAttributes 8
    userLabel String "Slot=2,DefaultRouter"
        defaultRouter0 String "$New_corenet_default_gateway" // New Corenet Default Gateway
        networkPrefixLength Integer 29
        rps Boolean false
        vLan Boolean true
        mtu Integer 1500
        trafficType Integer  7
        vid Integer $New_VLAN // Change the New VLAN if required
)


////////////////////////////////////////////////////////////////////////
//	Create IpAccessHostEt, IP Sync 				        		    //
///////////////////////////////////////////////////////////////////////
CREATE
(
    parent "ManagedElement=1,IpSystem=1"
    identity "1"
    moType IpAccessHostEt
    exception none
    nrOfAttributes 2
    ipAddress String "$New_corenet_IP" // new Corenet UP_CP IP address
    ipInterfaceMoRef Ref "ManagedElement=1,Equipment=1,Subrack=1,Slot=1,PlugInUnit=1,ExchangeTerminalIp=1,GigaBitEthernet=1,IpInterface=2"
)

SET
(
    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
    exception none
    administrativeState Integer 1
)

ECHO "CREATE - ManagedElement=1,IpSystem=1,IpAccessSctp=1"
CREATE
(
        parent "ManagedElement=1,IpSystem=1"
        identity "1"
        moType IpAccessSctp
        exception none
        nrOfAttributes 2
            userLabel String "1"
            ipAccessHostEtRef1 Ref "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
)

SET
(
    mo "ManagedElement=1,TransportNetwork=1,Sctp=1"
    exception none
        ipAccessSctpRef Ref "ManagedElement=1,IpSystem=1,IpAccessSctp=1"
)


SET
(
    mo "ManagedElement=1,ENodeBFunction=1"
    exception none
        upIpAddressRef Ref "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
)



SET
(
    mo "ManagedElement=1,ENodeBFunction=1"
    exception none
        sctpRef Ref "ManagedElement=1,TransportNetwork=1,Sctp=1"
)



ECHO "Setting administrativeState Integer 0"
SET
(
    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
    exception none
    administrativeState Integer 0
)


SET
(
    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
    exception none
    ipAddress String "$New_corenet_IP" // new Corenet UP_CP IP address
)


SET
(
    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
    exception none
    administrativeState Integer 1
)

/////////////////////////////////////////
//CREATE
//(
//    parent "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
//    identity "1"
//    moType IpSyncRef
//    exception none
//    nrOfAttributes 1
//        ntpServerIpAddress String "10.183.82.152"
//)
//CREATE
//(
//        parent "ManagedElement=1,IpSystem=1,IpAccessHostEt=1"
//        identity "2"
//        moType IpSyncRef
//        exception none
//        nrOfAttributes 1
//        ntpServerIpAddress String "10.183.82.153"
//)

////////////////////////////////////////////////////////////////////////
//   			Add synchref, IPSync                                  //
////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////
///////                   IpSyncRef=1                                /////
/////////////////////////////////////////////////////////////////////////
//ACTION
//(
//    actionName addSyncRefResource
//    mo "ManagedElement=1,TransportNetwork=1,Synchronization=1"
//    exception none
//    nrOfParameters 2
//        Reference "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=1"
//    Integer 2
//    returnValue none
//)
//ECHO "Setting administrativeState Integer 1"
//SET
//(
//    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=1"
//    exception none
//    administrativeState Integer 1
//)
/////////////////////////////////////////////////////////////////////////
///////                   IpSyncRef=2                                /////
/////////////////////////////////////////////////////////////////////////
//ACTION
//(
//    actionName addSyncRefResource
//    mo "ManagedElement=1,TransportNetwork=1,Synchronization=1"
//    exception none
//    nrOfParameters 2
//        Reference "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=2"
//    Integer 3
//    returnValue none
//)
//ECHO "Setting administrativeState Integer 1"
//SET
//(
//    mo "ManagedElement=1,IpSystem=1,IpAccessHostEt=1,IpSyncRef=2"
//    exception none
//    administrativeState Integer 1
//)