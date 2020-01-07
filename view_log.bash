#!/bin/bash

source "${BASH_SOURCE%/*}/config"

exe docker logs -f $PGADMIN_CONTAINER_NAME
