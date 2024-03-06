FROM php:8.1.27-fpm-alpine3.18

# Install system dependencies
RUN apk add composer bash zlib php-session

# Install PHP extensions
RUN apk add --no-cache php81 \
    php81-common \
    php81-fpm \
    php81-pdo \
    php81-opcache \
    php81-zip \
    php81-phar \
    php81-iconv \
    php81-cli \
    php81-curl \
    php81-openssl \
    php81-mbstring \
    php81-tokenizer \
    php81-fileinfo \
    php81-json \
    php81-xml \
    php81-xmlwriter \
    php81-simplexml \
    php81-dom \
    php81-pdo_pgsql \
    php81-pdo_sqlite \
    php81-tokenizer \
    php81-pecl-redis


# Install libpq-dev for PostgreSQL support
RUN apk add --no-cache libpq-dev

# Install and enable the PostgreSQL PHP extension
RUN docker-php-ext-install pdo_pgsql

# Set working directory
WORKDIR /root
VOLUME /root

# Expose ports for the application and FPM
EXPOSE 8000
EXPOSE 9000
ENV HOSTNAME '0.0.0.0'

# Start PHP FPM server
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
