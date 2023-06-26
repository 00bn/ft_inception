FROM debian:buster

RUN apt-get update && apt-get install --yes apt-utils mariadb-server

COPY ./mariadb_conf.sh /mariadb_conf.sh

RUN chmod +x /mariadb_conf.sh

WORKDIR /

ENTRYPOINT [ "./mariadb_conf.sh" ]
