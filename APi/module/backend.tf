terraform {
    backend "s3" {
        bucket = "poc-xyz-company-test"
        key = "api-gateway/us-east-2/terraform/poc/api.gateway.tfstate"
        region = "us-west-2" 
    }
}
