variable "instance_type" {}
variable "key_name" {}
variable "region" {}
variable "subnet_id" {}
variable "ami_id" {}
variable "volume_size" {}
variable "vpc_id" {}
variable "cidr_blocks" {
    type = "list"
}
variable "tags" {
  type = "map"
}
