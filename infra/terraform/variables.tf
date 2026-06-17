variable "region" {
  type        = string
  description = "AWS region for infrastructure deployment"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
  default     = {}
}

# VPC Variables
variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "online-store-vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  type        = list(string)
  description = "CIDR blocks for public subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnets" {
  type        = list(string)
  description = "CIDR blocks for private subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Enable NAT gateway for private subnets"
  default     = false
}

variable "single_nat_gateway" {
  type        = bool
  description = "Use a single NAT gateway for all private subnets"
  default     = false
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS hostnames in the VPC"
  default     = true
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS support in the VPC"
  default     = true
}


# ECR Variables
variable "ecr_repository_name" {
  type        = string
  description = "Name of the ECR repository"
  default     = "online-store"
}

variable "ecr_image_tag_mutability" {
  type        = string
  description = "The tag mutability setting for the ECR repository"
  default     = "MUTABLE"
}

variable "ecr_encryption_type" {
  type        = string
  description = "The encryption type to use for ECR"
  default     = "AES256"
}

variable "ecr_scan_on_push" {
  type        = bool
  description = "Enable image scanning on push for ECR"
  default     = true
}
