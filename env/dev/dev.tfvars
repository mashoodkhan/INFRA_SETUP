region           = "ap-south-1"
vpc_cidr         = "10.0.0.0/16"

public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]

alb_name = "EA-ALB"
target_group_name="EA-alb-Backend-DEV-tg"


cluster_name     = "platform-dev-ecs"
service_name     = "java-app-service"
task_name        = "java-app-task"

image            = "123456789012.dkr.ecr.us-east-1.amazonaws.com/java-app:11.2"
desired_count    = 1