#!/bin/bash

apt-get update
apt-get --yes install apache2

ufw allow ssh
ufw allow http
ufw allow https
ufw allow 'Apache Full'
ufw allow proto tcp from any to any port 22
ufw --force enable

systemctl start apache2