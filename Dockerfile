FROM php:8.3-fpm
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN install-php-extensions gd mbstring opcache readline sqlite3 xml curl zip json pcre session bz2 intl openssl zlib pdo_sqlite
COPY ./additional-config-fpm.conf /usr/local/etc/php-fpm.d/
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
