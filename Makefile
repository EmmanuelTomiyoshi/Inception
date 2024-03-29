docker_up:
	docker-compose -f ./srcs/docker-compose.yml up --build -d
docker_down:
	docker-compose -f ./srcs/docker-compose.yml down
docker_re: docker_down docker_up
