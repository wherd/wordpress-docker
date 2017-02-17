#!/bin/sh

# Change working directory
cd /var/www/localhost

tar --exclude ./htdocs/wp --exclude ./htdocs/app/uploads -zcvf ./backup/files.$(date +%d-%m-%Y).tar.gz ./config ./htdocs ./env.ini
