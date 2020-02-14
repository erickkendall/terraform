#!/usr/bin/bash
yum update -y
yum install httpd php php-mysql -y
cd /var/www/html
wget https://wordpress.org/latest.zip
unzip latest.zip
cp -rp wordpress/* /var/www/html/
rm -rf wordpress
rm -rf latest.zip
chmod -R 755 wp-content
chown -R apache:apache wp-content
service httpd start
chkconfig httpd on
