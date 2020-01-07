#!/bin/bash

source "${BASH_SOURCE%/*}/config"

exe mkdir -p $PGADMIN_DATA_VOLUME_PATH
exe chmod 777 $PGADMIN_DATA_VOLUME_PATH

# Run container
exe docker run \
  --rm \
  --detach \
  -p $PGADMIN_EXPOSED_PORT:80 \
  -e PGADMIN_DEFAULT_EMAIL=$PGADMIN_DEFAULT_EMAIL \
  -e PGADMIN_DEFAULT_PASSWORD=$PGADMIN_DEFAULT_PASSWORD \
  --name=$PGADMIN_CONTAINER_NAME \
  --hostname=$PGADMIN_CONTAINER_HOSTNAME \
  --volume=$PGADMIN_DATA_VOLUME_PATH:/var/lib/pgadmin \
  --network=$PGADMIN_NETWORK_NAME \
  dpage/pgadmin4:$PGADMIN_VERSION

