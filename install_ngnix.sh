#!/bin/bash

# install nginx
 apt-get update
 apt-get -y install nginx

# make sure nginx is started
 service nginx start

#Update index.html with static data
 echo "<h1>Cisco SPL</h1>"  > /var/www/html/index.html

# Restart ngnix
service nginx restart
