#!/bin/bash
apt-get update
apt-get upgrade

# Setup lamp server environment
apt-get install tasksel
tasksel install lamp-server

#After apache is installed
cp -r ./* /var/www/html/


ssh-keygen

#check whether user@server is written correctly
ssh-copy-id akash@192.168.0.113

#check whether user@server is written correctly
ssh-copy-id akash2@192.168.0.114
