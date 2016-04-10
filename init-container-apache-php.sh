#!/bin/bash
#start a container with apache-php 
#under port 5600
#to see log error's run the command: $ docker exec CONTAINER_ID tailf /var/log/apache2/error.log

###### VARIÁVEIS #####################
WEB_DIR_FILES='/var/www/'
CONTAINER_NAME='dev-php56-prod'
DOCKER_REPO_IMG_TAG='fredericomartini/php:5.6-prod'
LOCAL_PORT=5600 #start with the same php version
#####################################

/usr/bin/docker stop $CONTAINER_NAME
/usr/bin/docker rm $CONTAINER_NAME
/usr/bin/docker pull $DOCKER_REPO_IMG_TAG 

docker run  -d -p $LOCAL_PORT:80 --name $CONTAINER_NAME -v $WEB_DIR_FILES:/var/www/ $DOCKER_REPO_IMG_TAG /usr/sbin/apache2ctl -D FOREGROUND

