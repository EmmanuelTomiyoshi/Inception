#!/bin/bash

if ! wp core is-installed --path=/var/custom_www/ --allow-root; then

    wp core install \
        --url="$HTTP_HOST" \
        --title="$TITLE" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASS" \
        --admin_email="$ADMIN_EMAIL" \
        --skip-email \
        --path=/var/custom_www/ \
        --allow-root
    
    if wp user list --role=subscriber --field=user_login | grep -q "^$SUBSCRIBER_USER$"; then
        wp user create \
            "$SUBSCRIBER_USER" \
            "$SUBSCRIBER_EMAIL" \
            --role=subscriber \
            --user_pass="$SUBSCRIBER_PASS" \
            --path=/var/custom_www/ \
            --allow-root
    fi
fi

exec "$@"