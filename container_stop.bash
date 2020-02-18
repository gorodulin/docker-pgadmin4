#!/bin/bash

source "${BASH_SOURCE%/*}/config"

exe docker stop $PGADMIN_CONTAINER_NAME
