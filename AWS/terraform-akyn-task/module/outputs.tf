output "az"{
 value=aws_instance.nginx.availability_zone
}
//Print Public IP
output "pubip"{
 value=aws_instance.nginx.public_ip
}