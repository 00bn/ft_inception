#!/bin/bash

# Set database variables
DB_NAME="wpdb"
DB_USER="wpuser"
DB_PASSWORD="dbpassword"
DB_HOST="mariadb"

apt-get install -y wget && wget -P /var/www/html/ https://wordpress.org/latest.tar.gz && tar -xvf /var/www/html/latest.tar.gz

cp -r /wordpress/* /var/www/html/

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp


if [ ! -f /var/www/html/wp-config.php ]; then 
	echo "BOO: wp-config.php not found !!"

	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php


	wp="/var/www/html/wp-config.php"

	# wp core download --allow-root --path=/var/www/html/ set DB_NAME=$DB_NAME
	# wp core download --allow-root --path=/var/www/html/ set DB_USER=$DB_USER
	# wp core download --allow-root --path=/var/www/html/ set DB_PASSWORD=$DB_PASSWORD
	# wp core download --allow-root --path=/var/www/html/ set DB_HOST=$DB_HOST
	
	# #update wp-config.php
	sed -i "s/database_name_here/$DB_NAME/" ${wp}
	sed -i "s/username_here/$DB_USER/" ${wp}
	sed -i "s/password_here/$DB_PASSWORD/" ${wp}
	sed -i "s/localhost/$DB_HOST/" ${wp}
	# sed -i "s/define( 'WP_DEBUG', false );/define( 'WP_DEBUG', true );/" ${wp}
	# sed -i "s/define( 'WP_INSTALLING', true );/define( 'WP_INSTALLING', true );/" ${wp}
	


	#installation page 
	wp core install --allow-root --path=/var/www/html/ --url=localhost --title="YOOO IT'S B O O" --admin_user="wpuser" --admin_password="dbpassword" --admin_email="oobn4444@gmail.com"
	echo "BOO: wp installation page !!"
	#user creation

	wp user create --allow-root --path=/var/www/html/ "wp_boo" "nahdib0@gmail.com" --role=contributor --user_pass="boopassword"
	echo "BOO: create user in wp db !!"
fi
chown -R www-data:www-data /var/www/html/

sed -i 's/listen = .*/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

php-fpm7.3 -F

