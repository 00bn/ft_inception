FROM debian:buster 

RUN apt-get update && apt-get install -y nginx openssl apt-utils

RUN openssl genrsa -out server.key 2048 && \
openssl req -new -key server.key -out server.csr -subj "/C=AE/ST=AD/L=AD/O=42 School/OU=student/CN=boo" \
&& openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt

RUN mv server.crt /etc/ssl/certs && mv server.key /etc/ssl/private/

COPY ./conf/wordpress.conf /etc/nginx/sites-available/wordpress.conf 
# RUN chmod +x /usr/local/bin/ngnix_conf.sh

RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/

# RUN /usr/local/bin/ngnix_conf.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
