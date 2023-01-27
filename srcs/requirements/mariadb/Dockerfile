# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gkehren <gkehren@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/15 20:20:34 by gkehren           #+#    #+#              #
#    Updated: 2023/01/26 22:06:56 by gkehren          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

COPY tools/mariadb.sh /tmp/mariadb.sh
RUN chmod +x /tmp/mariadb.sh

ENTRYPOINT [ "sh", "/tmp/mariadb.sh" ]
