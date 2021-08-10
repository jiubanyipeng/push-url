<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'wordpress' );

/** MySQL database password */
define( 'DB_PASSWORD', 'username' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'YM=[RaQ(=DgNFgt-Xb7Im8[A.>>Ve/iW^W%#DIY:-xI$dPQh+o%>ep2vi$oPJbGb' );
define( 'SECURE_AUTH_KEY',  'i[CuAFq+hS|VxU2t~wge@] (6m?Tb&:4p6jXy>*dTFfn~whMVgv!<`Sv%TGf`cp]' );
define( 'LOGGED_IN_KEY',    '1;4&{TC0hgw#SqL<~y)VVNQa|jEpf=Iqo]!ElFS-if#!Xa3|<$]{V%PAtM@M@tk8' );
define( 'NONCE_KEY',        'C;=t9==x?}vr4AyF*0S+CRo8m55$~(UDcIVSNt-%aVl4drMxP+2zO.of%Tv1xk/M' );
define( 'AUTH_SALT',        'O=U^1/0B<k0GYAxB}d)jQBU6FTwEYZZ>~sh&|~o;L u>X<O1^Z}z36|V{I%;.upd' );
define( 'SECURE_AUTH_SALT', '#pRC=4yRK7c0eFO..-~Cx?-A&}(T:%a)P(7]%gdx98X#oO<-Zwt^vcg+sZ?E`<B4' );
define( 'LOGGED_IN_SALT',   'Md7OX26s#[[-?Fdc6(Gg3T9gCb_;%83E|!8<>R!2ik@|L$|rpN:)AS9Kd?1d@?>q' );
define( 'NONCE_SALT',       '+>f 7d=p{wJ+3Gy&X}($/Gt,-#tq/_6_!F!L#OxKhp@Z5+O/BHJ}jSCHYF+h(&]1' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_wordpress';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
