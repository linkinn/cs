module "network" {
  source         = "./modules/network"
  prefix         = var.prefix
  vpc_cidr_block = var.vpc_cidr_block
  cluster_name   = var.cluster_name
}

module "eks" {
  source         = "./modules/eks"
  prefix         = var.prefix
  cluster_name   = var.cluster_name
  vpc_id         = module.network.vpc_id
  subnet_ids     = module.network.subnet_ids
  retention_days = var.retention_days
  desired_size   = var.desired_size
  max_size       = var.max_size
  min_size       = var.min_size
  machine_type   = var.machine_type
}

module "alb" {
  source                = "./modules/alb"
  prefix                = var.prefix
  vpc_id                = module.network.vpc_id
  aws_security_group_id = module.eks.aws_security_group_id
  subnet_ids            = module.network.subnet_ids
}

module "route53" {
  source          = "./modules/route53"
  lb_eks_dns_name = module.alb.lb_eks_dns_name
  lb_eks_zode_id  = module.alb.lb_eks_zode_id
}

module "oidc" {
  source                = "./modules/oidc"
  cluster_identity_oidc = module.eks.cluster_identity_oidc
  thumbprint_id         = var.thumbprint_id
}

module "ingress" {
  source                = "./modules/ingress"
  prefix                = var.prefix
  cluster_identity_oidc = module.eks.cluster_identity_oidc
}
