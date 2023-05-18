FROM debian:buster 
RUN apt-get update && apt-get install -y nginx && apt-get clean && rm -rf /var/lib/apt/lists/* 
COPY ngnix_conf.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/ngnix_conf.sh
RUN /usr/local/bin/ngnix_conf.sh

RUN chmod +x ./wp_conf.sh
COPY wp-config.php /var/www/html/wp-config.php
COPY index.html /var/www/html/index.html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]