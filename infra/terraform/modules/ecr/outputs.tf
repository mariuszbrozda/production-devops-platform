output "repository_url" {
  value       = module.ecr.repository_url
  description = "The URL of the ECR repository"
}

output "repository_name" {
  value       = var.repository_name
  description = "The name of the ECR repository (from module input)"
}

output "repository_arn" {
  value       = module.ecr.repository_arn
  description = "The ARN of the ECR repository"
}

output "repository_registry_id" {
  value       = module.ecr.repository_registry_id
  description = "The registry ID where the repository was created"
}
