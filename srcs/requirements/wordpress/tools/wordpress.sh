#!/bin/sh

target="/etc/php7/php-fpm.d/www.conf"
grep -E "listen = 127.0.0.1" $target > /dev/null 2>&1

if [ $? -eq 0 ]; then
	sed -i "s|.*listen = 127.0.0.1.*|listen = 9000|g" $target
	echo "env[MYSQL_HOST] = \"${MYSQL_HOST}\"" >> $target
	echo "env[MYSQL_USER] = \"${MYSQL_USER}\"" >> $target
	echo "env[MYSQL_PASSWORD] = \"${MYSQL_PASSWORD}\"" >> $target
	echo "env[MYSQL_DATABASE] = \"${MYSQL_DATABASE}\"" >> $target
fi

if [ ! -f "wp-config.php" ]; then
	cp /config/wp-config ./wp-config.php
	sleep 5;
	if ! mysqladmin -h $MYSQL_HOST -u $MYSQL_USER \
		--password=$MYSQL_PASSWORD --wait=60 ping > /dev/null; then
		printf "MySQL is not available.\n"
		exit 1
	fi
	wp core install --url=${WORDPRESS_URL} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} \
					--admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root

	wp user create ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} --role=author --user_pass=${WORDPRESS_USER_PASSWORD}
fi

php-fpm7 --nodemonize
