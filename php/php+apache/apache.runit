#!/bin/bash

source /etc/apache2/envvars
echo "ServerName $HOSTNAME" > /etc/apache2/conf-available/fqdn.conf
echo "*** Setting Apache's ServerName directive to \"$HOSTNAME\":";
a2enconf fqdn >/dev/null

sleep 3;
exec /usr/sbin/apache2 -D FOREGROUND
