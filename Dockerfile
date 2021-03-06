# GoNorth! Websites
FROM ubuntu:14.04.1
MAINTAINER Straight North Dev <dev@straightnorth.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APP_ENV dev

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository ppa:ondrej/php5-5.6
RUN apt-get update
RUN apt-get upgrade -y --force-yes

# From forge-gnw-site.sh
RUN apt-get install -y --force-yes \
    libmcrypt4 \
    libpcre3-dev \
    nodejs-legacy \
    npm \
    ruby-dev \
    php5-apcu \
    php5-cli  \
    php5-curl \
    php5-dev \
    php5-gd \
    php5-gmp \
    php5-json \
    php5-mcrypt \
    php5-mysql
#    apache2
#    libapache2-mod-php5

# Install Jekyll for building sites
RUN gem install jekyll

# Install lessc for compiling LESS
RUN npm install -g less

RUN mkdir -p /data/www
RUN mkdir -p /data/logs
WORKDIR /data/www
EXPOSE 8000

#CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
CMD [ "php", "artisan", "serve", "--host=0.0.0.0" ]
