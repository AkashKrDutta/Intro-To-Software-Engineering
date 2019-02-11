#!/bin/bash
while [ : ]
do
    echo $((50+$RANDOM%30)) > /dev/null
    sleep 1s
done
