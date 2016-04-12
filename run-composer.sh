#!/bin/bash
#init container with apache
#to see environment localhost:5600
#to see log error's  $ docker exec CONTAINER_ID tailf /var/log/apache2/error.log

###### VARIABLES #####################
WEB_DIR_FILES='/var/www/'
CONTAINER_NAME='php56-composer'
DOCKER_REPO_IMG_TAG='fredericomartini/php:5.6-composer'
#LOCAL_PORT=5601 #start with the same version php
#####################################

#/usr/bin/docker stop $CONTAINER_NAME
#/usr/bin/docker rm $CONTAINER_NAME
#/usr/bin/docker pull $DOCKER_REPO_IMG_TAG 

docker run --name $CONTAINER_NAME -v $(pwd):/var/www/ $DOCKER_REPO_IMG_TAG composer $1

