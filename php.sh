#!/usr/bin/env bash
PHP_DIR='/etc/php5/apache2'
#Created by fred-pc on 12/5/15.

#install xdebug
pecl install xdebug

#install PHP_CodeSniffer
pear install PHP_CodeSniffer

sed -i "s,error_reporting =.*,error_reporting = E_ALL,g" $PHP_DIR/php.ini
sed -i "s,display_errors =.*,display_errors = On,g" $PHP_DIR/php.ini
sed -i "s,;date.timezone =.*,date.timezone = America/Sao_Paulo,g" $PHP_DIR/php.ini
sed -i "s,;default_charset =.*,default_charset = \"UTF-8\",g" $PHP_DIR/php.ini
#needed sapu short_open_tag
sed -i "s,short_open_tag =.*,short_open_tag = On,g" $PHP_DIR/php.ini

#xdebug 
#sed -i "1s,^,[ Xdebug ]\nextension=xdebug.so\n\n,g" /etc/php5/apache2/php.ini

# not generate error "XDEBUG NOT LOADED AS ZEND EXTENSION"
sed -i "1s,^,[ Xdebug ]\nzend_extension=/usr/lib/php5/20131226/xdebug.so\n\n,g" $PHP_DIR/php.ini

