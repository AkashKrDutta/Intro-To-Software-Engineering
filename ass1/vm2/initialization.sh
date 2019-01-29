#! /bin/bash
apt-get update
apt-get upgrade
apt-get install git

# Setup lamp server environment
apt-get install tasksel
tasksel install lamp-server

#configure the mysql server for remote connections from vm1
cat << EOF | mysql
GRANT ALL PRIVILEGES ON *.* TO 'vm1'@'%' IDENTIFIED BY 'vm1' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE DATABASE db1;
use db1;
CREATE TABLE table1 (
q1 FLOAT NOT NULL,
q2 FLOAT NOT NULL,
q3 FLOAT NOT NULL,
q4 FLOAT NOT NULL,
feed VARCHAR(500)
);
EOF


# change the binding as in stackoverflow
# This needs to be done manually as it is a configuration file. File is at /etc/mysql/mysql.conf.d/mysqld.cnf
