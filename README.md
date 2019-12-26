# apache-certbot
Docker Container to generate / renew https certificates from letsencrypt using apache2 and certbot

## Description

Once setup, just run `sudo docker-compose up`
 and all your letsencrypt certificates get renewed.

They will be stored in `./letsencrypt` and can be mounted
 as readonly into any other docker container with:

```
# ...
    volumes:
     - <path-to-apache-certbot>/letsencrypt:/etc/letsencrypt:ro
# ...
```

## Setup

Edit `docker-compose.yml` and replace `EMAIL` with your
 email for letsencrypt aswell as `DOMAINS` with a comma-
separated list of all domaiins you want to generate a
 certificate for.

## Run it

If there are other containers running that use port 80 / 443,
 stop them.

`sudo docker-compose build && sudo docker-compose up`

Then start your normal containers again.

## Run it fully automated every week

Edit `autoRenewCertificates` and adjust `stop()` and `start()`
 depending on if you want some docker containers to be stopped / started.
 Also don't forget to adjust the location of this folder in line 5. 

Run

`sudo EDITOR=nano crontab -e`

and add this line:

```
# weekly 05:30am => certificates
30 5 * * 1 <path-to-apache-certbot-folder>/autoRenewCertificates
```
