FROM php:8.4-fpm

RUN apt-get update && apt-get install -y \
    zip unzip curl git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www

COPY src/composer.json src/composer.lock* /var/www/

RUN composer install --no-dev --optimize-autoloader

COPY src /var/www

RUN chown -R www-data:www-data /var/www
