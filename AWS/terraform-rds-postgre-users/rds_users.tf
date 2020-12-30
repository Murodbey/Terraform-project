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