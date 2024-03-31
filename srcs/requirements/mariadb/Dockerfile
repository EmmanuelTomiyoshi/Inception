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


HEALTHCHECK    --interval=5s --timeout=5s --retries=5 CMD mysqladmin ping -h localhost -u root -p${DB_ROOT}

USER			mysql

ENTRYPOINT		["./script.sh"]
CMD				["mysqld"]


LABEL			maintainer="etomiyos | Emmanuel Tomiyoshi"
LABEL			description="Docker mariadb image for the Inception project at 42 São Paulo."

