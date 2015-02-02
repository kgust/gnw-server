# GoNorth! Websites
FROM ubuntu:stable
MAINTAINER Straight North Dev <dev@straightnorth.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository ppa:ondrej/php5-5.6
RUN apt-get update
RUN apt-get upgrade -y --force-yes

RUN apt-get install \
    php5-cli \
    php5-mcrypt \
    -o Dpkg::Options::="--force-confold" \
    -y --force-yes

RUN apt-get install \
    php5-xsl \
    php5-gd \
    php5-curl \
    php5-mysql \
    -y --force-yes

WORKDIR /data
EXPOSE 8000
#CMD ["php", "artisan", "serve"]
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
