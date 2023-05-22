#!/bin/bash

# Set database variables
DB_NAME="wpdb"
DB_USER="wpuser"
DB_PASSWORD="dbpassword"
DB_HOST="localhost"

apt-get install -y wget && wget -P /var/www/html/ https://wordpress.org/latest.tar.gz && tar -xvf /var/www/html/latest.tar.gz -C /var/www/html/

wp_conf_path="/var/www/html/wordpress/wp-config.php"

touch /var/www/html/boo

if [ ! -e /var/www/html/wordpress/wp-config.php ]; then

cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

#update wp-config.php
sed -i "s/database_name_here/$DB_NAME/" ${wp_conf_path}
sed -i "s/username_here/$DB_USER/" ${wp_conf_path}
sed -i "s/password_here/$DB_PASSWORD/" ${wp_conf_path}
sed -i "s/localhost/$DB_HOST/" ${wp_conf_path}
fi
chown -R www-data:www-data /var/www/html/wordpress && chmod -R 755 /var/www/html/wordpress
tail -f /dev/null