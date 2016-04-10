# php
### Repository to manage Dockerfiles of Php

#### - Running at:
* debian 8.3 
* apache 2.4 see more [apache2.4-dev](https://github.com/fredericomartini-docker-libraries/apache/tree/apache-2.4-dev)

#### - PHP Version 5.6.17-0+deb8u1

#### - Installed:

    php5-curl 
    php5-gd 
    php5-mcrypt php5-intl 
    php-apc 
    php5-sqlite 
    php5-mysql 
    php5-pgsql 
    php-pear 
    php5-dev 
   
### Xdebug
### PHP_CodeSniffer  

#### - php.ini config:

    error_reporting = E_ALL
    display_errors = On
    date.timezone = America/Sao_Paulo
    default_charset = "UTF-8"
    short_open_tag = On

#### - To run environment:

    sudo chmod +x init-container-apache-php.sh

[http://localhost:5601](http://localhost:5601)
