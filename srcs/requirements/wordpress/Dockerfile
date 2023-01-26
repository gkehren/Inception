# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gkehren <gkehren@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/16 01:09:40 by gkehren           #+#    #+#              #
#    Updated: 2023/01/26 16:06:46 by gkehren          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk update && apk upgrade && apk add --no-cache curl \
	php7 php7-phar php7-json php7-curl php7-fpm php7-mysqli php7-iconv

RUN  rm -f /etc/php7/php-fpm.d/www.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

RUN mkdir -p /var/www/wordpress
RUN	adduser -u 82 -D -S -G www-data www-data
RUN chmod -R 777 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

COPY conf/wp-config.php ./wp-config.php
COPY tools/wordpress.sh /tmp/wordpress.sh
RUN chmod +x /tmp/wordpress.sh

ENTRYPOINT [ "sh", "/tmp/wordpress.sh" ]
