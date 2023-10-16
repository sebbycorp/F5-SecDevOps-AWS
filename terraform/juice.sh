#!/bin/bash

# Get IP
local_ipv4="$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"

# Update and install packages
sudo yum update -y
sudo yum install -y amazon-linux-extras docker

# Start Docker service
sudo service docker start

# Pull and run the Juice Shop Docker container
sudo docker pull bkimminich/juice-shop
sudo docker run -d -p 80:3000 bkimminich/juice-shop
