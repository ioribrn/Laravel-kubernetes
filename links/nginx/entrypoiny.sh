#!/usr/bin/env bash

set -e

cd /var/www/laravel
rm -f public/storage

echo 'migrate'
#php artisan migrate --force

echo 'publish'
# php artisan vendor:publish --tag=laravel-pagination

echo 'cache'
php artisan config:cache
php artisan view:cache
php artisan route:cache
php artisan event:cache
#nginx
#service php7.3-fpm start
#nginx -g "daemon off;"
#apache
echo 'http'
exec apache2-foreground

