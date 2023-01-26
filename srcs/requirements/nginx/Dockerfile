# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gkehren <gkehren@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/15 20:20:30 by gkehren           #+#    #+#              #
#    Updated: 2023/01/26 15:21:36 by gkehren          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk update && apk upgrade && apk add --no-cache nginx openssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=gkehren/CN=gkehren.42.fr" -keyout /etc/nginx/privkey.pem -out /etc/nginx/cert.crt

COPY conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
