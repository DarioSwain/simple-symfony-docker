FROM php:5.6-fpm

MAINTAINER Ilya Pokamestov <dario_swain@yahoo.com>

RUN apt-get update && apt-get install -y \
	libicu-dev \
	git \
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install bcmath mbstring intl pdo_mysql \
	&& echo "zend_extension=opcache.so" >> "/usr/local/etc/php/conf.d/ext-opcache.ini" \
	&& curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/project/

#RUN rm -rf /var/www/project/app/cache/* \
#	&& rm -rf /var/www/project/app/logs/* \
#	&& cd /var/www/project/ && composer install
	
#ADD entrypoint.sh /usr/local/bin/entrypoint.sh
#ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["php-fpm"]