variable "environment" {
  type        = string
  description = "Environment name"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "allowed_cidrs" {
  type        = list(string)
  description = "Allowed CIDR blocks for ingress"
}
