#!/bin/bash

# Copy the .env.example to .env
cp .env.example .env

# Run artisan commands
php artisan key:generate
php artisan migrate --force

# Start Apache
exec apache2-foreground
