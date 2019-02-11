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

outputFile="./output.html"

vm1Machine=0
vm1Status=0
vm2Machine=0
vm2Status=0

echo -e "<link href=\"txtstyle.css\" rel=\"stylesheet\" type=\"text/css\" /> \nvm1Machine = $vm1Machine \nvm1Service = $vm1Status\nvm2Machine = $vm2Machine \nvm2Service = $vm2Status" > $outputFile



freq=$1
time="$1s"
while [ : ]
do

    if [[ "$(ping -c 1 $ip1 | grep '0% packet loss' )" != "1 packets transmitted, 1 received, 0% packet loss, time 0ms" ]];
    then
	    vm1Machine=0
    else
            vm1Machine=1
	    if [[ "$(sudo -u akash systemctl --host $user1@$ip1 is-active vm1.service)" != "active" ]];then
		vm1Status=0
	    else
		vm1Status=1
	    fi
    fi



    if [[ "$(ping -c 1 $ip2 | grep '0% packet loss' )" != "1 packets transmitted, 1 received, 0% packet loss, time 0ms" ]];
    then
	    vm2Machine=0
    else
            vm2Machine=1
	    if [[ "$(sudo -u akash systemctl --host $user1@$ip1 is-active vm1.service)" != "active" ]];then
		vm2Status=0
	    else
		vm2Status=1
	    fi
    fi

    echo -e "<link href=\"txtstyle.css\" rel=\"stylesheet\" type=\"text/css\" /> \nvm1Machine = $vm1Machine \nvm1Service = $vm1Status\nvm2Machine = $vm2Machine \nvm2Service = $vm2Status" > $outputFile

    sleep $time


done
