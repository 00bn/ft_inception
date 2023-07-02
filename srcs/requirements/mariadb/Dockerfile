FROM debian:buster

# Install packages
RUN apt-get update && apt-get install -y apt-utils mariadb-server mariadb-client

COPY ./tools/mariadb_conf.sh /mariadb_conf.sh

WORKDIR /

RUN chmod +x /mariadb_conf.sh

ENTRYPOINT [ "./mariadb_conf.sh" ]
