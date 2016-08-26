#!/bin/bash

printf "Waiting for etcd to start\n"
while [ $httpstatus -ne "200" ]; do
  httpstatus=$(curl -s -o /dev/null -I -w "%{http_code}" http://etcd:2379/version)
done

keyexists=$(curl -s -o /dev/null -I -w "%{http_code}" http://etcd:2379/v2/keys/squirrel/master_ifce)
if [ keyexists != 200 ]
  then

    echo "Setting keys up"
    curl http://etcd:2379/v2/keys/squirrel/master_ifce -XPUT -d value="eth0"
    curl http://etcd:2379/v2/keys/squirrel/master/emulated_subnet -XPUT -d value="10.0.4.0/24"
    curl http://etcd:2379/v2/keys/squirrel/master/mobility_manager -XPUT -d value="StaticUniformPositions"
    curl http://etcd:2379/v2/keys/squirrel/master/mobility_manager_config_path -XPUT -d value="/squirrel/master/StaticUniformPositions.1"
    curl http://etcd:2379/v2/keys/squirrel/master/StaticUniformPositions.1/spacing -XPUT -d value="200"
    curl http://etcd:2379/v2/keys/squirrel/master/StaticUniformPositions.1/shape -XPUT -d value="Linear"
    curl http://etcd:2379/v2/keys/squirrel/master/september -XPUT -d value="September0th"
    curl http://etcd:2379/v2/keys/squirrel/master/september -XPUT -d value="September0th"
    curl http://etcd:2379/v2/keys/squirrel/master_uri -XPUT -d value="squirrel-master"
    curl http://etcd:2379/v2/keys/squirrel/worker_tap_name -XPUT -d value="tap0"
fi


# babeld -d 3 eth0

(cd /tmp && ./squirrel-master -debug)

while true
do
  # loop forever to keep the docker container running
  sleep 1
done
