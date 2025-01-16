#!/bin/sh

set -e

echo "Generating APP secret"
php artisan key:generate
php artisan config:cache

echo "Starting the application..."
exec apache2-foreground
