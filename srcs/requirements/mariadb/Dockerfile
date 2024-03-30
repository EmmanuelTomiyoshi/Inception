FROM			debian:oldstable

RUN				apt update && apt upgrade -y --no-install-recommends && \
				apt install mariadb-server -y && \
				apt autoremove -y && \
				apt autoclean && \
				rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE			3306

HEALTHCHECK		CMD curl --fail --silent --show-error --interval=60s "$WEBSITE" || exit 1

CMD				["mysqld"]

LABEL			maintainer="etomiyos | Emmanuel Tomiyoshi"
LABEL			description="Docker mariadb image for the Inception project at 42 São Paulo."