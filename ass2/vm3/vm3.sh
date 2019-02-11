#!/bin/bash

#Change this ip and user to that of vm1 
ip1=192.168.0.113
user1=akash

#Change this ip to that of vm2
ip2=192.168.0.114
user2=akash2

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

            systemctl --host $user1@$ip1 is-active vm1.service
            
    fi



    if [[ "$(ping -c 1 $ip2 | grep '0% packet loss' )" != "1 packets transmitted, 1 received, 0% packet loss, time 0ms" ]];
    then
            echo "Host vm2 Unreachable!"
    else
	    echo "vm2 status:"
            systemctl --host $user2@$ip2 is-active vm2.service
            
    fi
 
    sleep $time
done
