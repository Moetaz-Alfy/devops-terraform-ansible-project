data "aws_caller_identity" "current" {}

module "iam" {
  source     = "./modules/iam"
  account_id = data.aws_caller_identity.current.account_id
}

module "vpc" {
  source         = "./modules/vpc"
  cluster_name   = var.cluster_name
  vpc_cidr       = "10.0.0.0/16"
  azs            = ["us-east-1a", "us-east-1b"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "eks" {
  source             = "./modules/eks"
  cluster_name       = var.cluster_name
  subnet_ids         = module.vpc.public_subnet_ids
  devops_role_arn    = module.iam.role_arn
  k8s_version        = "1.29"
  node_instance_type = "t3.medium"
}

module "ec2" {
  source           = "./modules/ec2"
  vpc_id           = module.vpc.vpc_id
  subnet_id        = module.vpc.public_subnet_ids[0]
  instance_type    = "t3.micro"
  key_name         = var.key_name
  devops_role_name = module.iam.role_name
}

output "ec2_public_ip" {
  description = "Public IP of EC2 Instance"
  value       = module.ec2.public_ip
}
