module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name                         = var.cluster_name
  cluster_version                      = var.cluster_version
  vpc_id                               = var.vpc_id
  subnet_ids                           = var.subnet_ids
  cluster_endpoint_private_access      = var.cluster_endpoint_private_access
  cluster_endpoint_public_access       = var.cluster_endpoint_public_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs

  create_kms_key                = var.create_kms_key
  enable_kms_key_rotation       = var.enable_kms_key_rotation
  cluster_encryption_config     = {}
  bootstrap_self_managed_addons = true

  enable_irsa = var.enable_irsa

  eks_managed_node_group_defaults = {
    #  ami_type       = "AL2_x86_64"
    instance_types = ["m5.large"]
    # instance_types = ["t2.micro", "t2.medium", "t3.small", "t3.micro"]
    iam_role_attach_cni_policy = true
  }

  eks_managed_node_groups = {
    default_node_group = {
      desired_size               = var.node_desired_capacity
      max_size                   = var.node_max_capacity
      min_size                   = var.node_min_capacity
      instance_types             = var.node_instance_types
      use_custom_launch_template = false
      disk_size                  = 50
    }
  }
  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  access_entries = {
    admin = {
      principal_arn = data.aws_caller_identity.current.arn

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

}