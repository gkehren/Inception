# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gkehren <gkehren@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/20 21:34:20 by gkehren           #+#    #+#              #
#    Updated: 2023/02/20 21:37:48 by gkehren          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@docker-compose -f ./srcs/docker-compose.yml up

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose 0f ./srcs/docker-compose.yml up --build

clean:
	@docker stop $${docker ps -a -q}; \
	docker rm $${docker ps -a -q}; \
	docker rmi -f $${docker images -q -a}; \
	docker volume rm $${docker volume ls -q}; \
	docker network rm $${docker network ls -q}; \

.PHONY: all down re clean
