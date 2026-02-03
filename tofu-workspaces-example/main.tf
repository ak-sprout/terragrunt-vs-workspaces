# Single main.tf - works for ALL environments via workspaces
# Environment-specific values loaded from workspaces/<workspace>.tfvars.json

locals {
  environment = terraform.workspace
}

resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name        = "${local.environment}-app-server"
    Environment = local.environment
    Project     = var.project_name
  }
}

resource "aws_security_group" "app" {
  name        = "${local.environment}-app-sg"
  description = "Security group for ${local.environment} app server"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = local.environment
  }
}
