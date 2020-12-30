#!/bin/bash
sudo yum install wget -y
wget -qO- https://get.docker.com/ | sh
sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker centos
sudo docker run -d -p 80:80 nginx
sudo docker run  hello-world

sudo docker update --restart always $(docker ps -q)