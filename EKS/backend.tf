terraform {
backend "s3" {
bucket = "terraform-class-murodbey"
key = "application/us-east-1/state/dev/infrastructure.tfstate"
region = "us-east-1"
  }
}
