#!/bin/bash

apt-get update
apt-get install -y babeld
apt-get install -y net-tools
apt-get install -y iputils-ping

babeld -d 3 eth0

# while true
# do
#   # loop forever to keep the docker container running
#   sleep 1
# done
