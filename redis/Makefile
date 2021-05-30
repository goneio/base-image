.PHONY: prepare build all

all: build

prepare:
	docker run --rm --privileged docker/binfmt:820fdd95a9972a5308930a2bdfb8573dd4447ad3
	-docker buildx rm benzine-redis-builder
	docker buildx create --name benzine-redis-builder
	docker buildx use benzine-redis-builder
	docker buildx inspect --bootstrap

build: prepare
	docker buildx build \
		--push \
		--platform linux/amd64,linux/arm64 \
		-t benzine/redis \
		-t ghcr.io/benzine-framework/docker-mariadb \
		.

