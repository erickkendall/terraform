#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
sudo apt-get update
sudo apt-get -y install httpd

# make sure nginx is started
sudo service httpd start
sudo systemctl enable httpd
sudo echo "<html><h1>This is webserver01</h1></html>" > /var/www/html/index.html
