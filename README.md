# PHP
### Repository to manage Dockerfiles of Php

#### - Running under:
* debian 8.4 see more [Debian 8.4](https://github.com/fredericomartini-docker-libraries/debian/tree/8.4)
* apache 2.4 see more [apache 2.4-dev](https://github.com/fredericomartini-docker-libraries/apache/tree/apache-2.4-dev)

#### - PHP Version 7.0.5-1~dotdeb+8.1 

#### - Installed:

 - php7.0
 - libapache2-mod-php7.0
 - php7.0-curl
 - php7.0-gd
 - php7.0-mcrypt
 - php7.0-intl
 - php7.0-sqlite3
 - php7.0-mysql
 - php7.0-pgsql
 - php7.0-dev
 - php7.0-bz2
 - php7.0-gmp
 - php7.0-xml 
 - php7.0-soap
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

#### Available at: [http://localhost:7000](http://localhost:7000)
