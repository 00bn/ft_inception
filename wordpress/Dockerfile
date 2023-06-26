FROM debian:buster

RUN apt-get update && apt-get install -y php-fpm php-mysql php-mbstring php-xml php-zip php-gd php-bcmath php-cli curl 
# RUN apt-get update && apt-get install -y php-fpm php-mysql php-mbstring php-xml php-zip php-gd php-bcmath php-cli curl 
RUN service php7.3-fpm start

RUN apt-get install --yes wget && mkdir -p /var/www/html

# RUN apt-get install -y wget && wget -P /var/www/html/ https://wordpress.org/latest.tar.gz && tar -xvf /var/www/html/latest.tar.gz -C /var/www/html/

# RUN chown -R www-data:www-data /var/www/html/wordpress && chmod -R 755 /var/www/html/wordpress
# WORKDIR /var/www/html/wordpress/

COPY ./wp_conf.sh /wp_conf.sh

WORKDIR /

RUN chmod +x /wp_conf.sh

ENTRYPOINT [ "./wp_conf.sh" ]





