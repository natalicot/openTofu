# s3 backend
terraform {
  backend "s3" {
    bucket = "opentofu-demo-state-bucket"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "opentofu-demo-state-lock"
    encrypt = true
  }
}
