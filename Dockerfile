FROM php:7.3.6-fpm-alpine3.9

RUN apk add --no-cache openssl bash mysql-client nodejs npm && \ 
    docker-php-ext-install pdo pdo_mysql bcmath

WORKDIR /var/www/

RUN rm -rf /var/www/html && \
    ln -s public html && \ 
    curl -sS http://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 9000

ENTRYPOINT ["php-fpm"]