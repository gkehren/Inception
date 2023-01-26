#!/bin/sh

sleep 5

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv -f wp-cli.phar /usr/local/bin/wp

/usr/local/bin/wp --info
/usr/local/bin/wp core download --path="/var/www/wordpress" --allow-root

rm -f /var/www/wordspress/wp-config.php
cp ./wp-config.php /var/www/wordpress/wp-config.php

/usr/local/bin/wp core install \
	--url=${WORDPRESS_URL} \
	--title=${WORDPRESS_TITLE} \
	--admin_user=${WORDPRESS_ADMIN_USER} \
	--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
	--admin_email=${WORDPRESS_ADMIN_EMAIL} \
	--path="/var/www/wordpress" \
	--skip-email \
	--allow-root

/usr/local/bin/wp user create \
	${WORDPRESS_USER} \
	${WORDPRESS_USER_EMAIL} \
	--role=author \
	--user_pass=${WORDPRESS_USER_PASSWORD} \
	--path="/var/www/wordpress" \
	--allow-root

exec php-fpm7 -F
