#!/bin/bash
cp ./vm1.service /etc/systemd/system/
service vm1 start
apt update 
apt install openssh-server


