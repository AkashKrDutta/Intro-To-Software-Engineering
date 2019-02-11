#!/bin/bash
while [ : ]
do
    echo $((1+$RANDOM%20)) > /dev/null
    sleep 1s
done
