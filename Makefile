#    ▄████  ▒█████   ███▄    █ ▓█████       ██▓ ▒█████
#   ██▒ ▀█▒▒██▒  ██▒ ██ ▀█   █ ▓█   ▀      ▓██▒▒██▒  ██▒
#  ▒██░▄▄▄░▒██░  ██▒▓██  ▀█ ██▒▒███        ▒██▒▒██░  ██▒
#  ░▓█  ██▓▒██   ██░▓██▒  ▐▌██▒▒▓█  ▄      ░██░▒██   ██░
#  ░▒▓███▀▒░ ████▓▒░▒██░   ▓██░░▒████▒ ██▓ ░██░░ ████▓▒░
#   ░▒   ▒ ░ ▒░▒░▒░ ░ ▒░   ▒ ▒ ░░ ▒░ ░ ▒▓▒ ░▓  ░ ▒░▒░▒░
#  ░▄▄▄▄ ░ ░▄▄▄░ ▒░ ░ ░██████░▓█████ ░ ░ ██▓ ███▄░▄███▓ ▄▄▄        ▄████ ▓█████
#  ▓█████▄ ▒████▄░   ▒██    ▒░▓█   ▀ ░  ▓██▒▓██▒▀█▀ ██▒▒████▄     ██▒ ▀█▒▓█   ▀
#  ▒██▒ ▄██▒██  ▀█▄  ░ ▓██▄   ▒███      ▒██▒▓██    ▓██░▒██  ▀█▄  ▒██░▄▄▄░▒███
#  ▒██░█▀  ░██▄▄▄▄██   ▒   ██▒▒▓█  ▄    ░██░▒██    ▒██ ░██▄▄▄▄██ ░▓█  ██▓▒▓█  ▄
#  ░▓█  ▀█▓ ▓█   ▓██▒▒██████▒▒░▒████▒   ░██░▒██▒   ░██▒ ▓█   ▓██▒░▒▓███▀▒░▒████▒
#  ░▒▓███▀▒ ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░░░ ▒░ ░   ░▓  ░ ▒░   ░  ░ ▒▒   ▓▒█░ ░▒   ▒ ░░ ▒░ ░
#  ▒░▒   ░   ▒   ▒▒ ░░ ░▒  ░ ░ ░ ░  ░    ▒ ░░  ░      ░  ▒   ▒▒ ░  ░   ░  ░ ░  ░
#   ░    ░   ░   ▒   ░  ░  ░     ░       ▒ ░░      ░     ░   ▒   ░ ░   ░    ░
#   ░            ░  ░      ░     ░  ░    ░         ░         ░  ░      ░    ░  ░

# Prettyprinting: http://patorjk.com/software/taag/#p=display&c=bash&f=Bloody&t=Example
CMD_BUILD=DOCKER_BUILDKIT=1 docker build
PHP_PACKAGES_56=mariadb-client \
					 php-apcu \
					 php-xdebug \
					 php5.6-bcmath \
					 php5.6-bz2 \
					 php5.6-cli \
					 php5.6-curl \
					 php5.6-gd \
					 php5.6-imap \
					 php5.6-intl \
					 php5.6-json \
					 php5.6-ldap \
					 php5.6-mbstring \
					 php5.6-mcrypt \
					 php5.6-memcache \
					 php5.6-memcached \
					 php5.6-mongodb \
					 php5.6-mysql \
					 php5.6-opcache \
					 php5.6-pgsql \
					 php5.6-pspell \
					 php5.6-redis \
					 php5.6-soap \
					 php5.6-sqlite \
					 php5.6-xml \
					 php5.6-zip \
					 postgresql-client

PHP_PACKAGES_70=mariadb-client \
					 php-apcu \
					 php-xdebug \
					 php7.0-bcmath \
					 php7.0-bz2 \
					 php7.0-cli \
					 php7.0-curl \
					 php7.0-gd \
					 php7.0-imap \
					 php7.0-intl \
					 php7.0-json \
					 php7.0-ldap \
					 php7.0-mbstring \
					 php7.0-mcrypt \
					 php7.0-memcache \
					 php7.0-memcached \
					 php7.0-mongodb \
					 php7.0-mysql \
					 php7.0-opcache \
					 php7.0-pgsql \
					 php7.0-pspell \
					 php7.0-redis \
					 php7.0-soap \
					 php7.0-sqlite \
					 php7.0-xml \
					 php7.0-zip \
					 postgresql-client

PHP_PACKAGES_71=mariadb-client \
					 php-apcu \
					 php-xdebug \
					 php7.1-bcmath \
					 php7.1-bz2 \
					 php7.1-cli \
					 php7.1-curl \
					 php7.1-gd \
					 php7.1-imap \
					 php7.1-intl \
					 php7.1-json \
					 php7.1-ldap \
					 php7.1-mbstring \
					 php7.1-mcrypt \
					 php7.1-memcache \
					 php7.1-memcached \
					 php7.1-mongodb \
					 php7.1-mysql \
					 php7.1-opcache \
					 php7.1-pgsql \
					 php7.1-pspell \
					 php7.1-redis \
					 php7.1-soap \
					 php7.1-sqlite \
					 php7.1-xml \
					 php7.1-zip \
					 postgresql-client

PHP_PACKAGES_72=mariadb-client \
					 php-apcu \
					 php-xdebug \
					 php7.2-bcmath \
					 php7.2-bz2 \
					 php7.2-cli \
					 php7.2-curl \
					 php7.2-gd \
					 php7.2-imap \
					 php7.2-intl \
					 php7.2-json \
					 php7.2-ldap \
					 php7.2-mbstring \
					 php7.2-memcache \
					 php7.2-memcached \
					 php7.2-mongodb \
					 php7.2-mysql \
					 php7.2-opcache \
					 php7.2-pgsql \
					 php7.2-pspell \
					 php7.2-redis \
					 php7.2-soap \
					 php7.2-sqlite \
					 php7.2-xml \
					 php7.2-zip \
					 postgresql-client

PHP_PACKAGES_73=mariadb-client \
					 php-apcu \
					 php-xdebug \
					 php7.3-bcmath \
					 php7.3-bz2 \
					 php7.3-cli \
					 php7.3-curl \
					 php7.3-gd \
					 php7.3-imap \
					 php7.3-intl \
					 php7.3-json \
					 php7.3-ldap \
					 php7.3-mbstring \
					 php7.3-memcache \
					 php7.3-memcached \
					 php7.3-mongodb \
					 php7.3-mysql \
					 php7.3-opcache \
					 php7.3-pgsql \
					 php7.3-pspell \
					 php7.3-redis \
					 php7.3-soap \
					 php7.3-sqlite \
					 php7.3-xml \
					 php7.3-zip \
					 postgresql-client
					 
PHP_PACKAGES_74=mariadb-client \
					 php-apcu \
					 php-xdebug \
					 php7.4-bcmath \
					 php7.4-bz2 \
					 php7.4-cli \
					 php7.4-curl \
					 php7.4-gd \
					 php7.4-imap \
					 php7.4-intl \
					 php7.4-json \
					 php7.4-ldap \
					 php7.4-mbstring \
					 php7.4-memcache \
#					 php7.4-memcached \
					 php7.4-mongodb \
					 php7.4-mysql \
					 php7.4-opcache \
					 php7.4-pgsql \
					 php7.4-pspell \
#					 php7.4-redis \
					 php7.4-soap \
					 php7.4-sqlite \
					 php7.4-xml \
					 php7.4-zip \
					 postgresql-client

#    ██████ ▓█████▄▄▄█████▓ █    ██  ██▓███
#  ▒██    ▒ ▓█   ▀▓  ██▒ ▓▒ ██  ▓██▒▓██░  ██▒
#  ░ ▓██▄   ▒███  ▒ ▓██░ ▒░▓██  ▒██░▓██░ ██▓▒
#    ▒   ██▒▒▓█  ▄░ ▓██▓ ░ ▓▓█  ░██░▒██▄█▓▒ ▒
#  ▒██████▒▒░▒████▒ ▒██▒ ░ ▒▒█████▓ ▒██▒ ░  ░
#  ▒ ▒▓▒ ▒ ░░░ ▒░ ░ ▒ ░░   ░▒▓▒ ▒ ▒ ▒▓▒░ ░  ░
#  ░ ░▒  ░ ░ ░ ░  ░   ░    ░░▒░ ░ ░ ░▒ ░
#  ░  ░  ░     ░    ░       ░░░ ░ ░ ░░
#        ░     ░  ░           ░

setup:
	git rev-parse --short HEAD > marshall/marshall_version
	date +%Y-%m-%d\ %H:%M:%S > marshall/marshall_build_date
	hostname > marshall/marshall_build_host

#   ███▄ ▄███▓ ▄▄▄       ██▀███    ██████  ██░ ██  ▄▄▄       ██▓     ██▓
#  ▓██▒▀█▀ ██▒▒████▄    ▓██ ▒ ██▒▒██    ▒ ▓██░ ██▒▒████▄    ▓██▒    ▓██▒
#  ▓██    ▓██░▒██  ▀█▄  ▓██ ░▄█ ▒░ ▓██▄   ▒██▀▀██░▒██  ▀█▄  ▒██░    ▒██░
#  ▒██    ▒██ ░██▄▄▄▄██ ▒██▀▀█▄    ▒   ██▒░▓█ ░██ ░██▄▄▄▄██ ▒██░    ▒██░
#  ▒██▒   ░██▒ ▓█   ▓██▒░██▓ ▒██▒▒██████▒▒░▓█▒░██▓ ▓█   ▓██▒░██████▒░██████▒
#  ░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒▓ ░▒▓░▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒ ▒▒   ▓▒█░░ ▒░▓  ░░ ▒░▓  ░
#  ░  ░      ░  ▒   ▒▒ ░  ░▒ ░ ▒░░ ░▒  ░ ░ ▒ ░▒░ ░  ▒   ▒▒ ░░ ░ ▒  ░░ ░ ▒  ░
#  ░      ░     ░   ▒     ░░   ░ ░  ░  ░   ░  ░░ ░  ░   ▒     ░ ░     ░ ░
#         ░         ░  ░   ░           ░   ░  ░  ░      ░  ░    ░  ░    ░  ░
gone/marshall: setup
	$(CMD_BUILD) -t gone/marshall:latest --target=marshall .

#   ██▓███   ██░ ██  ██▓███      ▄████▄   ▒█████   ██▀███  ▓█████
#  ▓██░  ██▒▓██░ ██▒▓██░  ██▒   ▒██▀ ▀█  ▒██▒  ██▒▓██ ▒ ██▒▓█   ▀
#  ▓██░ ██▓▒▒██▀▀██░▓██░ ██▓▒   ▒▓█    ▄ ▒██░  ██▒▓██ ░▄█ ▒▒███
#  ▒██▄█▓▒ ▒░▓█ ░██ ▒██▄█▓▒ ▒   ▒▓▓▄ ▄██▒▒██   ██░▒██▀▀█▄  ▒▓█  ▄
#  ▒██▒ ░  ░░▓█▒░██▓▒██▒ ░  ░   ▒ ▓███▀ ░░ ████▓▒░░██▓ ▒██▒░▒████▒
#  ▒▓▒░ ░  ░ ▒ ░░▒░▒▒▓▒░ ░  ░   ░ ░▒ ▒  ░░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░░ ▒░ ░
#  ░▒ ░      ▒ ░▒░ ░░▒ ░          ░  ▒     ░ ▒ ▒░   ░▒ ░ ▒░ ░ ░  ░
#  ░░        ░  ░░ ░░░          ░        ░ ░ ░ ▒    ░░   ░    ░
#            ░  ░  ░            ░ ░          ░ ░     ░        ░  ░

gone/php\:core-5.6: setup
	$(CMD_BUILD) -t gone/php:core-5.6 				--target=php-core 			--build-arg "PHP_VERSION=5.6" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_56)" .
gone/php\:core-7.0: setup
	$(CMD_BUILD) -t gone/php:core-7.0 				--target=php-core 			--build-arg "PHP_VERSION=7.0" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_70)" .
gone/php\:core-7.1: setup
	$(CMD_BUILD) -t gone/php:core-7.1 				--target=php-core 			--build-arg "PHP_VERSION=7.1" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_71)" .
gone/php\:core-7.2: setup
	$(CMD_BUILD) -t gone/php:core-7.2 				--target=php-core 			--build-arg "PHP_VERSION=7.2" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_72)" .
gone/php\:core-7.3: setup
	$(CMD_BUILD) -t gone/php:core-7.3 				--target=php-core 			--build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:core-7.4: setup
	$(CMD_BUILD) -t gone/php:core-7.4 				--target=php-core 			--build-arg "PHP_VERSION=7.4" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_74)" .

core:
	$(MAKE) gone/php\:core-5.6
	$(MAKE) gone/php\:core-7.0
	$(MAKE) gone/php\:core-7.1
	$(MAKE) gone/php\:core-7.2
	$(MAKE) gone/php\:core-7.3
	$(MAKE) gone/php\:core-7.4

#   ██▓███   ██░ ██  ██▓███      ▄████▄   ██▓     ██▓
#  ▓██░  ██▒▓██░ ██▒▓██░  ██▒   ▒██▀ ▀█  ▓██▒    ▓██▒
#  ▓██░ ██▓▒▒██▀▀██░▓██░ ██▓▒   ▒▓█    ▄ ▒██░    ▒██▒
#  ▒██▄█▓▒ ▒░▓█ ░██ ▒██▄█▓▒ ▒   ▒▓▓▄ ▄██▒▒██░    ░██░
#  ▒██▒ ░  ░░▓█▒░██▓▒██▒ ░  ░   ▒ ▓███▀ ░░██████▒░██░
#  ▒▓▒░ ░  ░ ▒ ░░▒░▒▒▓▒░ ░  ░   ░ ░▒ ▒  ░░ ▒░▓  ░░▓
#  ░▒ ░      ▒ ░▒░ ░░▒ ░          ░  ▒   ░ ░ ▒  ░ ▒ ░
#  ░░        ░  ░░ ░░░          ░          ░ ░    ▒ ░
#            ░  ░  ░            ░ ░          ░  ░ ░

gone/php\:cli-5.6: setup
	$(CMD_BUILD) -t gone/php:cli-5.6 				--target=php-cli 			--build-arg "PHP_VERSION=5.6" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_56)" .
gone/php\:cli-5.6-onbuild: setup
	$(CMD_BUILD) -t gone/php:cli-5.6-onbuild 		--target=php-cli-onbuild 	--build-arg "PHP_VERSION=5.6" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_56)" .
gone/php\:cli-7.0: setup
	$(CMD_BUILD) -t gone/php:cli-7.0 				--target=php-cli 			--build-arg "PHP_VERSION=7.0" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_70)" .
gone/php\:cli-7.0-onbuild: setup
	$(CMD_BUILD) -t gone/php:cli-7.0-onbuild 		--target=php-cli-onbuild 	--build-arg "PHP_VERSION=7.0" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_70)" .
gone/php\:cli-7.1: setup
	$(CMD_BUILD) -t gone/php:cli-7.1 				--target=php-cli 			--build-arg "PHP_VERSION=7.1" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_71)" .
gone/php\:cli-7.1-onbuild: setup
	$(CMD_BUILD) -t gone/php:cli-7.1-onbuild 		--target=php-cli-onbuild 	--build-arg "PHP_VERSION=7.1" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_71)" .
gone/php\:cli-7.2: setup
	$(CMD_BUILD) -t gone/php:cli-7.2 				--target=php-cli 			--build-arg "PHP_VERSION=7.2" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_72)" .
gone/php\:cli-7.2-onbuild: setup
	$(CMD_BUILD) -t gone/php:cli-7.2-onbuild 		--target=php-cli-onbuild 	--build-arg "PHP_VERSION=7.2" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_72)" .
gone/php\:cli-7.3: setup
	$(CMD_BUILD) -t gone/php:cli-7.3 				--target=php-cli 			--build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:cli-7.3-onbuild: setup
	$(CMD_BUILD) -t gone/php:cli-7.3-onbuild 		--target=php-cli-onbuild 	--build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:cli-7.4: setup
	$(CMD_BUILD) -t gone/php:cli-7.4 				--target=php-cli 			--build-arg "PHP_VERSION=7.4" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_74)" .
gone/php\:cli-7.4-onbuild: setup
	$(CMD_BUILD) -t gone/php:cli-7.4-onbuild 		--target=php-cli-onbuild 	--build-arg "PHP_VERSION=7.4" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_74)" .

php-cli:
	$(MAKE) gone/php\:cli-5.6
	$(MAKE) gone/php\:cli-5.6-onbuild
	$(MAKE) gone/php\:cli-7.0
	$(MAKE) gone/php\:cli-7.0-onbuild
	$(MAKE) gone/php\:cli-7.1
	$(MAKE) gone/php\:cli-7.1-onbuild
	$(MAKE) gone/php\:cli-7.2
	$(MAKE) gone/php\:cli-7.2-onbuild
	$(MAKE) gone/php\:cli-7.3
	$(MAKE) gone/php\:cli-7.3-onbuild
	$(MAKE) gone/php\:cli-7.4
	$(MAKE) gone/php\:cli-7.4-onbuild

#   ██▓███   ██░ ██  ██▓███      ███▄    █   ▄████  ██▓ ███▄    █ ▒██   ██▒
#  ▓██░  ██▒▓██░ ██▒▓██░  ██▒    ██ ▀█   █  ██▒ ▀█▒▓██▒ ██ ▀█   █ ▒▒ █ █ ▒░
#  ▓██░ ██▓▒▒██▀▀██░▓██░ ██▓▒   ▓██  ▀█ ██▒▒██░▄▄▄░▒██▒▓██  ▀█ ██▒░░  █   ░
#  ▒██▄█▓▒ ▒░▓█ ░██ ▒██▄█▓▒ ▒   ▓██▒  ▐▌██▒░▓█  ██▓░██░▓██▒  ▐▌██▒ ░ █ █ ▒
#  ▒██▒ ░  ░░▓█▒░██▓▒██▒ ░  ░   ▒██░   ▓██░░▒▓███▀▒░██░▒██░   ▓██░▒██▒ ▒██▒
#  ▒▓▒░ ░  ░ ▒ ░░▒░▒▒▓▒░ ░  ░   ░ ▒░   ▒ ▒  ░▒   ▒ ░▓  ░ ▒░   ▒ ▒ ▒▒ ░ ░▓ ░
#  ░▒ ░      ▒ ░▒░ ░░▒ ░        ░ ░░   ░ ▒░  ░   ░  ▒ ░░ ░░   ░ ▒░░░   ░▒ ░
#  ░░        ░  ░░ ░░░             ░   ░ ░ ░ ░   ░  ▒ ░   ░   ░ ░  ░    ░
#            ░  ░  ░                     ░       ░  ░           ░  ░    ░

gone/php\:nginx-5.6: setup
	$(CMD_BUILD) -t gone/php:nginx-5.6 				--target=php-nginx 			--build-arg "PHP_VERSION=5.6" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_56)" .
gone/php\:nginx-5.6-onbuild: setup
	$(CMD_BUILD) -t gone/php:nginx-5.6-onbuild 		--target=php-nginx-onbuild 	--build-arg "PHP_VERSION=5.6" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_56)" .
gone/php\:nginx-7.0: setup
	$(CMD_BUILD) -t gone/php:nginx-7.0 				--target=php-nginx 			--build-arg "PHP_VERSION=7.0" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_70)" .
gone/php\:nginx-7.0-onbuild: setup
	$(CMD_BUILD) -t gone/php:nginx-7.0-onbuild 		--target=php-nginx-onbuild 	--build-arg "PHP_VERSION=7.0" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_70)" .
gone/php\:nginx-7.1: setup
	$(CMD_BUILD) -t gone/php:nginx-7.1 				--target=php-nginx 			--build-arg "PHP_VERSION=7.1" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_71)" .
gone/php\:nginx-7.1-onbuild: setup
	$(CMD_BUILD) -t gone/php:nginx-7.1-onbuild 		--target=php-nginx-onbuild 	--build-arg "PHP_VERSION=7.1" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_71)" .
gone/php\:nginx-7.2: setup
	$(CMD_BUILD) -t gone/php:nginx-7.2 				--target=php-nginx 			--build-arg "PHP_VERSION=7.2" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_72)" .
gone/php\:nginx-7.2-onbuild: setup
	$(CMD_BUILD) -t gone/php:nginx-7.2-onbuild 		--target=php-nginx-onbuild 	--build-arg "PHP_VERSION=7.2" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_72)" .
gone/php\:nginx-7.3: setup
	$(CMD_BUILD) -t gone/php:nginx-7.3 				--target=php-nginx 			--build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:nginx-7.3-onbuild: setup
	$(CMD_BUILD) -t gone/php:nginx-7.3-onbuild 		--target=php-nginx-onbuild 	--build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:nginx-7.4: setup
	$(CMD_BUILD) -t gone/php:nginx-7.4 				--target=php-nginx 			--build-arg "PHP_VERSION=7.4" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_74)" .
gone/php\:nginx-7.4-onbuild: setup
	$(CMD_BUILD) -t gone/php:nginx-7.4-onbuild 		--target=php-nginx-onbuild 	--build-arg "PHP_VERSION=7.4" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_74)" .

php-nginx:
	$(MAKE) gone/php\:nginx-5.6
	$(MAKE) gone/php\:nginx-5.6-onbuild
	$(MAKE) gone/php\:nginx-7.0
	$(MAKE) gone/php\:nginx-7.0-onbuild
	$(MAKE) gone/php\:nginx-7.1
	$(MAKE) gone/php\:nginx-7.1-onbuild
	$(MAKE) gone/php\:nginx-7.2
	$(MAKE) gone/php\:nginx-7.2-onbuild
	$(MAKE) gone/php\:nginx-7.3
	$(MAKE) gone/php\:nginx-7.3-onbuild
	$(MAKE) gone/php\:nginx-7.4
	$(MAKE) gone/php\:nginx-7.4-onbuild
	
#   ██▓███   ██░ ██  ██▓███      ▄▄▄       ██▓███   ▄▄▄       ▄████▄   ██░ ██ ▓█████
#  ▓██░  ██▒▓██░ ██▒▓██░  ██▒   ▒████▄    ▓██░  ██▒▒████▄    ▒██▀ ▀█  ▓██░ ██▒▓█   ▀
#  ▓██░ ██▓▒▒██▀▀██░▓██░ ██▓▒   ▒██  ▀█▄  ▓██░ ██▓▒▒██  ▀█▄  ▒▓█    ▄ ▒██▀▀██░▒███
#  ▒██▄█▓▒ ▒░▓█ ░██ ▒██▄█▓▒ ▒   ░██▄▄▄▄██ ▒██▄█▓▒ ▒░██▄▄▄▄██ ▒▓▓▄ ▄██▒░▓█ ░██ ▒▓█  ▄
#  ▒██▒ ░  ░░▓█▒░██▓▒██▒ ░  ░    ▓█   ▓██▒▒██▒ ░  ░ ▓█   ▓██▒▒ ▓███▀ ░░▓█▒░██▓░▒████▒
#  ▒▓▒░ ░  ░ ▒ ░░▒░▒▒▓▒░ ░  ░    ▒▒   ▓▒█░▒▓▒░ ░  ░ ▒▒   ▓▒█░░ ░▒ ▒  ░ ▒ ░░▒░▒░░ ▒░ ░
#  ░▒ ░      ▒ ░▒░ ░░▒ ░          ▒   ▒▒ ░░▒ ░       ▒   ▒▒ ░  ░  ▒    ▒ ░▒░ ░ ░ ░  ░
#  ░░        ░  ░░ ░░░            ░   ▒   ░░         ░   ▒   ░         ░  ░░ ░   ░
#            ░  ░  ░                  ░  ░               ░  ░░ ░       ░  ░  ░   ░  ░

gone/php\:apache-5.6: setup
	$(CMD_BUILD) -t gone/php:apache-5.6 			--target=php-apache 		--build-arg "PHP_VERSION=5.6" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_56)" .
gone/php\:apache-5.6-onbuild: setup
	$(CMD_BUILD) -t gone/php:apache-5.6-onbuild 	--target=php-apache-onbuild --build-arg "PHP_VERSION=5.6" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_56)" .
gone/php\:apache-7.0: setup
	$(CMD_BUILD) -t gone/php:apache-7.0 			--target=php-apache 		--build-arg "PHP_VERSION=7.0" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_70)" .
gone/php\:apache-7.0-onbuild: setup
	$(CMD_BUILD) -t gone/php:apache-7.0-onbuild 	--target=php-apache-onbuild --build-arg "PHP_VERSION=7.0" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_70)" .
gone/php\:apache-7.1: setup
	$(CMD_BUILD) -t gone/php:apache-7.1 			--target=php-apache 		--build-arg "PHP_VERSION=7.1" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_71)" .
gone/php\:apache-7.1-onbuild: setup
	$(CMD_BUILD) -t gone/php:apache-7.1-onbuild 	--target=php-apache-onbuild --build-arg "PHP_VERSION=7.1" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_71)" .
gone/php\:apache-7.2: setup
	$(CMD_BUILD) -t gone/php:apache-7.2 			--target=php-apache 		--build-arg "PHP_VERSION=7.2" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_72)" .
gone/php\:apache-7.2-onbuild: setup
	$(CMD_BUILD) -t gone/php:apache-7.2-onbuild 	--target=php-apache-onbuild --build-arg "PHP_VERSION=7.2" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_72)" .
gone/php\:apache-7.3: setup
	$(CMD_BUILD) -t gone/php:apache-7.3 			--target=php-apache 		--build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:apache-7.3-onbuild: setup
	$(CMD_BUILD) -t gone/php:apache-7.3-onbuild 	--target=php-apache-onbuild --build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:apache-7.4: setup
	$(CMD_BUILD) -t gone/php:apache-7.4 			--target=php-apache 		--build-arg "PHP_VERSION=7.4" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_74)" .
gone/php\:apache-7.4-onbuild: setup
	$(CMD_BUILD) -t gone/php:apache-7.4-onbuild 	--target=php-apache-onbuild --build-arg "PHP_VERSION=7.4" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_74)" .

php-apache:
	$(MAKE) gone/php\:apache-5.6
	$(MAKE) gone/php\:apache-5.6-onbuild
	$(MAKE) gone/php\:apache-7.0
	$(MAKE) gone/php\:apache-7.0-onbuild
	$(MAKE) gone/php\:apache-7.1
	$(MAKE) gone/php\:apache-7.1-onbuild
	$(MAKE) gone/php\:apache-7.2
	$(MAKE) gone/php\:apache-7.2-onbuild
	$(MAKE) gone/php\:apache-7.3
	$(MAKE) gone/php\:apache-7.3-onbuild
	$(MAKE) gone/php\:apache-7.4
	$(MAKE) gone/php\:apache-7.4-onbuild
	
# ███▄    █  ▒█████  ▓█████▄ ▓█████     ▄▄▄██▀▀▀██████
# ██ ▀█   █ ▒██▒  ██▒▒██▀ ██▌▓█   ▀       ▒██ ▒██    ▒
#▓██  ▀█ ██▒▒██░  ██▒░██   █▌▒███         ░██ ░ ▓██▄
#▓██▒  ▐▌██▒▒██   ██░░▓█▄   ▌▒▓█  ▄    ▓██▄██▓  ▒   ██▒
#▒██░   ▓██░░ ████▓▒░░▒████▓ ░▒████▒    ▓███▒ ▒██████▒▒
#░ ▒░   ▒ ▒ ░ ▒░▒░▒░  ▒▒▓  ▒ ░░ ▒░ ░    ▒▓▒▒░ ▒ ▒▓▒ ▒ ░
#░ ░░   ░ ▒░  ░ ▒ ▒░  ░ ▒  ▒  ░ ░  ░    ▒ ░▒░ ░ ░▒  ░ ░
#   ░   ░ ░ ░ ░ ░ ▒   ░ ░  ░    ░       ░ ░ ░ ░  ░  ░
#         ░     ░ ░     ░       ░  ░    ░   ░       ░

gone/node\:8: setup
	$(CMD_BUILD) -t gone/node:8 					--target=nodejs 					--build-arg NODE_VERSION=8.16.0 	--build-arg YARN_VERSION=1.15.2 .
gone/node\:8-onbuild: setup
	$(CMD_BUILD) -t gone/node:8-onbuild 			--target=nodejs-onbuild 			--build-arg NODE_VERSION=8.16.0 	--build-arg YARN_VERSION=1.15.2 .
gone/node\:8-compiler: setup
	$(CMD_BUILD) -t gone/node:8-compiler 			--target=nodejs-compiler 			--build-arg NODE_VERSION=8.16.0 	--build-arg YARN_VERSION=1.15.2 .
gone/node\:8-compiler-onbuild: setup
	$(CMD_BUILD) -t gone/node:8-compiler-onbuild 	--target=nodejs-compiler-onbuild 	--build-arg NODE_VERSION=8.16.0 	--build-arg YARN_VERSION=1.15.2 .

gone/node\:10: setup
	$(CMD_BUILD) -t gone/node:10 					--target=nodejs 					--build-arg NODE_VERSION=10.16.0 	--build-arg YARN_VERSION=1.16.0 .
gone/node\:10-onbuild: setup
	$(CMD_BUILD) -t gone/node:10-onbuild 			--target=nodejs-onbuild 			--build-arg NODE_VERSION=10.16.0 	--build-arg YARN_VERSION=1.16.0 .
gone/node\:10-compiler: setup
	$(CMD_BUILD) -t gone/node:10-compiler 			--target=nodejs-compiler 			--build-arg NODE_VERSION=10.16.0 	--build-arg YARN_VERSION=1.16.0 .
gone/node\:10-compiler-onbuild: setup
	$(CMD_BUILD) -t gone/node:10-compiler-onbuild 	--target=nodejs-compiler-onbuild 	--build-arg NODE_VERSION=10.16.0 	--build-arg YARN_VERSION=1.16.0 .

gone/node\:11: setup
	$(CMD_BUILD) -t gone/node:11 					--target=nodejs 					--build-arg NODE_VERSION=11.15.0 	--build-arg YARN_VERSION=1.16.0 .
gone/node\:11-onbuild: setup
	$(CMD_BUILD) -t gone/node:11-onbuild 			--target=nodejs-onbuild 			--build-arg NODE_VERSION=11.15.0 	--build-arg YARN_VERSION=1.16.0 .
gone/node\:11-compiler: setup
	$(CMD_BUILD) -t gone/node:11-compiler 			--target=nodejs-compiler 			--build-arg NODE_VERSION=11.15.0 	--build-arg YARN_VERSION=1.16.0 .
gone/node\:11-compiler-onbuild: setup
	$(CMD_BUILD) -t gone/node:11-compiler-onbuild 	--target=nodejs-compiler-onbuild 	--build-arg NODE_VERSION=11.15.0 	--build-arg YARN_VERSION=1.16.0 .

gone/node\:12: setup
	$(CMD_BUILD) -t gone/node:12 					--target=nodejs 					--build-arg NODE_VERSION=12.3.1 	--build-arg YARN_VERSION=1.16.0 .
gone/node\:12-onbuild: setup
	$(CMD_BUILD) -t gone/node:12-onbuild			--target=nodejs-onbuild 			--build-arg NODE_VERSION=12.3.1 	--build-arg YARN_VERSION=1.16.0 .
gone/node\:12-compiler: setup
	$(CMD_BUILD) -t gone/node:12-compiler 			--target=nodejs-compiler 			--build-arg NODE_VERSION=12.3.1 	--build-arg YARN_VERSION=1.16.0 .
gone/node\:12-compiler-onbuild: setup
	$(CMD_BUILD) -t gone/node:12-compiler-onbuild 	--target=nodejs-compiler-onbuild 	--build-arg NODE_VERSION=12.3.1 	--build-arg YARN_VERSION=1.16.0 .

node:
	$(MAKE) gone/node\:8
	$(MAKE) gone/node\:8-onbuild
	$(MAKE) gone/node\:8-compiler
	$(MAKE) gone/node\:8-compiler-onbuild
	$(MAKE) gone/node\:10
	$(MAKE) gone/node\:10-onbuild
	$(MAKE) gone/node\:10-compiler
	$(MAKE) gone/node\:10-compiler-onbuild
	$(MAKE) gone/node\:11
	$(MAKE) gone/node\:11-onbuild
	$(MAKE) gone/node\:11-compiler
	$(MAKE) gone/node\:11-compiler-onbuild
	$(MAKE) gone/node\:12
	$(MAKE) gone/node\:12-onbuild
	$(MAKE) gone/node\:12-compiler
	$(MAKE) gone/node\:12-compiler-onbuild

#   ██▓    ▄▄▄     ▄▄▄█████▓▓█████   ██████ ▄▄▄█████▓    ▄▄▄▄    █    ██  ██▓ ██▓    ▓█████▄   ██████
#  ▓██▒   ▒████▄   ▓  ██▒ ▓▒▓█   ▀ ▒██    ▒ ▓  ██▒ ▓▒   ▓█████▄  ██  ▓██▒▓██▒▓██▒    ▒██▀ ██▌▒██    ▒
#  ▒██░   ▒██  ▀█▄ ▒ ▓██░ ▒░▒███   ░ ▓██▄   ▒ ▓██░ ▒░   ▒██▒ ▄██▓██  ▒██░▒██▒▒██░    ░██   █▌░ ▓██▄
#  ▒██░   ░██▄▄▄▄██░ ▓██▓ ░ ▒▓█  ▄   ▒   ██▒░ ▓██▓ ░    ▒██░█▀  ▓▓█  ░██░░██░▒██░    ░▓█▄   ▌  ▒   ██▒
#  ░██████▒▓█   ▓██▒ ▒██▒ ░ ░▒████▒▒██████▒▒  ▒██▒ ░    ░▓█  ▀█▓▒▒█████▓ ░██░░██████▒░▒████▓ ▒██████▒▒
#  ░ ▒░▓  ░▒▒   ▓▒█░ ▒ ░░   ░░ ▒░ ░▒ ▒▓▒ ▒ ░  ▒ ░░      ░▒▓███▀▒░▒▓▒ ▒ ▒ ░▓  ░ ▒░▓  ░ ▒▒▓  ▒ ▒ ▒▓▒ ▒ ░
#  ░ ░ ▒  ░ ▒   ▒▒ ░   ░     ░ ░  ░░ ░▒  ░ ░    ░       ▒░▒   ░ ░░▒░ ░ ░  ▒ ░░ ░ ▒  ░ ░ ▒  ▒ ░ ░▒  ░ ░
#    ░ ░    ░   ▒    ░         ░   ░  ░  ░    ░          ░    ░  ░░░ ░ ░  ▒ ░  ░ ░    ░ ░  ░ ░  ░  ░
#      ░  ░     ░  ░           ░  ░      ░               ░         ░      ░      ░  ░   ░          ░

gone/php\:cli: setup
	$(CMD_BUILD) -t gone/php:cli 					--target=php-cli 			--build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:cli-onbuild: setup
	$(CMD_BUILD) -t gone/php:cli-onbuild 			--target=php-cli-onbuild 	--build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:apache: setup
	$(CMD_BUILD) -t gone/php:apache 				--target=php-apache 		--build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:apache-onbuild: setup
	$(CMD_BUILD) -t gone/php:apache-onbuild 		--target=php-apache-onbuild --build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:nginx: setup
	$(CMD_BUILD) -t gone/php:nginx 					--target=php-nginx 			--build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/php\:nginx-onbuild: setup
	$(CMD_BUILD) -t gone/php:nginx-onbuild 			--target=php-nginx-onbuild 	--build-arg "PHP_VERSION=7.3" 	--build-arg "PHP_PACKAGES=$(PHP_PACKAGES_73)" .
gone/node: setup
	$(CMD_BUILD) -t gone/node			 			--target=nodejs 			--build-arg NODE_VERSION=12.3.1	--build-arg YARN_VERSION=1.16.0 .
gone/node\:onbuild: setup
	$(CMD_BUILD) -t gone/node-onbuild	 			--target=nodejs-onbuild		--build-arg NODE_VERSION=12.3.1	--build-arg YARN_VERSION=1.16.0 .

latest:
	$(MAKE) gone/php\:cli
	$(MAKE) gone/php\:cli-onbuild
	$(MAKE) gone/php\:apache
	$(MAKE) gone/php\:apache-onbuild
	$(MAKE) gone/php\:nginx
	$(MAKE) gone/php\:nginx-onbuild
	$(MAKE) gone/node
	$(MAKE) gone/node:onbuild

all:
	$(MAKE) gone/marshall
	#$(MAKE) php-core # Nobody actually uses the core as-is, everything is baked off of cli & nginx honestly.
	$(MAKE) php-cli
	$(MAKE) php-nginx
	$(MAKE) php-apache
	$(MAKE) latest

#  ▓█████▄  ▒█████   ▄████▄    ██████
#  ▒██▀ ██▌▒██▒  ██▒▒██▀ ▀█  ▒██    ▒
#  ░██   █▌▒██░  ██▒▒▓█    ▄ ░ ▓██▄
#  ░▓█▄   ▌▒██   ██░▒▓▓▄ ▄██▒  ▒   ██▒
#  ░▒████▓ ░ ████▓▒░▒ ▓███▀ ░▒██████▒▒
#   ▒▒▓  ▒ ░ ▒░▒░▒░ ░ ░▒ ▒  ░▒ ▒▓▒ ▒ ░
#   ░ ▒  ▒   ░ ▒ ▒░   ░  ▒   ░ ░▒  ░ ░
#   ░▄████ ▓█████▒ ███▄    █ ▓█████░ ██▀███   ▄▄▄     ▄▄▄█████▓ ▒█████   ██▀███
#   ██▒ ▀█▒▓█   ▀░ ██ ▀█   █ ▓█   ▀░▓██ ▒ ██▒▒████▄   ▓  ██▒ ▓▒▒██▒  ██▒▓██ ▒ ██▒
#  ▒██░▄▄▄░▒███   ▓██  ▀█ ██▒▒███   ▓██ ░▄█ ▒▒██  ▀█▄ ▒ ▓██░ ▒░▒██░  ██▒▓██ ░▄█ ▒
#  ░▓█  ██▓▒▓█  ▄ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██▀▀█▄  ░██▄▄▄▄██░ ▓██▓ ░ ▒██   ██░▒██▀▀█▄
#  ░▒▓███▀▒░▒████▒▒██░   ▓██░░▒████▒░██▓ ▒██▒ ▓█   ▓██▒ ▒██▒ ░ ░ ████▓▒░░██▓ ▒██▒
#   ░▒   ▒ ░░ ▒░ ░░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░ ▒▒   ▓▒█░ ▒ ░░   ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░
#    ░   ░  ░ ░  ░░ ░░   ░ ▒░ ░ ░  ░  ░▒ ░ ▒░  ▒   ▒▒ ░   ░      ░ ▒ ▒░   ░▒ ░ ▒░
#  ░ ░   ░    ░      ░   ░ ░    ░     ░░   ░   ░   ▒    ░      ░ ░ ░ ▒    ░░   ░
.PHONY: docs
docs:
	composer install -d doc/
	./doc/gen

generate:
	./scripts/transmute-all.sh

