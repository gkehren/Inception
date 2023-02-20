#!/bin/sh

if [ ! -f "./wordpress/wp-config.php" ]; then
	echo "Downloading Wordpress"
	mkdir -p /var/www/html/wordpress;
	wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html/wordpress;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/wp-config.php;
	echo "Wordpress creating user"
	wp core install --allow-root --url=${WORDPRESS_URL} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL};
	wp user create --allow-root ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${WORDPRESS_USER_PASSWORD};
fi

echo "Wordpress is ready!"
/usr/sbin/php-fpm7 -F -R
