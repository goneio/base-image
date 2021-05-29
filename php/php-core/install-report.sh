#!/bin/bash
MARSHALL_VERSION=$(cat /etc/marshall_version)
MARSHALL_BUILD_DATE=$(cat /etc/marshall_build_date)
MARSHALL_BUILD_HOST=$(cat /etc/marshall_build_host)
UBUNTU_VERSION=$(cat /etc/os-release | grep VERSION= | cut -d'=' -f2 | sed -e 's/\"//g')
PHP_VERSION=$(/usr/bin/php --version | head -n 1 | cut -d' ' -f2 | cut -d'-' -f1);
COMPOSER_VERSION=$(/usr/local/bin/composer --version | cut -d' ' -f 3);
PROJECT_CODE_SIZE=$(du -cBM /app | grep total | cut -f1);
PROJECT_CODE_SIZE_BYTES=$(du -c /app | grep total | cut -f1);
PHP_MODULES=$(/usr/bin/php -m)
MAX_CODE_SIZE_BYTES=100000000;
MODULES_COLUMNS=6

COLOUR_FAIL='\e[31m'
COLOUR_SUCCESS='\e[32m'
COLOUR_RESET='\e[0m'

[[ $PROJECT_CODE_SIZE_BYTES -gt $MAX_CODE_SIZE_BYTES ]] && COLOUR_CODE_SIZE="${COLOUR_FAIL}" || COLOUR_CODE_SIZE="${COLOUR_SUCCESS}";

MODULES=("SimpleXML" "dom" "mcrypt" "sodium" "Reflection" "xml" "xsl" "Xdebug" "PDO" "pdo_mysql" "pdo_pgsql" "pdo_sqlite" "mysqlnd" "mysqli" "pgsql" "sqlite3" "tokenizer" "bz2" "zip" "zlib" "apcu" "redis" "mongodb" "memcached" "gd" "exif" "imap" "bcmath" "intl" "json" "ldap" "mbstring" "curl" "soap")
echo -e "Marshall Build:             ${COLOUR_SUCCESS}${MARSHALL_VERSION}${COLOUR_RESET} at ${COLOUR_SUCCESS}${MARSHALL_BUILD_DATE}${COLOUR_RESET} on ${COLOUR_SUCCESS}${MARSHALL_BUILD_HOST}${COLOUR_RESET}"
echo -e "Ubuntu Version installed:   ${COLOUR_SUCCESS}${UBUNTU_VERSION}${COLOUR_RESET}"
echo -e "PHP Version installed:      ${COLOUR_SUCCESS}${PHP_VERSION}${COLOUR_RESET}"
echo -e "Composer Version installed: ${COLOUR_SUCCESS}${COMPOSER_VERSION}${COLOUR_RESET}"
echo -e "Application Size:           ${COLOUR_CODE_SIZE}${PROJECT_CODE_SIZE}${COLOUR_RESET}"
echo -e "PHP Modules installed:"
i=1;
for module in "${MODULES[@]}"
do
    ([[ $PHP_MODULES =~ "${module}" ]] && \
        printf "%b%s%b %-14s " $COLOUR_SUCCESS '✓' $COLOUR_RESET "${module}" \
    || \
        printf "%b%s%b %-14s " $COLOUR_FAIL '✕' $COLOUR_RESET "${module}" \
    )
    if ! (( i % $MODULES_COLUMNS )); then
        echo ""
    fi
    i=$((i+1));
done
echo

# @todo This bombs out if it can't read from a restricted repo. Revise later.
#if [ -f /app/composer.json ]; then
#    if [ -f /app/composer.lock ]; then
#        echo -e "Outdated ${COLOUR_FAIL}Composer${COLOUR_NONE} packages:"
#        /usr/local/bin/composer outdated
#    fi
#fi
