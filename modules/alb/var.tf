variable "vpc_id"{
    type = string
}

variable "public_subnets"{
    type = list(string)
}

variable "private_subnets"{
    type = list(string)
}

variable "alb_name"{}
variable "target_group_name"{}






