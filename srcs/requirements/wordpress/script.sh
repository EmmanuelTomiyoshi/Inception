#!/bin/bash

if ! wp core is-installed --path=/var/custom_www/ --allow-root; then    
    
    wp core config \
        --dbname=${DB_NAME} \
        --dbuser=${DB_USER} \
        --dbpass=${DB_PASS} \
        --dbhost=${DB_HOST} \
        --dbprefix=${DB_PREFIX} \
        --dbcharset="utf8" \
        --path=/var/custom_www/ \
        --allow-root

    wp core install \
        --url=${HTTP_HOST} \
        --title=${TITLE} \
        --admin_user=${ADMIN_USER} \
        --admin_password=${ADMIN_PASS} \
        --admin_email=${ADMIN_EMAIL} \
        --path=/var/custom_www/ \
        --skip-email \
        --allow-root
fi

exec "$@"