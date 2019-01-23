FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
    && apt-get install -y libzip-dev zip \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install mysqli pdo_mysql zip \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && rm -rf /tmp/pear/

RUN { \
    echo ''; \
    echo 'xdebug.remote_enable=1'; \
    echo 'xdebug.remote_port="9000"'; \
} >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# Adding and using local user
RUN useradd -m -s /bin/bash -u 1000 dev
USER dev

WORKDIR /var/www

EXPOSE 9000