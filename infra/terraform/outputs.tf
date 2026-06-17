# VPC Outputs
output "vpc_id" {
  value       = module.networking.vpc_id
  description = "The ID of the VPC"
}

output "private_subnets" {
  value       = module.networking.private_subnets
  description = "List of IDs of private subnets"
}

output "public_subnets" {
  value       = module.networking.public_subnets
  description = "List of IDs of public subnets"
}

output "nat_gateway_ips" {
  value       = module.networking.nat_gateway_ips
  description = "List of Elastic IPs created for NAT gateways"
}

# ECR Outputs
output "registry_url" {
  value       = module.ecr.repository_url
  description = "AWS ECR repository URL"
}

output "registry_name" {
  value       = module.ecr.repository_name
  description = "AWS ECR repository name"
}

output "registry_arn" {
  value       = module.ecr.repository_arn
  description = "AWS ECR repository ARN"
}

# Provider Outputs
output "region" {
  value       = var.region
  description = "AWS region"
}
