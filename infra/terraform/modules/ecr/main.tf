module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 1.6"

  repository_name            = var.repository_name
  repository_encryption_type = var.encryption_type

  repository_kms_key = var.encryption_key_arn

  repository_image_tag_mutability = var.image_tag_mutability
  repository_image_scan_on_push   = var.scan_on_push

  repository_lifecycle_policy = var.repository_lifecycle_policy
  # Only create lifecycle policy when a non-empty policy is provided
  create_lifecycle_policy = var.repository_lifecycle_policy != null && var.repository_lifecycle_policy != "" ? true : false

  tags = var.tags
}