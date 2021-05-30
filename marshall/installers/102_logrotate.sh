#!/bin/bash
mkdir -p /etc/service/logrotate
mv /etc/service/logrotate/logrotate.runit /etc/service/logrotate/run
chmod +x /etc/service/logrotate/run