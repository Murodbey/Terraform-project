resource "aws_instance" "nginx" {

depends_on = [
    aws_key_pair.nginx_key
  ]

  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  security_groups             = ["dev-nginx_sg"]
  associate_public_ip_address = true

provisioner "remote-exec"{
  connection{
  agent="false"
  type="ssh"
  user="ec2-user"
  private_key="${tls_private_key.nginx_key1.private_key_pem}"
  host="${aws_instance.nginx.public_ip}"
 }
  inline=[
    "sudo yum update -y",
    "sudo amazon-linux-extras install docker -y",
    "sudo service docker start",
    "sudo usermod -a -G docker ec2-user",
    "sudo systemctl enable docker",
    "sudo docker run --name docker-nginx -p 80:80 nginx"
  ]
 }
 tags ={
  Name="nginx"
 }

}
