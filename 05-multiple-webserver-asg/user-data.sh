#!/bin/bash
sudo yum update -y all
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable htpd
instance_ip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
sudo echo $instance_ip > /var/www/html/index.html
