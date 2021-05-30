.PHONY: build all

all: build

build:
	docker buildx build \
		--load \
		-t benzine/mariadb \
		-t ghcr.io/benzine-framework/docker-mariadb \
		.

