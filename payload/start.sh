#!/bin/sh

# Load settings
source /var/www/localhost/payload/config.sh

chmod +x /var/www/localhost/payload/cron/*.sh

# Setup cron jobs

# Run wp events (every 5 minutes)
echo "*/5 * * * * /bin/sh /var/www/localhost/payload/cron/event.sh >/dev/null 2>&1" > /var/crontab.setup

# Update WordPress Plugins (every 12 hours)
echo "5 */12 * * /bin/sh /var/www/localhost/payload/cron/update.plugins.sh >/dev/null 2>&1" >> /var/crontab.setup

# Update WordPress Core (every 12 hours)
echo "15 */12 * * * /bin/sh /var/www/localhost/payload/cron/update.core.sh >/dev/null 2>&1" >> /var/crontab.setup

# Backup database (once a day)
echo "20 1 * * * /bin/sh /var/www/localhost/payload/cron/backup.db.sh >/dev/null 2>&1" >> /var/crontab.setup

# Optimize database (once a day)
echo "25 1 * * * /bin/sh /var/www/localhost/payload/cron/optimize.sh >/dev/null 2>&1" >> /var/crontab.setup

# Backup WordPress files (once a week)
echo "30 1 * * 0 /bin/sh /var/www/localhost/payload/cron/backup.files.sh >/dev/null 2>&1" >> /var/crontab.setup

# Backup WordPress upload files (every month)
echo "35 1 1 * * /bin/sh /var/www/localhost/payload/cron/backup.uploads.sh >/dev/null 2>&1" >> /var/crontab.setup

touch /var/log/cron.log
crontab /var/crontab.setup

# Create wordpress configuration file
echo "
# Database settings
db_host=\"$MYSQL_HOST\"
db_name=\"$MYSQL_DB\"
db_user=\"$MYSQL_USER\"
db_password=\"$MYSQL_PASSWORD\"
db_prefix=\"$MYSQL_PREFIX\"
db_root=\"$MYSQL_ROOT\"

# Wordpress settings
htdocs=\"$HTDOCS\"
wp_env=\"$WP_ENV\"
wp_home=\"$WP_HOME\"
wp_siteurl=\"$WP_SITEURL\"
wp_static=\"$WP_STATIC\"

# Wordpress admin
wp_user=\"$WP_USER\"
wp_password=\"$WP_PASSWORD\"

# Wordpress password salts and keys
auth_key=\"$AUTH_KEY\"
secure_auth_key=\"$SECURE_AUTH_KEY\"
logged_in_key=\"$LOGGED_IN_KEY\"
nonce_key=\"$NONCE_KEY\"
auth_salt=\"$AUTH_SALT\"
secure_auth_salt=\"$SECURE_AUTH_SALT\"
logged_in_salt=\"$LOGGED_IN_SALT\"
nonce_salt=\"$NONCE_SALT\"
" > /var/www/localhost/env.ini

# create mysql databases
mysqladmin -u root password $MYSQL_ROOT
mysql -uroot -p$MYSQL_ROOT -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -uroot -p$MYSQL_ROOT -e "CREATE DATABASE $MYSQL_DB; GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'$MYSQL_HOST' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;"

# download wordpress and dependencies
cd /var/www/localhost
composer update
/var/www/localhost/vendor/bin/phpcs --config-set installed_paths /var/www/localhost/vendor/wp-coding-standards/wpcs

# Install WP-CLi
cd /var/www/localhost
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar
mv ./wp-cli.phar /usr/sbin/wp

# install wordpress
wp core install --allow-root --title="$WP_TITLE" --url="$WP_SITEURL" --admin_user="$WP_USER" --admin_password="$WP_PASSWORD" --admin_email="$WP_EMAIL"
