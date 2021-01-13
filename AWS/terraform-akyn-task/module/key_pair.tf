resource "tls_private_key" "nginx_key1"{
 algorithm="RSA"
}
resource "aws_key_pair" "nginx_key"{
 key_name="nginx_key"
 public_key="${tls_private_key.nginx_key1.public_key_openssh}"
 depends_on=[
  tls_private_key.nginx_key1
 ]
}