FROM debian:buster
RUN                                                                                                                     \
    set     -eux                                                                                                        \ 
    && apt-get -y update                                                                                                \
    && apt-get install -y dialog apt-utils                                                                              \
    && apt-get -y install --no-install-recommends --no-install-suggests --fix-missing bash-static                       \
    && apt-get -y install gcc-4.8                                                                                       \
    && apt-get -y install make                                                                                          \
    && cp /bin/bash-static /sh            
 
RUN apt-get update
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install --yes mariadb-server mariadb-client

COPY ./mariadb_conf.sh /mariadb_conf.sh

RUN chmod +x /mariadb_conf.sh

WORKDIR /
CMD ["tail", "-f", "/dev/null"]
# ENTRYPOINT [ "./mariadb_conf.sh" ]
