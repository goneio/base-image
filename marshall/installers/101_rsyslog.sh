#!/bin/bash
source /installers/config
$APT_GET rsyslog

mkdir -p /etc/service/rsyslog
mv /etc/service/rsyslog/rsyslog.runit /etc/service/rsyslog/run
chmod +x /etc/service/rsyslog/run