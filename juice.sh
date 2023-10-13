#!/bin/bash

#Get IP
local_ipv4="$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"
#!/bin/bash
sudo yum update -y
sudo yum install -y amazon-linux-extras docker
sudo service docker start
sudo docker pull bkimminich/juice-shop
sudo docker run -d -p 80:3000 bkimminich/juice-shop