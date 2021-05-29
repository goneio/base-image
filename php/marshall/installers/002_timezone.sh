#!/bin/bash
source /installers/config
$APT_GET tzdata
echo $DEFAULT_TZ > /etc/timezone