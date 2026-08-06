variable "aws_region" {
  description = "AWS Region where ShopZone will be deployed"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "project_name" {
  description = "Project name used for naming AWS resources"
  type        = string
  default     = "shopzone"
}

variable "vpc_cidr" {
  description = "CIDR block for the ShopZone VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Availability Zones used for deployment"
  type        = list(string)

  default = [
    "us-east-1a",
    "us-east-1b"
  ]
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"

  type = list(string)

  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private application subnets"

  type = list(string)

  default = [
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}

variable "database_subnet_cidrs" {
  description = "CIDR blocks for private database subnets"

  type = list(string)

  default = [
    "10.0.21.0/24",
    "10.0.22.0/24"
  ]
}