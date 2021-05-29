#!/bin/bash
source /installers/config
echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/force-unsafe-io

# We're gonna move the sources to .d/ubuntu-upstream.list, then copy it, then manipulate it for a mirror list.
mv /etc/apt/sources.list /etc/apt/sources.list.d/ubuntu-upstream.list
cp /etc/apt/sources.list.d/ubuntu-upstream.list /etc/apt/sources.list.d/ubuntu-mirrors.list
touch /etc/apt/sources.list
sed -i 's/http\:\/\/archive\.ubuntu\.com\/ubuntu\//mirror\:\/\/mirrors.ubuntu.com\/mirrors.txt/g' /etc/apt/sources.list.d/ubuntu-mirrors.list
sed -i "s|deb http://security.ubuntu.com|# deb http://security.ubuntu.com|g" /etc/apt/sources.list.d/ubuntu-mirrors.list

# Update apt repos
apt-get -qq update

# System upgrade
apt-get -yq upgrade

# Install apt-utils & ca-certificates to prevent some screaming.
$APT_GET ca-certificates
$APT_GET apt apt-utils
