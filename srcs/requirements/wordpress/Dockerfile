# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gkehren <gkehren@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/16 01:09:40 by gkehren           #+#    #+#              #
#    Updated: 2023/01/26 01:14:09 by gkehren          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk update && apk upgrade && apk add --no-cache curl \
	php7 php7-phar php7-json php7-curl php7-fpm php7-mysqli php7-iconv

RUN mkdir -p /var/www/wordpress /usr/local/bin/wp
RUN	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/bin/wp
RUN chmod +x ./usr/bin/wp
RUN wp core download --path=/var/www/wordpress --version=5.8.1
WORKDIR /var/www/wordpress

COPY conf/wp-config /config/wp-config
COPY tools/wordpress.sh /usr/local/bin/wordpress.sh
RUN chmod +x /usr/local/bin/wordpress.sh

ENTRYPOINT [ "sh", "/usr/local/bin/wordpress.sh" ]
