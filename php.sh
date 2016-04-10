#!/usr/bin/env bash
#Created by fred-pc on 12/5/15.
PHP_DIR='/etc/php5/apache2'

apt-get update
apt-get install php5 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-intl php-apc php5-sqlite php5-mysql php5-pgsql php-pear php5-dev -y
INSTALL_SUCCESS=$?

#verifica se foi instalado com sucesso
if [ ! $INSTALL_SUCCESS -eq 0 ]; then
    echo "Erro na instalação do PHP"
else
    sed -i "s,error_reporting =.*,error_reporting = E_ALL,g" $PHP_DIR/php.ini
    sed -i "s,display_errors =.*,display_errors = On,g" $PHP_DIR/php.ini
    sed -i "s,;date.timezone =.*,date.timezone = America/Sao_Paulo,g" $PHP_DIR/php.ini
    sed -i "s,;default_charset =.*,default_charset = \"UTF-8\",g" $PHP_DIR/php.ini 
    sed -i "s,short_open_tag =.*,short_open_tag = On,g" $PHP_DIR/php.ini 
fi
