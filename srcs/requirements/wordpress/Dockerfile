FROM debian:buster

# Install packages
RUN apt-get update && apt-get install -y php-fpm php-mysql php-mbstring php-xml php-zip php-gd php-bcmath php-cli curl && service php7.3-fpm start
RUN apt-get install --yes wget && mkdir -p /var/www/html

COPY ./tools/wp_conf.sh /wp_conf.sh

WORKDIR /

RUN chmod +x /wp_conf.sh

ENTRYPOINT [ "./wp_conf.sh" ]





