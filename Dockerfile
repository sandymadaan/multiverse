# For GCP / Cloud Build
FROM devopsfnl/image:php-8.2-laravel-newman-xdebug3

ARG PORT
ENV PORT=${PORT}
RUN a2enmod rewrite
COPY . /var/www/html

RUN composer install -n --prefer-dist
RUN composer run ci

COPY ./db-migration.sh /db-migration.sh
RUN chmod +x /db-migration.sh

EXPOSE ${PORT}
ENTRYPOINT ["/db-migration.sh"]
# Start Apache in the foreground
CMD ["apache2-foreground"]
