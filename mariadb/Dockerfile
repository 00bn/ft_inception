FROM debian:buster

RUN apt-get update && apt-get install --yes mariadb-server mariadb-client

COPY ./mariadb_conf.sh /usr/local/bin/mariadb_conf.sh

RUN chmod +x /usr/local/bin/mariadb_conf.sh

# RUN /usr/local/bin/mariadb_conf.sh

WORKDIR /usr/local/bin/

EXPOSE 3306

ENTRYPOINT [ "./mariadb_conf.sh" ]
CMD ["tail", "-f", "/dev/null"]


