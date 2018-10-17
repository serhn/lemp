#!/bin/sh
. inc/init.sh
#CONTAINER="mysql"
DB_LOCAL_DIR="$PWD/postgres105"
IMAGE="postgres:10.5"
DB_PORT="5432"

POSTGRES_USER="root"
POSTGRES_PASSWORD="testo"
POSTGRES_DB="callcenter"
DB_DIR="${PWD}/postgres105"
#FIRST START UNCOMMENT
#docker run -d \
#    --restart unless-stopped  \
#    --name=$CONTAINER   \
#    -p ${DB_PORT}:5432  \
#    -e "POSTGRES_PASSWORD=${POSTGRES_PASSWORD}" \
#    -e "POSTGRES_USER=${POSTGRES_USER}" \
#    -e "POSTGRES_DB=${POSTGRES_DB}" \
#    ${IMAGE}
#cp -a postgres105:/var/lib/postgresql/data postgres105
#if [ ! -d $DB_DIR  ]
#then
#    mkdir $DB_DIR
#fi
docker run -d \
    --restart unless-stopped  \
    --name=$CONTAINER   \
    -p ${DB_PORT}:5432  \
    -e "POSTGRES_PASSWORD=${POSTGRES_PASSWORD}" \
    -e "POSTGRES_USER=${POSTGRES_USER}" \
    -e "POSTGRES_DB=${POSTGRES_DB}" \
    -v ${DB_DIR}:/var/lib/postgresql/data \
    ${IMAGE}
echo "${BLUE}USER:${POSTGRES_USER}${NC}"
echo "${BLUE}PASSWORD:${POSTGRES_PASSWORD}${NC}"
echo "${BLUE}DB:${POSTGRES_DB}${NC}"
