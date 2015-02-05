# GoNorth! Websites
FROM ubuntu:14.04.1
MAINTAINER Straight North Dev <dev@straightnorth.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository ppa:ondrej/php5-5.6
RUN apt-get update
RUN apt-get upgrade -y --force-yes

# From forge-gnw-site.sh
RUN apt-get install -y --force-yes \
    libmcrypt4 \
    libpcre3-dev \
    php5-cli  \
    php5-mysqlnd \
    php5-apcu \
    php5-json \
    php5-curl \
    php5-dev \
    php5-gd \
    php5-gmp \
    php5-mcrypt
# apache2 libapache2-mod-php5

WORKDIR /data
EXPOSE 8000

#CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
CMD ["php", "artisan", "serve", "--host=0.0.0.0" "--env=local"]
