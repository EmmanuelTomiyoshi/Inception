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
	docker system prune
