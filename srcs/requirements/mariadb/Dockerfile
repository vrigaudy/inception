FROM debian:buster

RUN apt update -y \
    && apt upgrade -y \
    && apt install nano -y \
    && apt-get install mariadb-server -y \
    && apt-get install mariadb-client -y \
    && apt install sudo -y \
    && apt install systemd -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/config.sh	    /tmp/config.sh

EXPOSE 3306

RUN mkdir -p /var/run/mysqld

RUN sudo chown mysql:mysql /var/run/mysqld/
RUN sudo chmod -R 755 /var/run/mysqld/

ENTRYPOINT ["sh", "/tmp/config.sh"]
