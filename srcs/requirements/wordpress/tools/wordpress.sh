#!/bin/sh

if [ ! -f ./wordpress/wp-config.php ]; then
	echo "Downloading Wordpress"
	wget -q https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	rm -rf latest.tar.gz

	# Copy the config file
	rm -rf /etc/php/7.3/fpm/pool.d/www.conf
	mv ./www.conf /etc/php/7.3/fpm/pool.d/

	# wordpress config
	cd /var/www/html/wordpress
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOST/g" wp-config-sample.php
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php
	echo "Wordpress downloaded"
else
	echo "Wordpress already installed"
fi
