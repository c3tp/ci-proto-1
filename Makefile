CONTAINER_NAME = docker-hello-world
INSTANCE_NAME = $(CONTAINER_NAME)

all	:
all: build

.built: . $(DEPS)
	docker build -t $(CONTAINER_NAME) .
	@docker inspect -f '{{.Id}}' $(CONTAINER_NAME) > .built

build	:
build: .built

clean	:
clean: stop
	@$(RM) .built

test	:
test: build
	@./test-all

stop	:
stop:
#	-docker stop $(INSTANCE_NAME)
#	-docker rm $(INSTANCE_NAME)
