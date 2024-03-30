help:
	@cat makefile_manual.txt
up:
	docker-compose -f ./srcs/docker-compose.yml up --build -d
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
fclean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes
del:
	docker system prune --force
del_vol:
	docker volume prune -f
purge: down fclean del del_vol