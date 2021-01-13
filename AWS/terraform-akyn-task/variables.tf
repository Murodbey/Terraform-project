variable "aws_region" {}
variable "environment_name" {}
variable "ssh_key_location" {}
variable "ami_id" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "key_name" {}
variable "tags" {
  type = map(any)
}
