variable "aws_region" {}
variable "environment_name" {}
variable "key_name" {}
variable "ssh_key_location" {}
variable "ami_id" {}
variable "subnet_id" {}
variable "tags" {
  type = map(any)
}
