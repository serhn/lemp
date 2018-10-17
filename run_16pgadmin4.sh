#!/bin/sh
. inc/init.sh
IMAGE="dpage/pgadmin4"
PGADMIN_DEFAULT_EMAIL="qwe@qwe.qwe"
PGADMIN_DEFAULT_PASSWORD="qwe"


WWW_PORT="8080"

docker run -d \
           -p $WWW_PORT:80 \
          --name $CONTAINER \
          -e "PGADMIN_DEFAULT_EMAIL=${PGADMIN_DEFAULT_EMAIL}" \
          -e "PGADMIN_DEFAULT_PASSWORD=${PGADMIN_DEFAULT_PASSWORD}" \
       --restart unless-stopped \
       $IMAGE
echo "${BLUE}http://localhost:$WWW_PORT${NC}  $CONTAINER"
echo "${GREEN}EMAIL:${PGADMIN_DEFAULT_EMAIL}${NC}"
echo "${GREEN}PASSWORD:${PGADMIN_DEFAULT_PASSWORD}${NC}"
