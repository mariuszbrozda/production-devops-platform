# Networking module
module "networking" {
  source = "./modules/networking"

  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = var.common_tags
}

# ECR module
module "ecr" {
  source = "./modules/ecr"

  repository_name      = var.ecr_repository_name
  image_tag_mutability = var.ecr_image_tag_mutability
  encryption_type      = var.ecr_encryption_type
  scan_on_push         = var.ecr_scan_on_push

  tags = var.common_tags
}
