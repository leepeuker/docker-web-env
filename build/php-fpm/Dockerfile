FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
    openssl \
    git \
    unzip \
    nano

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

WORKDIR /var/www

EXPOSE 9000