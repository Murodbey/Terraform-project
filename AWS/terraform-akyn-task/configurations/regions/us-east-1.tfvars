aws_region               = "us-east-1"
environment_name         = "dev"
ssh_key_location         = "~/.ssh/id_rsa"
ami_id                   = "ami-0be2609ba883822ec" 
subnet_id                = "subnet-00f80855f5d558926"
vpc_id                   = "vpc-0bbb668bb87fc7009"
key_name                 = "nginx_key"
tags = {
  "Name"      = "nginx"
}