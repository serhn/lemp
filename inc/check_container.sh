if [ "$(docker ps -q -f name=$CONTAINER)" ]; then
   docker stop  $CONTAINER
   docker rm  $CONTAINER
fi
