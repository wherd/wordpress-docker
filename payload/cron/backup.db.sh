#!/bin/sh

# Change working directory
cd /var/www/localhost

# Make database copy
/usr/sbin/wp db export --add-drop-table ./backup/db.$(date +%d-%m-%Y).sql
