#!/bin/bash
#init container with apache
#to see environment localhost:5600
#to see log error's  $ docker exec CONTAINER_ID tailf /var/log/apache2/error.log

###### VARIABLES #####################
WEB_DIR_FILES='/var/www/'
CONTAINER_NAME='dev-php56-dev'
DOCKER_REPO_IMG_TAG='fredericomartini/php:5.6-dev'
LOCAL_PORT=5601 #start with the same version php
#####################################

/usr/bin/docker stop $CONTAINER_NAME
/usr/bin/docker rm $CONTAINER_NAME
/usr/bin/docker pull $DOCKER_REPO_IMG_TAG 

docker run  -d -p $LOCAL_PORT:80 --name $CONTAINER_NAME -v $WEB_DIR_FILES:/var/www/ $DOCKER_REPO_IMG_TAG /usr/sbin/apache2ctl -D FOREGROUND

