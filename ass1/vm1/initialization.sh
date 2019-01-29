#! /bin/bash
apt-get update
apt-get upgrade

# Setup lamp server environment
apt-get install tasksel
tasksel install lamp-server

#Install git to clone repos online
apt-get install git

#extract files for vm1 to /var/www/html
git clone https://github.com/AkashKrDutta/Intro-To-Software-Engineering
cp ./Intro-To-Software-Engineering/ass1/vm1/* /var/www/html/
