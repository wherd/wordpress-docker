#!/bin/sh

# Change working directory
cd /var/www/localhost

# Update wp client
/usr/sbin/wp cli update

# Update wp
/usr/sbin/wp core update

# Update wp database
/usr/sbin/wp core update-db
