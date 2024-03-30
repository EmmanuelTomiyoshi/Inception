FROM			debian:oldstable

RUN				apt update && apt upgrade -y --no-install-recommends && \
				apt install php7.4-mysql php7.4 php7.4-curl php7.4-fpm php7.4-gd php7.4-mbstring php7.4-xml mariadb-client -y && \
				apt autoremove -y && \
				apt autoclean && \
				rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN				mkdir -p /run/php /var/custom_www && \
				touch /run/php/php7.4-fpm.sock /var/custom_www/index.php && \
				chmod 666 /run/php/php7.4-fpm.sock && \
				echo "<?php phpinfo(); ?>" >> /var/custom_www/index.php

RUN				curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz && \
				tar -xzf wordpress.tar.gz -C /var/custom_www --strip-components=1 && \
				rm wordpress.tar.gz

# Set ownership of WordPress files to the web server user
RUN				chown -R www-data:www-data /var/custom_ww

WORKDIR			/var/custom_www

HEALTHCHECK		CMD curl --fail --silent --show-error --interval=60s "$WEBSITE" || exit 1

CMD				["php-fpm7.4", "-F", "-R"]

LABEL			maintainer="etomiyos | Emmanuel Tomiyoshi"
LABEL			description="Docker wordpress image for the Inception project at 42 São Paulo."
