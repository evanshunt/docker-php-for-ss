FROM php:7.4.7-apache

RUN apt-get update -y && apt-get install -y sendmail libpng-dev libtidy-dev libfreetype6-dev libjpeg62-turbo-dev zlib1g-dev libicu-dev g++ libxml2-dev libonig-dev
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg
RUN docker-php-ext-configure intl
RUN docker-php-ext-install -j$(nproc) gd mysqli tidy intl ctype dom fileinfo mbstring session simplexml tokenizer xml
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod expires

COPY php.ini /usr/local/etc/php/
COPY server-signature.conf /etc/apache2/conf-enabled/
