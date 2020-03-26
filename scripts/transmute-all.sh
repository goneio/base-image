#!/bin/bash
set -e
cd "$(dirname "$0")"
rm ../marshall/marshall_* || true
./generate-buildplan.php
./transmute.sh arm64v8
