# Change with your prefered settings.
#

# Public folder
HTDOCS="htdocs"

# MySQL setings
MYSQL_HOST="127.0.0.1"
MYSQL_DB="wordpress"
MYSQL_USER="wordpress"
MYSQL_PASSWORD=`pwgen -c -n -1 18`
MYSQL_PREFIX="wp_"
MYSQL_ROOT=`pwgen -c -n -1 18`

# Wordpress admin
WP_EMAIL="admin@local.dev"
WP_USER="admin"
WP_PASSWORD=`pwgen -c -n -1 18`

# Wordpress environment
WP_ENV="development"

# Wordpress settings
WP_TITLE="Wordpress Site"
WP_HOME="http://localhost"
WP_STATIC="http://localhost"
WP_SITEURL="http://localhost/wp"

# Wordpress keys
AUTH_KEY=`pwgen -c -n -1 65`
SECURE_AUTH_KEY=`pwgen -c -n -1 65`
LOGGED_IN_KEY=`pwgen -c -n -1 65`
NONCE_KEY=`pwgen -c -n -1 65`
AUTH_SALT=`pwgen -c -n -1 65`
SECURE_AUTH_SALT=`pwgen -c -n -1 65`
LOGGED_IN_SALT=`pwgen -c -n -1 65`
NONCE_SALT=`pwgen -c -n -1 65`
