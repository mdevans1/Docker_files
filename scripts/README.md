In CentOS 7 NetworkManager is handling all the new veth* interfaces created by a container
this list of interfaces is fed into firewalld for management.

When destroying a docker container the interface information is still held in NetworkManager and firewalld

Created clear_interfaces.sh in order to remove stale veth* interfaces from firewalld and NM

Script restarts NetworkManager which clears out all the interface information
Reloads firewalld to remove veth* from interface list

Usage: sudo ./clear_interfaces.sh


