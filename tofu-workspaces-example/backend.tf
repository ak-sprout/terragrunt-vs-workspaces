# Backend configuration - state files are automatically namespaced by workspace
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "app/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"

    # Workspaces automatically create: env:/dev/app/terraform.tfstate
    #                                  env:/staging/app/terraform.tfstate
    #                                  env:/prod/app/terraform.tfstate
  }
}

provider "aws" {
  region = "us-east-1"
}
