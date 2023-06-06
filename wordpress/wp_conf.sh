#!/bin/bash

# Set database variables
DB_NAME="wpdb"
DB_USER="wpuser"
DB_PASSWORD="dbpassword"
DB_HOST="localhost"

apt-get install -y wget && wget -P /var/www/html/ https://wordpress.org/latest.tar.gz && tar -xvf /var/www/html/latest.tar.gz

# touch /var/www/html/boo

# cd /var/www/html/wordpress/

# if [ ! -e /var/www/html/wordpress/wp-config.php ]; then
# cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php; 

# if [ ! -e /var/www/html/wordpress/wp-config.php ]; then

# cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
cp /wordpress/wp-config-sample.php /wordpress/wp-config.php

wp="/wordpress/wp-config.php"
# Wait for the database container to be ready
# until mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e 'show databases'; do
# 	>&2 echo "MySQL is unavailable - sleeping"
# 	sleep 1
# done

#update wp-config.php
sed -i "s/database_name_here/$DB_NAME/" ${wp}
sed -i "s/username_here/$DB_USER/" ${wp}
sed -i "s/password_here/$DB_PASSWORD/" ${wp}
sed -i "s/localhost/$DB_HOST/" ${wp}

chown -R www-data:www-data /wordpress && chmod -R 755 /wordpress
tail -f /dev/null