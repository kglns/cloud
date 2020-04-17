#!/bin/bash

DOMAIN="example.com"
REPLACE="example\.com"
EMAIL="example@gmail.com"

# Must be root user
apt-get update
apt-get --yes install python-certbot-apache

cd /etc/apache2/sites-available
cat 000-default.conf | sed -E "s/#ServerName\ www\.example\.com/ServerName\ $REPLACE/" > $DOMAIN.conf

ln -s "/etc/apache2/sites-available/$DOMAIN.conf" "/etc/apache2/sites-enabled/$DOMAIN.conf"

certbot --apache --non-interactive --agree-tos -m $EMAIL -d $DOMAIN

systemctl restart apache2