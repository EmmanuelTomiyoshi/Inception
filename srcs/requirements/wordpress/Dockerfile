FROM			debian:oldstable

RUN				apt update && apt upgrade -y --no-install-recommends && \
				apt install sudo curl php7.4-mysql php7.4 php7.4-curl php7.4-fpm php7.4-gd php7.4-mbstring php7.4-xml mariadb-client -y && \
				apt autoremove -y && \
				apt autoclean && \
				rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN				mkdir -p /run/php /var/custom_www && \
				touch /var/custom_www/index.php

#pre-installing the wordpress
RUN				curl -o /usr/local/bin/wp \
				https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
				chmod +x /usr/local/bin/wp && \
				wp core download --path=/var/custom_www/ --allow-root

# Set ownership of WordPress files to the web server user
RUN				chown -R www-data:www-data /var/custom_www

COPY			./www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY			./wp-config.php /var/custom_www/wp-config.php
COPY			./script.sh ./script.sh

RUN				chmod +x ./script.sh

HEALTHCHECK		CMD curl --fail --silent --show-error --interval=60s "$HTTP_HOST" || exit 1

ENTRYPOINT		["./script.sh"]
CMD				["php-fpm7.4", "-F"]

LABEL			maintainer="etomiyos | Emmanuel Tomiyoshi"
LABEL			description="Docker wordpress image for the Inception project at 42 São Paulo."
