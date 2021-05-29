#!/bin/bash
source /installers/config
cd /
apt-get remove -yqq \
  perl
apt-get autoremove -y
apt-get clean
rm -rf \
        /var/lib/apt/lists/* \
        /tmp/* \
        /var/tmp/* \
        /var/cache/* \
        /var/log/dpkg* \
        /usr/share/doc \
        /usr/share/doc-base \
        /var/log/apt/term.log