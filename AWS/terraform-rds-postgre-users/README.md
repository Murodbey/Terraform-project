## Note  terraform 0.13 required
### This module creates user groups and adds users to your PostgresSQL database


### Please copy paste the following code to your tfvars file 

```
region                      = "us-east-1"
db_host                     = ""
port                        = 5432
database                    = "postgres"
postgres_username           = "postgres"
password                    = ""
group_name                  = "datascience"

user_names = [
    "nargiz",
    "test2",
    "newUser",
    "farrukh"
]
```

### Create a new file called module.tf
```
module "rds" {
    source = "./module"
    user_names = var.user_names
    region = var.region
    db_host = var.db_host
    port = var.port
    postgres_username = var.postgres_username
    password = var.password
    database = var.database
    group_name = var.group_name
}
```

### Create variables. 

```
variable "user_names" {
  type = list
}
variable "region" {}
variable "db_host" {}
variable "port" {}
variable "database" {}
variable "postgres_username" {}
variable "password" {}
variable "group_name" {}
```
### Run The following command


```
terraform init 
terraform apply -var-file=main.tfvars
```