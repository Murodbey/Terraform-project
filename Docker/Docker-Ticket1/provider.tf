provider "aws" {
  region = "${var.region}"
  #shared_credentials_file = "/root/.aws/credentials"
}
terraform {
  required_version = "0.11.13"
}
