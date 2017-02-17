#!/bin/sh

# Change working directory
cd /var/www/localhost

# Optimize wp database
/usr/sbin/wp db optimize

# Repair wp database
/usr/sbin/wp db repair
