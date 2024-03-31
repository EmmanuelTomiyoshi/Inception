HOST 			= etomiyos.42.fr
HTTP_HOST		= http://etomiyos.42.fr/

all: setup up

#INTRO
help:
	@cat makefile_manual.txt
	@echo "\nHow to use:"
	@echo "Wordpress\t\t: $(HTTP_HOST)"
	@echo "Wordpress Admin\t\t: $(HTTP_HOST)"

#SETUP
setup:
	sudo mkdir -p /home/etomiyos/data/mariadb
	sudo mkdir -p /home/etomiyos/data/wordpress
	sudo bash -c "grep '$(HOST)' /etc/hosts || echo '127.0.0.1 $(HOST)' >> /etc/hosts"

#MAIN ACTIONS
up:
	docker compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

re: down up

ls:
	docker image ls -a
	docker container ls -a
	docker volume ls
	docker network ls -f type=custom

disk:
	docker system df

#CLEAN AND REMOVE
fclean:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes

del:
	docker system prune --force

del_vol:
	docker volume prune -f

del_net:
	docker network prune --force

rm_host:
	sudo sed -i '/$(HOST)/d' /etc/hosts

purge: down fclean del del_vol del_net rm_host

#PHONY
.PHONY: all up down re ls disk setup fclean del del del_vol del_net rm_host purge