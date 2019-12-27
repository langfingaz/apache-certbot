FROM debian:buster


RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends apache2 certbot python-certbot-apache nano
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY ./getCertificates /usr/local/bin/getCertificates

SHELL ["/bin/bash", "-c"]

# CMD apachectl -D FOREGROUND
CMD getCertificates
