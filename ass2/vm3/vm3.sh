#!/bin/bash

#Change this ip to that of vm1 
ip1=192.168.0.124

#Change this ip to that of vm2
ip2=192.168.0.125

if [[ "$#" -ne 1 ]]; then
    echo "Usage: ./vm3.sh <ping frequency in secs>"
    exit
fi
 
freq=$1
time="$1s"
while [ : ]
do
    if [[ "$(ping -c 1 $ip1 | grep '0% packet loss' )" != "1 packets transmitted, 1 received, 0% packet loss, time 0ms" ]];
    then
            echo "Host vm1 Unreachable!"
    else
	    echo "vm1 status:"
            systemctl --host kaushal@$ip1 is-active vm1.service
            
    fi



    if [[ "$(ping -c 1 $ip2 | grep '0% packet loss' )" != "1 packets transmitted, 1 received, 0% packet loss, time 0ms" ]];
    then
            echo "Host vm2 Unreachable!"
    else
	    echo "vm1 status:"
            systemctl --host kaushal@$ip1 is-active vm1.service
            
    fi
 
    sleep $time
done
