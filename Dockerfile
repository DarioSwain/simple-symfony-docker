FROM php:5.6-fpm
RUN apt-get update && apt-get install -y libicu-dev \ 
	&& docker-php-ext-configure intl \
	&& docker-php-ext-install bcmath mbstring intl
CMD ["php-fpm"]