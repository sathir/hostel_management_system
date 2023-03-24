FROM php:5.6-apache

RUN apt-get update && \
    apt-get install nano -y && \
    docker-php-ext-install mysqli pdo pdo_mysql && \
    docker-php-ext-enable pdo_mysql mysqli && \
    a2enmod rewrite

COPY . /var/www/html

COPY 000-default.conf /etc/apache2/sites-available

#COPY ./php-overrides.ini /etc/php7/conf.d/

WORKDIR /var/www/html/www

EXPOSE 80
