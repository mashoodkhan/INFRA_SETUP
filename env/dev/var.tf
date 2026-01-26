variable "region" {}
variable "vpc_cidr" {}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "alb_name"{}
variable "target_group_name" {}


variable "cluster_name" {}
variable "service_name" {}
variable "task_name" {}

variable "image" {}
variable "desired_count" {
  type = number
}
variable "eks_cluster_name" {}
variable "eks_cluster_version" {}

variable "node_groups" {
  description = "EKS node group configuration"
  type = map(object({
    instance_types = list(string)
    capacity_type  = string
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  }))
  default = {
    general = {
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
      scaling_config = {
        desired_size = 2
        max_size     = 2
        min_size     = 1
      }
    }
  }
}