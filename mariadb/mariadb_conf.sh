#!/bin/bash

# Edit the my.cnf file
cat <<EOF > /etc/mysql/my.cnf
[mysqld]
socket=/run/mysqld/mysqld.sock
[client]
socket=/run/mysqld/mysqld.sock
EOF

# Start the MySQL service
service mysql start

# Launch the MariaDB shell
mariadb <<EOF
CREATE DATABASE wpdb;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'dbpassword';
GRANT ALL PRIVILEGES ON wpdb.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
EOF

# Check if the user is registered
# mysql -u wpuser -p

tail