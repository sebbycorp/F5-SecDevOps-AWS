#!/bin/bash

# Get IP
local_ipv4="$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"

# Update and install packages
sudo yum update -y
sudo yum install -y amazon-linux-extras docker

# Start Docker service
sudo service docker start

# Pull and run the Juice Shop Docker container
sudo docker run -d --name docker-2024 --env SN_HOST_NAME=dev202618.service-now.com/ --env USER_NAME=admin --env PASSWORD='g$Y*G4G5uPej' moers/mid-server:tokyo.latest


sudo amazon-linux-extras install epel -y
sudo yum install certbot python2-certbot-apache -y


# sudo certbot --apache -d secure.maniak.academy
# sudo yum install certbot python2-certbot-dns-route53
# aws configure
# sudo certbot certonly --dns-route53 -d maniak.academy -d securedemo.maniak.academy
# sudo certbot certonly -d secapp.maniak.academy

# sudo certbot certonly \
#   --dns-route53 \
#   --dns-route53-propagation-seconds 30 \
#   --dns-route53-profile my-profile \
#   -d secapp.maniak.academy

# sudo certbot certonly \
#   --dns-route53 \
#   --dns-route53-propagation-seconds 30 \
#   -d secapp.maniak.academy \
#   --debug-challenges \
#   --verbose
