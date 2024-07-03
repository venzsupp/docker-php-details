FROM php:8.1-fpm

RUN apt-get update && apt-get install
RUN apt-get install -y libxml2-dev \
    && apt-get install -y libxslt-dev \
    && docker-php-ext-install soap \
    && docker-php-ext-install xsl
RUN docker-php-ext-install mysqli

RUN apt-get install -y libicu-dev \
    && docker-php-ext-install intl



# RUN docker-php-ext-install ctype dom fileinfo hash intl session simplexml tokenizer, xml

RUN apt-get install --yes zip unzip

# Install dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libmemcached-dev \
    zlib1g-dev \
    libssl-dev \
    && docker-php-ext-install zip

# # Install Memcached
RUN apt-get update && apt-get install -y memcached

# # Install PHP Memcached extension
RUN pecl install memcached \
    && docker-php-ext-enable memcached

COPY --from=composer/composer:latest-bin /composer /usr/bin/composer
# RUN composer create-project laravel/laravel /var/www/html/nzvenz_laravel
WORKDIR /var/www/html/silvers_web
