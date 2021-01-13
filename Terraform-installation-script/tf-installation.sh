#!/bin/bash
sudo yum install wget -y
sudo apt-get install wget -y
sudo yum install unzip -y
sudo apt-get install unzip -y 
wget https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip
unzip terraform_0.13.0_linux_amd64.zip
sudo mv terraform /bin/
rm terraform_0.13.0_linux_amd64.zip
terraform --version
terraform --help
