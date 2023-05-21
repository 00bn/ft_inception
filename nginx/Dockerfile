FROM debian:buster 

RUN apt-get update && apt-get install -y nginx

COPY ./conf/wordpress.conf /etc/nginx/sites-available/wordpress.conf

# RUN chmod +x /usr/local/bin/ngnix_conf.sh

RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

# RUN /usr/local/bin/ngnix_conf.sh

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
