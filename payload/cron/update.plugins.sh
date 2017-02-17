#!/bin/sh

# Change working directory
cd /var/www/localhost

# Update plugins
/usr/sbin/wp plugin update --all
