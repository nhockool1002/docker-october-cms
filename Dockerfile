FROM php:8.1.2-fpm

# Set working directory
WORKDIR /var/www/html/root

# Install dependencies
RUN apt-get update && apt-get install -y \
  libzip-dev \
  libonig-dev \
  build-essential \
  default-mysql-client \
  libpng-dev \
  libjpeg62-turbo-dev \
  libfreetype6-dev \
  locales \
  zip \
  supervisor \
  jpegoptim optipng pngquant gifsicle \
  vim \
  unzip \
  git \
  curl \
  openssl \
  libxml2-dev

RUN apt-get install -y libc-client-dev libkrb5-dev

# Install extensions
RUN docker-php-ext-install gd pdo_mysql xml zip
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
  && docker-php-ext-install imap \
  && docker-php-ext-enable imap
RUN pecl install redis && docker-php-ext-enable redis


# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Copy existing application directory contents
COPY ./src /var/www/html/root/

# Copy existing application directory permissions
COPY --chown=www:www ./src /var/www/html/root/
RUN chmod 775 storage bootstrap -R

# Copy supervisor conf
COPY ./.docker/php/laravel.conf /etc/supervisor/conf.d/supervisord.conf

# Expose port 9000 and start php-fpm server
EXPOSE 9000

# CMD ["php-fpm"]
CMD ["sh", "-c", "php-fpm -D && /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf"]
