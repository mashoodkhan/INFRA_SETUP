# INFRA_SETUP

This project support multi environment infrastructure creation 
on AWS With following modules for now.

1. VPC with public and private subnet
2. Application Load Balancer
3. Elastic Container service ( ECS ) Cluster

Makesure you have installed AWS CLI and configured AWS account with your access & secret access keys

Build Docker image first and push to AWS ECR

Refer this repo : https://github.com/mashoodkhan/Java-App.git

All you need to do is clone above repositoryI

In root folder just build your docker image with
docker build -t java-app .
and push your image to AWS ECR

Once you have built and push image from ECR --> go to this INFRA_SETUP repo 

Location : cd /workspaces/INFRA_SETUP/env/dev/dev.tfvars
Add docker image in dev.tfvars 

Modules are exists in below location :
cd /workspaces/INFRA_SETUP/env/dev/main.tf

To create above infra : 

Update your tfvars file accordingly like selecting region, adding docker image.
cd /workspaces/INFRA_SETUP/env/dev/dev.tfvars

Enter commands : 
Go to cd /workspaces/INFRA_SETUP/env/dev/dev.tfvars and run below commands

terraform init
terraform plan -var-file=tfvars
terraform apply -var-file=tfvars --auto-approve

That's it will create complelete infastructure needed to deploy above java app
Now you can go to AWS Console --> Load Balancers --> Copy DNS Name and enter it in browser.

JAVA APP WILL BE LIVE



 