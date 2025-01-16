#!/bin/sh

set -e

echo "Generating APP secret"
php artisan key:generate

echo "Starting the application..."
exec apache2-foreground
