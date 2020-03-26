#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"
DEFAULT=ubuntu:bionic
TARGET=$1
case $TARGET in
    arm64v8)
        TARGET_IMAGE=arm64v8/ubuntu
        QEMU=aarch64
        ;;
    *)
        echo "Target not valid: $TARGET"
        exit 1
esac

echo "Transmuting $DEFAULT TO $TARGET_IMAGE"
./generate-github-workflows.sh ${TARGET}
cp ../Dockerfile ../Dockerfile.${TARGET}
sed -i "s|on x86_64|on $TARGET|g"  ../Dockerfile.${TARGET}
sed -i "s|$DEFAULT|$TARGET_IMAGE|" ../Dockerfile.${TARGET}
sed -i "s|FROM gone/marshall-x86_64:latest|FROM gone/marshall-$TARGET_IMAGE|g" ../Dockerfile.${TARGET}

echo "Enabling qemu multiach"
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
echo "Saved as Dockerfile.${TARGET}"
