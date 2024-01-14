# main.tf
provider "aws" {
  region = "us-west-2"  # Set your desired AWS region
}

module "eks_cluster" {
  source = "./modules/eks"

  cluster_name = "my-eks-cluster"
  subnets      = ["subnet-xxxxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyyyy"]  # Replace with your subnet IDs
  vpc_id       = "vpc-xxxxxxxxxxxxxxxxx"  # Replace with your VPC ID
}
