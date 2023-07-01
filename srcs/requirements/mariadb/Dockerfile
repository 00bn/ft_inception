FROM debian:buster

# Install packages
RUN apt-get update && apt-get install -y apt-utils mariadb-server mariadb-client

COPY ./mariadb_conf.sh /mariadb_conf.sh

RUN chmod +x /mariadb_conf.sh

WORKDIR /

ENTRYPOINT [ "./mariadb_conf.sh" ]
