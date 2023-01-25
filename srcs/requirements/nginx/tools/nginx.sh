#!/bin/sh

if [ ! -f /etc/nginx/cert.crt ]; then
	echo "Generating self-signed certificate...";
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=gkehren/CN=gkehren.42.fr" -keyout /etc/nginx/privkey.pem -out /etc/nginx/cert.crt;
	echo "Done.";
fi

exec "$@"
