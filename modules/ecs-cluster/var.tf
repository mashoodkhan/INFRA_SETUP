variable "cluster_name" {}
variable "service_name" {}
variable "task_name" {}
variable "image" {}
variable "desired_count" {}

variable "vpc_id" {}
variable "private_subnets" { type = list(string) }
variable "target_group_arn" {}