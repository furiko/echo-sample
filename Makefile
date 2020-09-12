SERVER_REPOSITORY_NAME:=furiko/echo-sample
SERVER_CONTAINER_NAME:=echo-sample-server

HOST_APP_BASE:=$(shell pwd)
DOCKER_APP_BASE:=/go/src/github.com/furiko/echo-sample

local/run:
	$(MAKE) run
	@echo 'connect server port :8000 !!!'

docker/run:
	$(MAKE) docker/run/server

docker/run/server:
	docker run -d --name $(SERVER_CONTAINER_NAME) -p 8000:8000 -v $(HOST_APP_BASE):$(DOCKER_APP_BASE) $(SERVER_REPOSITORY_NAME):latest
	@echo 'connect server port :8000 !!!'

docker/stop:
	$(MAKE) docker/stop/server

docker/stop/server:
	docker container stop $(SERVER_CONTAINER_NAME)

run:
	fresh