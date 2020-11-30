#!/bin/bash
source /installers/config
echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/force-unsafe-io
# swap http://archive.ubuntu.com for the new mirror://mirrors.ubuntu.com/mirrors.txt mirror-router.
sed -i 's/http\:\/\/archive\.ubuntu\.com\/ubuntu\//mirror\:\/\/mirrors.ubuntu.com\/mirrors.txt/g' /etc/apt/sources.list

# Update apt repos
apt-get -qq update

# System upgrade
#apt-get -yq upgrade

# Install apt-utils & ca-certificates to prevent some screaming.
$APT_GET apt apt-utils ca-certificates
