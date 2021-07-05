#!/bin/bash

# install nginx
 apt-get update
 apt-get -y install nginx

# make sure nginx is started
 service nginx start

#Update index.html with static data
 echo "Cisco SPL"  > /var/www/html/index.html

# Restart ngnix
service nginx restart
