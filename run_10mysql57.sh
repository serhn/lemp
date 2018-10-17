#!/bin/sh
. inc/init.sh
#CONTAINER="mysql"
MYSQL_LOCAL_DIR="$PWD/mysql57"
IMAGE="mysql:5.7"
MYSQL_PORT="3306"
MYSQL_ROOT_PASSWORD="testo"
docker run -d \
    --restart unless-stopped  \
    --name=$CONTAINER   \
     -v ${MYSQL_LOCAL_DIR}/db:/var/lib/mysql  \
     -v ${MYSQL_LOCAL_DIR}/log:/var/log/mysql  \
     -v ${MYSQL_LOCAL_DIR}/etc:/etc/mysql  \
     -p ${MYSQL_PORT}:3306  \
        ${IMAGE}
