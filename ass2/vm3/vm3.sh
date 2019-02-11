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

echo "<link href=\"txtstyle.css\" rel=\"stylesheet\" type=\"text/css\" />" > output.html

 
freq=$1
time="$1s"
while [ : ]
do
    if [[ "$(ping -c 1 $ip1 | grep '0% packet loss' )" != "1 packets transmitted, 1 received, 0% packet loss, time 0ms" ]];
    then
            echo "Host vm1 Unreachable! <br>" >> output.html
    else
	    echo "vm1 status: <br>">> output.html

            systemctl --host $user1@$ip1 is-active vm1.service >> output.html
            echo "<br>">> output.html
    fi



    if [[ "$(ping -c 1 $ip2 | grep '0% packet loss' )" != "1 packets transmitted, 1 received, 0% packet loss, time 0ms" ]];
    then
            echo "Host vm2 Unreachable! <br>" >> output.html
    else
	    echo "vm2 status: <br>" >> output.html
            systemctl --host $user2@$ip2 is-active vm2.service >> output.html
            echo "<br>">> output.html
    fi
 
    sleep $time
done
