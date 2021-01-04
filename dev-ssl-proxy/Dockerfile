FROM nginx

RUN apt-get update \
	&& apt-get install openssl \
	&& rm -rf /var/lib/apt/lists/*

# Generate our self-signed certificate
RUN mkdir -p /ssl
WORKDIR /ssl
RUN openssl req -subj '/CN=localhost' -x509 -newkey rsa:4096 -nodes -keyout key.pem -out cert.pem -days 365

COPY virtual-site.template /etc/nginx/conf.d/virtual-site.template

CMD ["/bin/bash", "-c", "export DOLLAR='$' && envsubst < /etc/nginx/conf.d/virtual-site.template > /etc/nginx/conf.d/default.conf && cat /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]
