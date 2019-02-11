#!/bin/bash
cp ./vm2.service /etc/systemd/system/
service vm2 start 
apt update
apt install openssh-server


