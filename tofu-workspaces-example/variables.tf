# Shared variables (same across environments)
variable "project_name" {
  type        = string
  description = "Project name"
  default     = "myapp"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-0123456789abcdef0"
}

# Environment-specific variables (loaded from workspaces/*.tfvars.json)
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
