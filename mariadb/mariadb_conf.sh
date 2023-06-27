#!/bin/bash


# Start MariaDB server
sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

sed -i 's/^#port/port/' /etc/mysql/mariadb.conf.d/50-server.cnf
?
service mysql start

mysql -e "CREATE DATABASE wpdb;"
mysql -e "CREATE USER 'wpuser'@'%' identified by 'dbpassword';"
mysql -e "GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'%';"
mysql -e "FLUSH PRIVILEGES;"

# service mysql stop

# mysqld --console


