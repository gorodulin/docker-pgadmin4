#!/bin/bash

SCRIPT=`realpath -s $0`
SCRIPTPATH=`dirname $SCRIPT`
source $SCRIPTPATH/../config

if [ ! "$(docker ps -q -f name=$PGADMIN_CONTAINER_NAME)" ]; then
  echo "Container $PGADMIN_CONTAINER_NAME is not running"
  exit 0
fi

exe cp servers.json $PGADMIN_DATA_VOLUME_PATH/servers.json
exe chmod 666 $PGADMIN_DATA_VOLUME_PATH/servers.json
exe docker exec $PGADMIN_CONTAINER_NAME /usr/local/bin/python3 /pgadmin4/setup.py --load-servers /var/lib/pgadmin/servers.json --user $PGADMIN_DEFAULT_EMAIL
exe rm $PGADMIN_DATA_VOLUME_PATH/servers.json
