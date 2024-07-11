# For GCP / Cloud Build
FROM devopsfnl/image:php-8.2-laravel-newman-xdebug3

ARG PORT
ENV PORT=${PORT}

COPY . /var/www/html

RUN composer install -n --prefer-dist
RUN composer run ci

RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf
EXPOSE ${PORT}

# Start Apache in the foreground
CMD ["apache2-foreground"]
