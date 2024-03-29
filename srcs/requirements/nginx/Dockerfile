FROM	debian:oldstable

RUN	apt update && apt upgrade -y
RUN	apt install nginx openssl -y
COPY ./conf/default.conf /etc/nginx/sites-available/default
RUN	echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN	openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/nginx/key.key -out /etc/nginx/crt.crt -subj "/CN=etomiyos.42.fr"

CMD	[ "nginx"]
