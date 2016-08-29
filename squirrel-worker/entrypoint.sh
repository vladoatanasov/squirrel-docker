#!/bin/bash

printf "Waiting for etcd to start\n"
httpstatus="000"
while [ $httpstatus -ne "200" ]; do
  httpstatus=$(curl -s -o /dev/null -I -w "%{http_code}" http://etcd:2379/v2/keys/squirrel/master_ifce)
done

# printf "Waiting for squirrel-master to start\n"
status=1
while [ $status -ne 0 ]; do
  nc -vz squirrel-master 1234
  status=$?
done

# babeld -d 3 eth0

(cd /tmp && ./squirrel-worker -m squirrel-master -i 1 -t tap0 &)

while true
do
  # loop forever to keep the docker container running
  sleep 1
done
