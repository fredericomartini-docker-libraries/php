#!/bin/bash
adduser --disabled-password --gecos '' composer 
adduser composer sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
#chown composer:composer /bin/composer
#su - composer
#composer install
