#!/bin/bash
set -e
cd "$(dirname "$0")"
rm -f ../marshall/marshall_*
./generate-buildplan.php
./transmute.sh arm64v8
