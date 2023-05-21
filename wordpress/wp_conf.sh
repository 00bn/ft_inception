#!/bin/bash

# Set database variables
DB_NAME="wpdb"
DB_USER="wpuser"
DB_PASSWORD="dbpassword"
DB_HOST="localhost"

apt-get install -y wget && wget -P /var/www/html/ https://wordpress.org/latest.tar.gz && tar -xvf /var/www/html/latest.tar.gz -C /var/www/html/

touch /var/www/html/boo

# cd /var/www/html/wordpress/


# if [ ! -e /var/www/html/wordpress/wp-config.php ]; then
# cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php; 

if [ ! -e /var/www/html/wp-config.php ]; then

cp -r /wordpress/* /var/www/html/

cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

wp-conf-path="/var/www/html/wordpress/wp-config.php"
# Wait for the database container to be ready
# until mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e 'show databases'; do
# 	>&2 echo "MySQL is unavailable - sleeping"
# 	sleep 1
# done

#update wp-config.php
sed -i "s/database_name_here/$DB_NAME/" ${wp-conf-path}
sed -i "s/username_here/$DB_USER/" ${wp-conf-path}
sed -i "s/password_here/$DB_PASSWORD/" ${wp-conf-path}
sed -i "s/localhost/$DB_HOST/" ${wp-conf-path}
fi
chown -R www-data:www-data /var/www/html/wordpress && chmod -R 755 /var/www/html/wordpress
tail -f /dev/null