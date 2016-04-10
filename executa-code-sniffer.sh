#!/bin/bash
# inicializa um container com phpcs p/ efetuar testes no arquivo ou diretório 
# passado como parametro
# ex: de utilização: ./executa-code-sniffer.sh help mostra as opções para utilizar com CodeSniffer


###### VARIÁVEIS #####################
WEB_DIR_FILES='/var/www/'
CONTAINER_NAME='code-sniffer-php56'
DOCKER_REPO_IMG_TAG='200.17.170.182:5000/php:5.6-xdebug-phpcs'  #ex: fredericomartini/apache:2.0
#####################################

/usr/bin/docker stop $CONTAINER_NAME  > /dev/null 2>&1 #nao mostra saida em tela
/usr/bin/docker rm $CONTAINER_NAME  > /dev/null 2>&1 
/usr/bin/docker pull $DOCKER_REPO_IMG_TAG  > /dev/null 2>&1

docker run --name $CONTAINER_NAME -v $WEB_DIR_FILES:/var/www/ $DOCKER_REPO_IMG_TAG phpcs --colors $1 $2 $3 $4 $5 $6 $7 #parametros passados dinamicamente exemplo --report=full --standart=zend p/ mais informacoes utilizar help 

