terraform{
    backend "s3"{
    bucket = "ea-infra-state-locks"
    key = "ecs/dev/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "ea-terraform-locks"
    encrypt = true
    }
}