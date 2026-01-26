provider "aws" {
  region = var.region
}

module "vpc" {
  source           = "../../modules/vpc"
  vpc_cidr         = var.vpc_cidr
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
}

module "eks-cluster" {
  source = "../../modules/eks-cluster"
  eks_cluster_name    = var.eks_cluster_name
  eks_cluster_version = var.eks_cluster_version
  vpc_id          = module.vpc.vpc_id
  private_subnets      = module.vpc.private_subnets
  node_groups     = var.node_groups
}


# module "alb" {
#   source          = "../../modules/alb"
#   vpc_id          = module.vpc.vpc_id
#   public_subnets  = module.vpc.public_subnets
#   private_subnets  = module.vpc.private_subnets 
#   alb_name = var.alb_name
#   target_group_name = var.target_group_name 
# }

# module "ecs"{
#   source = "../../modules/ecs-cluster"
#   cluster_name = var.cluster_name
#   service_name = var.service_name
#   task_name = var.task_name
#   image = var.image
#   desired_count = var.desired_count
#   target_group_arn = module.alb.target_group_arn
#   vpc_id = module.vpc.vpc_id
#   private_subnets  = module.vpc.private_subnets
#   alb_sg_id = module.alb.alb_sg_id
# }

