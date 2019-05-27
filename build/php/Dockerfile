FROM php:7.3.4-fpm-alpine

ARG USER_ID

# system update
RUN apk update && apk upgrade

# install system dependencies
RUN apk add --no-cache git                  \
                       bash                 \
                       nano                 \
                       curl                 \
                       wget                 \
                       unzip                \
                       make                 \
                       imagemagick          \
                       imagemagick-libs     \
                       imagemagick-dev      \
                       zip                  \
                       libzip-dev           \
                       $PHPIZE_DEPS


# install php dependencies
RUN pecl install xdebug-beta            \
                 imagick                \
    &&                                  \
    docker-php-ext-install mysqli       \
                           pdo          \
                           pdo_mysql    \
                           zip          \
    &&                                  \
    docker-php-ext-enable xdebug        \
                          imagick

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN addgroup --gid "$USER_ID" "dev" \
    && adduser \
    --disabled-password \
    --gecos "" \
    --ingroup "dev" \
    --uid "$USER_ID" \
    "dev"

WORKDIR /var/www