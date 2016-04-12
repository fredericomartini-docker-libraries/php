FROM fredericomartini/php:5.6-prod
MAINTAINER Frederico Martini <fredmalmeida@gmail.com>

# Let the conatiner know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

ADD php.sh /usr/sbin/
ADD https://getcomposer.org/download/1.0.0/composer.phar /bin/composer

RUN chmod +x /bin/composer
#RUN adduser composer
#RUN chown composer:composer /bin/composer
RUN chmod +x /usr/sbin/php.sh
RUN sh /usr/sbin/php.sh


#teste
#RUN adduser --disabled-password --gecos '' r
#ADD add-user.sh /usr/sbin/
#RUN chmod +x /usr/sbin/add-user.sh
#RUN sh /usr/sbin/add-user.sh

RUN adduser --disabled-password --gecos '' composer 
RUN adduser composer sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN chown composer:composer /bin/composer

#clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#USER composer

CMD ["service", "apache2", "restart"]

WORKDIR "/var/www/"
USER composer

