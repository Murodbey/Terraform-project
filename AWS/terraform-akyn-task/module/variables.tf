# AWS region and AZs in which to deploy
variable "aws_region" {}


# SSH key name to access EC2 instances (should already exist) in the AWS Region
variable "ssh_key_location" {}
variable "ami_id" {}
variable "tags" {
  type = map(any)
}

# All resources will be tagged with this
variable "environment_name" {}

# Instance size
variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" {}
variable "vpc_id" {}