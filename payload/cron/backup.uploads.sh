#!/bin/sh

# Change working directory
cd /var/www/localhost

tar -zcvf ./backup/uploads.$(date +%d-%m-%Y).tar.gz ./htdocs/app/uploads
