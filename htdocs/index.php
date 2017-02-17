<?php
/**
 * WordPress bootstrapper.
 *
 * @package Core
 */

// Ensure wordpress is initizalized.
if ( ! file_exists( dirname( __DIR__ ) . '/env.ini' ) ) :
	?>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width">
		<title>WordPress Error</title>
		<style>
		html{background:#f1f1f1}
		body{background:#fff;color:#444;font-family:"Open Sans",sans-serif;margin:2em auto;padding:1em 2em;max-width:700px;box-shadow:0 1px 3px rgba(0,0,0,0.13)}
		h1 {border-bottom:1px solid #dadada;color:#666;font:24px "Open Sans",sans-serif;margin:30px 0 0 0;padding:0 0 7px 0}
		p{font-size:14px;line-height:1.5;margin:25px 0 20px}
		</style>
	</head>
	<body>
		<h1>WordPress Error &rsaquo; <small>Not installed</small></h1>
		<p>Please see <code>README.md</code> for how to initialize WordPress.</p>
	</body>
	</html>
	<?php
	die();
endif;

define( 'WP_USE_THEMES', true );
require __DIR__ . '/wp/wp-blog-header.php';
