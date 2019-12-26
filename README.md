# apache-certbot
Docker Container to generate / renew https certificates from letsencrypt using apache2 and certbot

## Description

Once setup, just run `sudo docker-compose up`
 and all your letsencrypt certificates get renewed.

They will be stored in `./letsencrypt` and can be mounted
 as readonly into any other docker container with:

```
# docker-compose.yml
# services:
#  serviceOne
# ...
    volumes:
     - <path-to-apache-certbot>/letsencrypt:/etc/letsencrypt:ro
# ...
```

## Setup

Edit `docker-compose.yml` and replace `EMAIL` with your
 email for letsencrypt aswell as `DOMAINS` with a comma-
separated list of all domains you want to generate a
 certificate for.

## Run it

If there are other containers running that use port 80 / 443,
 stop them.

`sudo docker-compose build && sudo docker-compose up`

Then start your normal containers again.

## Run it fully automated every week

If you add `docker-compose up` to your crontab for
 weekly execution, it may cause problems if other
 services/containers are listening on port 80 which
 is required for the renewal.

Therefore you can use the `autoRenewCertificates`
 script which is an example of how to to first stop
 conflicting docker containers and then start
 them again after renewal.

Simply edit `autoRenewCertificates` and adjust `stop()` and `start()`
 depending on the docker containers to be stopped during
 certificate renewal.
 Also don't forget to adjust the location of your copy of this repo in line 5. 

Then run

`sudo EDITOR=nano crontab -e`

and add the following two lines

```
# run weekly at 05:30am
30 5 * * 1 <path-to-apache-certbot-folder>/autoRenewCertificates
```
