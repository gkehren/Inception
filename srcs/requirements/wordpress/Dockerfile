# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gkehren <gkehren@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/16 01:09:40 by gkehren           #+#    #+#              #
#    Updated: 2023/02/20 22:15:18 by gkehren          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk update && apk upgrade && apk add --no-cache wget \
		php7 php7-phar php7-json php7-curl php7-fpm php7-mysqli php7-iconv

# Configure PHP
RUN adduser -S nginx && addgroup -S nginx
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf
RUN mkdir /run/php
COPY conf/wp-config.php /var/www/

COPY tools/wordpress.sh /tmp/wordpress.sh
RUN chmod +x /tmp/wordpress.sh
ENTRYPOINT [ "sh", "/tmp/wordpress.sh" ]
