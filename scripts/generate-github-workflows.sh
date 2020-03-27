#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
TARGET=$1

#cat ../.github/workflows/build-x86_64.yml \
#    | sed "s|x86_64|${TARGET}|g" \
#    | sed "s|gone/marshall|gone/marshall-${TARGET}|g" \
#    | sed "s|/php|/php-${TARGET}|g" \
#    > ../.github/workflows/build-${TARGET}.yml

