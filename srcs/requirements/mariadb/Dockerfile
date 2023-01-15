# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gkehren <gkehren@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/15 20:20:34 by gkehren           #+#    #+#              #
#    Updated: 2023/01/15 20:20:35 by gkehren          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.17

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

EXPOSE 3306
