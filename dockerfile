FROM php:7.4

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
			git \
			curl \
			wget \
			libmemcached-dev \
			libz-dev \
			libpq-dev \
			libjpeg-dev \
			libpng-dev \
			libfreetype6-dev \
			libssl-dev \
			libmcrypt-dev \
			libreadline-dev
			
RUN wget http://pear.php.net/go-pear.phar && mv go-pear.phar /usr/local/bin/pear 

RUN docker-php-ext-install pdo_mysql

RUN pecl install mcrypt-1.0.3 && docker-php-ext-enable mcrypt

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
