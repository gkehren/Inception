# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gkehren <gkehren@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/15 20:20:30 by gkehren           #+#    #+#              #
#    Updated: 2023/01/25 17:33:56 by gkehren          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.14

RUN apk update && apk upgrade && apk add --no-cache nginx openssl
RUN mkdir -p /var/www/html

COPY conf/default.conf /etc/nginx/http.d/default.conf
COPY tools/nginx.sh /tmp/nginx.sh

RUN chmod +x /tmp/nginx.sh

ENTRYPOINT [ "/tmp/nginx.sh" ]

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
