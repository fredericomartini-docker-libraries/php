FROM fredericomartini/php:5.6-prod
MAINTAINER Frederico Martini <fredmalmeida@gmail.com>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive
ADD php.sh /usr/sbin/
RUN chmod +x /usr/sbin/php.sh
RUN sh /usr/sbin/php.sh

#clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["service", "apache2", "restart"]
