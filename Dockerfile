FROM php:5.6-fpm

MAINTAINER Ilya Pokamestov <dario_swain@yahoo.com>

RUN apt-get update && apt-get install -y \
	libicu-dev \
	git \
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install bcmath mbstring intl pdo_mysql

RUN echo "zend_extension=opcache.so" >> "/usr/local/etc/php/conf.d/ext-opcache.ini"
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/project/

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["php-fpm"]