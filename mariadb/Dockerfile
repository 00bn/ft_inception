FROM debian:buster

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install --yes mariadb-server mariadb-client

COPY ./mariadb_conf.sh /mariadb_conf.sh

RUN chmod +x /mariadb_conf.sh

WORKDIR /
CMD ["tail", "-f", "/dev/null"]
# ENTRYPOINT [ "./mariadb_conf.sh" ]
