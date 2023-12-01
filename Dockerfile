FROM php:8.1.0-fpm

# Install php extention
RUN apt-get update && \ 
    apt install libgmp-dev libzip-dev -y \
    zip unzip  \ 
    && docker-php-ext-install pdo pdo_mysql exif gmp zip

RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
COPY . . 


CMD composer install ;\
     php artisan key:generate --force ; \
    php artisan cache:clear ; \
    php artisan config:clear ; \
    php artisan migrate ; \
    php artisan serve --host=0.0.0.0 --port=8000