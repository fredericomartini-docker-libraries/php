FROM fredericomartini/php:5.6-prod
MAINTAINER Frederico Martini <fredmalmeida@gmail.com>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive
ENV COMPOSER_LINK https://getcomposer.org/download/1.0.0/composer.phar
ENV COMPOSER_BIN_DIR /bin
ADD php.sh /usr/sbin/
ADD composer.sh /usr/sbin/
RUN chmod +x /usr/sbin/php.sh
RUN chmod +x /usr/sbin/composer.sh
RUN sh /usr/sbin/php.sh
#RUN composer.sh
RUN ["wget", "$COMPOSER_LINK", "$COMPOSER_BIN_DIR/composer"]

#clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["service", "apache2", "restart"]
