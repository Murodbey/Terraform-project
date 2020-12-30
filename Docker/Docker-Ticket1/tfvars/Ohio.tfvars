instance_type = "t2.micro"
key_name      = "RFM"
region        = "us-east-1"
ami_id        = ""
subnet_id     = ""
volume_size   = "250"
vpc_id        = ""
cidr_blocks     = [
    "10.1.0.0/16",
    "10.2.0.0/16",
    "100.100.0.0/16"
]
tags = {
    Name        = "VPC_Project"
    Environment = "Dev"
    Team        = "DevOps"
    Department  = "Operations"
    Bill        = "CFO"
    Quarter     = "1"
}
