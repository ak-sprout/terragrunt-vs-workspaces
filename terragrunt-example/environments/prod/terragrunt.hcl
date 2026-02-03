# Production environment terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/ec2"
}

inputs = {
  environment   = "prod"
  project_name  = "myapp"
  ami_id        = "ami-0123456789abcdef0"
  instance_type = "t3.large"
  vpc_id        = "vpc-prod12345"
  allowed_cidrs = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}
