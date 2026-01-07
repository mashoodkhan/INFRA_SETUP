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