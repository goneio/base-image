#!/bin/bash
set -e
cd "$(dirname "$0")"
./generate-buildplan.php
./transmute.sh arm64v8
