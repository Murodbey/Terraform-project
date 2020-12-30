provider "postgresql" {
  host            = var.db_host
  port            = var.port
  database        = var.database
  username        = var.postgres_username
  password        = var.password
  superuser = false
}
provider "aws" {
  region =  var.region
 }

