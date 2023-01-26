# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gkehren <gkehren@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/15 20:20:34 by gkehren           #+#    #+#              #
#    Updated: 2023/01/26 01:38:24 by gkehren          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

RUN mkdir -p /var/lib/mysqld /run/mysqld
COPY tools/create_db.sql /tmp/create_db.sql
COPY tools/mariadb.sh ./

RUN mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld

ENTRYPOINT [ "sh", "mariadb.sh" ]
