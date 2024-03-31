FROM			debian:oldstable

# Update package repositories and install necessary packages. It's a single RUN to improve layer caching
RUN				apt update && apt upgrade -y --no-install-recommends && \
				apt install curl nginx openssl -y && \
				apt autoremove -y && \
				apt autoclean && \
				rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy NGINX configuration file
COPY			./conf/default.conf /etc/nginx/sites-available/default

# Secure NGINX configuration
RUN				sed -i 's/# server_tokens off;/server_tokens off;/' /etc/nginx/nginx.conf

RUN				openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/key.key -out /etc/nginx/crt.crt -subj "/CN=${HTTP_HOST}"

HEALTHCHECK		CMD curl --fail --silent --show-error --interval=5s "$HTTP_HOST" || exit 1

EXPOSE			443

CMD				["nginx", "-g", "daemon off;"]

LABEL			maintainer="etomiyos | Emmanuel Tomiyoshi"
LABEL			description="Docker nginx image for the Inception project at 42 São Paulo."