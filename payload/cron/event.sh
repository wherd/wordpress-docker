#!/bin/sh

# Change working directory
cd /var/www/localhost

# Update wp client
/usr/sbin/wp cron event run --due-now
