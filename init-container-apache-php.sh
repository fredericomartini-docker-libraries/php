#!/bin/bash
#inicializa um container c/ apache
#através da porta:7000 
#para verificar erros gerados no apache dentro do container executar o comando: $ docker exec CONTAINER_ID tailf /var/log/apache2/error.log

###### VARIÁVEIS #####################
WEB_DIR_FILES='/var/www/'
CONTAINER_NAME='php7.0-dev'
DOCKER_REPO_IMG_TAG='fredericomartini/php:7.0-dev'
LOCAL_PORT=7000 #colocar mesma versao do php como inicio de porta
#####################################

/usr/bin/docker stop $CONTAINER_NAME
/usr/bin/docker rm $CONTAINER_NAME
/usr/bin/docker pull $DOCKER_REPO_IMG_TAG 

docker run -d -p $LOCAL_PORT:80 --name $CONTAINER_NAME -v $WEB_DIR_FILES:/var/www/ $DOCKER_REPO_IMG_TAG /usr/sbin/apache2ctl -D FOREGROUND



