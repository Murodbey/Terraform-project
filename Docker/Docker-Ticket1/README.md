# Docker-Ticket1
Create centos machine that has a docker-ce latest version. It should be created with terraform. Once the instance is up and running make sure you terraform code can deploy 2 test docker images:
nginx
hello world. 
find a way to automatically start the docker images in the future when the instance is restarted.
Full process should be done thru terraform if possible with Jenkins pipeline.
```
terraform init
terraform apply -var-file tfvars/Ohio.tfvars
```