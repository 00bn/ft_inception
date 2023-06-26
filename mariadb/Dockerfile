FROM debian:buster

ARG TERM=xterm
ARG LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install --yes mariadb-server mariadb-client

COPY ./mariadb_conf.sh /mariadb_conf.sh

RUN chmod +x /mariadb_conf.sh

WORKDIR /
CMD ["tail", "-f", "/dev/null"]
# ENTRYPOINT [ "./mariadb_conf.sh" ]
