#
# Build: $> docker build -t evanshunt/php-for-ss
#

FROM php:5.6-apache

RUN apt-get update -y && apt-get install -y \
    libpng-dev \
    libtidy-dev \
    ssl-cert \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
    gd \
    mysql \
    mysqli \
    tidy

RUN a2enmod rewrite \
    && ln -s /etc/apache2/mods-available/ssl.conf /etc/apache2/mods-enabled/ssl.conf \
    && ln -s /etc/apache2/mods-available/ssl.load /etc/apache2/mods-enabled/ssl.load \
    && ln -s /etc/apache2/mods-available/socache_shmcb.load /etc/apache2/mods-enabled/socache_shmcb.load

COPY php.ini /usr/local/etc/php/
COPY default-ssl.conf /etc/apache2/sites-enabled/
