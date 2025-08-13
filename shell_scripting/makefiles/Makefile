DOCKER_COMPOSE := docker-compose
os := $(shell uname)

build: 
	@echo "Running in $(os)"
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down: 
	$(DOCKER_COMPOSE) down

clean: 
	docker system prune 

