# PHP
### Repository to manage Dockerfiles of Php

#### - Running under:
* debian 8.4 see more [Debian 8.4](https://github.com/fredericomartini-docker-libraries/debian/tree/8.4)
* apache 2.4 see more [apache 2.4-dev](https://github.com/fredericomartini-docker-libraries/apache/tree/apache-2.4-dev)

#### - PHP Version 5.6.17-0+deb8u1

#### - Installed:

 - php5-curl 
 - php5-gd 
 - php5-mcrypt php5-intl 
 - php-apc 
 - php5-sqlite 
 - php5-mysql 
 - php5-pgsql 
 - php-pear 
 - php5-dev 
 - [XDEBUG 2.4.0](https://xdebug.org/)
 - [PHP_CodeSniffer 2.6.0](http://pear.php.net/package/PHP_CodeSniffer/redirected)
 - [PHP Mess Detector 2.4.2](https://phpmd.org/)

#### - php.ini config:

    error_reporting = E_ALL
    display_errors = On
    date.timezone = America/Sao_Paulo
    default_charset = "UTF-8"
    short_open_tag = On

#### - To run environment:

    sudo chmod +x init-container-apache-php.sh

    ./init-container-apache-php.sh

 #### - To validate code:
  
    sudo chmod +x validate-code.sh       
    
    ./validate-code $FILE_TO_CHECK $RULES

 - $FILES_TO_CHECK Can be passed a dir or single file
 - $RULES .xml file with rules Must be in # TODO aqui ajustar.. deixar dinâmico onde pega arquivos de regras.. 

#### Available at: [http://localhost:56001](http://localhost:5600)
