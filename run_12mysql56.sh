#!/bin/sh
#CONTAINER="mysql_mag"
. inc/init.sh
#MYSQL_LOCAL_DIR="$PWD/mysql57"
MYSQL_LOCAL_DIR="$PWD/mysql56"
#IMAGE="mysql:5.7.24"
IMAGE="mysql:5.6"
DB_PORT="3306"
if [ ! -d $MYSQL_LOCAL_DIR  ]
then
    #echo -n "Enter mysql ROOT PASSWORD: "
    #read MYSQL_ROOT_PASSWORD
    docker run \
        -e MYSQL_ROOT_PASSWORD=$DB_PASS \
        -e MYSQL_DATABASE=$DB_BASE \
        -d --name="$CONTAINER" $IMAGE
    docker exec  $CONTAINER sh -c "apt-get update && apt-get install -y procps"
    #docker exec -it mysql bash
    COUNT="0"
    START_CHECK="0"
    while [  $START_CHECK -le 0 ]
    do
       COUNT=$(( $COUNT + 1 ))
       sleep 1
       START_CHECK=`docker exec  $CONTAINER sh -c "ps xa | grep -E \"[0-9] mysqld$\" | grep -v grep | wc -l " | sed 's#[\n\r]##g'`
       echo "Wait start  ${COUNT}s"
    done
    mkdir ${MYSQL_LOCAL_DIR}
    docker cp -a $CONTAINER:/var/lib/mysql ${MYSQL_LOCAL_DIR}/db
    docker cp -a $CONTAINER:/var/log/mysql ${MYSQL_LOCAL_DIR}/log
    docker cp -a $CONTAINER:/etc/mysql ${MYSQL_LOCAL_DIR}/etc
    echo "$IMAGE" > ${MYSQL_LOCAL_DIR}/README.txt
    docker stop $CONTAINER
    docker rm  $CONTAINER
    echo "${BLUE}USER:${DB_USER}${NC}"
    echo "${BLUE}PASSWORD:${DB_PASS}${NC}"
fi
# -p ${DB_PORT}:3306  \
docker run -d \
    --restart unless-stopped  \
    --name=$CONTAINER   \
     -v ${MYSQL_LOCAL_DIR}/db:/var/lib/mysql  \
     -v ${MYSQL_LOCAL_DIR}/log:/var/log/mysql  \
     -v ${MYSQL_LOCAL_DIR}/etc:/etc/mysql  \
     -p ${DB_PORT}:3306 \
     -e TZ=${TZ} \
        ${IMAGE}
echo "${BLUE}DB:${DB_BASE}${NC}"
