output "pubip"{
 value=module.aws_instance.nginx.public_ip
}