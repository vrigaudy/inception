FROM debian:buster

RUN apt-get -y update \
    && apt-get -y install nginx \
    && apt-get install openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/vrigaudy.42.fr.crt \
        -keyout /etc/nginx/ssl/vrigaudy.42.fr.key \
        -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=vrigaudy.42.fr/UID=vrigaudy.42.fr"

COPY conf/default.conf	/etc/nginx/conf.d/default.conf
COPY conf/nginx.conf	/etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
