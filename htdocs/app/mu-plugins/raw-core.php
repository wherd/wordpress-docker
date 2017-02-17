<?php
/**
 * Raw Core
 *
 * @package Raw\Core
 * @author Sérgio 'wherd' Leal <hello@wherd.name>
 * @license GPL-2.0
 *
 * @wordpress-plugin
 * Plugin Name: Raw Core
 * Description: Fix theme path and other settings.
 * Version:     1.0.0
 * Author:      Sérgio 'wherd' Leal
 * Author URI:  https://www.wherd.name
 * License:     GPL2 or later
 * License URI: https://www.gnu.org/licenses/gpl-2.0.html
 * Text Domain: raw-core
 * Domain Path: /languages
 * Tags: core, custom, settings, customizer, theme, fix
 */

defined( 'ABSPATH' ) or die( 'No script kiddies please!' );

// disallow indexing on non-production environments.
if ( defined( WP_DEBUG ) && WP_DEBUG ) {
	add_action( 'pre_option_blog_public', '__return_zero' );
}

// register default theme directory.
if ( ! defined( 'WP_DEFAULT_THEME' ) ) {
	register_theme_directory( ABSPATH . 'wp-content/themes' );
}
