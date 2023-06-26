FROM debian:buster

RUN apt-get update 
RUN apt-get install --yes mariadb-server mariadb-client  

COPY ./mariadb_conf.sh /mariadb_conf.sh

RUN chmod +x /mariadb_conf.sh

WORKDIR /

ENTRYPOINT [ "./mariadb_conf.sh" ]
