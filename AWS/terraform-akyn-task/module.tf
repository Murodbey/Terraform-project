module "vault" {
  environment_name         = var.environment_name
  ssh_key_location         = var.ssh_key_location
  aws_region               = var.aws_region
  subnet_id                = var.subnet_id
  key_name                 = var.key_name
  ami_id                   = var.ami_id
  source                   = "./module"
  vpc_id                   = var.vpc_id
  tags                     = var.tags
}