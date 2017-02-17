<?php
/**
 * Load and define Wordpress settings.
 *
 * @package Config
 */

// Website root directory containing all the site files.
$root = dirname( __DIR__ );

// Load ini file.
$env = parse_ini_file( "$root/env.ini" );

// Plublic folder name.
$htdocs = $env['htdocs'] ?: 'htdocs';

// Website document root.
$webroot = "$root/$htdocs";

// Setup global environment constant and load it's config.
define( 'WP_ENV', $env['wp_env'] ?: 'development' );

$env_file = __DIR__ . '/environments/' . WP_ENV . '.php';

if ( file_exists( $env_file ) ) {
	require $env_file;
}

// Define wordpress url's.
define( 'WP_HOME', $env['wp_home'] );
define( 'WP_SITEURL', $env['wp_siteurl'] );

// Setup custom content directory.
define( 'CONTENT_DIR', '/app' );
define( 'WP_CONTENT_DIR', $webroot . CONTENT_DIR );
define( 'WP_CONTENT_URL', $env['wp_static'] . CONTENT_DIR );
define( 'WP_PLUGIN_URL', WP_CONTENT_URL . '/plugins' );

// Setup db settings.
define( 'DB_NAME', $env['db_name'] );
define( 'DB_USER', $env['db_user'] );
define( 'DB_PASSWORD', $env['db_password'] );
define( 'DB_HOST', $env['db_host'] );
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );

// Wordpress Database Table Prefix.
$table_prefix = $env['db_prefix'] ?: 'wp_';

// Authentication unique keys and salts.
define( 'AUTH_KEY', $env['auth_key'] );
define( 'SECURE_AUTH_KEY', $env['secure_auth_key'] );
define( 'LOGGED_IN_KEY', $env['logged_in_key'] );
define( 'NONCE_KEY', $env['nonce_key'] );
define( 'AUTH_SALT', $env['auth_salt'] );
define( 'SECURE_AUTH_SALT', $env['secure_auth_salt'] );
define( 'LOGGED_IN_SALT', $env['logged_in_salt'] );
define( 'NONCE_SALT', $env['nonce_salt'] );

// Custom settings.
define( 'AUTOMATIC_UPDATER_DISABLED', true );
define( 'DISABLE_WP_CRON', true );
define( 'DISALLOW_FILE_EDIT', true );

// Wordpress path.
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', "$webroot/wp/" );
}
