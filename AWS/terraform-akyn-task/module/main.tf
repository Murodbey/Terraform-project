resource "aws_instance" "nginx" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = [aws_key_pair.nginx_key.key_name]
  vpc_security_group_ids      = [aws_security_group.nginx_sg.id]
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
    "docker run --name docker-nginx -p 80:80 nginx",
    "docker ps"
  ]
 }
 tags ={
  Name="nginx"
 }

}
