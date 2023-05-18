#!/bin/bash

# Create the Nginx configuration file
cat <<EOF > nginx.conf
server {
    listen 80;
    server_name example.com;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
EOF