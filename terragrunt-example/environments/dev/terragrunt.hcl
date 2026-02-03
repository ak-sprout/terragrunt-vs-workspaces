# Dev environment terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/ec2"
}

inputs = {
  environment   = "dev"
  project_name  = "myapp"
  ami_id        = "ami-0123456789abcdef0"
  instance_type = "t3.micro"
  vpc_id        = "vpc-dev12345"
  allowed_cidrs = ["10.0.0.0/8"]
}
