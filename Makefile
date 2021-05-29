BUILD:=docker build

docker-marshall:
	$(BUILD) \
		--tag benzine/marshall:latest \
		--target marshall \
		--file Dockerfile.Marshall \
		.

docker-php-core:
	$(BUILD) \
		--build-arg PHP_PACKAGES="git mariadb-client php${PHP_VERSION}-apcu php${PHP_VERSION}-bcmath php${PHP_VERSION}-bz2 php${PHP_VERSION}-cli php${PHP_VERSION}-curl php${PHP_VERSION}-gd php${PHP_VERSION}-imap php${PHP_VERSION}-imagick php${PHP_VERSION}-intl php${PHP_VERSION}-ldap php${PHP_VERSION}-mbstring php${PHP_VERSION}-memcache php${PHP_VERSION}-mysql php${PHP_VERSION}-opcache php${PHP_VERSION}-pgsql php${PHP_VERSION}-phpdbg php${PHP_VERSION}-pspell php${PHP_VERSION}-redis php${PHP_VERSION}-soap php${PHP_VERSION}-sqlite php${PHP_VERSION}-xdebug php${PHP_VERSION}-xml php${PHP_VERSION}-zip postgresql-client" \
		--build-arg PHP_VERSION=${PHP_VERSION} \
		--tag benzine/php:core-${PHP_VERSION} \
		--target php-core \
		--file Dockerfile.Core \
		.

docker-php-flavour:
	$(BUILD) \
		--build-arg PHP_CORE_VERSION=benzine/php:core-${PHP_VERSION} \
		--build-arg PHP_VERSION=${PHP_VERSION} \
		--tag benzine/php:${FLAVOUR}-${PHP_VERSION} \
		--target php-${FLAVOUR} \
		--file Dockerfile.Flavours \
		.

bake-flavours:
	$(MAKE) docker-php-flavour FLAVOUR=cli
	$(MAKE) docker-php-flavour FLAVOUR=nginx
	$(MAKE) docker-php-flavour FLAVOUR=apache

bake:
	$(MAKE) docker-marshall
	$(MAKE) docker-php-core bake-flavours PHP_VERSION=7.3
	$(MAKE) docker-php-core bake-flavours PHP_VERSION=7.4
	$(MAKE) docker-php-core bake-flavours PHP_VERSION=8.0

all: bake