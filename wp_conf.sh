#!/bin/bash

# Set database variables
DB_NAME="wordpress"
DB_USER="wpuser"
DB_PASSWORD="wppassword"
DB_HOST="mariadb"

# Create the WordPress configuration file
cat <<EOF > wp-config.php
<?php
define( 'DB_NAME', '${wordpress}' );
define( 'DB_USER', '${wpuser}' );
define( 'DB_PASSWORD', '${wppassword}' );
define( 'DB_HOST', '${mariadb}' );

// Other WordPress configuration settings...

EOF