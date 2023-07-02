#!/bin/bash


# Start MariaDB server
# bind address for remote access to the database
sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

sed -i 's/^#port/port/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start
echo $DB_NAME
if [! -d "/var/lib/mysql/$DB_NAME"]; then
mysql -e "CREATE DATABASE $DB_NAME ;"
mysql -e "CREATE USER '$DB_USER'@'%' identified by '$DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"
echo "Database created"
else 
echo "Database already exists"
fi

service mysql stop

mysqld --console


