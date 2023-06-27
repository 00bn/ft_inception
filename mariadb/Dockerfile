FROM debian:buster
# Set DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && apt-get install -y apt-utils mariadb-server mariadb-client

# RUN apt-get update
# RUN apt-get install --yes mariadb-server mariadb-client

COPY ./mariadb_conf.sh /mariadb_conf.sh

RUN chmod +x /mariadb_conf.sh

WORKDIR /
CMD ["tail", "-f", "/dev/null"]
# ENTRYPOINT [ "./mariadb_conf.sh" ]
