#!/bin/bash

dynamic=$(ip a | awk '/enp0s3:/,/forever/ {print}' | grep -o dynamic)
mac=$( ip a | awk '/enp0s3:/,FN+4 && /link\/ether/ {if ($2 != "enp0s3:") print $2}' )
ip=$( ip a | awk '(/enp0s3/ && /inet/) {print $2 }' | cut -d / -f 1 )
gatewayip=$(ip r | awk '/default/ {print $3 }')
nicspeed=$(/sbin/ethtool enp0s3 | awk '/Speed/ {print $2 }')
nicduplex=$(/sbin/ethtool enp0s3 | awk '/Duplex/ {print $2 }')

echo "$dynamic" IPv4 address: "$ip"
echo MAC address: "$mac"
echo Gateway router: "$gatewayip"
cat /etc/resolv.conf | awk '(/search/ || /nameserver/) { if ( $1 == "nameserver") { print "DNS Server: " $2  } else { print "DNS Domain:" $2 } }'
echo NIC Speed: "$nicspeed"
echo NIC Duplex: "$nicduplex"
