help:
	@cat makefile_manual.txt
up:
	docker-compose -f ./srcs/docker-compose.yml --env-file ./srcs/.env up --build
down:
	docker-compose -f ./srcs/docker-compose.yml down 
re: down up
ls:
	docker image ls -a
	docker container ls -a
	docker volume ls
	docker network ls -f type=custom
usage:
	docker system df
setup:
	sudo mkdir -p /home/etomiyos/data/mariadb
	sudo mkdir -p /home/etomiyos/data/wordpress
	sudo bash -c "grep 'etomiyos.42.fr' /etc/hosts || echo '127.0.0.1 etomiyos.42.fr' >> /etc/hosts"
fclean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes
del:
	docker system prune --force
del_vol:
	docker volume prune -f
del_net:
	docker network prune --force
purge: down fclean del del_vol del_net