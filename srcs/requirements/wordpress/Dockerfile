FROM	debian:oldstable

RUN	apt update && apt upgrade -y
RUN	apt install php7.4-mysql php7.4 php7.4-curl php7.4-fpm php7.4-gd php7.4-mbstring php7.4-xml mariadb-client -y
RUN mkdir /run/php -p
RUN touch /run/php/php7.4-fpm.sock
RUN chmod 666 /run/php/php7.4-fpm.sock
RUN mkdir -p /var/custom_www/
RUN touch /var/custom_www/index.php
RUN echo "<?php phpinfo(); ?>" >> /var/custom_www/index.php

CMD	[ "php-fpm7.4", "-F", "-R" ]
