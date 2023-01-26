# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gkehren <gkehren@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/15 20:20:34 by gkehren           #+#    #+#              #
#    Updated: 2023/01/26 19:38:53 by gkehren          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk update && apk upgrade && apk add --no-cache openrc \
	mariadb mariadb-client mariadb-common mariadb-server-utils

RUN rm -f /etc/mysql/my.cnf /etc/my.cnf ~/my.cnf
COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/my.cnf /etc/my.cnf
COPY conf/my.cnf ~/my.cnf

RUN mkdir -p /var/lib/mysql /run/mysqld
RUN chown -R mysql /var/lib/mysql
RUN chmod 777 /var/lib/mysql

COPY tools/mariadb.sh mariadb.sh
RUN chmod +x mariadb.sh

ENTRYPOINT [ "sh", "mariadb.sh" ]

EXPOSE 3306
