	#!/bin/bash
#created by fred-pc on 10/03/16.
PHP_DIR='/etc/php/7.0/apache2'
#add repository to php 7

cat > /etc/apt/sources.list.d/php7.list <<EOF 
deb http://packages.dotdeb.org jessie all
deb-src http://packages.dotdeb.org jessie all

EOF

#adding public key
echo `curl -O https://www.dotdeb.org/dotdeb.gpg` >> dotdeb.gpg
apt-key add dotdeb.gpg
rm -rf dotdeb.gpg

#update
apt-get update

apt-get -y install php7.0 libapache2-mod-php7.0 php7.0-curl php7.0-gd php7.0-mcrypt php7.0-intl php7.0-sqlite3 php7.0-mysql php7.0-pgsql php7.0-dev php7.0-bz2 php7.0-gmp wget nano
INSTALL_SUCCESS=$?

#verifica se foi instalado com sucesso
if [ ! $INSTALL_SUCCESS -eq 0 ]; then
    echo "Erro na instalação do PHP"
else
	#download and install pear
	#pear
	wget http://pear.php.net/go-pear.phar
	php go-pear.phar

	#download PHPMD https://phpmd.org/ to /bin folder
	wget -O /bin/phpmd http://static.phpmd.org/php/latest/phpmd.phar
	chmod 755 /bin/phpmd

	#delete file
	rm -rf go-pear.phar

	#install PHP_CodeSniffer
	pear install PHP_CodeSniffer

	#xdebug 2.4.0rc2 manual installation
	wget http://xdebug.org/files/xdebug-2.4.0rc2.tgz
	mv xdebug-2.4.0rc2.tgz /tmp/
	cd /tmp/
	tar -xvzf xdebug-2.4.0rc2.tgz

	#delete file
	rm -rf xdebug-2.4.0rc2.tgz
	cd xdebug-2.4.0RC2/

	#reconfigure php
	/usr/bin/phpize7.0
	./configure --enable-xdebug --with-php-config=/usr/bin/php-config7.0
	make
	cp modules/xdebug.so /usr/lib/php/20151012/

	#configure php.ini
	sed -i "s,error_reporting =.*,error_reporting = E_ALL,g" $PHP_DIR/php.ini 
	sed -i "s,display_errors =.*,display_errors = On,g" $PHP_DIR/php.ini
	sed -i "s,;date.timezone =.*,date.timezone = America/Sao_Paulo,g" $PHP_DIR/php.ini
	sed -i "s,;default_charset =.*,default_charset = \"UTF-8\",g" $PHP_DIR/php.ini
	#short_open_tag <?=
	sed -i "s,short_open_tag =.*,short_open_tag = On,g" $PHP_DIR/php.ini
	sed -i "1s,^,[ Xdebug ]\nzend_extension=/usr/lib/php/20151012/xdebug.so\n\n,g" $PHP_DIR/php.ini
fi

