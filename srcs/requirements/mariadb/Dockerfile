FROM			debian:oldstable

RUN				apt update && apt upgrade -y --no-install-recommends && \
				apt install curl mariadb-server -y && \
				apt autoremove -y && \
				apt autoclean && \
				rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#remove default MariaDB configuration
RUN				rm /etc/mysql/my.cnf

COPY			./my.cnf /etc/mysql/my.cnf
COPY			./script.sh ./script.sh

RUN				chmod +x ./script.sh

RUN				mkdir -p /run/mysqld && \ 
				chown mysql:mysql /run/mysqld/ && \
				chmod 755 /run/mysqld/

EXPOSE			3306


HEALTHCHECK		CMD curl --fail --silent --show-error --interval=60s "$HTTP_HOST" || exit 1

USER			mysql

ENTRYPOINT		["./script.sh"]
CMD				["mysqld_safe"]


LABEL			maintainer="etomiyos | Emmanuel Tomiyoshi"
LABEL			description="Docker mariadb image for the Inception project at 42 São Paulo."

